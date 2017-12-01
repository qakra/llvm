; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin -mcpu=knl -mattr=+avx512vbmi2 | FileCheck %s

define <32 x i16> @test_expand_load_w_512(i8* %addr, <32 x i16> %data, i32 %mask) {
; CHECK-LABEL: test_expand_load_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vpexpandw (%rdi), %zmm0 {%k1}
; CHECK-NEXT:    retq
  %res = call <32 x i16> @llvm.x86.avx512.mask.expand.load.w.512(i8* %addr, <32 x i16> %data, i32 %mask)
  ret <32 x i16> %res
}
declare <32 x i16> @llvm.x86.avx512.mask.expand.load.w.512(i8* %addr, <32 x i16> %data, i32 %mask)

define void @test_compress_store_w_512(i8* %addr, <32 x i16> %data, i32 %mask) {
; CHECK-LABEL: test_compress_store_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vpcompressw %zmm0, (%rdi) {%k1}
; CHECK-NEXT:    retq
  call void @llvm.x86.avx512.mask.compress.store.w.512(i8* %addr, <32 x i16> %data, i32 %mask)
  ret void
}
declare void @llvm.x86.avx512.mask.compress.store.w.512(i8* %addr, <32 x i16> %data, i32 %mask)

define <64 x i8> @test_expand_load_b_512(i8* %addr, <64 x i8> %data, i64 %mask) {
; CHECK-LABEL: test_expand_load_b_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovq %rsi, %k1
; CHECK-NEXT:    vpexpandb (%rdi), %zmm0 {%k1}
; CHECK-NEXT:    retq
  %res = call <64 x i8> @llvm.x86.avx512.mask.expand.load.b.512(i8* %addr, <64 x i8> %data, i64 %mask)
  ret <64 x i8> %res
}
declare <64 x i8> @llvm.x86.avx512.mask.expand.load.b.512(i8* %addr, <64 x i8> %data, i64 %mask)

define void @test_compress_store_b_512(i8* %addr, <64 x i8> %data, i64 %mask) {
; CHECK-LABEL: test_compress_store_b_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovq %rsi, %k1
; CHECK-NEXT:    vpcompressb %zmm0, (%rdi) {%k1}
; CHECK-NEXT:    retq
  call void @llvm.x86.avx512.mask.compress.store.b.512(i8* %addr, <64 x i8> %data, i64 %mask)
  ret void
}
declare void @llvm.x86.avx512.mask.compress.store.b.512(i8* %addr, <64 x i8> %data, i64 %mask)

define <32 x i16> @test_compress_w_512(<32 x i16> %data, <32 x i16> %src, i32 %mask) {
; CHECK-LABEL: test_compress_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpcompressw %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm1, %zmm0
; CHECK-NEXT:    retq
  %res = call <32 x i16> @llvm.x86.avx512.mask.compress.w.512(<32 x i16> %data, <32 x i16> %src, i32 %mask)
  ret <32 x i16> %res
}
declare <32 x i16> @llvm.x86.avx512.mask.compress.w.512(<32 x i16>, <32 x i16>, i32)

define <64 x i8> @test_compress_b_512(<64 x i8> %data, <64 x i8> %src, i64 %mask) {
; CHECK-LABEL: test_compress_b_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovq %rdi, %k1
; CHECK-NEXT:    vpcompressb %zmm0, %zmm1 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm1, %zmm0
; CHECK-NEXT:    retq
  %res = call <64 x i8> @llvm.x86.avx512.mask.compress.b.512(<64 x i8> %data, <64 x i8> %src, i64 %mask)
  ret <64 x i8> %res
}
declare <64 x i8> @llvm.x86.avx512.mask.compress.b.512(<64 x i8>, <64 x i8>, i64)

define <32 x i16> @test_expand_w_512(i8* %addr, <32 x i16> %data, i32 %mask) {
; CHECK-LABEL: test_expand_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vpexpandw %zmm0, %zmm0 {%k1} {z}
; CHECK-NEXT:    retq
  %res = call <32 x i16> @llvm.x86.avx512.mask.expand.w.512(<32 x i16> %data, <32 x i16> zeroinitializer, i32 %mask)
  ret <32 x i16> %res
}
declare <32 x i16> @llvm.x86.avx512.mask.expand.w.512(<32 x i16>, <32 x i16>, i32)

define <64 x i8> @test_expand_b_512(i8* %addr, <64 x i8> %data, i64 %mask) {
; CHECK-LABEL: test_expand_b_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovq %rsi, %k1
; CHECK-NEXT:    vpexpandb %zmm0, %zmm0 {%k1} {z}
; CHECK-NEXT:    retq
  %res = call <64 x i8> @llvm.x86.avx512.mask.expand.b.512(<64 x i8> %data, <64 x i8> zeroinitializer, i64 %mask)
  ret <64 x i8> %res
}
declare <64 x i8> @llvm.x86.avx512.mask.expand.b.512(<64 x i8>, <64 x i8>, i64)

define <16 x i32>@test_int_x86_avx512_mask_vpshld_d_512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x3, i16 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshld_d_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshldd $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshldd $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddd %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32> %x0, <16 x i32> %x1, i32 22, <16 x i32> %x3, i16 %x4)
  %res1 = call <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32> %x0, <16 x i32> %x1, i32 22, <16 x i32> %x3, i16 -1)
  %res2 = add <16 x i32> %res, %res1
  ret <16 x i32> %res2
}
declare <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32>, <16 x i32>, i32, <16 x i32>, i16)

define <8 x i64>@test_int_x86_avx512_mask_vpshld_q_512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x3, i8 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshld_q_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshldq $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshldq $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddq %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64> %x0, <8 x i64> %x1, i32 22, <8 x i64> %x3, i8 %x4)
  %res1 = call <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64> %x0, <8 x i64> %x1, i32 22, <8 x i64> %x3, i8 -1)
  %res2 = add <8 x i64> %res, %res1
  ret <8 x i64> %res2
}
declare <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64>, <8 x i64>, i32, <8 x i64>, i8)

define <32 x i16>@test_int_x86_avx512_mask_vpshld_w_512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x3, i32 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshld_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshldw $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshldw $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddw %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16> %x0, <32 x i16> %x1, i32 22, <32 x i16> %x3, i32 %x4)
  %res1 = call <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16> %x0, <32 x i16> %x1, i32 22, <32 x i16> %x3, i32 -1)
  %res2 = add <32 x i16> %res, %res1
  ret <32 x i16> %res2
}
declare <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16>, <32 x i16>, i32, <32 x i16>, i32)

define <16 x i32>@test_int_x86_avx512_mask_vpshrd_d_512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x3, i16 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrd_d_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshrdd $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshrdd $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddd %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32> %x0, <16 x i32> %x1, i32 22, <16 x i32> %x3, i16 %x4)
  %res1 = call <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32> %x0, <16 x i32> %x1, i32 22, <16 x i32> %x3, i16 -1)
  %res2 = add <16 x i32> %res, %res1
  ret <16 x i32> %res2
}
declare <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32>, <16 x i32>, i32, <16 x i32>, i16)

define <8 x i64>@test_int_x86_avx512_mask_vpshrd_q_512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x3, i8 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrd_q_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshrdq $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshrdq $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddq %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64> %x0, <8 x i64> %x1, i32 22, <8 x i64> %x3, i8 %x4)
  %res1 = call <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64> %x0, <8 x i64> %x1, i32 22, <8 x i64> %x3, i8 -1)
  %res2 = add <8 x i64> %res, %res1
  ret <8 x i64> %res2
}
declare <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64>, <8 x i64>, i32, <8 x i64>, i8)

define <32 x i16>@test_int_x86_avx512_mask_vpshrd_w_512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x3, i32 %x4) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrd_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %edi, %k1
; CHECK-NEXT:    vpshrdw $22, %zmm1, %zmm0, %zmm2 {%k1}
; CHECK-NEXT:    vpshrdw $22, %zmm1, %zmm0, %zmm0
; CHECK-NEXT:    vpaddw %zmm0, %zmm2, %zmm0
; CHECK-NEXT:    retq
  %res = call <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16> %x0, <32 x i16> %x1, i32 22, <32 x i16> %x3, i32 %x4)
  %res1 = call <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16> %x0, <32 x i16> %x1, i32 22, <32 x i16> %x3, i32 -1)
  %res2 = add <32 x i16> %res, %res1
  ret <32 x i16> %res2
}
declare <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16>, <32 x i16>, i32, <32 x i16>, i32)

declare <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <16 x i32> @llvm.x86.avx512.maskz.vpshrdv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)

define <16 x i32>@test_int_x86_avx512_mask_vpshrdv_d_512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32>* %x2p, <16 x i32> %x4, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrdv_d_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshrdvd (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm4
; CHECK-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    vpaddd %zmm0, %zmm4, %zmm0
; CHECK-NEXT:    vpaddd %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <16 x i32>, <16 x i32>* %x2p
  %res = call <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x2, i16 %x3)
  %res1 = call <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x4, i16 -1)
  %res2 = call <16 x i32> @llvm.x86.avx512.maskz.vpshrdv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x4, i16  %x3)
  %res3 = add <16 x i32> %res, %res1
  %res4 = add <16 x i32> %res2, %res3
  ret <16 x i32> %res4
}

declare <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <8 x i64> @llvm.x86.avx512.maskz.vpshrdv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)

define <8 x i64>@test_int_x86_avx512_mask_vpshrdv_q_512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64>* %x2p, <8 x i64> %x4, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrdv_q_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshrdvq (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm4
; CHECK-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    vpaddq %zmm0, %zmm4, %zmm0
; CHECK-NEXT:    vpaddq %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <8 x i64>, <8 x i64>* %x2p
  %res = call <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x2, i8 %x3)
  %res1 = call <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x4, i8 -1)
  %res2 = call <8 x i64> @llvm.x86.avx512.maskz.vpshrdv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x4, i8  %x3)
  %res3 = add <8 x i64> %res, %res1
  %res4 = add <8 x i64> %res2, %res3
  ret <8 x i64> %res4
}

declare <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)
declare <32 x i16> @llvm.x86.avx512.maskz.vpshrdv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)

define <32 x i16>@test_int_x86_avx512_mask_vpshrdv_w_512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16>* %x2p, <32 x i16> %x4, i32 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshrdv_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshrdvw (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm4 {%k1} {z}
; CHECK-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    vpaddw %zmm4, %zmm0, %zmm0
; CHECK-NEXT:    vpaddw %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <32 x i16>, <32 x i16>* %x2p
  %res = call <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x2, i32 %x3)
  %res1 = call <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x4, i32 -1)
  %res2 = call <32 x i16> @llvm.x86.avx512.maskz.vpshrdv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x4, i32  %x3)
  %res3 = add <32 x i16> %res, %res1
  %res4 = add <32 x i16> %res2, %res3
  ret <32 x i16> %res4
}

declare <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <16 x i32> @llvm.x86.avx512.maskz.vpshldv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)

define <16 x i32>@test_int_x86_avx512_mask_vpshldv_d_512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32>* %x2p, <16 x i32> %x4, i16 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshldv_d_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshldvd (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshldvd %zmm2, %zmm1, %zmm4
; CHECK-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    vpaddd %zmm0, %zmm4, %zmm0
; CHECK-NEXT:    vpaddd %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <16 x i32>, <16 x i32>* %x2p
  %res = call <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x2, i16 %x3)
  %res1 = call <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x4, i16 -1)
  %res2 = call <16 x i32> @llvm.x86.avx512.maskz.vpshldv.d.512(<16 x i32> %x0, <16 x i32> %x1, <16 x i32> %x4, i16  %x3)
  %res3 = add <16 x i32> %res, %res1
  %res4 = add <16 x i32> %res2, %res3
  ret <16 x i32> %res4
}

declare <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <8 x i64> @llvm.x86.avx512.maskz.vpshldv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)

define <8 x i64>@test_int_x86_avx512_mask_vpshldv_q_512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64>* %x2p, <8 x i64> %x4, i8 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshldv_q_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshldvq (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshldvq %zmm2, %zmm1, %zmm4
; CHECK-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; CHECK-NEXT:    vpaddq %zmm0, %zmm4, %zmm0
; CHECK-NEXT:    vpaddq %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <8 x i64>, <8 x i64>* %x2p
  %res = call <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x2, i8 %x3)
  %res1 = call <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x4, i8 -1)
  %res2 = call <8 x i64> @llvm.x86.avx512.maskz.vpshldv.q.512(<8 x i64> %x0, <8 x i64> %x1, <8 x i64> %x4, i8  %x3)
  %res3 = add <8 x i64> %res, %res1
  %res4 = add <8 x i64> %res2, %res3
  ret <8 x i64> %res4
}

declare <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)
declare <32 x i16> @llvm.x86.avx512.maskz.vpshldv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)

define <32 x i16>@test_int_x86_avx512_mask_vpshldv_w_512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16>* %x2p, <32 x i16> %x4, i32 %x3) {
; CHECK-LABEL: test_int_x86_avx512_mask_vpshldv_w_512:
; CHECK:       ## BB#0:
; CHECK-NEXT:    kmovd %esi, %k1
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm3
; CHECK-NEXT:    vpshldvw (%rdi), %zmm1, %zmm3 {%k1}
; CHECK-NEXT:    vmovdqa64 %zmm0, %zmm4
; CHECK-NEXT:    vpshldvw %zmm2, %zmm1, %zmm4 {%k1} {z}
; CHECK-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    vpaddw %zmm4, %zmm0, %zmm0
; CHECK-NEXT:    vpaddw %zmm0, %zmm3, %zmm0
; CHECK-NEXT:    retq
  %x2 = load <32 x i16>, <32 x i16>* %x2p
  %res = call <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x2, i32 %x3)
  %res1 = call <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x4, i32 -1)
  %res2 = call <32 x i16> @llvm.x86.avx512.maskz.vpshldv.w.512(<32 x i16> %x0, <32 x i16> %x1, <32 x i16> %x4, i32  %x3)
  %res3 = add <32 x i16> %res, %res1
  %res4 = add <32 x i16> %res2, %res3
  ret <32 x i16> %res4
}
