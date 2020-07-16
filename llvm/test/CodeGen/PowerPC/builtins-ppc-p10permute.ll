; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -mcpu=pwr10 \
; RUN:   -ppc-vsr-nums-as-vr -mtriple=powerpc64le-unknown-unknown < %s | FileCheck %s

; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -mcpu=pwr10 \
; RUN:   -ppc-vsr-nums-as-vr -mtriple=powerpc64-unknown-unknown < %s | FileCheck %s

define <16 x i8> @testVSLDBI(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: testVSLDBI:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsldbi v2, v2, v3, 1
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vsldbi(<16 x i8> %a, <16 x i8> %b, i32 1)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vsldbi(<16 x i8>, <16 x i8>, i32 immarg)

define <16 x i8> @testVSRDBI(<16 x i8> %a, <16 x i8> %b) {
; CHECK-LABEL: testVSRDBI:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vsrdbi v2, v2, v3, 1
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vsrdbi(<16 x i8> %a, <16 x i8> %b, i32 1)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vsrdbi(<16 x i8>, <16 x i8>, i32 immarg)

define <16 x i8> @testXXPERMX(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) {
; CHECK-LABEL: testXXPERMX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxpermx v2, v2, v3, v4, 1
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.vsx.xxpermx(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c, i32 1)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.vsx.xxpermx(<16 x i8>, <16 x i8>, <16 x i8>, i32 immarg)

define <16 x i8> @testXXBLENDVB(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c) {
; CHECK-LABEL: testXXBLENDVB:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxblendvb v2, v2, v3, v4
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.vsx.xxblendvb(<16 x i8> %a, <16 x i8> %b, <16 x i8> %c)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.vsx.xxblendvb(<16 x i8>, <16 x i8>, <16 x i8>)

define <8 x i16> @testXXBLENDVH(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c) {
; CHECK-LABEL: testXXBLENDVH:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxblendvh v2, v2, v3, v4
; CHECK-NEXT:    blr
entry:
  %0 = tail call <8 x i16> @llvm.ppc.vsx.xxblendvh(<8 x i16> %a, <8 x i16> %b, <8 x i16> %c)
  ret <8 x i16> %0
}
declare <8 x i16> @llvm.ppc.vsx.xxblendvh(<8 x i16>, <8 x i16>, <8 x i16>)

define <4 x i32> @testXXBLENDVW(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) {
; CHECK-LABEL: testXXBLENDVW:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxblendvw v2, v2, v3, v4
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.vsx.xxblendvw(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.vsx.xxblendvw(<4 x i32>, <4 x i32>, <4 x i32>)

define <2 x i64> @testXXBLENDVD(<2 x i64> %a, <2 x i64> %b, <2 x i64> %c) {
; CHECK-LABEL: testXXBLENDVD:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxblendvd v2, v2, v3, v4
; CHECK-NEXT:    blr
entry:
  %0 = tail call <2 x i64> @llvm.ppc.vsx.xxblendvd(<2 x i64> %a, <2 x i64> %b, <2 x i64> %c)
  ret <2 x i64> %0
}
declare <2 x i64> @llvm.ppc.vsx.xxblendvd(<2 x i64>, <2 x i64>, <2 x i64>)

define <16 x i8> @testVINSBLX(<16 x i8> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSBLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsblx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vinsblx(<16 x i8> %a, i32 %b, i32 %c)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vinsblx(<16 x i8>, i32, i32)

define <16 x i8> @testVINSBRX(<16 x i8> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSBRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsbrx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vinsbrx(<16 x i8> %a, i32 %b, i32 %c)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vinsbrx(<16 x i8>, i32, i32)

define <8 x i16> @testVINSHLX(<8 x i16> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSHLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinshlx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <8 x i16> @llvm.ppc.altivec.vinshlx(<8 x i16> %a, i32 %b, i32 %c)
  ret <8 x i16> %0
}
declare <8 x i16> @llvm.ppc.altivec.vinshlx(<8 x i16>, i32, i32)

define <8 x i16> @testVINSHRX(<8 x i16> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSHRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinshrx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <8 x i16> @llvm.ppc.altivec.vinshrx(<8 x i16> %a, i32 %b, i32 %c)
  ret <8 x i16> %0
}
declare <8 x i16> @llvm.ppc.altivec.vinshrx(<8 x i16>, i32, i32)

define <4 x i32> @testVINSWLX(<4 x i32> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSWLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinswlx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.altivec.vinswlx(<4 x i32> %a, i32 %b, i32 %c)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.altivec.vinswlx(<4 x i32>, i32, i32)

define <4 x i32> @testVINSWRX(<4 x i32> %a, i32 %b, i32 %c) {
; CHECK-LABEL: testVINSWRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinswrx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.altivec.vinswrx(<4 x i32> %a, i32 %b, i32 %c)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.altivec.vinswrx(<4 x i32>, i32, i32)

define <2 x i64> @testVINSDLX(<2 x i64> %a, i64 %b, i64 %c) {
; CHECK-LABEL: testVINSDLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsdlx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <2 x i64> @llvm.ppc.altivec.vinsdlx(<2 x i64> %a, i64 %b, i64 %c)
  ret <2 x i64> %0
}
declare <2 x i64> @llvm.ppc.altivec.vinsdlx(<2 x i64>, i64, i64)

define <2 x i64> @testVINSDRX(<2 x i64> %a, i64 %b, i64 %c) {
; CHECK-LABEL: testVINSDRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsdrx v2, r5, r6
; CHECK-NEXT:    blr
entry:
  %0 = tail call <2 x i64> @llvm.ppc.altivec.vinsdrx(<2 x i64> %a, i64 %b, i64 %c)
  ret <2 x i64> %0
}
declare <2 x i64> @llvm.ppc.altivec.vinsdrx(<2 x i64>, i64, i64)

define <16 x i8> @testVINSBVLX(<16 x i8> %a, i64 %b, <16 x i8> %c) {
; CHECK-LABEL: testVINSBVLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsbvlx v2, r5, v3
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vinsbvlx(<16 x i8> %a, i64 %b, <16 x i8> %c)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vinsbvlx(<16 x i8>, i64, <16 x i8>)

define <16 x i8> @testVINSBVRX(<16 x i8> %a, i64 %b, <16 x i8> %c) {
; CHECK-LABEL: testVINSBVRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsbvrx v2, r5, v3
; CHECK-NEXT:    blr
entry:
  %0 = tail call <16 x i8> @llvm.ppc.altivec.vinsbvrx(<16 x i8> %a, i64 %b, <16 x i8> %c)
  ret <16 x i8> %0
}
declare <16 x i8> @llvm.ppc.altivec.vinsbvrx(<16 x i8>, i64, <16 x i8>)

define <8 x i16> @testVINSHVLX(<8 x i16> %a, i64 %b, <8 x i16> %c) {
; CHECK-LABEL: testVINSHVLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinshvlx v2, r5, v3
; CHECK-NEXT:    blr
entry:
  %0 = tail call <8 x i16> @llvm.ppc.altivec.vinshvlx(<8 x i16> %a, i64 %b, <8 x i16> %c)
  ret <8 x i16> %0
}
declare <8 x i16> @llvm.ppc.altivec.vinshvlx(<8 x i16>, i64, <8 x i16>)

define <8 x i16> @testVINSHVRX(<8 x i16> %a, i64 %b, <8 x i16> %c) {
entry:
  %0 = tail call <8 x i16> @llvm.ppc.altivec.vinshvrx(<8 x i16> %a, i64 %b, <8 x i16> %c)
  ret <8 x i16> %0
}
declare <8 x i16> @llvm.ppc.altivec.vinshvrx(<8 x i16>, i64, <8 x i16>)

define <4 x i32> @testVINSWVLX(<4 x i32> %a, i64 %b, <4 x i32> %c) {
; CHECK-LABEL: testVINSWVLX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinswvlx v2, r5, v3
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.altivec.vinswvlx(<4 x i32> %a, i64 %b, <4 x i32> %c)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.altivec.vinswvlx(<4 x i32>, i64, <4 x i32>)

define <4 x i32> @testVINSWVRX(<4 x i32> %a, i64 %b, <4 x i32> %c) {
; CHECK-LABEL: testVINSWVRX:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinswvrx v2, r5, v3
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.altivec.vinswvrx(<4 x i32> %a, i64 %b, <4 x i32> %c)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.altivec.vinswvrx(<4 x i32>, i64, <4 x i32>)

define <4 x i32> @testVINSW(<4 x i32> %a, i32 %b) {
; CHECK-LABEL: testVINSW:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsw v2, r5, 1
; CHECK-NEXT:    blr
entry:
  %0 = tail call <4 x i32> @llvm.ppc.altivec.vinsw(<4 x i32> %a, i32 %b, i32 1)
  ret <4 x i32> %0
}
declare <4 x i32> @llvm.ppc.altivec.vinsw(<4 x i32>, i32, i32 immarg)

define <2 x i64> @testVINSD(<2 x i64> %a, i64 %b) {
; CHECK-LABEL: testVINSD:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    vinsd v2, r5, 1
; CHECK-NEXT:    blr
entry:
  %0 = tail call <2 x i64> @llvm.ppc.altivec.vinsd(<2 x i64> %a, i64 %b, i32 1)
  ret <2 x i64> %0
}
declare <2 x i64> @llvm.ppc.altivec.vinsd(<2 x i64>, i64, i32 immarg)
