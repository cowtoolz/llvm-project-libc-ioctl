; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=aarch64 -global-isel=0 -mattr=+v8.2a,+fullfp16  | FileCheck %s --check-prefixes=CHECK,SDISEL
; RUN: llc < %s -mtriple=aarch64 -global-isel=1 -mattr=+v8.2a,+fullfp16  | FileCheck %s --check-prefixes=CHECK,GISEL

declare i64 @llvm.aarch64.neon.fcvtpu.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtpu.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtps.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtps.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtnu.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtnu.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtns.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtns.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtmu.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtmu.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtms.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtms.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtau.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtau.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtas.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtas.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtzs.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtzs.i32.f16(half)
declare i64 @llvm.aarch64.neon.fcvtzu.i64.f16(half)
declare i32 @llvm.aarch64.neon.fcvtzu.i32.f16(half)
declare half @llvm.aarch64.neon.frsqrte.f16(half)
declare half @llvm.aarch64.neon.frecpx.f16(half)
declare half @llvm.aarch64.neon.frecpe.f16(half)

define dso_local i16 @t2(half %a) {
; SDISEL-LABEL: t2:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcmp h0, #0.0
; SDISEL-NEXT:    csetm w0, eq
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t2:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcmp h0, #0.0
; GISEL-NEXT:    cset w8, eq
; GISEL-NEXT:    sbfx w0, w8, #0, #1
; GISEL-NEXT:    ret
entry:
  %0 = fcmp oeq half %a, 0xH0000
  %vceqz = sext i1 %0 to i16
  ret i16 %vceqz
}

define dso_local i16 @t3(half %a) {
; SDISEL-LABEL: t3:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcmp h0, #0.0
; SDISEL-NEXT:    csetm w0, ge
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t3:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcmp h0, #0.0
; GISEL-NEXT:    cset w8, ge
; GISEL-NEXT:    sbfx w0, w8, #0, #1
; GISEL-NEXT:    ret
entry:
  %0 = fcmp oge half %a, 0xH0000
  %vcgez = sext i1 %0 to i16
  ret i16 %vcgez
}

define dso_local i16 @t4(half %a) {
; SDISEL-LABEL: t4:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcmp h0, #0.0
; SDISEL-NEXT:    csetm w0, gt
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t4:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcmp h0, #0.0
; GISEL-NEXT:    cset w8, gt
; GISEL-NEXT:    sbfx w0, w8, #0, #1
; GISEL-NEXT:    ret
entry:
  %0 = fcmp ogt half %a, 0xH0000
  %vcgtz = sext i1 %0 to i16
  ret i16 %vcgtz
}

define dso_local i16 @t5(half %a) {
; SDISEL-LABEL: t5:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcmp h0, #0.0
; SDISEL-NEXT:    csetm w0, ls
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t5:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcmp h0, #0.0
; GISEL-NEXT:    cset w8, ls
; GISEL-NEXT:    sbfx w0, w8, #0, #1
; GISEL-NEXT:    ret
entry:
  %0 = fcmp ole half %a, 0xH0000
  %vclez = sext i1 %0 to i16
  ret i16 %vclez
}

define dso_local i16 @t6(half %a) {
; SDISEL-LABEL: t6:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcmp h0, #0.0
; SDISEL-NEXT:    csetm w0, mi
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t6:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcmp h0, #0.0
; GISEL-NEXT:    cset w8, mi
; GISEL-NEXT:    sbfx w0, w8, #0, #1
; GISEL-NEXT:    ret
entry:
  %0 = fcmp olt half %a, 0xH0000
  %vcltz = sext i1 %0 to i16
  ret i16 %vcltz
}

define dso_local half @t8(i32 %a) {
; CHECK-LABEL: t8:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    scvtf h0, w0
; CHECK-NEXT:    ret
entry:
  %0 = sitofp i32 %a to half
  ret half %0
}

define dso_local half @t9(i64 %a) {
; CHECK-LABEL: t9:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    scvtf h0, x0
; CHECK-NEXT:    ret
entry:
  %0 = sitofp i64 %a to half
  ret half %0
}

define dso_local half @t12(i64 %a) {
; CHECK-LABEL: t12:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    ucvtf h0, x0
; CHECK-NEXT:    ret
entry:
  %0 = uitofp i64 %a to half
  ret half %0
}

define dso_local i16 @t13(half %a) {
; CHECK-LABEL: t13:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzs w0, h0
; CHECK-NEXT:    ret
entry:
  %0 = fptosi half %a to i16
  ret i16 %0
}

define dso_local i64 @t15(half %a) {
; CHECK-LABEL: t15:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzs x0, h0
; CHECK-NEXT:    ret
entry:
  %0 = fptosi half %a to i64
  ret i64 %0
}

define dso_local i16 @t16(half %a) {
; SDISEL-LABEL: t16:
; SDISEL:       // %bb.0: // %entry
; SDISEL-NEXT:    fcvtzs w0, h0
; SDISEL-NEXT:    ret
;
; GISEL-LABEL: t16:
; GISEL:       // %bb.0: // %entry
; GISEL-NEXT:    fcvtzu w0, h0
; GISEL-NEXT:    ret
entry:
  %0 = fptoui half %a to i16
  ret i16 %0
}

define dso_local i64 @t18(half %a) {
; CHECK-LABEL: t18:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzu x0, h0
; CHECK-NEXT:    ret
entry:
  %0 = fptoui half %a to i64
  ret i64 %0
}

define i32 @fcvtzu_intrinsic_i32(half %a) {
; CHECK-LABEL: fcvtzu_intrinsic_i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzu w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtzu.i32.f16(half %a)
  ret i32 %fcvt
}

define i64 @fcvtzu_intrinsic_i64(half %a) {
; CHECK-LABEL: fcvtzu_intrinsic_i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzs x0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i64 @llvm.aarch64.neon.fcvtzs.i64.f16(half %a)
  ret i64 %fcvt
}

define i32 @fcvtzs_intrinsic_i32(half %a) {
; CHECK-LABEL: fcvtzs_intrinsic_i32:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzs w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtzs.i32.f16(half %a)
  ret i32 %fcvt
}

define i64 @fcvtzs_intrinsic_i64(half %a) {
; CHECK-LABEL: fcvtzs_intrinsic_i64:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtzs x0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i64 @llvm.aarch64.neon.fcvtzs.i64.f16(half %a)
  ret i64 %fcvt
}

define dso_local i16 @t19(half %a) {
; CHECK-LABEL: t19:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtas w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtas.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t21(half %a) {
; CHECK-LABEL: t21:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtas x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtah_s64_f16 = tail call i64 @llvm.aarch64.neon.fcvtas.i64.f16(half %a)
  ret i64 %vcvtah_s64_f16
}

define dso_local i16 @t22(half %a) {
; CHECK-LABEL: t22:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtau w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtau.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t24(half %a) {
; CHECK-LABEL: t24:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtau x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtah_u64_f16 = tail call i64 @llvm.aarch64.neon.fcvtau.i64.f16(half %a)
  ret i64 %vcvtah_u64_f16
}

define dso_local i16 @t25(half %a) {
; CHECK-LABEL: t25:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtms w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtms.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t27(half %a) {
; CHECK-LABEL: t27:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtms x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtmh_s64_f16 = tail call i64 @llvm.aarch64.neon.fcvtms.i64.f16(half %a)
  ret i64 %vcvtmh_s64_f16
}

define dso_local i16 @t28(half %a) {
; CHECK-LABEL: t28:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtmu w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtmu.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t30(half %a) {
; CHECK-LABEL: t30:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtmu x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtmh_u64_f16 = tail call i64 @llvm.aarch64.neon.fcvtmu.i64.f16(half %a)
  ret i64 %vcvtmh_u64_f16
}

define dso_local i16 @t31(half %a) {
; CHECK-LABEL: t31:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtns w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtns.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t33(half %a) {
; CHECK-LABEL: t33:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtns x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtnh_s64_f16 = tail call i64 @llvm.aarch64.neon.fcvtns.i64.f16(half %a)
  ret i64 %vcvtnh_s64_f16
}

define dso_local i16 @t34(half %a) {
; CHECK-LABEL: t34:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtnu w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtnu.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t36(half %a) {
; CHECK-LABEL: t36:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtnu x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtnh_u64_f16 = tail call i64 @llvm.aarch64.neon.fcvtnu.i64.f16(half %a)
  ret i64 %vcvtnh_u64_f16
}

define dso_local i16 @t37(half %a) {
; CHECK-LABEL: t37:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtps w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtps.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t39(half %a) {
; CHECK-LABEL: t39:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtps x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtph_s64_f16 = tail call i64 @llvm.aarch64.neon.fcvtps.i64.f16(half %a)
  ret i64 %vcvtph_s64_f16
}

define dso_local i16 @t40(half %a) {
; CHECK-LABEL: t40:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtpu w0, h0
; CHECK-NEXT:    ret
entry:
  %fcvt = tail call i32 @llvm.aarch64.neon.fcvtpu.i32.f16(half %a)
  %0 = trunc i32 %fcvt to i16
  ret i16 %0
}

define dso_local i64 @t42(half %a) {
; CHECK-LABEL: t42:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    fcvtpu x0, h0
; CHECK-NEXT:    ret
entry:
  %vcvtph_u64_f16 = tail call i64 @llvm.aarch64.neon.fcvtpu.i64.f16(half %a)
  ret i64 %vcvtph_u64_f16
}

define dso_local half @t44(half %a) {
; CHECK-LABEL: t44:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    frecpe h0, h0
; CHECK-NEXT:    ret
entry:
  %vrecpeh_f16 = tail call half @llvm.aarch64.neon.frecpe.f16(half %a)
  ret half %vrecpeh_f16
}

define dso_local half @t45(half %a) {
; CHECK-LABEL: t45:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    frecpx h0, h0
; CHECK-NEXT:    ret
entry:
  %vrecpxh_f16 = tail call half @llvm.aarch64.neon.frecpx.f16(half %a)
  ret half %vrecpxh_f16
}

define dso_local half @t53(half %a) {
; CHECK-LABEL: t53:
; CHECK:       // %bb.0: // %entry
; CHECK-NEXT:    frsqrte h0, h0
; CHECK-NEXT:    ret
entry:
  %vrsqrteh_f16 = tail call half @llvm.aarch64.neon.frsqrte.f16(half %a)
  ret half %vrsqrteh_f16
}
