include $(LLVM_DEPTH)/llvmdefs

#
## Targets
#
LIB_TARGET = LLVMMC

#
## C files
#
vpath %.cpp $(COMPONENT_DEPTH)

CPPFILES := $(notdir $(wildcard $(COMPONENT_DEPTH)/*.cpp))

include $(LLVM_DEPTH)/llvmrules
