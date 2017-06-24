	.text
	.file	"bc.a.bc"
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

	.globl	btbl_bitcnt
	.align	2
	.type	btbl_bitcnt,@function
btbl_bitcnt:                            ; @btbl_bitcnt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#14, r1
	;DEBUG_VALUE: btbl_bitcnt:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.b	-8(r4), r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	r14, -10(r4)
	mov.b	-7(r4), r14
	mov.w	-6(r4), r15
	mov.w	r15, r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	bis.w	r11, r14
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jeq	.LBB2_2
	jmp	.LBB2_1
.LBB2_1:                                ; %if.then
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14
	call	#btbl_bitcnt
	mov.w	-10(r4), r14
	add.w	r15, r14
	mov.w	r14, -10(r4)
	jmp	.LBB2_2
.LBB2_2:                                ; %if.end
	mov.w	-10(r4), r15
	add.w	#14, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end2:
	.size	btbl_bitcnt, .Lfunc_end2-btbl_bitcnt

	.globl	bit_count
	.align	2
	.type	bit_count,@function
bit_count:                              ; @bit_count
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: bit_count:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	-2(r4), r14
	mov.w	-4(r4), r15
	bis.w	r14, r15
	cmp.w	#0, r15
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_5
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	jmp	.LBB3_2
.LBB3_2:                                ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB3_3
.LBB3_3:                                ; %do.cond
                                        ;   in Loop: Header=BB3_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, r14
	add.w	#-1, r14
	mov.w	r13, r15
	addc.w	#-1, r15
	and.w	r14, r12
	and.w	r15, r13
	mov.w	r13, -2(r4)
	mov.w	r12, -4(r4)
	bis.w	r13, r12
	cmp.w	#0, r12
	jne	.LBB3_2
	jmp	.LBB3_4
.LBB3_4:                                ; %do.end
	jmp	.LBB3_5
.LBB3_5:                                ; %if.end
	mov.w	-6(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	bit_count, .Lfunc_end3-bit_count

	.globl	bitcount
	.align	2
	.type	bitcount,@function
bitcount:                               ; @bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#8, r1
	;DEBUG_VALUE: bitcount:i <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r15, r11
	and.w	#-21846, r11
	mov.w	r14, r10
	and.w	#-21846, r10
	clrc
	rrc.w	r10
	clrc
	rrc.w	r11
	and.w	#21845, r14
	and.w	#21845, r15
	add.w	r14, r10
	addc.w	r15, r11
	mov.w	r11, -6(r4)
	mov.w	r10, -8(r4)
	mov.w	r11, r14
	and.w	#-13108, r14
	mov.w	r10, r15
	and.w	#-13108, r15
	clrc
	rrc.w	r15
	rra.w	r15
	clrc
	rrc.w	r14
	rra.w	r14
	and.w	#13107, r10
	and.w	#13107, r11
	add.w	r10, r15
	addc.w	r11, r14
	mov.w	r14, -6(r4)
	mov.w	r15, -8(r4)
	mov.w	r14, r11
	and.w	#28912, r11
	mov.w	r15, r10
	and.w	#-3856, r10
	clrc
	rrc.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	clrc
	rrc.w	r11
	rra.w	r11
	rra.w	r11
	rra.w	r11
	and.w	#3855, r15
	and.w	#3855, r14
	add.w	r15, r10
	addc.w	r14, r11
	mov.w	r11, -6(r4)
	mov.w	r10, -8(r4)
	mov.w	r11, r14
	and.w	#7936, r14
	mov.w	r10, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.b	r10, r10
	mov.b	r11, r11
	add.w	r10, r15
	addc.w	r11, r14
	mov.w	r14, -6(r4)
	mov.w	r15, -8(r4)
	mov.w	#0, r11
	add.w	r15, r14
	addc.w	#0, r11
	mov.w	r11, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	-8(r4), r15
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	add.w	#8, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end4:
	.size	bitcount, .Lfunc_end4-bitcount

	.globl	ntbl_bitcount
	.align	2
	.type	ntbl_bitcount,@function
ntbl_bitcount:                          ; @ntbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#8, r1
	;DEBUG_VALUE: ntbl_bitcount:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r14, r11
	and.w	#15, r11
	mov.b	bits(r11), r11
	sxt	r11
	mov.w	r14, r10
	and.w	#240, r10
	clrc
	rrc.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	mov.b	bits(r10), r10
	sxt	r10
	add.w	r10, r11
	mov.w	r14, r10
	and.w	#3840, r10
	clrc
	rrc.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	mov.b	bits(r10), r10
	sxt	r10
	add.w	r10, r11
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.b	bits(r14), r14
	sxt	r14
	add.w	r14, r11
	mov.w	r15, r14
	and.w	#15, r14
	mov.b	bits(r14), r14
	sxt	r14
	add.w	r14, r11
	mov.w	r15, r14
	and.w	#240, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.b	bits(r14), r14
	sxt	r14
	add.w	r14, r11
	mov.w	r15, r14
	and.w	#3840, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.b	bits(r14), r14
	sxt	r14
	add.w	r14, r11
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.b	bits(r15), r14
	sxt	r14
	add.w	r14, r11
	mov.w	r11, r15
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	add.w	#8, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end5:
	.size	ntbl_bitcount, .Lfunc_end5-ntbl_bitcount

	.globl	BW_btbl_bitcount
	.align	2
	.type	BW_btbl_bitcount,@function
BW_btbl_bitcount:                       ; @BW_btbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: BW_btbl_bitcount:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.b	-8(r4), r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.b	-7(r4), r15
	mov.b	bits(r15), r15
	sxt	r15
	add.w	r15, r14
	mov.b	-5(r4), r15
	mov.b	bits(r15), r15
	sxt	r15
	add.w	r15, r14
	mov.b	-6(r4), r15
	mov.b	bits(r15), r15
	sxt	r15
	add.w	r15, r14
	mov.w	r14, r15
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	BW_btbl_bitcount, .Lfunc_end6-BW_btbl_bitcount

	.globl	AR_btbl_bitcount
	.align	2
	.type	AR_btbl_bitcount,@function
AR_btbl_bitcount:                       ; @AR_btbl_bitcount
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: AR_btbl_bitcount:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r4, r14
	sub.w	#4, r14
	mov.w	r14, -6(r4)
	bis.w	#1, r14
	mov.w	r14, -6(r4)
	mov.b	-4(r4), r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	r14, -8(r4)
	mov.w	-6(r4), r14
	mov.w	r14, r15
	add.w	#1, r15
	mov.w	r15, -6(r4)
	mov.b	0(r14), r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	-8(r4), r15
	add.w	r14, r15
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r14
	mov.w	r14, r15
	add.w	#1, r15
	mov.w	r15, -6(r4)
	mov.b	0(r14), r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	-8(r4), r15
	add.w	r14, r15
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r14
	mov.b	0(r14), r14
	mov.b	bits(r14), r14
	sxt	r14
	add.w	r14, r15
	mov.w	r15, -8(r4)
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	AR_btbl_bitcount, .Lfunc_end7-AR_btbl_bitcount

	.globl	ntbl_bitcnt
	.align	2
	.type	ntbl_bitcnt,@function
ntbl_bitcnt:                            ; @ntbl_bitcnt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#14, r1
	;DEBUG_VALUE: ntbl_bitcnt:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	and.w	#15, r14
	mov.b	bits(r14), r14
	sxt	r14
	mov.w	r14, -10(r4)
	mov.w	-6(r4), r14
	mov.w	-8(r4), r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r14, r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	bis.w	r11, r15
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	mov.w	r14, -6(r4)
	mov.w	r15, -8(r4)
	bis.w	r14, r15
	cmp.w	#0, r15
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14
	call	#ntbl_bitcnt
	mov.w	-10(r4), r14
	add.w	r15, r14
	mov.w	r14, -10(r4)
	jmp	.LBB8_2
.LBB8_2:                                ; %if.end
	mov.w	-10(r4), r15
	add.w	#14, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end8:
	.size	ntbl_bitcnt, .Lfunc_end8-ntbl_bitcnt

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#52, r1
	mov.w	#0, -2(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -4(r4)
	cmp.w	#-1, r15
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	mov.w	-4(r4), r15
	call	#__mementos_restore
	jmp	.LBB9_2
.LBB9_2:                                ; %if.end
	;DEBUG_VALUE: main:n_0 <- [FP+-6]
	;DEBUG_VALUE: main:n_1 <- [FP+-8]
	;DEBUG_VALUE: main:n_2 <- [FP+-10]
	;DEBUG_VALUE: main:n_3 <- [FP+-12]
	;DEBUG_VALUE: main:n_4 <- [FP+-14]
	;DEBUG_VALUE: main:n_5 <- [FP+-16]
	;DEBUG_VALUE: main:n_6 <- [FP+-18]
	;DEBUG_VALUE: main:seed <- [FP+-24]
	;DEBUG_VALUE: main:iter <- [FP+-26]
	;DEBUG_VALUE: main:func <- [FP+-28]
	mov.w	#0, -6(r4)
	mov.w	#0, -8(r4)
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	#0, -14(r4)
	mov.w	#0, -16(r4)
	mov.w	#0, -18(r4)
	call	#__mementos_checkpoint
	mov.w	#0, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then.2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_4
.LBB9_4:                                ; %if.end.3
	mov.w	#0, -28(r4)
	jmp	.LBB9_5
.LBB9_5:                                ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_58 Depth 2
                                        ;     Child Loop BB9_50 Depth 2
                                        ;     Child Loop BB9_42 Depth 2
                                        ;     Child Loop BB9_34 Depth 2
                                        ;     Child Loop BB9_26 Depth 2
                                        ;     Child Loop BB9_18 Depth 2
                                        ;     Child Loop BB9_10 Depth 2
	mov.w	-28(r4), r12
	cmp.w	#7, r12
	jlo	4
	br	#.LBB9_72
	jmp	.LBB9_6
.LBB9_6:                                ; %for.body
                                        ;   in Loop: Header=BB9_5 Depth=1
	call	#__mementos_checkpoint
	mov.w	#1, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %if.then.7
                                        ;   in Loop: Header=BB9_5 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_8
.LBB9_8:                                ; %if.end.8
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -22(r4)
	mov.w	#4, -24(r4)
	mov.w	-28(r4), r12
	cmp.w	#0, r12
	jne	.LBB9_16
	jmp	.LBB9_9
.LBB9_9:                                ; %if.then.10
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_10
.LBB9_10:                               ; %for.cond.11
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_15
	jmp	.LBB9_11
.LBB9_11:                               ; %for.body.13
                                        ;   in Loop: Header=BB9_10 Depth=2
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_13
	jmp	.LBB9_12
.LBB9_12:                               ; %if.then.16
                                        ;   in Loop: Header=BB9_10 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_13
.LBB9_13:                               ; %if.end.17
                                        ;   in Loop: Header=BB9_10 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#bit_count
	mov.w	-6(r4), r14
	add.w	r15, r14
	mov.w	r14, -6(r4)
	jmp	.LBB9_14
.LBB9_14:                               ; %for.inc
                                        ;   in Loop: Header=BB9_10 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_10
.LBB9_15:                               ; %for.end
                                        ;   in Loop: Header=BB9_5 Depth=1
	br	#.LBB9_70
.LBB9_16:                               ; %if.else
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#1, r12
	jne	.LBB9_24
	jmp	.LBB9_17
.LBB9_17:                               ; %if.then.21
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_18
.LBB9_18:                               ; %for.cond.22
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_23
	jmp	.LBB9_19
.LBB9_19:                               ; %for.body.24
                                        ;   in Loop: Header=BB9_18 Depth=2
	call	#__mementos_checkpoint
	mov.w	#3, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_21
	jmp	.LBB9_20
.LBB9_20:                               ; %if.then.27
                                        ;   in Loop: Header=BB9_18 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_21
.LBB9_21:                               ; %if.end.28
                                        ;   in Loop: Header=BB9_18 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#bitcount
	mov.w	-8(r4), r14
	add.w	r15, r14
	mov.w	r14, -8(r4)
	jmp	.LBB9_22
.LBB9_22:                               ; %for.inc.31
                                        ;   in Loop: Header=BB9_18 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_18
.LBB9_23:                               ; %for.end.34
                                        ;   in Loop: Header=BB9_5 Depth=1
	br	#.LBB9_69
.LBB9_24:                               ; %if.else.35
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#2, r12
	jne	.LBB9_32
	jmp	.LBB9_25
.LBB9_25:                               ; %if.then.37
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_26
.LBB9_26:                               ; %for.cond.38
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_31
	jmp	.LBB9_27
.LBB9_27:                               ; %for.body.40
                                        ;   in Loop: Header=BB9_26 Depth=2
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_29
	jmp	.LBB9_28
.LBB9_28:                               ; %if.then.43
                                        ;   in Loop: Header=BB9_26 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_29
.LBB9_29:                               ; %if.end.44
                                        ;   in Loop: Header=BB9_26 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#ntbl_bitcnt
	mov.w	-10(r4), r14
	add.w	r15, r14
	mov.w	r14, -10(r4)
	jmp	.LBB9_30
.LBB9_30:                               ; %for.inc.47
                                        ;   in Loop: Header=BB9_26 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_26
.LBB9_31:                               ; %for.end.50
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_68
.LBB9_32:                               ; %if.else.51
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#3, r12
	jne	.LBB9_40
	jmp	.LBB9_33
.LBB9_33:                               ; %if.then.53
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_34
.LBB9_34:                               ; %for.cond.54
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_39
	jmp	.LBB9_35
.LBB9_35:                               ; %for.body.56
                                        ;   in Loop: Header=BB9_34 Depth=2
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_37
	jmp	.LBB9_36
.LBB9_36:                               ; %if.then.59
                                        ;   in Loop: Header=BB9_34 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_37
.LBB9_37:                               ; %if.end.60
                                        ;   in Loop: Header=BB9_34 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#ntbl_bitcount
	mov.w	-12(r4), r14
	add.w	r15, r14
	mov.w	r14, -12(r4)
	jmp	.LBB9_38
.LBB9_38:                               ; %for.inc.63
                                        ;   in Loop: Header=BB9_34 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_34
.LBB9_39:                               ; %for.end.66
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_67
.LBB9_40:                               ; %if.else.67
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#4, r12
	jne	.LBB9_48
	jmp	.LBB9_41
.LBB9_41:                               ; %if.then.69
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_42
.LBB9_42:                               ; %for.cond.70
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_47
	jmp	.LBB9_43
.LBB9_43:                               ; %for.body.72
                                        ;   in Loop: Header=BB9_42 Depth=2
	call	#__mementos_checkpoint
	mov.w	#6, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_45
	jmp	.LBB9_44
.LBB9_44:                               ; %if.then.75
                                        ;   in Loop: Header=BB9_42 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_45
.LBB9_45:                               ; %if.end.76
                                        ;   in Loop: Header=BB9_42 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#BW_btbl_bitcount
	mov.w	-14(r4), r14
	add.w	r15, r14
	mov.w	r14, -14(r4)
	jmp	.LBB9_46
.LBB9_46:                               ; %for.inc.79
                                        ;   in Loop: Header=BB9_42 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_42
.LBB9_47:                               ; %for.end.82
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_66
.LBB9_48:                               ; %if.else.83
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#5, r12
	jne	.LBB9_56
	jmp	.LBB9_49
.LBB9_49:                               ; %if.then.85
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_50
.LBB9_50:                               ; %for.cond.86
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_55
	jmp	.LBB9_51
.LBB9_51:                               ; %for.body.88
                                        ;   in Loop: Header=BB9_50 Depth=2
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_53
	jmp	.LBB9_52
.LBB9_52:                               ; %if.then.91
                                        ;   in Loop: Header=BB9_50 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_53
.LBB9_53:                               ; %if.end.92
                                        ;   in Loop: Header=BB9_50 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#AR_btbl_bitcount
	mov.w	-16(r4), r14
	add.w	r15, r14
	mov.w	r14, -16(r4)
	jmp	.LBB9_54
.LBB9_54:                               ; %for.inc.95
                                        ;   in Loop: Header=BB9_50 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_50
.LBB9_55:                               ; %for.end.98
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_65
.LBB9_56:                               ; %if.else.99
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	cmp.w	#6, r12
	jne	.LBB9_64
	jmp	.LBB9_57
.LBB9_57:                               ; %if.then.101
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB9_58
.LBB9_58:                               ; %for.cond.102
                                        ;   Parent Loop BB9_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-26(r4), r12
	cmp.w	#100, r12
	jhs	.LBB9_63
	jmp	.LBB9_59
.LBB9_59:                               ; %for.body.104
                                        ;   in Loop: Header=BB9_58 Depth=2
	call	#__mementos_checkpoint
	mov.w	#8, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_61
	jmp	.LBB9_60
.LBB9_60:                               ; %if.then.107
                                        ;   in Loop: Header=BB9_58 Depth=2
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_61
.LBB9_61:                               ; %if.end.108
                                        ;   in Loop: Header=BB9_58 Depth=2
	mov.w	-22(r4), r15
	mov.w	-24(r4), r14
	call	#bit_shifter
	mov.w	-18(r4), r14
	add.w	r15, r14
	mov.w	r14, -18(r4)
	jmp	.LBB9_62
.LBB9_62:                               ; %for.inc.111
                                        ;   in Loop: Header=BB9_58 Depth=2
	mov.w	-26(r4), r12
	add.w	#1, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	#13, r12
	addc.w	#0, r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	jmp	.LBB9_58
.LBB9_63:                               ; %for.end.114
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_64
.LBB9_64:                               ; %if.end.115
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_65
.LBB9_65:                               ; %if.end.116
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_66
.LBB9_66:                               ; %if.end.117
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_67
.LBB9_67:                               ; %if.end.118
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_68
.LBB9_68:                               ; %if.end.119
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_69
.LBB9_69:                               ; %if.end.120
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_70
.LBB9_70:                               ; %if.end.121
                                        ;   in Loop: Header=BB9_5 Depth=1
	jmp	.LBB9_71
.LBB9_71:                               ; %for.inc.122
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.w	-28(r4), r12
	add.w	#1, r12
	mov.w	r12, -28(r4)
	br	#.LBB9_5
.LBB9_72:                               ; %for.end.124
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_74
	jmp	.LBB9_73
.LBB9_73:                               ; %if.then.127
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_74
.LBB9_74:                               ; %if.end.128
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.1, 0(r14)
	call	#printf
	mov.w	-6(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-8(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-10(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-12(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-14(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -38(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-16(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-18(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, r12
	mov.w	r15, -44(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	add.w	#52, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	main, .Lfunc_end9-main

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
.Lfunc_end10:
	.size	init_hw, .Lfunc_end10-init_hw

	.align	2
	.type	bit_shifter,@function
bit_shifter:                            ; @bit_shifter
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	;DEBUG_VALUE: bit_shifter:x <- undef
	mov.w	r15, r12
	mov.w	r14, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -8(r4)
	mov.w	#0, -6(r4)
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB11_1
.LBB11_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	mov.b	#0, r14
	bis.w	r12, r13
	cmp.w	#0, r13
	mov.b	r14, -13(r4)            ; 1-byte Folded Spill
	jeq	.LBB11_3
	jmp	.LBB11_2
.LBB11_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-6(r4), r12
	cmp.w	#32, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -13(r4)            ; 1-byte Folded Spill
	jmp	.LBB11_3
.LBB11_3:                               ; %land.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.b	-13(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB11_6
	jmp	.LBB11_4
.LBB11_4:                               ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-4(r4), r12
	and.w	#1, r12
	mov.w	-8(r4), r13
	add.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB11_5
.LBB11_5:                               ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	clrc
	rrc.w	r13
	mov.w	r12, r14
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
	bis.w	r14, r13
	clrc
	rrc.w	r12
	mov.w	r12, -2(r4)
	mov.w	r13, -4(r4)
	jmp	.LBB11_1
.LBB11_6:                               ; %for.end
	mov.w	-8(r4), r15
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	bit_shifter, .Lfunc_end11-bit_shifter

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
.Lfunc_end12:
	.size	msp_watchdog_enable, .Lfunc_end12-msp_watchdog_enable

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
.Lfunc_end13:
	.size	msp_watchdog_disable, .Lfunc_end13-msp_watchdog_disable

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
.Lfunc_end14:
	.size	msp_watchdog_kick, .Lfunc_end14-msp_watchdog_kick

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
	jeq	.LBB15_4
	jmp	.LBB15_1
.LBB15_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB15_2
.LBB15_2:                               ; %while.body
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
	jne	.LBB15_2
	jmp	.LBB15_3
.LBB15_3:                               ; %while.end.loopexit
	jmp	.LBB15_4
.LBB15_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end15:
	.size	memcpy, .Lfunc_end15-memcpy

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
.Lfunc_end16:
	.size	my_memset, .Lfunc_end16-my_memset

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
.Lfunc_end17:
	.size	msp_clock_setup, .Lfunc_end17-msp_clock_setup

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
.Lfunc_end18:
	.size	mult16, .Lfunc_end18-mult16

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
	jmp	.LBB19_1
.LBB19_1:                               ; %while.cond
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
	jeq	.LBB19_3
	jmp	.LBB19_2
.LBB19_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB19_3
.LBB19_3:                               ; %land.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB19_10
	jmp	.LBB19_4
.LBB19_4:                               ; %while.body
                                        ;   in Loop: Header=BB19_1 Depth=1
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
	jeq	.LBB19_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB19_6:                               ; %while.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB19_8
	jmp	.LBB19_7
.LBB19_7:                               ; %if.then
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB19_9
.LBB19_8:                               ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB19_9
.LBB19_9:                               ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	jmp	.LBB19_1
.LBB19_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end19:
	.size	sqrt16, .Lfunc_end19-sqrt16

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
	jmp	.LBB20_1
.LBB20_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB20_4
	jmp	.LBB20_2
.LBB20_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB20_4
	jmp	.LBB20_3
.LBB20_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB20_4
.LBB20_4:                               ; %land.end
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB20_6
	jmp	.LBB20_5
.LBB20_5:                               ; %while.body
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB20_1
.LBB20_6:                               ; %while.end
	jmp	.LBB20_7
.LBB20_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB20_11
	jmp	.LBB20_8
.LBB20_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB20_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB20_10
	jmp	.LBB20_9
.LBB20_9:                               ; %if.then
                                        ;   in Loop: Header=BB20_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB20_10
.LBB20_10:                              ; %if.end
                                        ;   in Loop: Header=BB20_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB20_7
.LBB20_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB20_13
	jmp	.LBB20_12
.LBB20_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB20_14
.LBB20_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB20_14
.LBB20_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end20:
	.size	udivmodhi4, .Lfunc_end20-udivmodhi4

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
	jge	.LBB21_2
	jmp	.LBB21_1
.LBB21_1:                               ; %if.then
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
	jmp	.LBB21_2
.LBB21_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB21_4
	jmp	.LBB21_3
.LBB21_3:                               ; %if.then.2
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
	jmp	.LBB21_4
.LBB21_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB21_6
	jmp	.LBB21_5
.LBB21_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB21_6
.LBB21_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end21:
	.size	__divhi3, .Lfunc_end21-__divhi3

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
	jge	.LBB22_2
	jmp	.LBB22_1
.LBB22_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB22_2
.LBB22_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB22_4
	jmp	.LBB22_3
.LBB22_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB22_4
.LBB22_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB22_6
	jmp	.LBB22_5
.LBB22_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB22_6
.LBB22_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end22:
	.size	__modhi3, .Lfunc_end22-__modhi3

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
.Lfunc_end23:
	.size	__udivhi3, .Lfunc_end23-__udivhi3

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
.Lfunc_end24:
	.size	__umodhi3, .Lfunc_end24-__umodhi3

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
.Lfunc_end25:
	.size	__dino_task_boundary, .Lfunc_end25-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB26_2
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB26_2
.LBB26_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__dino_empty_versioning, .Lfunc_end26-__dino_empty_versioning

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
.Lfunc_end27:
	.size	__dino_unset_recovery_bit, .Lfunc_end27-__dino_unset_recovery_bit

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
.Lfunc_end28:
	.size	__dino_recovery_bit_set, .Lfunc_end28-__dino_recovery_bit_set

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
	jne	.LBB29_2
	jmp	.LBB29_1
.LBB29_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB29_5
.LBB29_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB29_4
	jmp	.LBB29_3
.LBB29_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB29_5
.LBB29_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB29_5
.LBB29_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	__dino_find_next_recovery, .Lfunc_end29-__dino_find_next_recovery

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
	jne	.LBB30_2
	jmp	.LBB30_1
.LBB30_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB30_5
.LBB30_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB30_4
	jmp	.LBB30_3
.LBB30_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB30_5
.LBB30_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB30_5
.LBB30_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end30:
	.size	__dino_find_active_recovery, .Lfunc_end30-__dino_find_active_recovery

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
.Lfunc_end31:
	.size	__dino_recovery_get, .Lfunc_end31-__dino_recovery_get

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
.Lfunc_end32:
	.size	__dino_recovery_set, .Lfunc_end32-__dino_recovery_set

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
.Lfunc_end33:
	.size	__dino_set_next_recovery, .Lfunc_end33-__dino_set_next_recovery

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
	jmp	.LBB34_1
.LBB34_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB34_4
	jmp	.LBB34_2
.LBB34_2:                               ; %for.body
                                        ;   in Loop: Header=BB34_1 Depth=1
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
	jmp	.LBB34_3
.LBB34_3:                               ; %for.inc
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB34_1
.LBB34_4:                               ; %for.end
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
.Lfunc_end34:
	.size	__mementos_restore, .Lfunc_end34-__mementos_restore

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
	jmp	.LBB35_1
.LBB35_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB35_2
.LBB35_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end35:
	.size	__mementos_setup_timer, .Lfunc_end35-__mementos_setup_timer

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
.Lfunc_end36:
	.size	TIMER0_A0_ISR, .Lfunc_end36-TIMER0_A0_ISR

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
	jmp	.LBB37_1
.LBB37_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB37_4
	jmp	.LBB37_2
.LBB37_2:                               ; %for.body
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB37_3
.LBB37_3:                               ; %for.inc
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB37_1
.LBB37_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB37_5
.LBB37_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB37_8
	jmp	.LBB37_6
.LBB37_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB37_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB37_7
.LBB37_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB37_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB37_5
.LBB37_8:                               ; %for.end.16
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
.Lfunc_end37:
	.size	__mementos_checkpoint, .Lfunc_end37-__mementos_checkpoint

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
	jeq	.LBB38_2
	jmp	.LBB38_1
.LBB38_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB38_3
	jmp	.LBB38_4
.LBB38_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB38_5
.LBB38_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB38_4
.LBB38_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB38_5
.LBB38_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end38:
	.size	__mementos_locate_next_bundle, .Lfunc_end38-__mementos_locate_next_bundle

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
	jeq	.LBB39_2
	jmp	.LBB39_1
.LBB39_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB39_3
.LBB39_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB39_3
.LBB39_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end39:
	.size	__mementos_find_active_bundle, .Lfunc_end39-__mementos_find_active_bundle

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
	jlo	.LBB40_2
	jmp	.LBB40_1
.LBB40_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB40_2
.LBB40_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end40:
	.size	__mementos_bundle_in_range, .Lfunc_end40-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end41:
	.size	__mementos_atboot_cleanup, .Lfunc_end41-__mementos_atboot_cleanup

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
.Lfunc_end42:
	.size	__mementos_inactive_cleanup, .Lfunc_end42-__mementos_inactive_cleanup

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
.Lfunc_end43:
	.size	__mementos_force_free, .Lfunc_end43-__mementos_force_free

	.type	overflow,@object        ; @overflow
	.section	.bss,"aw",@nobits
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

	.type	curtask,@object         ; @curtask
	.section	.nv_vars,"aw",@progbits
	.align	1
curtask:
	.short	0                       ; 0x0
	.size	curtask, 2

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	".%u.\r\n"
	.size	.L.str, 7

	.type	bits,@object            ; @bits
	.data
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	.L.str.1,@object        ; @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.1, 26

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"%u\r\n"
	.size	.L.str.2, 5

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
