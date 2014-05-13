//===- HSAILAsmPrinter.h - Convert HSAIL LLVM code to assembly --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
#ifndef _HSAIL_ASM_PRINTER_H_
#define _HSAIL_ASM_PRINTER_H_

#include "HSAIL.h"
#include "HSAILLLVMVersion.h"
#include "HSAILSubtarget.h"
#include "InstPrinter/HSAILInstPrinter.h"
#include "llvm/Type.h"
#include "llvm/CodeGen/AsmPrinter.h"
//#include "llvm/CodeGen/MachineLocation.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/TargetRegistry.h"
//#include "llvm/Target/TargetRegistry.h"

namespace llvm {

class HSAILKernelManager;
class HSAILMachineFunctionInfo;
class HSAILModuleInfo;
class MachineBasicBlock;
class MachineConstantPoolValue;
class MachineFunction;
class MachineInstr;
class MachineJumptableInfo;
class MCContext;
class MCInst;
class MCStreamer;
class MCSymbol;
class Module;
class raw_ostream;

class LLVM_LIBRARY_VISIBILITY HSAILAsmPrinter : public AsmPrinter {
  const HSAILSubtarget *Subtarget;

  // Used for the callee part of the calling convention and be cleared
  // at every function
  std::string FuncArgsStr;
  std::string FuncRetValStr;

  // Do counting for returned values and parameters of a function and
  // be cleared at every function
  unsigned retValCounter;
  unsigned paramCounter;

  // Do counting for 1-bit, 32-bit, and 64-bit parameters or returned
  // values in a function call and be cleared at every call site
  // twice---one for parameters and the other for returned values
  unsigned reg1Counter;
  unsigned reg32Counter;
  unsigned reg64Counter;
public:
  explicit HSAILAsmPrinter(HSAIL_ASM_PRINTER_ARGUMENTS);

  virtual ~HSAILAsmPrinter();

  virtual const char* getPassName() const { return "HSAIL Assembly Printer"; }

  const HSAILSubtarget& getSubtarget() const { return *Subtarget; }

  /// EmitGlobalVariable - Emit the specified global variable to the .s file.
  virtual void EmitGlobalVariable(const GlobalVariable *GV);

  void EmitFunctionLabel(const Function &);

  /// override by targets that emit something at start of file
  virtual void EmitStartOfAsmFile(Module &);

  /// override by targets that emit something at end of file.
  virtual void EmitEndOfAsmFile(Module &);

  /// override to emit stuff before the first basic block in function.
  virtual void EmitFunctionBodyStart();

  /// Targets can override this to emit stuff after
  /// the last basic block in the function.
  virtual void EmitFunctionBodyEnd();

  /// Targets should implement this to emit instructions [required]
  virtual void EmitInstruction(const MachineInstr *);

  virtual void EmitFunctionEntryLabel();
  virtual void EmitMachineConstantPoolValue(MachineConstantPoolValue *MCPV);

  /// isBlockOnlyReachableByFallthough - Return true if the basic block has
  /// exactly one predecessor and the control transfer mechanism between
  /// the predecessor and this block is a fall-through.
  virtual bool isBlockOnlyReachableByFallthrough(
    const MachineBasicBlock *MBB) const;

  bool doFinalization(Module &M);

  //===------------------------------------------------------------------===//
  // Dwarf Emission Helper Routines
  //===------------------------------------------------------------------===//

  /// Get location information encoded by DBG_VALUE operands.
  virtual MachineLocation getDebugValueLocation(const MachineInstr *MI) const;

  /// Get the value for DW_AT_APPLE_isa. Zero if no isa encoding specified.
  virtual unsigned getISAEncoding();

public:

  virtual void PrintSpecial(const MachineInstr *MI,
                            raw_ostream &OS,
                            const char *Code) const;

  virtual bool PrintAsmOperand(const MachineInstr *MI,
                               unsigned OpNo,
                               unsigned AsmVariant,
                               const char *ExtraCode,
                               raw_ostream &OS);

  virtual bool PrintAsmMemoryOperand(const MachineInstr *MI,
                                     unsigned OpNo,
                                     unsigned AsmVariant,
                                     const char *ExtraCode,
                                     raw_ostream &OS);

  virtual void printOperand(const MachineInstr *MI, 
                            unsigned opNum, 
                            raw_ostream &OS);

  void printMemOperand(const MachineInstr *MI,
                       unsigned opNum,
                       raw_ostream &OS,
                       const char *Modifier = NULL);

  void printImageMemOperand(const MachineInstr *MI,
                            unsigned opNum,
                            raw_ostream &OS,
                            const char *Modifier = NULL);

  // --- autogenerated ---
  void printInstruction(const MachineInstr *MI, raw_ostream &OS); 
  const char* getRegisterName(unsigned RegNo); 
  const char* getInstructionName(unsigned Opcode);
  // --- end autogenerated ---

  bool runOnMachineFunction(MachineFunction &F);
  bool isMacroFunc(const MachineInstr *MI);
  bool isIdentityCopy(const MachineInstr *MI) const;

  protected:

  virtual void emitMacroFunc(const MachineInstr *MI, raw_ostream &O);

  HSAILTargetMachine *mTM;      
  HSAILKernelManager *mMeta;    /**< metadata required by the runtime */
  HSAILMachineFunctionInfo *mMFI; /**< current function being processed */
  HSAILModuleInfo *mAMI;        /**< current module being processed */

  /// Name of the current function being printed
  /// by the asm printer
  std::string mName;

  /// name of the kernel wrapper of the current function
  std::string mKernelName;

private:
  
  int mBuffer;

  typedef enum {
    ARG_TYPE_NONE = 0,
    ARG_TYPE_FUNC = 1,
    ARG_TYPE_KERNEL = 2,
    ARG_TYPE_POINTER = 3, 
    ARG_TYPE_VALUE = 4
  } HSAIL_ARG_TYPE;



  int getHSAILParameterSize(Type* type, HSAIL_ARG_TYPE arg_type);
  std::string getHSAILArgType( Type* type, 
                              HSAIL_ARG_TYPE arg_type = ARG_TYPE_NONE);
  std::string getHSAILReg(Type* type);
  std::string getHSAILAddressSpace(const GlobalVariable* gv);
  bool canInitHSAILAddressSpace(const GlobalVariable* gv) const;
  void EmitFunctionArgument(Type* type, bool isKernel, formatted_raw_ostream &O);
  void EmitFunctionReturn(Type* type, bool isKernel, formatted_raw_ostream &O);
  void EmitFunctionParam(Type*, bool, unsigned&, formatted_raw_ostream&);
  void EmitCallerReturn(Type*, bool, formatted_raw_ostream&);
  
  bool usesGCNAtomicCounter(void);

  void EmitSamplerDefs();
};

} // end namespace llvm
#endif // _HSAIL_ASM_PRINTER_H_
