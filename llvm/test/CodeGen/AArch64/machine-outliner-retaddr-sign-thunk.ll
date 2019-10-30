; RUN: llc -mtriple aarch64-arm-linux-gnu --enable-machine-outliner \
; RUN: -verify-machineinstrs %s -o - | FileCheck %s

declare i32 @thunk_called_fn(i32, i32, i32, i32)

define i32 @a() #0 {
; CHECK-LABEL:  a:                                      // @a
; CHECK:        // %bb.0:                               // %entry
; CHECK-NEXT:       paciasp
; CHECK:            bl [[OUTLINED_1:OUTLINED_FUNCTION_[0-9]+]]
; CHECK:            autiasp
; CHECK-NEXT:       ret
entry:
  %call = tail call i32 @thunk_called_fn(i32 1, i32 2, i32 3, i32 4)
  %cx = add i32 %call, 8
  ret i32 %cx
}

define i32 @b() #0 {
; CHECK-LABEL:  b:                                      // @b
; CHECK:        // %bb.0:                               // %entry
; CHECK-NEXT:       paciasp
; CHECK-NEXT:       .cfi_negate_ra_state
; CHECK:            bl [[OUTLINED_1]]
; CHECK:            autiasp
; CHECK-NEXT:       ret
entry:
  %call = tail call i32 @thunk_called_fn(i32 1, i32 2, i32 3, i32 4)
  %cx = add i32 %call, 88
  ret i32 %cx
}

define hidden i32 @c(i32 (i32, i32, i32, i32)* %fptr) #0 {
; CHECK-LABEL:  c:                                      // @c
; CHECK:        // %bb.0:                               // %entry
; CHECK-NEXT:       paciasp
; CHECK-NEXT:       .cfi_negate_ra_state
; CHECK:            bl [[OUTLINED_2:OUTLINED_FUNCTION_[0-9]+]]
; CHECK:            autiasp
; CHECK-NEXT:       ret
entry:
  %call = tail call i32 %fptr(i32 1, i32 2, i32 3, i32 4)
  %add = add nsw i32 %call, 8
  ret i32 %add
}

define hidden i32 @d(i32 (i32, i32, i32, i32)* %fptr) #0 {
; CHECK-LABEL:  d:                                      // @d
; CHECK:        // %bb.0:                               // %entry
; CHECK-NEXT:       paciasp
; CHECK-NEXT:       .cfi_negate_ra_state
; CHECK:            bl [[OUTLINED_2]]
; CHECK:            autiasp
; CHECK-NEXT:       ret
entry:
  %call = tail call i32 %fptr(i32 1, i32 2, i32 3, i32 4)
  %add = add nsw i32 %call, 88
  ret i32 %add
}

attributes #0 = { "sign-return-address"="non-leaf" }

; CHECK:        [[OUTLINED_1]]
; CHECK-NOT:         .cfi_b_key_frame
; CHECK-NOT:         paci{{[a,b]}}sp
; CHECK-NOT:         .cfi_negate_ra_state
; CHECK-NOT:         auti{{[a,b]}}sp
