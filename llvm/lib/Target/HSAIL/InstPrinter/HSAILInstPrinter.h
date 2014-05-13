//===-- HSAILInstPrinter.h - Convert HSAIL MCInst to assembly syntax ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an HSAIL MCInst to .s file syntax.
//
//===----------------------------------------------------------------------===//

#ifndef HSAIL_INST_PRINTER_H
#define HSAIL_INST_PRINTER_H

#include "llvm/MC/MCInstPrinter.h"
#include "llvm/Support/raw_ostream.h"

namespace llvm {
class MCOperand;

class HSAILInstPrinter : public MCInstPrinter {
 public:
 HSAILInstPrinter(const MCAsmInfo &MAI)
   : MCInstPrinter(MAI, MII, MRI) {}

  virtual void
    printInst(const MCInst *MI, raw_ostream &OS, StringRef annot);
  virtual StringRef
    getOpcodeName(unsigned Opcode) const;

  // Autogenerated by tblgen.
  void
    printInstruction(const MCInst *MI, raw_ostream &O);
  static const char*
    getRegisterName(unsigned RegNo);
  static const char*
    getInstructionName(unsigned Opcode);

  void
    printOperand(const MCInst *MI, unsigned OpNo, raw_ostream &O);

  void
    printMemReference(const MCInst *MI, unsigned Op, raw_ostream &O);

};

}

#endif