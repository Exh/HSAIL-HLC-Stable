; RUN: llc -march=amdil < %s | FileCheck %s
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-a0:0:64-f80:32:32"
target triple = "amdil-pc-amdopencl"

; CHECK:  dcl_lds_id(2) 0
; CHECK:  lds_load_id(2) {{r[0-9]+\.x___}}, {{r[0-9]+\.[xyzw]}}


@.str = internal addrspace(2) constant [4 x i8] c"out\00"
@.str1 = internal addrspace(2) constant [4 x i8] c"out\00"
@.str2 = internal addrspace(2) constant [5 x i8] c"int*\00"
@.str3 = internal addrspace(2) constant [3 x i8] c"in\00"
@.str4 = internal addrspace(2) constant [3 x i8] c"in\00"
@.str5 = internal addrspace(2) constant [3 x i8] c"in\00"
@.str6 = internal addrspace(2) constant [5 x i8] c"int*\00"
@.str7 = internal addrspace(2) constant [3 x i8] c"in\00"
@llvm.readonlypointer.annotations.__OpenCL_zero_local_array_kernel = global [1 x i8*] [i8* bitcast ([3 x i8] addrspace(2)* @.str3 to i8*)], section "llvm.metadata"
@llvm.signedOrSignedpointee.annotations.__OpenCL_zero_local_array_kernel = global [2 x i8*] [i8* bitcast ([4 x i8] addrspace(2)* @.str to i8*), i8* bitcast ([3 x i8] addrspace(2)* @.str4 to i8*)], section "llvm.metadata"
@llvm.restrictpointer.annotations.__OpenCL_zero_local_array_kernel = global [2 x i8*] [i8* bitcast ([4 x i8] addrspace(2)* @.str1 to i8*), i8* bitcast ([3 x i8] addrspace(2)* @.str5 to i8*)], section "llvm.metadata"
@llvm.argtypename.annotations.__OpenCL_zero_local_array_kernel = global [2 x i8*] [i8* bitcast ([5 x i8] addrspace(2)* @.str2 to i8*), i8* bitcast ([5 x i8] addrspace(2)* @.str6 to i8*)], section "llvm.metadata"
@llvm.argtypeconst.annotations.__OpenCL_zero_local_array_kernel = global [1 x i8*] [i8* bitcast ([3 x i8] addrspace(2)* @.str7 to i8*)], section "llvm.metadata"
@zero_local_array_cllocal_foo = internal addrspace(3) global [0 x i32] zeroinitializer, align 4
@sgv = internal addrspace(2) constant [1 x i8] zeroinitializer
@fgv = internal addrspace(2) constant [1 x i8] zeroinitializer
@lvgv = internal constant [1 x i8*] [i8* bitcast ([0 x i32] addrspace(3)* @zero_local_array_cllocal_foo to i8*)]
@rvgv = internal constant [0 x i8*] zeroinitializer
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i8*, i8*, i32 } { i8* bitcast (void (i32 addrspace(1)*, i32 addrspace(1)*)* @__OpenCL_zero_local_array_kernel to i8*), i8* bitcast ([1 x i8] addrspace(2)* @sgv to i8*), i8* bitcast ([1 x i8] addrspace(2)* @fgv to i8*), i8* bitcast ([1 x i8*]* @lvgv to i8*), i8* bitcast ([0 x i8*]* @rvgv to i8*), i32 0 }], section "llvm.metadata"

define  void @__OpenCL_zero_local_array_kernel(i32 addrspace(1)* noalias nocapture %out, i32 addrspace(1)* noalias nocapture %in) nounwind {
entry:
  %0 = tail call  <4 x i32> @__amdil_get_local_id_int() nounwind
  %1 = extractelement <4 x i32> %0, i32 0
  %arrayidx = getelementptr [0 x i32] addrspace(3)* @zero_local_array_cllocal_foo, i32 0, i32 %1
  %2 = tail call  <4 x i32> @__amdil_get_global_id_int() nounwind
  %3 = extractelement <4 x i32> %2, i32 0
  %arrayidx3 = getelementptr i32 addrspace(1)* %in, i32 %3
  %tmp4 = load i32 addrspace(1)* %arrayidx3, align 4
  store i32 %tmp4, i32 addrspace(3)* %arrayidx, align 4
  %4 = tail call  <4 x i32> @__amdil_get_global_id_int() nounwind
  %5 = extractelement <4 x i32> %4, i32 0
  %arrayidx7 = getelementptr i32 addrspace(1)* %out, i32 %5
  %6 = tail call  <4 x i32> @__amdil_get_local_id_int() nounwind
  %7 = extractelement <4 x i32> %6, i32 0
  %arrayidx11 = getelementptr [0 x i32] addrspace(3)* @zero_local_array_cllocal_foo, i32 0, i32 %7
  %tmp12 = load i32 addrspace(3)* %arrayidx11, align 4
  store i32 %tmp12, i32 addrspace(1)* %arrayidx7, align 4
  ret void
}

declare  <4 x i32> @__amdil_get_local_id_int() nounwind readonly

declare  <4 x i32> @__amdil_get_global_id_int() nounwind readonly
