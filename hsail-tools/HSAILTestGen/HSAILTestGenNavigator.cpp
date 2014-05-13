//===-- HSAILTestGenFilter.cpp - HSAIL Test Generator Navigator -----------===//
//
//===----------------------------------------------------------------------===//
//
// HSAIL Test Generator Navigator. (C) 2012 AMD Inc. All rights reserved.
//
//===----------------------------------------------------------------------===//

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/PathV2.h"

#include "HSAILItems.h"
#include "HSAILValidatorBase.h"
#include "HSAILTestGenOptions.h"
#include "HSAILTestGenNavigator.h"
#include "HSAILUtilities.h"
#include "HSAILItems.h"
#include "Brig.h"

#include <algorithm>
#include <cctype>
#include <sstream>
#include <fstream>
#include <iomanip> 

using std::string;
using std::vector;
using std::ostringstream;
using std::ofstream;

using HSAIL_ASM::Inst;
using HSAIL_ASM::InstBasic;
using HSAIL_ASM::InstAtomic;
using HSAIL_ASM::InstAtomicImage;
using HSAIL_ASM::InstLane;
using HSAIL_ASM::InstCmp;
using HSAIL_ASM::InstCvt;
using HSAIL_ASM::InstAddr;
using HSAIL_ASM::InstImage;
using HSAIL_ASM::InstMem;
using HSAIL_ASM::InstMod;
using HSAIL_ASM::InstBr;
using HSAIL_ASM::InstSourceType;
using HSAIL_ASM::InstSeg;
using HSAIL_ASM::InstMemFence;
using HSAIL_ASM::InstSegCvt;
using HSAIL_ASM::InstSignal;
using HSAIL_ASM::InstQueue;

using HSAIL_ASM::OperandReg;
using HSAIL_ASM::OperandImmed;

using HSAIL_ASM::PropValidator;

using HSAIL_ASM::opcode2str;
using HSAIL_ASM::isPackedType;
using HSAIL_ASM::getSrcType;
using HSAIL_ASM::getType;

// ============================================================================
// ============================================================================

namespace TESTGEN {

//=============================================================================
//=============================================================================
//=============================================================================

static const char* HSAIL_TESTLIST = "testlist.txt";

enum Category
{
    C_ARITHMETIC = 0, // Arithmetic
    C_MOVE,
    C_ATOMIC_MEMORY,
    C_MEMORY,
    C_ATOMIC_IMAGE,
    C_IMAGE,
    C_SYNC,
    C_MISC,
    C_BRANCH,
    C_GCN_ARITHMETIC,
    C_GCN_ATOMIC_MEMORY,
    C_GCN_MEMORY,
    C_GCN_MISC,

    C_MAXID
};

static const char* categoryName[] =
{
    "arith",
    "arith",
    "mem/atomic",
    "mem/nonatomic",
    "image/atomic",
    "image/nonatomic",
    "sync",
    "special",
    "branch",
    "gcn/arith",
    "gcn/mem/atomic",
    "gcn/mem/nonatomic",
    "gcn/special"
};

static const char* operandName[] =
{
    "operand0",
    "operand1",
    "operand2",
    "operand3",
    "operand4",
};

struct CategoryDesc 
{
    unsigned categoryId;
    unsigned instOpcode;

    bool operator<(const CategoryDesc& c) const { return this->instOpcode < c.instOpcode; }
};

//=============================================================================
// Mapping of opcodes to test categories (autogenerated from HDL description)

#define CATEGORIES
#include "HSAILTestGen_gen.hpp"
#undef CATEGORIES

//=============================================================================
// Test Filtering
//=============================================================================
//
// Currently, each element of a filter may have one of the following formats:
//
//  -------------------------------------------------------------------------------------
//   Format          Meaning                                            Encoded as
//  -------------------------------------------------------------------------------------
//   "prop=value"    this string must present in test description       "prop=value"
//   "prop!=value"   "prop=value" must not present in test description  " prop=value"
//   "value"         equivalent to "opcode=value"                       "opcode=value"
//  -------------------------------------------------------------------------------------
//

#define OPCODE_PREF ("opcode=")

static string normalize(string s) 
{ 
    s.erase(std::remove(s.begin(), s.end(), ' '), s.end());
    
    if (s.find_first_of("=!") == string::npos) s = OPCODE_PREF + s;
    
    // Handling of negative conditions
    std::string::size_type pos = s.find("!=");
    if (pos != string::npos) {
        s = s.erase(pos, 1);    // erase '!'
        s = " " + s;
    }

    return s;
}

static bool eqChIgnoreCase(char c1, char c2) { return std::tolower(c1) == std::tolower(c2); }

static bool eqStrIgnoreCase(string s1, string s2) 
{ 
    return s1.length() == s2.length() && std::equal(s1.begin(), s1.end(), s2.begin(), eqChIgnoreCase); 
}

static bool isOpcodeProp(string s)
{
    const std::string::size_type len = strlen(OPCODE_PREF);
    return s.length() > len && eqStrIgnoreCase(s.substr(0, len), OPCODE_PREF);
}

//==========================================================================

class FilterComparator
{
private:
    unsigned index;
    const vector<string> &filter;

public:
    FilterComparator(const vector<string> &f) : index(0), filter(f) {}

    bool isEmpty()     const { return index == filter.size(); }
    bool isPositive()  const { return filter[index].length() == 0 || filter[index][0] != ' '; }
    string getFilter() const { return isPositive()? filter[index] : filter[index].substr(1); }
    void next()              { ++index; }

    bool operator()(const string& val) const { return eqStrIgnoreCase(val, getFilter()); }
};

//==========================================================================

class TestGenFilter
{
private:
    std::vector<std::string> filter;
    std::string opcode;

public:
    TestGenFilter()
    {
        std::transform(testFilter.begin(), testFilter.end(), back_inserter(filter), normalize);
        std::vector<std::string>::iterator result = find_if(filter.begin(), filter.end(), isOpcodeProp);
        if (result != filter.end()) opcode = *result;
    }

public:
    bool isTestEnabled(const std::vector<std::string> &testProps)
    {
        for (FilterComparator c(filter); !c.isEmpty(); c.next()) 
        {
            bool found = (find_if(testProps.begin(), testProps.end(), c) != testProps.end());
            if (found != c.isPositive()) return false; // ok == (found for positive) || (not found for negative)
        }
        return true;
    }
    bool isOpcodeEnabled(const std::string s) const { return opcode.empty() || eqStrIgnoreCase(s, opcode); }
};

//=============================================================================
//=============================================================================
//=============================================================================

#define DEFAULT_PROP_VAL_NAME    ("default")
#define NONDEFAULT_PROP_VAL_NAME ("nondefault")

class TestGenNavigatorImpl
{
private:
    string rootPath;
    string fullPath;
    string relPath;
    string testCategories;
    CategoryDesc* instCategoryTab;
    vector<string> testProps;
    TestGenFilter filter;
    const char* lastOpcode;
    ofstream osfs;

    //==========================================================================
public:
    TestGenNavigatorImpl(string path) : rootPath(path), instCategoryTab(0), lastOpcode(0) {}
    ~TestGenNavigatorImpl() { closeStream(); delete[] instCategoryTab; }

    //==========================================================================
public:
    bool isOpcodeEnabled(unsigned opcode)
    { 
        return filter.isOpcodeEnabled(makeProp(PROP_OPCODE, opcode));
    }

    bool isTestEnabled(Inst inst)
    { 
        registerTestProps(inst); 
        if (!filter.isTestEnabled(testProps)) return false;
        if (hasPackedOperand(inst)  && (dataType & DATA_TYPE_PACKED) == 0)  return false;
        if (!hasPackedOperand(inst) && (dataType & DATA_TYPE_REGULAR) == 0) return false;
        return true;
    }

    bool startTest(Inst inst)
    { 
        if (isTestEnabled(inst))
        {
            const char* instName = val2str(PROP_OPCODE, inst.opcode());
            assert(instName);

            unsigned baseCategoryId = getBaseCategoryId(inst);
            testCategories = getCategoryTags(inst, baseCategoryId);

            relPath = getCategoryName(inst, baseCategoryId, '/') + "/" + instName;
            fullPath = rootPath 
                     + getCategoryName(inst, baseCategoryId, getPathDelimiter()[0]) 
                     + getPathDelimiter() 
                     + instName;

            createPath(fullPath);
            return true;
        }
        return false;
    }
    
    void registerTest(unsigned opcode, unsigned idx)  
    { 
        writeTestInfo(opcode, idx);
    }

    string getTestPath()
    {
        return fullPath + getPathDelimiter();
    }

    static const char* val2str(unsigned propId, unsigned propVal) { return PropValidator::val2str(propId, propVal); }

    //==========================================================================
private:

    bool hasPackedOperand(Inst inst) 
    {
        return isPackedType(getType(inst)) || isPackedType(getSrcType(inst));
    }

    //==========================================================================
private:
    void visitProp(Inst inst, unsigned propId, unsigned propVal)
    {
        if (propId == PROP_EQUIVCLASS)
        {
            ostringstream s;
            s << propVal;
            addProp(makeProp(propId, s.str()));
            addProp(makeDefaultProp(propId, propVal == 0));
        }
        else if (propId == PROP_WIDTH)
        {
            addProp(makeProp(propId, propVal));
            addProp(makeDefaultProp(propId, propVal == getDefWidth(inst, machineModel)));
        }
        else
        {
            addProp(makeProp(propId, propVal));
        }
    }

    void addProp(const char* propName, string propVal) { addProp(propName, propVal.c_str()); }

    void addProp(const char* propName, const char* propVal, const char* defaultVal = "none")
    {
        if (!propVal || strlen(propVal) == 0) propVal = defaultVal;
        addProp(string(propName) + "=" + propVal);
    }

    void addProp(string prop)
    {
        testProps.push_back(prop);
    }

    void addProp(unsigned propId, unsigned propVal)
    {
        addProp(makeProp(propId, propVal));
    }

    string makeProp(unsigned propId, string propVal)
    {
        return PropValidator::prop2key(propId) + string("=") + propVal;
    }

    string makeProp(unsigned propId, unsigned propVal)
    {
        return makeProp(propId, PropValidator::val2str(propId, propVal));
    }

    string makeDefaultProp(unsigned propId, bool isDefault)
    {
        return makeProp(propId, isDefault? DEFAULT_PROP_VAL_NAME : NONDEFAULT_PROP_VAL_NAME);
    }

    //==========================================================================
private:

    void registerOperandProps(unsigned i, Operand opr)
    {
        if (!opr) 
        {
            addProp(operandName[i], "null");
            return;
        }

        addProp(operandName[i], PropValidator::operandKind2str(opr.kind()));
    }

    void registerOperandProps(Inst inst)
    {
        for (int i = 0; i < 5; ++i)
        {
            registerOperandProps(i, inst.operand(i));
        }
    }

    void registerTestProps(Inst inst)
    {
        testProps.clear();
        visitBrigProps(inst);
        registerOperandProps(inst);
    }

    //==========================================================================
    //==========================================================================
    //==========================================================================
    // Registration of test properties (autogenerated)
private:

#include "HSAILBrigPropsVisitor_gen.hpp"

    //==========================================================================
    //==========================================================================
    //==========================================================================
private:
    void initBaseCategoryTab();
    unsigned getBaseCategoryId(Inst inst);
    unsigned getBaseCategoriesNum() { return sizeof(baseCategories) / sizeof(CategoryDesc); }

    //==========================================================================
    //==========================================================================
    //==========================================================================
private:

    void openStream()
    {
        assert(!osfs.is_open());
        string testlist = string(rootPath) + HSAIL_TESTLIST;
        osfs.open(testlist.c_str());
        if (osfs.bad()) {
            throw TestGenError("Failed to create " + testlist);
        }
    }

    void closeStream()
    {
        if (!osfs.bad() && osfs.is_open()) {
            osfs.close();
        }
    }

    void writeTestInfo(unsigned opcode, unsigned testIdx)
    {
        if (!osfs.is_open()) openStream();

        if (!osfs.bad()) 
        {
            if (dumpTestProps)              // dump full test description
            {
                ostringstream s;
                s << ":" << std::setw(5) << std::setfill('0') << testIdx;
                osfs << relPath << s.str() << " all";
                for (unsigned i = 0; i < testProps.size(); ++i) {
                    osfs << ',' << testProps[i];
                }
                osfs << testCategories << "\n";
            }
            else                            // dump only list of opcodes
            {
                const char* opcName = opcode2str(opcode);
                assert(opcName);
                if (lastOpcode == 0 || strcmp(opcName, lastOpcode) != 0) {
                    lastOpcode = opcName;
                    osfs << opcName << "\n";
                }
            }
        }
    }

    void createPath(string path)
    {
        bool existed = false;
        llvm::error_code ec;

        if (llvm::sys::fs::exists(path))
        {
            ec = llvm::sys::fs::is_directory(path, existed);
            if (ec != llvm::errc::success || !existed) {
                throw TestGenError(path + " must be a directory");
            }
        }

        existed = false;
        ec = llvm::sys::fs::create_directories(path, existed);
        if (ec != llvm::errc::success)
        {
            throw TestGenError(std::string("Failed to create ") + path);
        }
    }

    //==========================================================================
    //==========================================================================
    //==========================================================================
private:

    static string getCategoryName(Inst inst, unsigned category, char delim)
    {
        assert(category < C_MAXID);
        string res = categoryName[category];

        switch(category)
        {
        case C_ARITHMETIC:      // packed, type
        case C_GCN_ARITHMETIC:  // type
            if (getPacking(inst) != Brig::BRIG_PACK_NONE || HSAIL_ASM::isPackedType(getType(inst)))
            {
                res += getPackedCategory(inst);
            }
            else
            {
                res += getTypeCategory(inst);
            }
            break;
        case C_MOVE: {          // type, vector
            string v = getVectorCategory(inst);
            res += (v.length() > 0)? v : getTypeCategory(inst);
            }
            break;
        case C_ATOMIC_MEMORY:
        case C_GCN_ATOMIC_MEMORY:
            break;
        case C_MEMORY:          // vector
        case C_GCN_MEMORY:      // vector
            res += getVectorCategory(inst);
            break;
        case C_BRANCH:          // direct, indirect
            res += getBranchCategory(inst);
            break;
        case C_ATOMIC_IMAGE:
        case C_IMAGE:
        case C_SYNC:
        case C_MISC:
        case C_GCN_MISC:
            break;
        default:
            assert(false);
            return "";
        }

        if (delim != '/') std::replace(res.begin(), res.end(), '/', delim);

        return res;
    }

    static string getCategoryTags(Inst inst, unsigned category)
    {
        using namespace Brig;

        assert(category < C_MAXID);
        string res = ',' + getCategoryName(inst, category, ',');

        if (isOperandCategory(inst, BRIG_OPERAND_WAVESIZE)) res += ",wavesize";

        if (isEquivCategory(inst)) res += ",equiv";

        unsigned type    = inst.type();
        unsigned srcType = getSrcType(inst);
        unsigned segment = getSegment(inst);
        unsigned opcode  = inst.opcode();

        if      (type == BRIG_TYPE_F16  || srcType == BRIG_TYPE_F16)  res += ",f16";
        else if (type == BRIG_TYPE_B128 || srcType == BRIG_TYPE_B128) res += ",b128";

        switch(opcode)
        {
        case BRIG_OPCODE_ACTIVELANEMASK:
        case BRIG_OPCODE_ACTIVELANEID:
        case BRIG_OPCODE_ACTIVELANESHUFFLE:
        case BRIG_OPCODE_ACTIVELANECOUNT:
            res += ",crosslane";
            break;

        default:
            break;
        }

        switch(segment)
        {
        case BRIG_SEGMENT_FLAT:
            res += ",flat";
            break;
        default:
            break;
        }

        return res;
    }

    static bool isEquivCategory(Inst inst)
    {
        using namespace Brig;
        switch (inst.opcode())
        {
        case BRIG_OPCODE_LD:
        case BRIG_OPCODE_ST:
        case BRIG_OPCODE_ATOMIC:
        case BRIG_OPCODE_ATOMICNORET:
        case BRIG_OPCODE_RDIMAGE:
        case BRIG_OPCODE_STIMAGE:
        case BRIG_OPCODE_LDIMAGE:
        case BRIG_OPCODE_ATOMICIMAGE:
        case BRIG_OPCODE_ATOMICIMAGENORET:
        case BRIG_OPCODE_GCNLD:
        case BRIG_OPCODE_GCNST:
        case BRIG_OPCODE_GCNATOMIC:
        case BRIG_OPCODE_GCNATOMICNORET:
            return true;
        default:
            return false;
        }
    }

    static bool isOperandCategory(Inst inst, unsigned kind)
    {
        for (unsigned idx = 0; idx < 5 && inst.operand(idx); ++idx)
        {
            if (inst.operand(idx).brig()->kind == kind) return true;
        }
        return false;
    }

    static string getTypeCategory(Inst inst)
    {
        return string("/") + val2str(PROP_TYPE, getType(inst));
    }

    static string getPackedCategory(Inst inst)
    {
        return "/packed";
    }

    static string getVectorCategory(Inst inst)
    {
        for (unsigned idx = 0; idx < 5 && inst.operand(idx); ++idx)
        {
            unsigned kind = inst.operand(idx).brig()->kind;
            if (kind == Brig::BRIG_OPERAND_VECTOR) return "/vector";
        }
        return "";
    }

    static string getBranchCategory(Inst inst)
    {
        for (unsigned idx = 0; idx < 5 && inst.operand(idx); ++idx)
        {
            if (OperandReg reg = inst.operand(idx)) {
                if (getRegSize(reg) != 1) return "/indirect";
            }
        }
        return "/direct";
    }

    const char* getPathDelimiter() { return llvm::sys::path::is_separator('\\')? "\\" : "/"; }
};

void TestGenNavigatorImpl::initBaseCategoryTab()
{
    assert(!instCategoryTab);
    unsigned size = getBaseCategoriesNum();
    instCategoryTab = new CategoryDesc[size];
    std::copy(baseCategories, baseCategories + size, instCategoryTab);
    std::sort(instCategoryTab, instCategoryTab + size);
}

unsigned TestGenNavigatorImpl::getBaseCategoryId(Inst inst)
{
    if (!instCategoryTab) initBaseCategoryTab();

    CategoryDesc sample = {0, inst.opcode()};
    unsigned size = getBaseCategoriesNum();
    CategoryDesc* res = std::lower_bound(instCategoryTab, instCategoryTab + size, sample);

    if (res >= instCategoryTab + size || res->instOpcode != inst.opcode()) {
        ostringstream s;
        const char* name = HSAIL_ASM::opcode2str(inst.opcode());
        s << "Internal error: cannot get category for opcode " << inst.opcode() << " (" << (name? name : "UNKNOWN") << ')';
        throw TestGenError(s.str());
    } else if (res->categoryId >= C_MAXID) {
        ostringstream s;
        const char* name = HSAIL_ASM::opcode2str(inst.opcode());
        s << "Internal error: invalid category id for opcode " << inst.opcode() << " (" << (name? name : "UNKNOWN") << ')';
        throw TestGenError(s.str());
    }
    
    return res->categoryId;
}

//=============================================================================
// Interface definition
//=============================================================================

TestGenNavigator::TestGenNavigator(string path)
{
    impl = new TestGenNavigatorImpl(path);
}

TestGenNavigator::~TestGenNavigator()
{
    delete impl;
}

bool TestGenNavigator::isOpcodeEnabled(unsigned opcode) const
{
    return impl->isOpcodeEnabled(opcode);
}

bool TestGenNavigator::isTestEnabled(Inst inst)
{
    return impl->isTestEnabled(inst);
}

bool TestGenNavigator::startTest(Inst inst)
{
    return impl->startTest(inst);
}

void TestGenNavigator::registerTest(unsigned opcode, unsigned idx)
{
    impl->registerTest(opcode, idx);
}

string TestGenNavigator::getTestPath()
{
    return impl->getTestPath();
}

//=============================================================================
//=============================================================================
//=============================================================================

} // namespace TESTGEN
