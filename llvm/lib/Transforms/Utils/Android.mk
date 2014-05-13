LOCAL_PATH:= $(call my-dir)

transforms_utils_SRC_FILES := \
  BasicBlockUtils.cpp \
  BreakCriticalEdges.cpp \
  BuildLibCalls.cpp \
  CloneFunction.cpp \
  CloneModule.cpp \
  CmpInstAnalysis.cpp \
  CodeExtractor.cpp \
  DemoteRegToStack.cpp \
  InlineFunction.cpp \
  InstructionNamer.cpp \
  LCSSA.cpp \
  Local.cpp \
  LoopSimplify.cpp \
  LoopUnroll.cpp \
  LoopUnrollRuntime.cpp \
  LowerExpectIntrinsic.cpp \
  LowerInvoke.cpp \
  LowerSwitch.cpp \
  Mem2Reg.cpp \
  ModuleUtils.cpp \
  PromoteMemoryToRegister.cpp \
  SSAUpdater.cpp \
  SimplifyCFG.cpp \
  SimplifyIndVar.cpp \
  SimplifyInstructions.cpp \
  UnifyFunctionExitNodes.cpp \
  Utils.cpp \
  ValueMapper.cpp \
  AddrModeMatcher.cpp \
  AMDArgumentUtils.cpp \
  AMDDbgmovePass.cpp \
  AMDLibCalls.cpp \
  BypassSlowDivision.cpp \
  SimplifyLibCalls.cpp \
  MetaRenamer.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= AMDlibLLVMTransformUtils

LOCAL_MODULE_TAGS := optional

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= AMDlibLLVMTransformUtils

LOCAL_MODULE_TAGS := optional

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
