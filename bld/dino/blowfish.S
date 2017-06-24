	.text
	.file	"blowfish.a.bc"
	.globl	TimerB1_ISR
	.align	2
	.type	TimerB1_ISR,@function
TimerB1_ISR:                            ; @TimerB1_ISR
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r12
	mov.w	&0x03C0, r12
	and.w	#-3, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	cmp.w	#0, r12
	jeq	.LBB0_2
	jmp	.LBB0_1
.LBB0_1:                                ; %if.then
	mov.w	&overflow, r12
	add.w	#1, r12
	mov.w	r12, &overflow
	mov.w	&0x03C0, r12
	bis.w	#4, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#2, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	and.w	#-2, r12
	mov.w	r12, &0x03C0
	jmp	.LBB0_2
.LBB0_2:                                ; %if.end
	pop.w	r12
	pop.w	r4
	reti
.Lfunc_end0:
	.size	TimerB1_ISR, .Lfunc_end0-TimerB1_ISR

	.globl	init
	.align	2
	.type	init,@function
init:                                   ; @init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&0x03C0, r12
	and.w	#-6401, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#512, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#192, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	and.w	#-17, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#32, r12
	mov.w	r12, &0x03C0
	mov.w	&0x03C0, r12
	bis.w	#2, r12
	mov.w	r12, &0x03C0
	call	#init_hw
	call	#mspconsole_init
	;APP
	eint { nop
	;NO_APP
	mov.w	&curtask, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	init, .Lfunc_end1-init

	.globl	BF_encrypt
	.align	2
	.type	BF_encrypt,@function
BF_encrypt:                             ; @BF_encrypt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#44, r1
	;DEBUG_VALUE: BF_encrypt:data <- undef
	;DEBUG_VALUE: BF_encrypt:key <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	mov.w	r13, -46(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#6, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB2_2
	jmp	.LBB2_1
.LBB2_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB2_2
.LBB2_2:                                ; %if.end
	;DEBUG_VALUE: BF_encrypt:l <- [FP+-8]
	;DEBUG_VALUE: BF_encrypt:r <- [FP+-12]
	;DEBUG_VALUE: BF_encrypt:p <- [FP+-16]
	;DEBUG_VALUE: BF_encrypt:s0_t <- [FP+-20]
	;DEBUG_VALUE: BF_encrypt:s1_t <- [FP+-24]
	;DEBUG_VALUE: BF_encrypt:s2_t <- [FP+-28]
	;DEBUG_VALUE: BF_encrypt:s3_t <- [FP+-32]
	;DEBUG_VALUE: BF_encrypt:tmp <- [FP+-36]
	mov.w	-6(r4), r12
	mov.w	0(r12), r13
	mov.w	2(r12), r12
	mov.w	r12, -14(r4)
	mov.w	r13, -16(r4)
	mov.w	-6(r4), r12
	mov.w	4(r12), r13
	mov.w	6(r12), r12
	mov.w	r12, -10(r4)
	mov.w	r13, -12(r4)
	;DEBUG_VALUE: index <- [FP+-38]
	mov.w	#0, -42(r4)
	jmp	.LBB2_3
.LBB2_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-42(r4), r12
	cmp.w	#17, r12
	jhs	.LBB2_8
	jmp	.LBB2_4
.LBB2_4:                                ; %for.body
                                        ;   in Loop: Header=BB2_3 Depth=1
	mov.w	-42(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	2(r13), r13
	mov.w	r13, -18(r4)
	mov.w	r12, -20(r4)
	mov.w	-42(r4), r12
	cmp.w	#0, r12
	jne	.LBB2_6
	jmp	.LBB2_5
.LBB2_5:                                ; %if.then.5
                                        ;   in Loop: Header=BB2_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-20(r4), r13
	mov.w	-14(r4), r14
	mov.w	-16(r4), r15
	xor.w	r13, r15
	xor.w	r12, r14
	mov.w	r14, -14(r4)
	mov.w	r15, -16(r4)
	mov.w	-42(r4), r12
	add.w	#1, r12
	mov.w	r12, -42(r4)
	jmp	.LBB2_6
.LBB2_6:                                ; %if.end.6
                                        ;   in Loop: Header=BB2_3 Depth=1
	mov.w	-42(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	2(r13), r13
	mov.w	r13, -18(r4)
	mov.w	r12, -20(r4)
	mov.w	-10(r4), r14
	mov.w	-12(r4), r15
	xor.w	r12, r15
	xor.w	r13, r14
	mov.w	r14, -10(r4)
	mov.w	r15, -12(r4)
	mov.b	-13(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	s0(r12), r13
	mov.w	s0+2(r12), r12
	mov.w	r12, -22(r4)
	mov.w	r13, -24(r4)
	mov.b	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	s1(r12), r13
	mov.w	s1+2(r12), r12
	mov.w	r12, -26(r4)
	mov.w	r13, -28(r4)
	mov.b	-15(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	s2(r12), r13
	mov.w	s2+2(r12), r12
	mov.w	r12, -30(r4)
	mov.w	r13, -32(r4)
	mov.b	-16(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	s3(r12), r13
	mov.w	s3+2(r12), r12
	mov.w	r12, -34(r4)
	mov.w	r13, -36(r4)
	mov.w	-24(r4), r14
	mov.w	-22(r4), r15
	mov.w	-28(r4), r11
	mov.w	-26(r4), r10
	add.w	r11, r14
	addc.w	r10, r15
	mov.w	-30(r4), r11
	mov.w	-32(r4), r10
	xor.w	r10, r14
	xor.w	r11, r15
	add.w	r13, r14
	addc.w	r12, r15
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	xor.w	r14, r13
	xor.w	r15, r12
	mov.w	r12, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	r13, -38(r4)
	mov.w	r12, -40(r4)
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	r13, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-40(r4), r12
	mov.w	-38(r4), r13
	mov.w	r13, -10(r4)
	mov.w	r12, -12(r4)
	jmp	.LBB2_7
.LBB2_7:                                ; %for.inc
                                        ;   in Loop: Header=BB2_3 Depth=1
	mov.w	-42(r4), r12
	add.w	#1, r12
	mov.w	r12, -42(r4)
	jmp	.LBB2_3
.LBB2_8:                                ; %for.end
	mov.w	-8(r4), r12
	mov.w	68(r12), r13
	mov.w	70(r12), r12
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.w	-10(r4), r14
	mov.w	-12(r4), r15
	xor.w	r13, r15
	xor.w	r12, r14
	mov.w	r14, -10(r4)
	mov.w	r15, -12(r4)
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	-6(r4), r14
	mov.w	r13, 6(r14)
	mov.w	r12, 4(r14)
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	-6(r4), r14
	mov.w	r13, 2(r14)
	mov.w	r12, 0(r14)
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB2_10
	jmp	.LBB2_9
.LBB2_9:                                ; %if.then.30
	call	#__dino_unset_recovery_bit
	jmp	.LBB2_10
.LBB2_10:                               ; %if.end.31
	add.w	#44, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end2:
	.size	BF_encrypt, .Lfunc_end2-BF_encrypt

	.globl	BF_set_key
	.align	2
	.type	BF_set_key,@function
BF_set_key:                             ; @BF_set_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#66, r1
	;DEBUG_VALUE: BF_set_key:data <- undef
	;DEBUG_VALUE: BF_set_key:key <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	#0, -18(r4)
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	mov.w	r13, -36(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	mov.w	#0, -8(r4)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	cmp.w	#18, r12
	jlo	4
	br	#.LBB3_18
	jmp	.LBB3_4
.LBB3_4:                                ; %for.body
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r12, -12(r4)
	mov.w	#0, -10(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB3_6
	jmp	.LBB3_5
.LBB3_5:                                ; %cond.true
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	#0, r12
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_7
.LBB3_6:                                ; %cond.false
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_7
.LBB3_7:                                ; %cond.end
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -12(r4)
	mov.w	r12, -10(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r12, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	-10(r4), r13
	mov.w	-12(r4), r14
	bis.w	r12, r14
	mov.w	r13, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB3_9
	jmp	.LBB3_8
.LBB3_8:                                ; %cond.true.8
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	#0, r12
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_10
.LBB3_9:                                ; %cond.false.9
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_10
.LBB3_10:                               ; %cond.end.10
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -12(r4)
	mov.w	r12, -10(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r12, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	-10(r4), r13
	mov.w	-12(r4), r14
	bis.w	r12, r14
	mov.w	r13, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB3_12
	jmp	.LBB3_11
.LBB3_11:                               ; %cond.true.19
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	#0, r12
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_13
.LBB3_12:                               ; %cond.false.20
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_13
.LBB3_13:                               ; %cond.end.21
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-42(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -12(r4)
	mov.w	r12, -10(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	mov.w	-4(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r12, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	-10(r4), r13
	mov.w	-12(r4), r14
	bis.w	r12, r14
	mov.w	r13, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB3_15
	jmp	.LBB3_14
.LBB3_14:                               ; %cond.true.30
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	#0, r12
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_16
.LBB3_15:                               ; %cond.false.31
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_16
.LBB3_16:                               ; %cond.end.32
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	-8(r4), r14
	mov.w	-6(r4), r15
	rla.w	r14
	rla.w	r14
	add.w	r14, r15
	mov.w	2(r15), r14
	mov.w	0(r15), r11
	xor.w	r13, r11
	xor.w	r12, r14
	mov.w	r14, 2(r15)
	mov.w	r11, 0(r15)
	jmp	.LBB3_17
.LBB3_17:                               ; %for.inc
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	br	#.LBB3_3
.LBB3_18:                               ; %for.end
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB3_20
	jmp	.LBB3_19
.LBB3_19:                               ; %if.then.38
	call	#__dino_unset_recovery_bit
	jmp	.LBB3_20
.LBB3_20:                               ; %if.end.39
	;DEBUG_VALUE: BF_set_key:in <- [FP+-26]
	mov.w	#0, -22(r4)
	mov.w	#0, -24(r4)
	mov.w	#0, -26(r4)
	mov.w	#0, -28(r4)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	;DEBUG_VALUE: BF_set_key:li <- [FP+-30]
	mov.w	#0, -30(r4)
	mov.w	#2, -32(r4)
	jmp	.LBB3_21
.LBB3_21:                               ; %for.cond.40
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#1044, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_23
; BB#22:                                ; %for.cond.40
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
.LBB3_23:                               ; %for.cond.40
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jeq	4
	br	#.LBB3_50
	jmp	.LBB3_24
.LBB3_24:                               ; %for.body.43
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#20, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -50(r4)            ; 2-byte Folded Spill
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_26
; BB#25:                                ; %for.body.43
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
.LBB3_26:                               ; %for.body.43
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-52(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_28
	jmp	.LBB3_27
.LBB3_27:                               ; %if.then.46
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	-6(r4), r15
	add.w	r15, r14
	mov.w	r13, -6(r14)
	mov.w	r12, -8(r14)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	-6(r4), r15
	add.w	r15, r14
	mov.w	r13, -2(r14)
	mov.w	r12, -4(r14)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	br	#.LBB3_48
.LBB3_28:                               ; %if.else
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#276, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -54(r4)            ; 2-byte Folded Spill
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_30
; BB#29:                                ; %if.else
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
.LBB3_30:                               ; %if.else
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-56(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_32
	jmp	.LBB3_31
.LBB3_31:                               ; %if.then.56
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s0-78(r14)
	mov.w	r12, s0-80(r14)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s0-74(r14)
	mov.w	r12, s0-76(r14)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	jmp	.LBB3_47
.LBB3_32:                               ; %if.else.66
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#532, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -58(r4)            ; 2-byte Folded Spill
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_34
; BB#33:                                ; %if.else.66
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-58(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
.LBB3_34:                               ; %if.else.66
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-60(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_36
	jmp	.LBB3_35
.LBB3_35:                               ; %if.then.69
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s1-1102(r14)
	mov.w	r12, s1-1104(r14)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s1-1098(r14)
	mov.w	r12, s1-1100(r14)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	jmp	.LBB3_46
.LBB3_36:                               ; %if.else.79
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#788, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -62(r4)            ; 2-byte Folded Spill
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_38
; BB#37:                                ; %if.else.79
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-62(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
.LBB3_38:                               ; %if.else.79
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-64(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_40
	jmp	.LBB3_39
.LBB3_39:                               ; %if.then.82
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s2-2126(r14)
	mov.w	r12, s2-2128(r14)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s2-2122(r14)
	mov.w	r12, s2-2124(r14)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	jmp	.LBB3_45
.LBB3_40:                               ; %if.else.92
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#1044, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -66(r4)            ; 2-byte Folded Spill
	mov.w	r12, -68(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_42
; BB#41:                                ; %if.else.92
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-66(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -68(r4)            ; 2-byte Folded Spill
.LBB3_42:                               ; %if.else.92
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-68(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_44
	jmp	.LBB3_43
.LBB3_43:                               ; %if.then.95
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s3-3150(r14)
	mov.w	r12, s3-3152(r14)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-32(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	r13, s3-3146(r14)
	mov.w	r12, s3-3148(r14)
	mov.w	-6(r4), r14
	mov.w	r4, r15
	sub.w	#28, r15
	call	#BF_encrypt
	jmp	.LBB3_44
.LBB3_44:                               ; %if.end.105
                                        ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_45
.LBB3_45:                               ; %if.end.106
                                        ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_46
.LBB3_46:                               ; %if.end.107
                                        ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_47
.LBB3_47:                               ; %if.end.108
                                        ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_48
.LBB3_48:                               ; %if.end.109
                                        ;   in Loop: Header=BB3_21 Depth=1
	jmp	.LBB3_49
.LBB3_49:                               ; %for.inc.110
                                        ;   in Loop: Header=BB3_21 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	add.w	#2, r12
	addc.w	#0, r13
	mov.w	r13, -30(r4)
	mov.w	r12, -32(r4)
	br	#.LBB3_21
.LBB3_50:                               ; %for.end.111
	add.w	#66, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end3:
	.size	BF_set_key, .Lfunc_end3-BF_set_key

	.globl	BF_cfb64_encrypt
	.align	2
	.type	BF_cfb64_encrypt,@function
BF_cfb64_encrypt:                       ; @BF_cfb64_encrypt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#36, r1
	;DEBUG_VALUE: BF_cfb64_encrypt:out <- undef
	;DEBUG_VALUE: BF_cfb64_encrypt:iv <- undef
	;DEBUG_VALUE: BF_cfb64_encrypt:key <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	#0, -24(r4)
	mov.w	#0, -26(r4)
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	mov.w	r11, -32(r4)            ; 2-byte Folded Spill
	mov.w	r10, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_1
.LBB4_1:                                ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_6 Depth 2
	mov.w	-26(r4), r12
	cmp.w	#13, r12
	jlo	4
	br	#.LBB4_14
	jmp	.LBB4_2
.LBB4_2:                                ; %for.body
                                        ;   in Loop: Header=BB4_1 Depth=1
	call	#__mementos_checkpoint
	mov.w	#8, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then
                                        ;   in Loop: Header=BB4_1 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_4
.LBB4_4:                                ; %if.end
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-24(r4), r12
	cmp.w	#0, r12
	jne	.LBB4_10
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then.2
                                        ;   in Loop: Header=BB4_1 Depth=1
	;DEBUG_VALUE: j <- [FP+-24]
	mov.w	#0, -28(r4)
	jmp	.LBB4_6
.LBB4_6:                                ; %for.cond.3
                                        ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-28(r4), r12
	cmp.w	#8, r12
	jhs	.LBB4_9
	jmp	.LBB4_7
.LBB4_7:                                ; %for.body.5
                                        ;   in Loop: Header=BB4_6 Depth=2
	jmp	.LBB4_8
.LBB4_8:                                ; %for.inc
                                        ;   in Loop: Header=BB4_6 Depth=2
	mov.w	-28(r4), r12
	add.w	#1, r12
	mov.w	r12, -28(r4)
	jmp	.LBB4_6
.LBB4_9:                                ; %for.end
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	mov.b	0(r12), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -18(r4)
	mov.w	#0, -20(r4)
	mov.w	-8(r4), r13
	mov.b	1(r13), r13
	bis.w	r13, r12
	mov.w	r12, -18(r4)
	mov.w	#0, -20(r4)
	mov.w	-8(r4), r13
	mov.b	2(r13), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.w	-8(r4), r14
	mov.b	3(r14), r14
	bis.w	r14, r13
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.w	-8(r4), r12
	mov.b	4(r12), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -14(r4)
	mov.w	#0, -16(r4)
	mov.w	-8(r4), r13
	mov.b	5(r13), r13
	bis.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -16(r4)
	mov.w	-8(r4), r13
	mov.b	6(r13), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r12, -14(r4)
	mov.w	r13, -16(r4)
	mov.w	-8(r4), r14
	mov.b	7(r14), r14
	bis.w	r14, r13
	mov.w	r12, -14(r4)
	mov.w	r13, -16(r4)
	mov.b	#1, &test11
	mov.w	-10(r4), r14
	mov.w	r4, r15
	sub.w	#20, r15
	call	#BF_encrypt
	mov.b	#0, &test11
	mov.b	-17(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 0(r12)
	mov.b	-18(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 1(r12)
	mov.b	-19(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 2(r12)
	mov.b	-20(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 3(r12)
	mov.b	-13(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 4(r12)
	mov.b	-14(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 5(r12)
	mov.b	-15(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 6(r12)
	mov.b	-16(r4), r11
	mov.w	-8(r4), r12
	mov.b	r11, 7(r12)
	jmp	.LBB4_10
.LBB4_10:                               ; %if.end.74
                                        ;   in Loop: Header=BB4_1 Depth=1
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_12
	jmp	.LBB4_11
.LBB4_11:                               ; %if.then.77
                                        ;   in Loop: Header=BB4_1 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_12
.LBB4_12:                               ; %if.end.78
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-26(r4), r12
	mov.b	indata(r12), r12
	mov.w	-24(r4), r13
	mov.w	-8(r4), r14
	add.w	r13, r14
	mov.b	0(r14), r13
	xor.w	r13, r12
	mov.b	r12, r15
	mov.b	r15, -21(r4)
	mov.w	-26(r4), r12
	mov.w	-6(r4), r13
	add.w	r12, r13
	mov.b	r15, 0(r13)
	mov.b	-21(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.1, 0(r13)
	call	#printf
	mov.b	-21(r4), r11
	mov.w	-24(r4), r12
	mov.w	-8(r4), r13
	add.w	r12, r13
	mov.b	r11, 0(r13)
	mov.w	-24(r4), r12
	add.w	#1, r12
	and.w	#7, r12
	mov.w	r12, -24(r4)
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_13
.LBB4_13:                               ; %for.inc.89
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	br	#.LBB4_1
.LBB4_14:                               ; %for.end.91
	add.w	#36, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end4:
	.size	BF_cfb64_encrypt, .Lfunc_end4-BF_cfb64_encrypt

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#200, r1
	mov.w	#0, -2(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -78(r4)
	cmp.w	#-1, r15
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov.w	-78(r4), r15
	call	#__mementos_restore
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	;DEBUG_VALUE: main:ukey <- [FP+-94]
	;DEBUG_VALUE: main:outdata <- [FP+-174]
	;DEBUG_VALUE: main:ivec <- [FP+-182]
	;DEBUG_VALUE: main:i <- [FP+-184]
	mov.w	#0, -184(r4)
	;DEBUG_VALUE: main:by <- [FP+-186]
	mov.w	#0, -186(r4)
	mov.w	#0, -184(r4)
	jmp	.LBB5_3
.LBB5_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-184(r4), r12
	cmp.w	#8, r12
	jhs	.LBB5_6
	jmp	.LBB5_4
.LBB5_4:                                ; %for.body
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-184(r4), r12
	mov.w	r4, r13
	sub.w	#182, r13
	add.w	r12, r13
	mov.b	#0, 0(r13)
	jmp	.LBB5_5
.LBB5_5:                                ; %for.inc
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-184(r4), r12
	add.w	#1, r12
	mov.w	r12, -184(r4)
	jmp	.LBB5_3
.LBB5_6:                                ; %for.end
	mov.w	#0, -184(r4)
	call	#__mementos_checkpoint
	mov.w	#1, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_8
	jmp	.LBB5_7
.LBB5_7:                                ; %if.then.3
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_8
.LBB5_8:                                ; %if.end.4
	jmp	.LBB5_9
.LBB5_9:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-184(r4), r12
	cmp.w	#32, r12
	jhs	.LBB5_21
	jmp	.LBB5_10
.LBB5_10:                               ; %while.body
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-184(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#48, r12
	jl	.LBB5_13
	jmp	.LBB5_11
.LBB5_11:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-184(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#58, r12
	jge	.LBB5_13
	jmp	.LBB5_12
.LBB5_12:                               ; %if.then.13
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-186(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-184(r4), r13
	mov.b	cp(r13), r13
	sxt	r13
	add.w	r13, r12
	add.w	#-48, r12
	mov.w	r12, -186(r4)
	jmp	.LBB5_18
.LBB5_13:                               ; %if.else
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-184(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#65, r12
	jl	.LBB5_16
	jmp	.LBB5_14
.LBB5_14:                               ; %land.lhs.true.20
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-184(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#71, r12
	jge	.LBB5_16
	jmp	.LBB5_15
.LBB5_15:                               ; %if.then.25
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-186(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-184(r4), r13
	mov.b	cp(r13), r13
	sxt	r13
	add.w	r13, r12
	add.w	#-55, r12
	mov.w	r12, -186(r4)
	jmp	.LBB5_17
.LBB5_16:                               ; %if.else.32
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.2, 0(r12)
	call	#printf
	mov.w	r15, -188(r4)           ; 2-byte Folded Spill
	jmp	.LBB5_17
.LBB5_17:                               ; %if.end.34
                                        ;   in Loop: Header=BB5_9 Depth=1
	jmp	.LBB5_18
.LBB5_18:                               ; %if.end.35
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.w	-184(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -184(r4)
	bit.w	#1, r12
	jeq	.LBB5_20
	jmp	.LBB5_19
.LBB5_19:                               ; %if.then.38
                                        ;   in Loop: Header=BB5_9 Depth=1
	mov.b	-186(r4), r12
	mov.w	-184(r4), r13
	clrc
	rrc.w	r13
	mov.w	r4, r14
	sub.w	#94, r14
	add.w	r14, r13
	mov.b	r12, -1(r13)
	jmp	.LBB5_20
.LBB5_20:                               ; %if.end.43
                                        ;   in Loop: Header=BB5_9 Depth=1
	jmp	.LBB5_9
.LBB5_21:                               ; %while.end
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_23
	jmp	.LBB5_22
.LBB5_22:                               ; %if.then.46
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_23
.LBB5_23:                               ; %if.end.47
	mov.w	#0, -184(r4)
	jmp	.LBB5_24
.LBB5_24:                               ; %for.cond.48
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-184(r4), r12
	cmp.w	#18, r12
	jhs	.LBB5_27
	jmp	.LBB5_25
.LBB5_25:                               ; %for.body.51
                                        ;   in Loop: Header=BB5_24 Depth=1
	mov.w	-184(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	init_key+2(r12), r13
	mov.w	init_key(r12), r14
	mov.w	r4, r15
	sub.w	#76, r15
	add.w	r12, r15
	mov.w	r14, 0(r15)
	bis.w	#2, r15
	mov.w	r13, 0(r15)
	jmp	.LBB5_26
.LBB5_26:                               ; %for.inc.54
                                        ;   in Loop: Header=BB5_24 Depth=1
	mov.w	-184(r4), r12
	add.w	#1, r12
	mov.w	r12, -184(r4)
	jmp	.LBB5_24
.LBB5_27:                               ; %for.end.56
	mov.w	#0, -184(r4)
	jmp	.LBB5_28
.LBB5_28:                               ; %for.cond.57
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-184(r4), r12
	cmp.w	#1024, r12
	jhs	.LBB5_47
	jmp	.LBB5_29
.LBB5_29:                               ; %for.body.60
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#0, r12
	jeq	.LBB5_33
	jmp	.LBB5_30
.LBB5_30:                               ; %lor.lhs.false
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#256, r12
	jeq	.LBB5_33
	jmp	.LBB5_31
.LBB5_31:                               ; %lor.lhs.false.65
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#512, r12
	jeq	.LBB5_33
	jmp	.LBB5_32
.LBB5_32:                               ; %lor.lhs.false.68
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#768, r12
	jne	.LBB5_36
	jmp	.LBB5_33
.LBB5_33:                               ; %if.then.71
                                        ;   in Loop: Header=BB5_28 Depth=1
	call	#__mementos_checkpoint
	mov.w	#3, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_35
	jmp	.LBB5_34
.LBB5_34:                               ; %if.then.74
                                        ;   in Loop: Header=BB5_28 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_35
.LBB5_35:                               ; %if.end.75
                                        ;   in Loop: Header=BB5_28 Depth=1
	jmp	.LBB5_36
.LBB5_36:                               ; %if.end.76
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#256, r12
	jhs	.LBB5_38
	jmp	.LBB5_37
.LBB5_37:                               ; %if.then.79
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	init_s0(r12), r13
	mov.w	init_s0+2(r12), r14
	mov.w	r14, s0+2(r12)
	mov.w	r13, s0(r12)
	jmp	.LBB5_45
.LBB5_38:                               ; %if.else.82
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#512, r12
	jhs	.LBB5_40
	jmp	.LBB5_39
.LBB5_39:                               ; %if.then.85
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	init_s1-1024(r12), r13
	mov.w	init_s1-1022(r12), r14
	mov.w	r14, s1-1022(r12)
	mov.w	r13, s1-1024(r12)
	jmp	.LBB5_44
.LBB5_40:                               ; %if.else.90
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	cmp.w	#768, r12
	jhs	.LBB5_42
	jmp	.LBB5_41
.LBB5_41:                               ; %if.then.93
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	init_s2-2048(r12), r13
	mov.w	init_s2-2046(r12), r14
	mov.w	r14, s2-2046(r12)
	mov.w	r13, s2-2048(r12)
	jmp	.LBB5_43
.LBB5_42:                               ; %if.else.98
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	init_s3-3072(r12), r13
	mov.w	init_s3-3070(r12), r14
	mov.w	r14, s3-3070(r12)
	mov.w	r13, s3-3072(r12)
	jmp	.LBB5_43
.LBB5_43:                               ; %if.end.103
                                        ;   in Loop: Header=BB5_28 Depth=1
	jmp	.LBB5_44
.LBB5_44:                               ; %if.end.104
                                        ;   in Loop: Header=BB5_28 Depth=1
	jmp	.LBB5_45
.LBB5_45:                               ; %if.end.105
                                        ;   in Loop: Header=BB5_28 Depth=1
	jmp	.LBB5_46
.LBB5_46:                               ; %for.inc.106
                                        ;   in Loop: Header=BB5_28 Depth=1
	mov.w	-184(r4), r12
	add.w	#1, r12
	mov.w	r12, -184(r4)
	jmp	.LBB5_28
.LBB5_47:                               ; %for.end.108
	mov.w	r4, r15
	sub.w	#94, r15
	mov.w	r4, r12
	sub.w	#76, r12
	mov.w	r12, r14
	mov.w	r12, -190(r4)           ; 2-byte Folded Spill
	call	#BF_set_key
	mov.w	r4, r15
	sub.w	#174, r15
	mov.w	r4, r14
	sub.w	#182, r14
	mov.w	-190(r4), r13           ; 2-byte Folded Reload
	call	#BF_cfb64_encrypt
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.3, 0(r14)
	call	#printf
	mov.w	-2(r4), r12
	mov.w	r15, -192(r4)           ; 2-byte Folded Spill
	mov.w	r12, r15
	add.w	#200, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	main, .Lfunc_end5-main

	.align	2
	.type	init_hw,@function
init_hw:                                ; @init_hw
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#msp_watchdog_disable
	mov.w	&0x0130, r12
	and.w	#-2, r12
	mov.w	r12, &0x0130
	call	#msp_clock_setup
	pop.w	r4
	ret
.Lfunc_end6:
	.size	init_hw, .Lfunc_end6-init_hw

	.globl	msp_watchdog_enable
	.align	2
	.type	msp_watchdog_enable,@function
msp_watchdog_enable:                    ; @msp_watchdog_enable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;DEBUG_VALUE: msp_watchdog_enable:bits <- R15
	;DEBUG_VALUE: msp_watchdog_enable:bits <- R15
	mov.b	r15, r12
	bis.w	#23048, r15
	mov.w	r15, &0x015C
	mov.b	r12, &watchdog_bits
	pop.w	r4
	ret
.Lfunc_end7:
	.size	msp_watchdog_enable, .Lfunc_end7-msp_watchdog_enable

	.globl	msp_watchdog_disable
	.align	2
	.type	msp_watchdog_disable,@function
msp_watchdog_disable:                   ; @msp_watchdog_disable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#23168, &0x015C
	pop.w	r4
	ret
.Lfunc_end8:
	.size	msp_watchdog_disable, .Lfunc_end8-msp_watchdog_disable

	.globl	msp_watchdog_kick
	.align	2
	.type	msp_watchdog_kick,@function
msp_watchdog_kick:                      ; @msp_watchdog_kick
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.b	&watchdog_bits, r12
	bis.w	#23048, r12
	mov.w	r12, &0x015C
	pop.w	r4
	ret
.Lfunc_end9:
	.size	msp_watchdog_kick, .Lfunc_end9-msp_watchdog_kick

	.globl	memcpy
	.align	2
	.type	memcpy,@function
memcpy:                                 ; @memcpy
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	;DEBUG_VALUE: memcpy:dest <- R15
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:n <- R13
	;DEBUG_VALUE: memcpy:n <- R13
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:dest <- R15
	;DEBUG_VALUE: memcpy:i <- 0
	mov.w	r13, r12
	;DEBUG_VALUE: memcpy:src <- R14
	;DEBUG_VALUE: memcpy:dest <- R15
	cmp.w	#0, r13
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	;DEBUG_VALUE: memcpy:dest <- [FP+-2]
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	mov.w	r14, -6(r4)             ; 2-byte Folded Spill
	;DEBUG_VALUE: memcpy:src <- [FP+-6]
	jeq	.LBB10_4
	jmp	.LBB10_1
.LBB10_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB10_2
.LBB10_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.b	0(r13), r14
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.b	r14, 0(r13)
	add.w	#1, r12
	;DEBUG_VALUE: memcpy:i <- R12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	cmp.w	r13, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jne	.LBB10_2
	jmp	.LBB10_3
.LBB10_3:                               ; %while.end.loopexit
	jmp	.LBB10_4
.LBB10_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	memcpy, .Lfunc_end10-memcpy

	.globl	my_memset
	.align	2
	.type	my_memset,@function
my_memset:                              ; @my_memset
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;DEBUG_VALUE: my_memset:s <- R15
	;DEBUG_VALUE: my_memset:c <- R14
	;DEBUG_VALUE: my_memset:n <- R13
	;APP
	mov r15, r12
add r15, r13
cmp r13, r12
jz $+10
mov.b r14, 0(r12)
inc r12
jmp $-10

	;NO_APP
	pop.w	r4
	ret
.Lfunc_end11:
	.size	my_memset, .Lfunc_end11-my_memset

	.globl	msp_clock_setup
	.align	2
	.type	msp_clock_setup,@function
msp_clock_setup:                        ; @msp_clock_setup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.b	#-91, &0x0160+1
	mov.w	#70, &0x0162
	mov.w	#51, &0x0164
	mov.w	#0, &0x0166
	pop.w	r4
	ret
.Lfunc_end12:
	.size	msp_clock_setup, .Lfunc_end12-msp_clock_setup

	.globl	mult16
	.align	2
	.type	mult16,@function
mult16:                                 ; @mult16
; BB#0:                                 ; %entry
	;APP
	MOV R15, &0x04C0
MOV R14, &0x04C8
MOV &0x04CA, R14
MOV &0x04CC, R15
RET

	;NO_APP
.Lfunc_end13:
	.size	mult16, .Lfunc_end13-mult16

	.globl	sqrt16
	.align	2
	.type	sqrt16,@function
sqrt16:                                 ; @sqrt16
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#30, r1
	;DEBUG_VALUE: sqrt16:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	#-1, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	-10(r4), r14
	clrc
	rrc.w	r14
	mov.w	r14, -14(r4)
	mov.w	#0, -18(r4)
	mov.w	#0, -20(r4)
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB14_1
.LBB14_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-8(r4), r14
	mov.w	-6(r4), r15
	mov.b	#0, r11
	xor.w	r15, r13
	xor.w	r14, r12
	bis.w	r13, r12
	cmp.w	#0, r12
	mov.b	r11, -25(r4)            ; 1-byte Folded Spill
	jeq	.LBB14_3
	jmp	.LBB14_2
.LBB14_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB14_3
.LBB14_3:                               ; %land.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB14_10
	jmp	.LBB14_4
.LBB14_4:                               ; %while.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	#0, r14
	add.w	r13, r12
	addc.w	#0, r14
	clrc
	rrc.w	r12
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r12
	mov.w	r12, -14(r4)
	mov.w	r12, r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -18(r4)
	mov.w	r14, -20(r4)
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r15
	mov.w	r2, r11
	and.w	#1, r11
	cmp.w	r12, r14
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	r13, r15
	mov.w	r11, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	jeq	.LBB14_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB14_6:                               ; %while.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB14_8
	jmp	.LBB14_7
.LBB14_7:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB14_9
.LBB14_8:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB14_9
.LBB14_9:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_1
.LBB14_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end14:
	.size	sqrt16, .Lfunc_end14-sqrt16

	.globl	udivmodhi4
	.align	2
	.type	udivmodhi4,@function
udivmodhi4:                             ; @udivmodhi4
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#20, r1
	;DEBUG_VALUE: udivmodhi4:num <- undef
	;DEBUG_VALUE: udivmodhi4:den <- undef
	;DEBUG_VALUE: udivmodhi4:modwanted <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -8(r4)
	mov.w	r14, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	#1, -14(r4)
	mov.w	#0, -16(r4)
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	mov.w	r11, -20(r4)            ; 2-byte Folded Spill
	mov.w	r10, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB15_1
.LBB15_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB15_4
	jmp	.LBB15_2
.LBB15_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB15_4
	jmp	.LBB15_3
.LBB15_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB15_4
.LBB15_4:                               ; %land.end
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB15_6
	jmp	.LBB15_5
.LBB15_5:                               ; %while.body
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB15_1
.LBB15_6:                               ; %while.end
	jmp	.LBB15_7
.LBB15_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB15_11
	jmp	.LBB15_8
.LBB15_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB15_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB15_10
	jmp	.LBB15_9
.LBB15_9:                               ; %if.then
                                        ;   in Loop: Header=BB15_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB15_10
.LBB15_10:                              ; %if.end
                                        ;   in Loop: Header=BB15_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB15_7
.LBB15_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB15_13
	jmp	.LBB15_12
.LBB15_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB15_14
.LBB15_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB15_14
.LBB15_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end15:
	.size	udivmodhi4, .Lfunc_end15-udivmodhi4

	.globl	__divhi3
	.align	2
	.type	__divhi3,@function
__divhi3:                               ; @__divhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: __divhi3:a <- undef
	;DEBUG_VALUE: __divhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r14
	cmp.w	#0, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	jge	.LBB16_2
	jmp	.LBB16_1
.LBB16_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB16_2
.LBB16_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB16_4
	jmp	.LBB16_3
.LBB16_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB16_4
.LBB16_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB16_6
	jmp	.LBB16_5
.LBB16_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB16_6
.LBB16_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end16:
	.size	__divhi3, .Lfunc_end16-__divhi3

	.globl	__modhi3
	.align	2
	.type	__modhi3,@function
__modhi3:                               ; @__modhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: __modhi3:a <- undef
	;DEBUG_VALUE: __modhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r14
	cmp.w	#0, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	jge	.LBB17_2
	jmp	.LBB17_1
.LBB17_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB17_2
.LBB17_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB17_4
	jmp	.LBB17_3
.LBB17_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB17_4
.LBB17_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB17_6
	jmp	.LBB17_5
.LBB17_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB17_6
.LBB17_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end17:
	.size	__modhi3, .Lfunc_end17-__modhi3

	.globl	__udivhi3
	.align	2
	.type	__udivhi3,@function
__udivhi3:                              ; @__udivhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#8, r1
	;DEBUG_VALUE: __udivhi3:a <- undef
	;DEBUG_VALUE: __udivhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	-4(r4), r15
	mov.w	#0, r11
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r11, r13
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#udivmodhi4
	add.w	#8, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end18:
	.size	__udivhi3, .Lfunc_end18-__udivhi3

	.globl	__umodhi3
	.align	2
	.type	__umodhi3,@function
__umodhi3:                              ; @__umodhi3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#8, r1
	;DEBUG_VALUE: __umodhi3:a <- undef
	;DEBUG_VALUE: __umodhi3:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	-4(r4), r15
	mov.w	#1, r11
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r11, r13
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#udivmodhi4
	add.w	#8, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end19:
	.size	__umodhi3, .Lfunc_end19-__umodhi3

	.globl	__dino_task_boundary
	.align	2
	.type	__dino_task_boundary,@function
__dino_task_boundary:                   ; @__dino_task_boundary
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: __dino_task_boundary:t <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end20:
	.size	__dino_task_boundary, .Lfunc_end20-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB21_2
	jmp	.LBB21_1
.LBB21_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB21_2
.LBB21_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end21:
	.size	__dino_empty_versioning, .Lfunc_end21-__dino_empty_versioning

	.globl	__dino_unset_recovery_bit
	.align	2
	.type	__dino_unset_recovery_bit,@function
__dino_unset_recovery_bit:              ; @__dino_unset_recovery_bit
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#0, &__mementos_restored
	pop.w	r4
	ret
.Lfunc_end22:
	.size	__dino_unset_recovery_bit, .Lfunc_end22-__dino_unset_recovery_bit

	.globl	__dino_recovery_bit_set
	.align	2
	.type	__dino_recovery_bit_set,@function
__dino_recovery_bit_set:                ; @__dino_recovery_bit_set
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	&__mementos_restored, r12
	cmp.w	#1, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, r15
	pop.w	r4
	ret
.Lfunc_end23:
	.size	__dino_recovery_bit_set, .Lfunc_end23-__dino_recovery_bit_set

	.globl	__dino_find_next_recovery
	.align	2
	.type	__dino_find_next_recovery,@function
__dino_find_next_recovery:              ; @__dino_find_next_recovery
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	call	#__mementos_find_active_bundle
	mov.w	r15, -4(r4)
	cmp.w	#-4226, r15
	jne	.LBB24_2
	jmp	.LBB24_1
.LBB24_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB24_5
.LBB24_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB24_4
	jmp	.LBB24_3
.LBB24_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB24_5
.LBB24_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB24_5
.LBB24_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end24:
	.size	__dino_find_next_recovery, .Lfunc_end24-__dino_find_next_recovery

	.globl	__dino_find_active_recovery
	.align	2
	.type	__dino_find_active_recovery,@function
__dino_find_active_recovery:            ; @__dino_find_active_recovery
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	call	#__mementos_find_active_bundle
	mov.w	r15, -4(r4)
	cmp.w	#-4226, r15
	jne	.LBB25_2
	jmp	.LBB25_1
.LBB25_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB25_5
.LBB25_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB25_4
	jmp	.LBB25_3
.LBB25_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB25_5
.LBB25_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB25_5
.LBB25_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end25:
	.size	__dino_find_active_recovery, .Lfunc_end25-__dino_find_active_recovery

	.globl	__dino_recovery_get
	.align	2
	.type	__dino_recovery_get,@function
__dino_recovery_get:                    ; @__dino_recovery_get
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: __dino_recovery_get:recoveryAddr <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#__dino_find_active_recovery
	mov.w	0(r15), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__dino_recovery_get, .Lfunc_end26-__dino_recovery_get

	.globl	__dino_recovery_set
	.align	2
	.type	__dino_recovery_set,@function
__dino_recovery_set:                    ; @__dino_recovery_set
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: __dino_recovery_set:p <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#__dino_find_active_recovery
	mov.w	-4(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, 0(r15)
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	__dino_recovery_set, .Lfunc_end27-__dino_recovery_set

	.globl	__dino_set_next_recovery
	.align	2
	.type	__dino_set_next_recovery,@function
__dino_set_next_recovery:               ; @__dino_set_next_recovery
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: __dino_set_next_recovery:p <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#__dino_find_next_recovery
	mov.w	-4(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, 0(r15)
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__dino_set_next_recovery, .Lfunc_end28-__dino_set_next_recovery

	.globl	__mementos_restore
	.align	2
	.type	__mementos_restore,@function
__mementos_restore:                     ; @__mementos_restore
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: __mementos_restore:b <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r15, &baseaddr
	mov.w	#1, &__mementos_restored
	mov.w	&baseaddr, r15
	mov.w	2(r15), r15
	mov.w	r15, &tmpsize
	mov.w	#0, &i
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	jmp	.LBB29_1
.LBB29_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB29_4
	jmp	.LBB29_2
.LBB29_2:                               ; %for.body
                                        ;   in Loop: Header=BB29_1 Depth=1
	;APP
	MOV #0x2400, j
	;NO_APP
	;APP
	SUB i, j
	;NO_APP
	;APP
	DECD.W j
	;NO_APP
	;APP
	MOV baseaddr, k
	;NO_APP
	;APP
	ADD #30, k
	;NO_APP
	;APP
	ADD #2, k
	;NO_APP
	;APP
	ADD tmpsize, k
	;NO_APP
	;APP
	SUB i, k
	;NO_APP
	;APP
	MOV k, R7
	;NO_APP
	;APP
	MOV j, R8
	;NO_APP
	;APP
	MOV @R7, 0(R8)
	;NO_APP
	jmp	.LBB29_3
.LBB29_3:                               ; %for.inc
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB29_1
.LBB29_4:                               ; %for.end
	;APP
	MOV tmpsize, R7
	;NO_APP
	;APP
	MOV baseaddr, R6
	;NO_APP
	;APP
	MOV @R6, R8
	;NO_APP
	;APP
	CLR.W R9
	;NO_APP
	;APP
	rdloop:
	;NO_APP
	;APP
	CMP R8, R9
	;NO_APP
	;APP
	JC afterrd
	;NO_APP
	;APP
	MOV R6, R10
	;NO_APP
	;APP
	ADD #34, R10
	;NO_APP
	;APP
	ADD R7, R10
	;NO_APP
	;APP
	ADD R9, R10
	;NO_APP
	;APP
	MOV 0(R10), 0x1C00(R9)
	;NO_APP
	;APP
	INCD R9
	;NO_APP
	;APP
	JMP rdloop
	;NO_APP
	;APP
	afterrd:
	;NO_APP
	;APP
	MOV R6, baseaddr
	;NO_APP
	;APP
	MOV 4(R6), j
	;NO_APP
	;APP
	MOV 6(R6), R1
	;NO_APP
	;APP
	MOV 32(R6), R15
	;NO_APP
	;APP
	MOV 30(R6), R14
	;NO_APP
	;APP
	MOV 28(R6), R13
	;NO_APP
	;APP
	MOV 26(R6), R12
	;NO_APP
	;APP
	MOV 24(R6), R11
	;NO_APP
	;APP
	MOV 22(R6), R10
	;NO_APP
	;APP
	MOV 20(R6), R9
	;NO_APP
	;APP
	MOV 18(R6), R8
	;NO_APP
	;APP
	MOV 16(R6), R7
	;NO_APP
	;APP
	MOV 12(R6), R5
	;NO_APP
	;APP
	MOV 10(R6), R4
	;NO_APP
	;APP
	MOV 8(R6), R2
	;NO_APP
	;APP
	MOV 6(R6), R1
	;NO_APP
	;APP
	PUSH 4(R6)
	;NO_APP
	;APP
	MOV 14(R6), R6
	;NO_APP
	;APP
	POP R0
	;NO_APP
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	__mementos_restore, .Lfunc_end29-__mementos_restore

	.globl	__mementos_setup_timer
	.align	2
	.type	__mementos_setup_timer,@function
__mementos_setup_timer:                 ; @__mementos_setup_timer
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#16, &0x0342
	mov.w	#20000, &0x0352
	mov.w	#528, &0x0340
	jmp	.LBB30_1
.LBB30_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB30_2
.LBB30_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end30:
	.size	__mementos_setup_timer, .Lfunc_end30-__mementos_setup_timer

	.globl	TIMER0_A0_ISR
	.align	2
	.type	TIMER0_A0_ISR,@function
TIMER0_A0_ISR:                          ; @TIMER0_A0_ISR
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r12
	mov.b	#1, &ok_to_checkpoint
	mov.w	#20000, &0x0352
	mov.w	&0x0342, r12
	and.w	#-2, r12
	mov.w	r12, &0x0342
	pop.w	r12
	pop.w	r4
	reti
.Lfunc_end31:
	.size	TIMER0_A0_ISR, .Lfunc_end31-TIMER0_A0_ISR

	.globl	__mementos_checkpoint
	.align	2
	.type	__mementos_checkpoint,@function
__mementos_checkpoint:                  ; @__mementos_checkpoint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;APP
	PUSH 4(R1)
	;NO_APP
	;APP
	NOP
	;NO_APP
	;APP
	PUSH R1
	;NO_APP
	;APP
	ADD #6, 0(R1)
	;NO_APP
	;APP
	PUSH R2
	;NO_APP
	;APP
	PUSH 8(R1)
	;NO_APP
	;APP
	PUSH R5
	;NO_APP
	;APP
	PUSH R6
	;NO_APP
	;APP
	PUSH R7
	;NO_APP
	;APP
	PUSH R8
	;NO_APP
	;APP
	PUSH R9
	;NO_APP
	;APP
	PUSH R10
	;NO_APP
	;APP
	PUSH R11
	;NO_APP
	;APP
	PUSH R12
	;NO_APP
	;APP
	PUSH R13
	;NO_APP
	;APP
	PUSH R14
	;NO_APP
	;APP
	PUSH R15
	;NO_APP
	;APP
	MOV 26(R1), j
	;NO_APP
	call	#__mementos_locate_next_bundle
	mov.w	r15, &baseaddr
	;APP
	PUSH R12
	;NO_APP
	;APP
	PUSH R13
	;NO_APP
	;APP
	MOV #0x2400, R13
	;NO_APP
	;APP
	SUB j, R13
	;NO_APP
	;APP
	MOV baseaddr, R12
	;NO_APP
	;APP
	MOV R13, 2(R12)
	;NO_APP
	;APP
	MOV GlobalAllocSize, R13
	;NO_APP
	;APP
	INC R13
	;NO_APP
	;APP
	AND #0xFFFE, R13
	;NO_APP
	;APP
	MOV R13, 0(R12)
	;NO_APP
	;APP
	POP R13
	;NO_APP
	;APP
	POP R12
	;NO_APP
	;APP
	MOV baseaddr, R14
	;NO_APP
	;APP
	POP 32(R14)
	;NO_APP
	;APP
	POP 30(R14)
	;NO_APP
	;APP
	POP 28(R14)
	;NO_APP
	;APP
	POP 26(R14)
	;NO_APP
	;APP
	POP 24(R14)
	;NO_APP
	;APP
	POP 22(R14)
	;NO_APP
	;APP
	POP 20(R14)
	;NO_APP
	;APP
	POP 18(R14)
	;NO_APP
	;APP
	POP 16(R14)
	;NO_APP
	;APP
	POP 14(R14)
	;NO_APP
	;APP
	POP 12(R14)
	;NO_APP
	;APP
	POP 10(R14)
	;NO_APP
	;APP
	POP 8(R14)
	;NO_APP
	;APP
	POP 6(R14)
	;NO_APP
	;APP
	POP 4(R14)
	;NO_APP
	mov.w	&baseaddr, r15
	add.w	#34, r15
	mov.w	r15, &k
	mov.w	&j, r15
	mov.w	r15, &i
	jmp	.LBB32_1
.LBB32_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB32_4
	jmp	.LBB32_2
.LBB32_2:                               ; %for.body
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB32_3
.LBB32_3:                               ; %for.inc
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB32_1
.LBB32_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB32_5
.LBB32_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB32_8
	jmp	.LBB32_6
.LBB32_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB32_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB32_7
.LBB32_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB32_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB32_5
.LBB32_8:                               ; %for.end.16
	mov.w	&i, r12
	mov.w	&k, r13
	add.w	r13, r12
	mov.w	r12, r13
	add.w	#-7168, r13
	mov.w	r13, &k
	mov.w	#-16723, -7168(r12)
	mov.w	&baseaddr, r12
	mov.w	r12, &__mementos_active_bundle_ptr
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end32:
	.size	__mementos_checkpoint, .Lfunc_end32-__mementos_checkpoint

	.globl	__mementos_locate_next_bundle
	.align	2
	.type	__mementos_locate_next_bundle,@function
__mementos_locate_next_bundle:          ; @__mementos_locate_next_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	call	#__mementos_find_active_bundle
	mov.w	r15, -2(r4)
	mov.w	r15, r12
	cmp.w	#-4226, r15
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jeq	.LBB33_2
	jmp	.LBB33_1
.LBB33_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB33_3
	jmp	.LBB33_4
.LBB33_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB33_5
.LBB33_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB33_4
.LBB33_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB33_5
.LBB33_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	__mementos_locate_next_bundle, .Lfunc_end33-__mementos_locate_next_bundle

	.globl	__mementos_find_active_bundle
	.align	2
	.type	__mementos_find_active_bundle,@function
__mementos_find_active_bundle:          ; @__mementos_find_active_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&__mementos_active_bundle_ptr, r12
	mov.w	r12, -4(r4)
	mov.w	r12, r15
	call	#__mementos_bundle_in_range
	cmp.w	#0, r15
	jeq	.LBB34_2
	jmp	.LBB34_1
.LBB34_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB34_3
.LBB34_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB34_3
.LBB34_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end34:
	.size	__mementos_find_active_bundle, .Lfunc_end34-__mementos_find_active_bundle

	.globl	__mementos_bundle_in_range
	.align	2
	.type	__mementos_bundle_in_range,@function
__mementos_bundle_in_range:             ; @__mementos_bundle_in_range
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: __mementos_bundle_in_range:bun_addr <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.b	#0, r13
	cmp.w	#-4226, r15
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	mov.b	r13, -5(r4)             ; 1-byte Folded Spill
	jlo	.LBB35_2
	jmp	.LBB35_1
.LBB35_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB35_2
.LBB35_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end35:
	.size	__mementos_bundle_in_range, .Lfunc_end35-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end36:
	.size	__mementos_atboot_cleanup, .Lfunc_end36-__mementos_atboot_cleanup

	.globl	__mementos_inactive_cleanup
	.align	2
	.type	__mementos_inactive_cleanup,@function
__mementos_inactive_cleanup:            ; @__mementos_inactive_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: __mementos_inactive_cleanup:active_bundle_addr <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end37:
	.size	__mementos_inactive_cleanup, .Lfunc_end37-__mementos_inactive_cleanup

	.globl	__mementos_force_free
	.align	2
	.type	__mementos_force_free,@function
__mementos_force_free:                  ; @__mementos_force_free
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#0, r15
	pop.w	r4
	ret
.Lfunc_end38:
	.size	__mementos_force_free, .Lfunc_end38-__mementos_force_free

	.type	test11,@object          ; @test11
	.section	.bss,"aw",@nobits
	.globl	test11
test11:
	.byte	0                       ; 0x0
	.size	test11, 1

	.type	overflow,@object        ; @overflow
	.globl	overflow
	.align	1
overflow:
	.short	0                       ; 0x0
	.size	overflow, 2

	.type	__vector_timer0_b1,@object ; @__vector_timer0_b1
	.section	__interrupt_vector_timer0_b1,"aw",@progbits
	.globl	__vector_timer0_b1
	.align	1
__vector_timer0_b1:
	.short	TimerB1_ISR
	.size	__vector_timer0_b1, 2

	.type	s0,@object              ; @s0
	.section	.nv_vars,"aw",@progbits
	.globl	s0
	.align	1
s0:
	.zero	1024
	.size	s0, 1024

	.type	s1,@object              ; @s1
	.globl	s1
	.align	1
s1:
	.zero	1024
	.size	s1, 1024

	.type	s2,@object              ; @s2
	.globl	s2
	.align	1
s2:
	.zero	1024
	.size	s2, 1024

	.type	s3,@object              ; @s3
	.globl	s3
	.align	1
s3:
	.zero	1024
	.size	s3, 1024

	.type	curtask,@object         ; @curtask
	.align	1
curtask:
	.short	0                       ; 0x0
	.size	curtask, 2

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	".%u.\r\n"
	.size	.L.str, 7

	.type	indata,@object          ; @indata
	.section	.ro_nv_vars,"a",@progbits
indata:
	.ascii	"Hello, world!"
	.size	indata, 13

	.type	.L.str.1,@object        ; @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"result: %x\r\n"
	.size	.L.str.1, 13

	.type	cp,@object              ; @cp
	.section	.ro_nv_vars,"a",@progbits
cp:
	.ascii	"1234567890ABCDEFFEDCBA0987654321"
	.size	cp, 32

	.type	.L.str.2,@object        ; @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"Key must be hexadecimal!!\r\n"
	.size	.L.str.2, 28

	.type	init_key,@object        ; @init_key
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_key:
	.long	608135816               ; 0x243f6a88
	.long	2242054355              ; 0x85a308d3
	.long	320440878               ; 0x13198a2e
	.long	57701188                ; 0x3707344
	.long	2752067618              ; 0xa4093822
	.long	698298832               ; 0x299f31d0
	.long	137296536               ; 0x82efa98
	.long	3964562569              ; 0xec4e6c89
	.long	1160258022              ; 0x452821e6
	.long	953160567               ; 0x38d01377
	.long	3193202383              ; 0xbe5466cf
	.long	887688300               ; 0x34e90c6c
	.long	3232508343              ; 0xc0ac29b7
	.long	3380367581              ; 0xc97c50dd
	.long	1065670069              ; 0x3f84d5b5
	.long	3041331479              ; 0xb5470917
	.long	2450970073              ; 0x9216d5d9
	.long	2306472731              ; 0x8979fb1b
	.size	init_key, 72

	.type	init_s0,@object         ; @init_s0
	.align	1
init_s0:
	.long	3509652390              ; 0xd1310ba6
	.long	2564797868              ; 0x98dfb5ac
	.long	805139163               ; 0x2ffd72db
	.long	3491422135              ; 0xd01adfb7
	.long	3101798381              ; 0xb8e1afed
	.long	1780907670              ; 0x6a267e96
	.long	3128725573              ; 0xba7c9045
	.long	4046225305              ; 0xf12c7f99
	.long	614570311               ; 0x24a19947
	.long	3012652279              ; 0xb3916cf7
	.long	134345442               ; 0x801f2e2
	.long	2240740374              ; 0x858efc16
	.long	1667834072              ; 0x636920d8
	.long	1901547113              ; 0x71574e69
	.long	2757295779              ; 0xa458fea3
	.long	4103290238              ; 0xf4933d7e
	.long	227898511               ; 0xd95748f
	.long	1921955416              ; 0x728eb658
	.long	1904987480              ; 0x718bcd58
	.long	2182433518              ; 0x82154aee
	.long	2069144605              ; 0x7b54a41d
	.long	3260701109              ; 0xc25a59b5
	.long	2620446009              ; 0x9c30d539
	.long	720527379               ; 0x2af26013
	.long	3318853667              ; 0xc5d1b023
	.long	677414384               ; 0x286085f0
	.long	3393288472              ; 0xca417918
	.long	3101374703              ; 0xb8db38ef
	.long	2390351024              ; 0x8e79dcb0
	.long	1614419982              ; 0x603a180e
	.long	1822297739              ; 0x6c9e0e8b
	.long	2954791486              ; 0xb01e8a3e
	.long	3608508353              ; 0xd71577c1
	.long	3174124327              ; 0xbd314b27
	.long	2024746970              ; 0x78af2fda
	.long	1432378464              ; 0x55605c60
	.long	3864339955              ; 0xe65525f3
	.long	2857741204              ; 0xaa55ab94
	.long	1464375394              ; 0x57489862
	.long	1676153920              ; 0x63e81440
	.long	1439316330              ; 0x55ca396a
	.long	715854006               ; 0x2aab10b6
	.long	3033291828              ; 0xb4cc5c34
	.long	289532110               ; 0x1141e8ce
	.long	2706671279              ; 0xa15486af
	.long	2087905683              ; 0x7c72e993
	.long	3018724369              ; 0xb3ee1411
	.long	1668267050              ; 0x636fbc2a
	.long	732546397               ; 0x2ba9c55d
	.long	1947742710              ; 0x741831f6
	.long	3462151702              ; 0xce5c3e16
	.long	2609353502              ; 0x9b87931e
	.long	2950085171              ; 0xafd6ba33
	.long	1814351708              ; 0x6c24cf5c
	.long	2050118529              ; 0x7a325381
	.long	680887927               ; 0x28958677
	.long	999245976               ; 0x3b8f4898
	.long	1800124847              ; 0x6b4bb9af
	.long	3300911131              ; 0xc4bfe81b
	.long	1713906067              ; 0x66282193
	.long	1641548236              ; 0x61d809cc
	.long	4213287313              ; 0xfb21a991
	.long	1216130144              ; 0x487cac60
	.long	1575780402              ; 0x5dec8032
	.long	4018429277              ; 0xef845d5d
	.long	3917837745              ; 0xe98575b1
	.long	3693486850              ; 0xdc262302
	.long	3949271944              ; 0xeb651b88
	.long	596196993               ; 0x23893e81
	.long	3549867205              ; 0xd396acc5
	.long	258830323               ; 0xf6d6ff3
	.long	2213823033              ; 0x83f44239
	.long	772490370               ; 0x2e0b4482
	.long	2760122372              ; 0xa4842004
	.long	1774776394              ; 0x69c8f04a
	.long	2652871518              ; 0x9e1f9b5e
	.long	566650946               ; 0x21c66842
	.long	4142492826              ; 0xf6e96c9a
	.long	1728879713              ; 0x670c9c61
	.long	2882767088              ; 0xabd388f0
	.long	1783734482              ; 0x6a51a0d2
	.long	3629395816              ; 0xd8542f68
	.long	2517608232              ; 0x960fa728
	.long	2874225571              ; 0xab5133a3
	.long	1861159788              ; 0x6eef0b6c
	.long	326777828               ; 0x137a3be4
	.long	3124490320              ; 0xba3bf050
	.long	2130389656              ; 0x7efb2a98
	.long	2716951837              ; 0xa1f1651d
	.long	967770486               ; 0x39af0176
	.long	1724537150              ; 0x66ca593e
	.long	2185432712              ; 0x82430e88
	.long	2364442137              ; 0x8cee8619
	.long	1164943284              ; 0x456f9fb4
	.long	2105845187              ; 0x7d84a5c3
	.long	998989502               ; 0x3b8b5ebe
	.long	3765401048              ; 0xe06f75d8
	.long	2244026483              ; 0x85c12073
	.long	1075463327              ; 0x401a449f
	.long	1455516326              ; 0x56c16aa6
	.long	1322494562              ; 0x4ed3aa62
	.long	910128902               ; 0x363f7706
	.long	469688178               ; 0x1bfedf72
	.long	1117454909              ; 0x429b023d
	.long	936433444               ; 0x37d0d724
	.long	3490320968              ; 0xd00a1248
	.long	3675253459              ; 0xdb0fead3
	.long	1240580251              ; 0x49f1c09b
	.long	122909385               ; 0x75372c9
	.long	2157517691              ; 0x80991b7b
	.long	634681816               ; 0x25d479d8
	.long	4142456567              ; 0xf6e8def7
	.long	3825094682              ; 0xe3fe501a
	.long	3061402683              ; 0xb6794c3b
	.long	2540495037              ; 0x976ce0bd
	.long	79693498                ; 0x4c006ba
	.long	3249098678              ; 0xc1a94fb6
	.long	1084186820              ; 0x409f60c4
	.long	1583128258              ; 0x5e5c9ec2
	.long	426386531               ; 0x196a2463
	.long	1761308591              ; 0x68fb6faf
	.long	1047286709              ; 0x3e6c53b5
	.long	322548459               ; 0x1339b2eb
	.long	995290223               ; 0x3b52ec6f
	.long	1845252383              ; 0x6dfc511f
	.long	2603652396              ; 0x9b30952c
	.long	3431023940              ; 0xcc814544
	.long	2942221577              ; 0xaf5ebd09
	.long	3202600964              ; 0xbee3d004
	.long	3727903485              ; 0xde334afd
	.long	1712269319              ; 0x660f2807
	.long	422464435               ; 0x192e4bb3
	.long	3234572375              ; 0xc0cba857
	.long	1170764815              ; 0x45c8740f
	.long	3523960633              ; 0xd20b5f39
	.long	3117677531              ; 0xb9d3fbdb
	.long	1434042557              ; 0x5579c0bd
	.long	442511882               ; 0x1a60320a
	.long	3600875718              ; 0xd6a100c6
	.long	1076654713              ; 0x402c7279
	.long	1738483198              ; 0x679f25fe
	.long	4213154764              ; 0xfb1fa3cc
	.long	2393238008              ; 0x8ea5e9f8
	.long	3677496056              ; 0xdb3222f8
	.long	1014306527              ; 0x3c7516df
	.long	4251020053              ; 0xfd616b15
	.long	793779912               ; 0x2f501ec8
	.long	2902807211              ; 0xad0552ab
	.long	842905082               ; 0x323db5fa
	.long	4246964064              ; 0xfd238760
	.long	1395751752              ; 0x53317b48
	.long	1040244610              ; 0x3e00df82
	.long	2656851899              ; 0x9e5c57bb
	.long	3396308128              ; 0xca6f8ca0
	.long	445077038               ; 0x1a87562e
	.long	3742853595              ; 0xdf1769db
	.long	3577915638              ; 0xd542a8f6
	.long	679411651               ; 0x287effc3
	.long	2892444358              ; 0xac6732c6
	.long	2354009459              ; 0x8c4f5573
	.long	1767581616              ; 0x695b27b0
	.long	3150600392              ; 0xbbca58c8
	.long	3791627101              ; 0xe1ffa35d
	.long	3102740896              ; 0xb8f011a0
	.long	284835224               ; 0x10fa3d98
	.long	4246832056              ; 0xfd2183b8
	.long	1258075500              ; 0x4afcb56c
	.long	768725851               ; 0x2dd1d35b
	.long	2589189241              ; 0x9a53e479
	.long	3069724005              ; 0xb6f84565
	.long	3532540348              ; 0xd28e49bc
	.long	1274779536              ; 0x4bfb9790
	.long	3789419226              ; 0xe1ddf2da
	.long	2764799539              ; 0xa4cb7e33
	.long	1660621633              ; 0x62fb1341
	.long	3471099624              ; 0xcee4c6e8
	.long	4011903706              ; 0xef20cada
	.long	913787905               ; 0x36774c01
	.long	3497959166              ; 0xd07e9efe
	.long	737222580               ; 0x2bf11fb4
	.long	2514213453              ; 0x95dbda4d
	.long	2928710040              ; 0xae909198
	.long	3937242737              ; 0xeaad8e71
	.long	1804850592              ; 0x6b93d5a0
	.long	3499020752              ; 0xd08ed1d0
	.long	2949064160              ; 0xafc725e0
	.long	2386320175              ; 0x8e3c5b2f
	.long	2390070455              ; 0x8e7594b7
	.long	2415321851              ; 0x8ff6e2fb
	.long	4061277028              ; 0xf2122b64
	.long	2290661394              ; 0x8888b812
	.long	2416832540              ; 0x900df01c
	.long	1336762016              ; 0x4fad5ea0
	.long	1754252060              ; 0x688fc31c
	.long	3520065937              ; 0xd1cff191
	.long	3014181293              ; 0xb3a8c1ad
	.long	791618072               ; 0x2f2f2218
	.long	3188594551              ; 0xbe0e1777
	.long	3933548030              ; 0xea752dfe
	.long	2332172193              ; 0x8b021fa1
	.long	3852520463              ; 0xe5a0cc0f
	.long	3043980520              ; 0xb56f74e8
	.long	413987798               ; 0x18acf3d6
	.long	3465142937              ; 0xce89e299
	.long	3030929376              ; 0xb4a84fe0
	.long	4245938359              ; 0xfd13e0b7
	.long	2093235073              ; 0x7cc43b81
	.long	3534596313              ; 0xd2ada8d9
	.long	375366246               ; 0x165fa266
	.long	2157278981              ; 0x80957705
	.long	2479649556              ; 0x93cc7314
	.long	555357303               ; 0x211a1477
	.long	3870105701              ; 0xe6ad2065
	.long	2008414854              ; 0x77b5fa86
	.long	3344188149              ; 0xc75442f5
	.long	4221384143              ; 0xfb9d35cf
	.long	3956125452              ; 0xebcdaf0c
	.long	2067696032              ; 0x7b3e89a0
	.long	3594591187              ; 0xd6411bd3
	.long	2921233993              ; 0xae1e7e49
	.long	2428461                 ; 0x250e2d
	.long	544322398               ; 0x2071b35e
	.long	577241275               ; 0x226800bb
	.long	1471733935              ; 0x57b8e0af
	.long	610547355               ; 0x2464369b
	.long	4027169054              ; 0xf009b91e
	.long	1432588573              ; 0x5563911d
	.long	1507829418              ; 0x59dfa6aa
	.long	2025931657              ; 0x78c14389
	.long	3646575487              ; 0xd95a537f
	.long	545086370               ; 0x207d5ba2
	.long	48609733                ; 0x2e5b9c5
	.long	2200306550              ; 0x83260376
	.long	1653985193              ; 0x6295cfa9
	.long	298326376               ; 0x11c81968
	.long	1316178497              ; 0x4e734a41
	.long	3007786442              ; 0xb3472dca
	.long	2064951626              ; 0x7b14a94a
	.long	458293330               ; 0x1b510052
	.long	2589141269              ; 0x9a532915
	.long	3591329599              ; 0xd60f573f
	.long	3164325604              ; 0xbc9bc6e4
	.long	727753846               ; 0x2b60a476
	.long	2179363840              ; 0x81e67400
	.long	146436021               ; 0x8ba6fb5
	.long	1461446943              ; 0x571be91f
	.long	4069977195              ; 0xf296ec6b
	.long	705550613               ; 0x2a0dd915
	.long	3059967265              ; 0xb6636521
	.long	3887724982              ; 0xe7b9f9b6
	.long	4281599278              ; 0xff34052e
	.long	3313849956              ; 0xc5855664
	.long	1404054877              ; 0x53b02d5d
	.long	2845806497              ; 0xa99f8fa1
	.long	146425753               ; 0x8ba4799
	.long	1854211946              ; 0x6e85076a
	.size	init_s0, 1024

	.type	init_s1,@object         ; @init_s1
	.align	1
init_s1:
	.long	1266315497              ; 0x4b7a70e9
	.long	3048417604              ; 0xb5b32944
	.long	3681880366              ; 0xdb75092e
	.long	3289982499              ; 0xc4192623
	.long	2909710000              ; 0xad6ea6b0
	.long	1235738493              ; 0x49a7df7d
	.long	2632868024              ; 0x9cee60b8
	.long	2414719590              ; 0x8fedb266
	.long	3970600049              ; 0xecaa8c71
	.long	1771706367              ; 0x699a17ff
	.long	1449415276              ; 0x5664526c
	.long	3266420449              ; 0xc2b19ee1
	.long	422970021               ; 0x193602a5
	.long	1963543593              ; 0x75094c29
	.long	2690192192              ; 0xa0591340
	.long	3826793022              ; 0xe4183a3e
	.long	1062508698              ; 0x3f54989a
	.long	1531092325              ; 0x5b429d65
	.long	1804592342              ; 0x6b8fe4d6
	.long	2583117782              ; 0x99f73fd6
	.long	2714934279              ; 0xa1d29c07
	.long	4024971509              ; 0xefe830f5
	.long	1294809318              ; 0x4d2d38e6
	.long	4028980673              ; 0xf0255dc1
	.long	1289560198              ; 0x4cdd2086
	.long	2221992742              ; 0x8470eb26
	.long	1669523910              ; 0x6382e9c6
	.long	35572830                ; 0x21ecc5e
	.long	157838143               ; 0x9686b3f
	.long	1052438473              ; 0x3ebaefc9
	.long	1016535060              ; 0x3c971814
	.long	1802137761              ; 0x6b6a70a1
	.long	1753167236              ; 0x687f3584
	.long	1386275462              ; 0x52a0e286
	.long	3080475397              ; 0xb79c5305
	.long	2857371447              ; 0xaa500737
	.long	1040679964              ; 0x3e07841c
	.long	2145300060              ; 0x7fdeae5c
	.long	2390574316              ; 0x8e7d44ec
	.long	1461121720              ; 0x5716f2b8
	.long	2956646967              ; 0xb03ada37
	.long	4031777805              ; 0xf0500c0d
	.long	4028374788              ; 0xf01c1f04
	.long	33600511                ; 0x200b3ff
	.long	2920084762              ; 0xae0cf51a
	.long	1018524850              ; 0x3cb574b2
	.long	629373528               ; 0x25837a58
	.long	3691585981              ; 0xdc0921bd
	.long	3515945977              ; 0xd19113f9
	.long	2091462646              ; 0x7ca92ff6
	.long	2486323059              ; 0x94324773
	.long	586499841               ; 0x22f54701
	.long	988145025               ; 0x3ae5e581
	.long	935516892               ; 0x37c2dadc
	.long	3367335476              ; 0xc8b57634
	.long	2599673255              ; 0x9af3dda7
	.long	2839830854              ; 0xa9446146
	.long	265290510               ; 0xfd0030e
	.long	3972581182              ; 0xecc8c73e
	.long	2759138881              ; 0xa4751e41
	.long	3795373465              ; 0xe238cd99
	.long	1005194799              ; 0x3bea0e2f
	.long	847297441               ; 0x3280bba1
	.long	406762289               ; 0x183eb331
	.long	1314163512              ; 0x4e548b38
	.long	1332590856              ; 0x4f6db908
	.long	1866599683              ; 0x6f420d03
	.long	4127851711              ; 0xf60a04bf
	.long	750260880               ; 0x2cb81290
	.long	613907577               ; 0x24977c79
	.long	1450815602              ; 0x5679b072
	.long	3165620655              ; 0xbcaf89af
	.long	3734664991              ; 0xde9a771f
	.long	3650291728              ; 0xd9930810
	.long	3012275730              ; 0xb38bae12
	.long	3704569646              ; 0xdccf3f2e
	.long	1427272223              ; 0x5512721f
	.long	778793252               ; 0x2e6b7124
	.long	1343938022              ; 0x501adde6
	.long	2676280711              ; 0x9f84cd87
	.long	2052605720              ; 0x7a584718
	.long	1946737175              ; 0x7408da17
	.long	3164576444              ; 0xbc9f9abc
	.long	3914038668              ; 0xe94b7d8c
	.long	3967478842              ; 0xec7aec3a
	.long	3682934266              ; 0xdb851dfa
	.long	1661551462              ; 0x63094366
	.long	3294938066              ; 0xc464c3d2
	.long	4011595847              ; 0xef1c1847
	.long	840292616               ; 0x3215d908
	.long	3712170807              ; 0xdd433b37
	.long	616741398               ; 0x24c2ba16
	.long	312560963               ; 0x12a14d43
	.long	711312465               ; 0x2a65c451
	.long	1351876610              ; 0x50940002
	.long	322626781               ; 0x133ae4dd
	.long	1910503582              ; 0x71dff89e
	.long	271666773               ; 0x10314e55
	.long	2175563734              ; 0x81ac77d6
	.long	1594956187              ; 0x5f11199b
	.long	70604529                ; 0x43556f1
	.long	3617834859              ; 0xd7a3c76b
	.long	1007753275              ; 0x3c11183b
	.long	1495573769              ; 0x5924a509
	.long	4069517037              ; 0xf28fe6ed
	.long	2549218298              ; 0x97f1fbfa
	.long	2663038764              ; 0x9ebabf2c
	.long	504708206               ; 0x1e153c6e
	.long	2263041392              ; 0x86e34570
	.long	3941167025              ; 0xeae96fb1
	.long	2249088522              ; 0x860e5e0a
	.long	1514023603              ; 0x5a3e2ab3
	.long	1998579484              ; 0x771fe71c
	.long	1312622330              ; 0x4e3d06fa
	.long	694541497               ; 0x2965dcb9
	.long	2582060303              ; 0x99e71d0f
	.long	2151582166              ; 0x803e89d6
	.long	1382467621              ; 0x5266c825
	.long	776784248               ; 0x2e4cc978
	.long	2618340202              ; 0x9c10b36a
	.long	3323268794              ; 0xc6150eba
	.long	2497899128              ; 0x94e2ea78
	.long	2784771155              ; 0xa5fc3c53
	.long	503983604               ; 0x1e0a2df4
	.long	4076293799              ; 0xf2f74ea7
	.long	907881277               ; 0x361d2b3d
	.long	423175695               ; 0x1939260f
	.long	432175456               ; 0x19c27960
	.long	1378068232              ; 0x5223a708
	.long	4145222326              ; 0xf71312b6
	.long	3954048622              ; 0xebadfe6e
	.long	3938656102              ; 0xeac31f66
	.long	3820766613              ; 0xe3bc4595
	.long	2793130115              ; 0xa67bc883
	.long	2977904593              ; 0xb17f37d1
	.long	26017576                ; 0x18cff28
	.long	3274890735              ; 0xc332ddef
	.long	3194772133              ; 0xbe6c5aa5
	.long	1700274565              ; 0x65582185
	.long	1756076034              ; 0x68ab9802
	.long	4006520079              ; 0xeecea50f
	.long	3677328699              ; 0xdb2f953b
	.long	720338349               ; 0x2aef7dad
	.long	1533947780              ; 0x5b6e2f84
	.long	354530856               ; 0x1521b628
	.long	688349552               ; 0x29076170
	.long	3973924725              ; 0xecdd4775
	.long	1637815568              ; 0x619f1510
	.long	332179504               ; 0x13cca830
	.long	3949051286              ; 0xeb61bd96
	.long	53804574                ; 0x334fe1e
	.long	2852348879              ; 0xaa0363cf
	.long	3044236432              ; 0xb5735c90
	.long	1282449977              ; 0x4c70a239
	.long	3583942155              ; 0xd59e9e0b
	.long	3416972820              ; 0xcbaade14
	.long	4006381244              ; 0xeecc86bc
	.long	1617046695              ; 0x60622ca7
	.long	2628476075              ; 0x9cab5cab
	.long	3002303598              ; 0xb2f3846e
	.long	1686838959              ; 0x648b1eaf
	.long	431878346               ; 0x19bdf0ca
	.long	2686675385              ; 0xa02369b9
	.long	1700445008              ; 0x655abb50
	.long	1080580658              ; 0x40685a32
	.long	1009431731              ; 0x3c2ab4b3
	.long	832498133               ; 0x319ee9d5
	.long	3223435511              ; 0xc021b8f7
	.long	2605976345              ; 0x9b540b19
	.long	2271191193              ; 0x875fa099
	.long	2516031870              ; 0x95f7997e
	.long	1648197032              ; 0x623d7da8
	.long	4164389018              ; 0xf837889a
	.long	2548247927              ; 0x97e32d77
	.long	300782431               ; 0x11ed935f
	.long	375919233               ; 0x16681281
	.long	238389289               ; 0xe358829
	.long	3353747414              ; 0xc7e61fd6
	.long	2531188641              ; 0x96dedfa1
	.long	2019080857              ; 0x7858ba99
	.long	1475708069              ; 0x57f584a5
	.long	455242339               ; 0x1b227263
	.long	2609103871              ; 0x9b83c3ff
	.long	448939670               ; 0x1ac24696
	.long	3451063019              ; 0xcdb30aeb
	.long	1395535956              ; 0x532e3054
	.long	2413381860              ; 0x8fd948e4
	.long	1841049896              ; 0x6dbc3128
	.long	1491858159              ; 0x58ebf2ef
	.long	885456874               ; 0x34c6ffea
	.long	4264095073              ; 0xfe28ed61
	.long	4001119347              ; 0xee7c3c73
	.long	1565136089              ; 0x5d4a14d9
	.long	3898914787              ; 0xe864b7e3
	.long	1108368660              ; 0x42105d14
	.long	540939232               ; 0x203e13e0
	.long	1173283510              ; 0x45eee2b6
	.long	2745871338              ; 0xa3aaabea
	.long	3681308437              ; 0xdb6c4f15
	.long	4207628240              ; 0xfacb4fd0
	.long	3343053890              ; 0xc742f442
	.long	4016749493              ; 0xef6abbb5
	.long	1699691293              ; 0x654f3b1d
	.long	1103962373              ; 0x41cd2105
	.long	3625875870              ; 0xd81e799e
	.long	2256883143              ; 0x86854dc7
	.long	3830138730              ; 0xe44b476a
	.long	1031889488              ; 0x3d816250
	.long	3479347698              ; 0xcf62a1f2
	.long	1535977030              ; 0x5b8d2646
	.long	4236805024              ; 0xfc8883a0
	.long	3251091107              ; 0xc1c7b6a3
	.long	2132092099              ; 0x7f1524c3
	.long	1774941330              ; 0x69cb7492
	.long	1199868427              ; 0x47848a0b
	.long	1452454533              ; 0x5692b285
	.long	157007616               ; 0x95bbf00
	.long	2904115357              ; 0xad19489d
	.long	342012276               ; 0x1462b174
	.long	595725824               ; 0x23820e00
	.long	1480756522              ; 0x58428d2a
	.long	206960106               ; 0xc55f5ea
	.long	497939518               ; 0x1dadf43e
	.long	591360097               ; 0x233f7061
	.long	863170706               ; 0x3372f092
	.long	2375253569              ; 0x8d937e41
	.long	3596610801              ; 0xd65fecf1
	.long	1814182875              ; 0x6c223bdb
	.long	2094937945              ; 0x7cde3759
	.long	3421402208              ; 0xcbee7460
	.long	1082520231              ; 0x4085f2a7
	.long	3463918190              ; 0xce77326e
	.long	2785509508              ; 0xa6078084
	.long	435703966               ; 0x19f8509e
	.long	3908032597              ; 0xe8efd855
	.long	1641649973              ; 0x61d99735
	.long	2842273706              ; 0xa969a7aa
	.long	3305899714              ; 0xc50c06c2
	.long	1510255612              ; 0x5a04abfc
	.long	2148256476              ; 0x800bcadc
	.long	2655287854              ; 0x9e447a2e
	.long	3276092548              ; 0xc3453484
	.long	4258621189              ; 0xfdd56705
	.long	236887753               ; 0xe1e9ec9
	.long	3681803219              ; 0xdb73dbd3
	.long	274041037               ; 0x105588cd
	.long	1734335097              ; 0x675fda79
	.long	3815195456              ; 0xe3674340
	.long	3317970021              ; 0xc5c43465
	.long	1899903192              ; 0x713e38d8
	.long	1026095262              ; 0x3d28f89e
	.long	4050517792              ; 0xf16dff20
	.long	356393447               ; 0x153e21e7
	.long	2410691914              ; 0x8fb03d4a
	.long	3873677099              ; 0xe6e39f2b
	.long	3682840055              ; 0xdb83adf7
	.size	init_s1, 1024

	.type	init_s2,@object         ; @init_s2
	.align	1
init_s2:
	.long	3913112168              ; 0xe93d5a68
	.long	2491498743              ; 0x948140f7
	.long	4132185628              ; 0xf64c261c
	.long	2489919796              ; 0x94692934
	.long	1091903735              ; 0x411520f7
	.long	1979897079              ; 0x7602d4f7
	.long	3170134830              ; 0xbcf46b2e
	.long	3567386728              ; 0xd4a20068
	.long	3557303409              ; 0xd4082471
	.long	857797738               ; 0x3320f46a
	.long	1136121015              ; 0x43b7d4b7
	.long	1342202287              ; 0x500061af
	.long	507115054               ; 0x1e39f62e
	.long	2535736646              ; 0x97244546
	.long	337727348               ; 0x14214f74
	.long	3213592640              ; 0xbf8b8840
	.long	1301675037              ; 0x4d95fc1d
	.long	2528481711              ; 0x96b591af
	.long	1895095763              ; 0x70f4ddd3
	.long	1721773893              ; 0x66a02f45
	.long	3216771564              ; 0xbfbc09ec
	.long	62756741                ; 0x3bd9785
	.long	2142006736              ; 0x7fac6dd0
	.long	835421444               ; 0x31cb8504
	.long	2531993523              ; 0x96eb27b3
	.long	1442658625              ; 0x55fd3941
	.long	3659876326              ; 0xda2547e6
	.long	2882144922              ; 0xabca0a9a
	.long	676362277               ; 0x28507825
	.long	1392781812              ; 0x530429f4
	.long	170690266               ; 0xa2c86da
	.long	3921047035              ; 0xe9b66dfb
	.long	1759253602              ; 0x68dc1462
	.long	3611846912              ; 0xd7486900
	.long	1745797284              ; 0x680ec0a4
	.long	664899054               ; 0x27a18dee
	.long	1329594018              ; 0x4f3ffea2
	.long	3901205900              ; 0xe887ad8c
	.long	3045908486              ; 0xb58ce006
	.long	2062866102              ; 0x7af4d6b6
	.long	2865634940              ; 0xaace1e7c
	.long	3543621612              ; 0xd3375fec
	.long	3464012697              ; 0xce78a399
	.long	1080764994              ; 0x406b2a42
	.long	553557557               ; 0x20fe9e35
	.long	3656615353              ; 0xd9f385b9
	.long	3996768171              ; 0xee39d7ab
	.long	991055499               ; 0x3b124e8b
	.long	499776247               ; 0x1dc9faf7
	.long	1265440854              ; 0x4b6d1856
	.long	648242737               ; 0x26a36631
	.long	3940784050              ; 0xeae397b2
	.long	980351604               ; 0x3a6efa74
	.long	3713745714              ; 0xdd5b4332
	.long	1749149687              ; 0x6841e7f7
	.long	3396870395              ; 0xca7820fb
	.long	4211799374              ; 0xfb0af54e
	.long	3640570775              ; 0xd8feb397
	.long	1161844396              ; 0x454056ac
	.long	3125318951              ; 0xba489527
	.long	1431517754              ; 0x55533a3a
	.long	545492359               ; 0x20838d87
	.long	4268468663              ; 0xfe6ba9b7
	.long	3499529547              ; 0xd096954b
	.long	1437099964              ; 0x55a867bc
	.long	2702547544              ; 0xa1159a58
	.long	3433638243              ; 0xcca92963
	.long	2581715763              ; 0x99e1db33
	.long	2787789398              ; 0xa62a4a56
	.long	1060185593              ; 0x3f3125f9
	.long	1593081372              ; 0x5ef47e1c
	.long	2418618748              ; 0x9029317c
	.long	4260947970              ; 0xfdf8e802
	.long	69676912                ; 0x4272f70
	.long	2159744348              ; 0x80bb155c
	.long	86519011                ; 0x5282ce3
	.long	2512459080              ; 0x95c11548
	.long	3838209314              ; 0xe4c66d22
	.long	1220612927              ; 0x48c1133f
	.long	3339683548              ; 0xc70f86dc
	.long	133810670               ; 0x7f9c9ee
	.long	1090789135              ; 0x41041f0f
	.long	1078426020              ; 0x404779a4
	.long	1569222167              ; 0x5d886e17
	.long	845107691               ; 0x325f51eb
	.long	3583754449              ; 0xd59bc0d1
	.long	4072456591              ; 0xf2bcc18f
	.long	1091646820              ; 0x41113564
	.long	628848692               ; 0x257b7834
	.long	1613405280              ; 0x602a9c60
	.long	3757631651              ; 0xdff8e8a3
	.long	526609435               ; 0x1f636c1b
	.long	236106946               ; 0xe12b4c2
	.long	48312990                ; 0x2e1329e
	.long	2942717905              ; 0xaf664fd1
	.long	3402727701              ; 0xcad18115
	.long	1797494240              ; 0x6b2395e0
	.long	859738849               ; 0x333e92e1
	.long	992217954               ; 0x3b240b62
	.long	4005476642              ; 0xeebeb922
	.long	2243076622              ; 0x85b2a20e
	.long	3870952857              ; 0xe6ba0d99
	.long	3732016268              ; 0xde720c8c
	.long	765654824               ; 0x2da2f728
	.long	3490871365              ; 0xd0127845
	.long	2511836413              ; 0x95b794fd
	.long	1685915746              ; 0x647d0862
	.long	3888969200              ; 0xe7ccf5f0
	.long	1414112111              ; 0x5449a36f
	.long	2273134842              ; 0x877d48fa
	.long	3281911079              ; 0xc39dfd27
	.long	4080962846              ; 0xf33e8d1e
	.long	172450625               ; 0xa476341
	.long	2569994100              ; 0x992eff74
	.long	980381355               ; 0x3a6f6eab
	.long	4109958455              ; 0xf4f8fd37
	.long	2819808352              ; 0xa812dc60
	.long	2716589560              ; 0xa1ebddf8
	.long	2568741196              ; 0x991be14c
	.long	3681446669              ; 0xdb6e6b0d
	.long	3329971472              ; 0xc67b5510
	.long	1835478071              ; 0x6d672c37
	.long	660984891               ; 0x2765d43b
	.long	3704678404              ; 0xdcd0e804
	.long	4045999559              ; 0xf1290dc7
	.long	3422617507              ; 0xcc00ffa3
	.long	3040415634              ; 0xb5390f92
	.long	1762651403              ; 0x690fed0b
	.long	1719377915              ; 0x667b9ffb
	.long	3470491036              ; 0xcedb7d9c
	.long	2693910283              ; 0xa091cf0b
	.long	3642056355              ; 0xd9155ea3
	.long	3138596744              ; 0xbb132f88
	.long	1364962596              ; 0x515bad24
	.long	2073328063              ; 0x7b9479bf
	.long	1983633131              ; 0x763bd6eb
	.long	926494387               ; 0x37392eb3
	.long	3423689081              ; 0xcc115979
	.long	2150032023              ; 0x8026e297
	.long	4096667949              ; 0xf42e312d
	.long	1749200295              ; 0x6842ada7
	.long	3328846651              ; 0xc66a2b3b
	.long	309677260               ; 0x12754ccc
	.long	2016342300              ; 0x782ef11c
	.long	1779581495              ; 0x6a124237
	.long	3079819751              ; 0xb79251e7
	.long	111262694               ; 0x6a1bbe6
	.long	1274766160              ; 0x4bfb6350
	.long	443224088               ; 0x1a6b1018
	.long	298511866               ; 0x11caedfa
	.long	1025883608              ; 0x3d25bdd8
	.long	3806446537              ; 0xe2e1c3c9
	.long	1145181785              ; 0x44421659
	.long	168956806               ; 0xa121386
	.long	3641502830              ; 0xd90cec6e
	.long	3584813610              ; 0xd5abea2a
	.long	1689216846              ; 0x64af674e
	.long	3666258015              ; 0xda86a85f
	.long	3200248200              ; 0xbebfe988
	.long	1692713982              ; 0x64e4c3fe
	.long	2646376535              ; 0x9dbc8057
	.long	4042768518              ; 0xf0f7c086
	.long	1618508792              ; 0x60787bf8
	.long	1610833997              ; 0x6003604d
	.long	3523052358              ; 0xd1fd8346
	.long	4130873264              ; 0xf6381fb0
	.long	2001055236              ; 0x7745ae04
	.long	3610705100              ; 0xd736fccc
	.long	2202168115              ; 0x83426b33
	.long	4028541809              ; 0xf01eab71
	.long	2961195399              ; 0xb0804187
	.long	1006657119              ; 0x3c005e5f
	.long	2006996926              ; 0x77a057be
	.long	3186142756              ; 0xbde8ae24
	.long	1430667929              ; 0x55464299
	.long	3210227297              ; 0xbf582e61
	.long	1314452623              ; 0x4e58f48f
	.long	4074634658              ; 0xf2ddfda2
	.long	4101304120              ; 0xf474ef38
	.long	2273951170              ; 0x8789bdc2
	.long	1399257539              ; 0x5366f9c3
	.long	3367210612              ; 0xc8b38e74
	.long	3027628629              ; 0xb475f255
	.long	1190975929              ; 0x46fcd9b9
	.long	2062231137              ; 0x7aeb2661
	.long	2333990788              ; 0x8b1ddf84
	.long	2221543033              ; 0x846a0e79
	.long	2438960610              ; 0x915f95e2
	.long	1181637006              ; 0x466e598e
	.long	548689776               ; 0x20b45770
	.long	2362791313              ; 0x8cd55591
	.long	3372408396              ; 0xc902de4c
	.long	3104550113              ; 0xb90bace1
	.long	3145860560              ; 0xbb8205d0
	.long	296247880               ; 0x11a86248
	.long	1970579870              ; 0x7574a99e
	.long	3078560182              ; 0xb77f19b6
	.long	3769228297              ; 0xe0a9dc09
	.long	1714227617              ; 0x662d09a1
	.long	3291629107              ; 0xc4324633
	.long	3898220290              ; 0xe85a1f02
	.long	166772364               ; 0x9f0be8c
	.long	1251581989              ; 0x4a99a025
	.long	493813264               ; 0x1d6efe10
	.long	448347421               ; 0x1ab93d1d
	.long	195405023               ; 0xba5a4df
	.long	2709975567              ; 0xa186f20f
	.long	677966185               ; 0x2868f169
	.long	3703036547              ; 0xdcb7da83
	.long	1463355134              ; 0x573906fe
	.long	2715995803              ; 0xa1e2ce9b
	.long	1338867538              ; 0x4fcd7f52
	.long	1343315457              ; 0x50115e01
	.long	2802222074              ; 0xa70683fa
	.long	2684532164              ; 0xa002b5c4
	.long	233230375               ; 0xde6d027
	.long	2599980071              ; 0x9af88c27
	.long	2000651841              ; 0x773f8641
	.long	3277868038              ; 0xc3604c06
	.long	1638401717              ; 0x61a806b5
	.long	4028070440              ; 0xf0177a28
	.long	3237316320              ; 0xc0f586e0
	.long	6314154                 ; 0x6058aa
	.long	819756386               ; 0x30dc7d62
	.long	300326615               ; 0x11e69ed7
	.long	590932579               ; 0x2338ea63
	.long	1405279636              ; 0x53c2dd94
	.long	3267499572              ; 0xc2c21634
	.long	3150704214              ; 0xbbcbee56
	.long	2428286686              ; 0x90bcb6de
	.long	3959192993              ; 0xebfc7da1
	.long	3461946742              ; 0xce591d76
	.long	1862657033              ; 0x6f05e409
	.long	1266418056              ; 0x4b7c0188
	.long	963775037               ; 0x39720a3d
	.long	2089974820              ; 0x7c927c24
	.long	2263052895              ; 0x86e3725f
	.long	1917689273              ; 0x724d9db9
	.long	448879540               ; 0x1ac15bb4
	.long	3550394620              ; 0xd39eb8fc
	.long	3981727096              ; 0xed545578
	.long	150775221               ; 0x8fca5b5
	.long	3627908307              ; 0xd83d7cd3
	.long	1303187396              ; 0x4dad0fc4
	.long	508620638               ; 0x1e50ef5e
	.long	2975983352              ; 0xb161e6f8
	.long	2726630617              ; 0xa28514d9
	.long	1817252668              ; 0x6c51133c
	.long	1876281319              ; 0x6fd5c7e7
	.long	1457606340              ; 0x56e14ec4
	.long	908771278               ; 0x362abfce
	.long	3720792119              ; 0xddc6c837
	.long	3617206836              ; 0xd79a3234
	.long	2455994898              ; 0x92638212
	.long	1729034894              ; 0x670efa8e
	.long	1080033504              ; 0x406000e0
	.size	init_s2, 1024

	.type	init_s3,@object         ; @init_s3
	.align	1
init_s3:
	.long	976866871               ; 0x3a39ce37
	.long	3556439503              ; 0xd3faf5cf
	.long	2881648439              ; 0xabc27737
	.long	1522871579              ; 0x5ac52d1b
	.long	1555064734              ; 0x5cb0679e
	.long	1336096578              ; 0x4fa33742
	.long	3548522304              ; 0xd3822740
	.long	2579274686              ; 0x99bc9bbe
	.long	3574697629              ; 0xd5118e9d
	.long	3205460757              ; 0xbf0f7315
	.long	3593280638              ; 0xd62d1c7e
	.long	3338716283              ; 0xc700c47b
	.long	3079412587              ; 0xb78c1b6b
	.long	564236357               ; 0x21a19045
	.long	2993598910              ; 0xb26eb1be
	.long	1781952180              ; 0x6a366eb4
	.long	1464380207              ; 0x5748ab2f
	.long	3163844217              ; 0xbc946e79
	.long	3332601554              ; 0xc6a376d2
	.long	1699332808              ; 0x6549c2c8
	.long	1393555694              ; 0x530ff8ee
	.long	1183702653              ; 0x468dde7d
	.long	3581086237              ; 0xd5730a1d
	.long	1288719814              ; 0x4cd04dc6
	.long	691649499               ; 0x2939bbdb
	.long	2847557200              ; 0xa9ba4650
	.long	2895455976              ; 0xac9526e8
	.long	3193889540              ; 0xbe5ee304
	.long	2717570544              ; 0xa1fad5f0
	.long	1781354906              ; 0x6a2d519a
	.long	1676643554              ; 0x63ef8ce2
	.long	2592534050              ; 0x9a86ee22
	.long	3230253752              ; 0xc089c2b8
	.long	1126444790              ; 0x43242ef6
	.long	2770207658              ; 0xa51e03aa
	.long	2633158820              ; 0x9cf2d0a4
	.long	2210423226              ; 0x83c061ba
	.long	2615765581              ; 0x9be96a4d
	.long	2414155088              ; 0x8fe51550
	.long	3127139286              ; 0xba645bd6
	.long	673620729               ; 0x2826a2f9
	.long	2805611233              ; 0xa73a3ae1
	.long	1269405062              ; 0x4ba99586
	.long	4015350505              ; 0xef5562e9
	.long	3341807571              ; 0xc72fefd3
	.long	4149409754              ; 0xf752f7da
	.long	1057255273              ; 0x3f046f69
	.long	2012875353              ; 0x77fa0a59
	.long	2162469141              ; 0x80e4a915
	.long	2276492801              ; 0x87b08601
	.long	2601117357              ; 0x9b09e6ad
	.long	993977747               ; 0x3b3ee593
	.long	3918593370              ; 0xe990fd5a
	.long	2654263191              ; 0x9e34d797
	.long	753973209               ; 0x2cf0b7d9
	.long	36408145                ; 0x22b8b51
	.long	2530585658              ; 0x96d5ac3a
	.long	25011837                ; 0x17da67d
	.long	3520020182              ; 0xd1cf3ed6
	.long	2088578344              ; 0x7c7d2d28
	.long	530523599               ; 0x1f9f25cf
	.long	2918365339              ; 0xadf2b89b
	.long	1524020338              ; 0x5ad6b472
	.long	1518925132              ; 0x5a88f54c
	.long	3760827505              ; 0xe029ac71
	.long	3759777254              ; 0xe019a5e6
	.long	1202760957              ; 0x47b0acfd
	.long	3985898139              ; 0xed93fa9b
	.long	3906192525              ; 0xe8d3c48d
	.long	674977740               ; 0x283b57cc
	.long	4174734889              ; 0xf8d56629
	.long	2031300136              ; 0x79132e28
	.long	2019492241              ; 0x785f0191
	.long	3983892565              ; 0xed756055
	.long	4153806404              ; 0xf7960e44
	.long	3822280332              ; 0xe3d35e8c
	.long	352677332               ; 0x15056dd4
	.long	2297720250              ; 0x88f46dba
	.long	60907813                ; 0x3a16125
	.long	90501309                ; 0x564f0bd
	.long	3286998549              ; 0xc3eb9e15
	.long	1016092578              ; 0x3c9057a2
	.long	2535922412              ; 0x97271aec
	.long	2839152426              ; 0xa93a072a
	.long	457141659               ; 0x1b3f6d9b
	.long	509813237               ; 0x1e6321f5
	.long	4120667899              ; 0xf59c66fb
	.long	652014361               ; 0x26dcf319
	.long	1966332200              ; 0x7533d928
	.long	2975202805              ; 0xb155fdf5
	.long	55981186                ; 0x3563482
	.long	2327461051              ; 0x8aba3cbb
	.long	676427537               ; 0x28517711
	.long	3255491064              ; 0xc20ad9f8
	.long	2882294119              ; 0xabcc5167
	.long	3433927263              ; 0xccad925f
	.long	1307055953              ; 0x4de81751
	.long	942726286               ; 0x3830dc8e
	.long	933058658               ; 0x379d5862
	.long	2468411793              ; 0x9320f991
	.long	3933900994              ; 0xea7a90c2
	.long	4215176142              ; 0xfb3e7bce
	.long	1361170020              ; 0x5121ce64
	.long	2001714738              ; 0x774fbe32
	.long	2830558078              ; 0xa8b6e37e
	.long	3274259782              ; 0xc3293d46
	.long	1222529897              ; 0x48de5369
	.long	1679025792              ; 0x6413e680
	.long	2729314320              ; 0xa2ae0810
	.long	3714953764              ; 0xdd6db224
	.long	1770335741              ; 0x69852dfd
	.long	151462246               ; 0x9072166
	.long	3013232138              ; 0xb39a460a
	.long	1682292957              ; 0x6445c0dd
	.long	1483529935              ; 0x586cdecf
	.long	471910574               ; 0x1c20c8ae
	.long	1539241949              ; 0x5bbef7dd
	.long	458788160               ; 0x1b588d40
	.long	3436315007              ; 0xccd2017f
	.long	1807016891              ; 0x6bb4e3bb
	.long	3718408830              ; 0xdda26a7e
	.long	978976581               ; 0x3a59ff45
	.long	1043663428              ; 0x3e350a44
	.long	3165965781              ; 0xbcb4cdd5
	.long	1927990952              ; 0x72eacea8
	.long	4200891579              ; 0xfa6484bb
	.long	2372276910              ; 0x8d6612ae
	.long	3208408903              ; 0xbf3c6f47
	.long	3533431907              ; 0xd29be463
	.long	1412390302              ; 0x542f5d9e
	.long	2931980059              ; 0xaec2771b
	.long	4132332400              ; 0xf64e6370
	.long	1947078029              ; 0x740e0d8d
	.long	3881505623              ; 0xe75b1357
	.long	4168226417              ; 0xf8721671
	.long	2941484381              ; 0xaf537d5d
	.long	1077988104              ; 0x4040cb08
	.long	1320477388              ; 0x4eb4e2cc
	.long	886195818               ; 0x34d2466a
	.long	18198404                ; 0x115af84
	.long	3786409000              ; 0xe1b00428
	.long	2509781533              ; 0x95983a1d
	.long	112762804               ; 0x6b89fb4
	.long	3463356488              ; 0xce6ea048
	.long	1866414978              ; 0x6f3f3b82
	.long	891333506               ; 0x3520ab82
	.long	18488651                ; 0x11a1d4b
	.long	661792760               ; 0x277227f8
	.long	1628790961              ; 0x611560b1
	.long	3885187036              ; 0xe7933fdc
	.long	3141171499              ; 0xbb3a792b
	.long	876946877               ; 0x344525bd
	.long	2693282273              ; 0xa08839e1
	.long	1372485963              ; 0x51ce794b
	.long	791857591               ; 0x2f32c9b7
	.long	2686433993              ; 0xa01fbac9
	.long	3759982718              ; 0xe01cc87e
	.long	3167212022              ; 0xbcc7d1f6
	.long	3472953795              ; 0xcf0111c3
	.long	2716379847              ; 0xa1e8aac7
	.long	445679433               ; 0x1a908749
	.long	3561995674              ; 0xd44fbd9a
	.long	3504004811              ; 0xd0dadecb
	.long	3574258232              ; 0xd50ada38
	.long	54117162                ; 0x339c32a
	.long	3331405415              ; 0xc6913667
	.long	2381918588              ; 0x8df9317c
	.long	3769707343              ; 0xe0b12b4f
	.long	4154350007              ; 0xf79e59b7
	.long	1140177722              ; 0x43f5bb3a
	.long	4074052095              ; 0xf2d519ff
	.long	668550556               ; 0x27d9459c
	.long	3214352940              ; 0xbf97222c
	.long	367459370               ; 0x15e6fc2a
	.long	261225585               ; 0xf91fc71
	.long	2610173221              ; 0x9b941525
	.long	4209349473              ; 0xfae59361
	.long	3468074219              ; 0xceb69ceb
	.long	3265815641              ; 0xc2a86459
	.long	314222801               ; 0x12baa8d1
	.long	3066103646              ; 0xb6c1075e
	.long	3808782860              ; 0xe3056a0c
	.long	282218597               ; 0x10d25065
	.long	3406013506              ; 0xcb03a442
	.long	3773591054              ; 0xe0ec6e0e
	.long	379116347               ; 0x1698db3b
	.long	1285071038              ; 0x4c98a0be
	.long	846784868               ; 0x3278e964
	.long	2669647154              ; 0x9f1f9532
	.long	3771962079              ; 0xe0d392df
	.long	3550491691              ; 0xd3a0342b
	.long	2305946142              ; 0x8971f21e
	.long	453669953               ; 0x1b0a7441
	.long	1268987020              ; 0x4ba3348c
	.long	3317592352              ; 0xc5be7120
	.long	3279303384              ; 0xc37632d8
	.long	3744833421              ; 0xdf359f8d
	.long	2610507566              ; 0x9b992f2e
	.long	3859509063              ; 0xe60b6f47
	.long	266596637               ; 0xfe3f11d
	.long	3847019092              ; 0xe54cda54
	.long	517658769               ; 0x1edad891
	.long	3462560207              ; 0xce6279cf
	.long	3443424879              ; 0xcd3e7e6f
	.long	370717030               ; 0x1618b166
	.long	4247526661              ; 0xfd2c1d05
	.long	2224018117              ; 0x848fd2c5
	.long	4143653529              ; 0xf6fb2299
	.long	4112773975              ; 0xf523f357
	.long	2788324899              ; 0xa6327623
	.long	2477274417              ; 0x93a83531
	.long	1456262402              ; 0x56cccd02
	.long	2901442914              ; 0xacf08162
	.long	1517677493              ; 0x5a75ebb5
	.long	1846949527              ; 0x6e163697
	.long	2295493580              ; 0x88d273cc
	.long	3734397586              ; 0xde966292
	.long	2176403920              ; 0x81b949d0
	.long	1280348187              ; 0x4c50901b
	.long	1908823572              ; 0x71c65614
	.long	3871786941              ; 0xe6c6c7bd
	.long	846861322               ; 0x327a140a
	.long	1172426758              ; 0x45e1d006
	.long	3287448474              ; 0xc3f27b9a
	.long	3383383037              ; 0xc9aa53fd
	.long	1655181056              ; 0x62a80f00
	.long	3139813346              ; 0xbb25bfe2
	.long	901632758               ; 0x35bdd2f6
	.long	1897031941              ; 0x71126905
	.long	2986607138              ; 0xb2040222
	.long	3066810236              ; 0xb6cbcf7c
	.long	3447102507              ; 0xcd769c2b
	.long	1393639104              ; 0x53113ec0
	.long	373351379               ; 0x1640e3d3
	.long	950779232               ; 0x38abbd60
	.long	625454576               ; 0x2547adf0
	.long	3124240540              ; 0xba38209c
	.long	4148612726              ; 0xf746ce76
	.long	2007998917              ; 0x77afa1c5
	.long	544563296               ; 0x20756060
	.long	2244738638              ; 0x85cbfe4e
	.long	2330496472              ; 0x8ae88dd8
	.long	2058025392              ; 0x7aaaf9b0
	.long	1291430526              ; 0x4cf9aa7e
	.long	424198748               ; 0x1948c25c
	.long	50039436                ; 0x2fb8a8c
	.long	29584100                ; 0x1c36ae4
	.long	3605783033              ; 0xd6ebe1f9
	.long	2429876329              ; 0x90d4f869
	.long	2791104160              ; 0xa65cdea0
	.long	1057563949              ; 0x3f09252d
	.long	3255363231              ; 0xc208e69f
	.long	3075367218              ; 0xb74e6132
	.long	3463963227              ; 0xce77e25b
	.long	1469046755              ; 0x578fdfe3
	.long	985887462               ; 0x3ac372e6
	.size	init_s3, 1024

	.type	.L.str.3,@object        ; @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.3, 26

	.type	watchdog_bits,@object   ; @watchdog_bits
	.local	watchdog_bits
	.comm	watchdog_bits,1,1
	.type	baseaddr,@object        ; @baseaddr
	.comm	baseaddr,2,2
	.type	__mementos_restored,@object ; @__mementos_restored
	.comm	__mementos_restored,2,2
	.type	tmpsize,@object         ; @tmpsize
	.comm	tmpsize,2,2
	.type	i,@object               ; @i
	.comm	i,2,2
	.type	j,@object               ; @j
	.comm	j,2,2
	.type	k,@object               ; @k
	.comm	k,2,2
	.type	ok_to_checkpoint,@object ; @ok_to_checkpoint
	.comm	ok_to_checkpoint,1,1
	.type	__vector_timer0_a0,@object ; @__vector_timer0_a0
	.section	__interrupt_vector_timer0_a0,"aw",@progbits
	.globl	__vector_timer0_a0
	.align	1
__vector_timer0_a0:
	.short	TIMER0_A0_ISR
	.size	__vector_timer0_a0, 2

	.type	GlobalAllocSize,@object ; @GlobalAllocSize
	.section	.bss,"aw",@nobits
	.globl	GlobalAllocSize
	.align	1
GlobalAllocSize:
	.short	0                       ; 0x0
	.size	GlobalAllocSize, 2

	.type	__mementos_active_bundle_ptr,@object ; @__mementos_active_bundle_ptr
	.section	.nv_vars,"aw",@progbits
	.globl	__mementos_active_bundle_ptr
	.align	1
__mementos_active_bundle_ptr:
	.short	65535
	.size	__mementos_active_bundle_ptr, 2


	.globl	__interrupt_vector_51
__interrupt_vector_51 = TimerB1_ISR
	.globl	__interrupt_vector_46
__interrupt_vector_46 = TIMER0_A0_ISR
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.section	".note.GNU-stack","",@progbits
