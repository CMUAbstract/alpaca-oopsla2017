	.text
	.file	"rsa.a.bc"
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

	.globl	print_bigint
	.align	2
	.type	print_bigint,@function
print_bigint:                           ; @print_bigint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	;DEBUG_VALUE: print_bigint:n <- undef
	;DEBUG_VALUE: print_bigint:digits <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	add.w	#-1, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB1_1
.LBB1_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	jl	.LBB1_4
	jmp	.LBB1_2
.LBB1_2:                                ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB1_3
.LBB1_3:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#-1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB1_1
.LBB1_4:                                ; %for.end
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	print_bigint, .Lfunc_end1-print_bigint

	.globl	log_bigint
	.align	2
	.type	log_bigint,@function
log_bigint:                             ; @log_bigint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: log_bigint:n <- undef
	;DEBUG_VALUE: log_bigint:digits <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	add.w	#-1, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	jl	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#-1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	add.w	#10, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	log_bigint, .Lfunc_end2-log_bigint

	.globl	print_hex_ascii
	.align	2
	.type	print_hex_ascii,@function
print_hex_ascii:                        ; @print_hex_ascii
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	;DEBUG_VALUE: print_hex_ascii:m <- undef
	;DEBUG_VALUE: print_hex_ascii:len <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_1
.LBB3_1:                                ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_3 Depth 2
                                        ;     Child Loop BB3_9 Depth 2
                                        ;     Child Loop BB3_13 Depth 2
	mov.w	-6(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB3_23
	jmp	.LBB3_2
.LBB3_2:                                ; %for.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	#0, -8(r4)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.cond.1
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-8(r4), r12
	mov.b	#0, r13
	cmp.w	#8, r12
	mov.b	r13, -15(r4)            ; 1-byte Folded Spill
	jge	.LBB3_5
	jmp	.LBB3_4
.LBB3_4:                                ; %land.rhs
                                        ;   in Loop: Header=BB3_3 Depth=2
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -15(r4)            ; 1-byte Folded Spill
	jmp	.LBB3_5
.LBB3_5:                                ; %land.end
                                        ;   in Loop: Header=BB3_3 Depth=2
	mov.b	-15(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB3_8
	jmp	.LBB3_6
.LBB3_6:                                ; %for.body.4
                                        ;   in Loop: Header=BB3_3 Depth=2
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	-2(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_7
.LBB3_7:                                ; %for.inc
                                        ;   in Loop: Header=BB3_3 Depth=2
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB3_3
.LBB3_8:                                ; %for.end
                                        ;   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_9
.LBB3_9:                                ; %for.cond.6
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-8(r4), r12
	cmp.w	#8, r12
	jge	.LBB3_12
	jmp	.LBB3_10
.LBB3_10:                               ; %for.body.9
                                        ;   in Loop: Header=BB3_9 Depth=2
	mov.w	r1, r12
	mov.w	#.L.str.1, 0(r12)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_11
.LBB3_11:                               ; %for.inc.11
                                        ;   in Loop: Header=BB3_9 Depth=2
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB3_9
.LBB3_12:                               ; %for.end.13
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.2, 0(r12)
	call	#printf
	mov.w	#0, -8(r4)
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_13
.LBB3_13:                               ; %for.cond.15
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-8(r4), r12
	mov.b	#0, r13
	cmp.w	#8, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jge	.LBB3_15
	jmp	.LBB3_14
.LBB3_14:                               ; %land.rhs.18
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB3_15
.LBB3_15:                               ; %land.end.22
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB3_21
	jmp	.LBB3_16
.LBB3_16:                               ; %for.body.23
                                        ;   in Loop: Header=BB3_13 Depth=2
	;DEBUG_VALUE: c <- [FP+-9]
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	-2(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r14
	mov.b	r14, -9(r4)
	mov.b	-9(r4), r12
	sxt	r12
	cmp.w	#32, r12
	jl	.LBB3_18
	jmp	.LBB3_17
.LBB3_17:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.b	-9(r4), r12
	sxt	r12
	cmp.w	#128, r12
	jl	.LBB3_19
	jmp	.LBB3_18
.LBB3_18:                               ; %if.then
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.b	#46, -9(r4)
	jmp	.LBB3_19
.LBB3_19:                               ; %if.end
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.b	-9(r4), r12
	sxt	r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.3, 0(r13)
	call	#printf
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_20
.LBB3_20:                               ; %for.inc.34
                                        ;   in Loop: Header=BB3_13 Depth=2
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB3_13
.LBB3_21:                               ; %for.end.36
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_22
.LBB3_22:                               ; %for.inc.38
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB3_1
.LBB3_23:                               ; %for.end.40
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	print_hex_ascii, .Lfunc_end3-print_hex_ascii

	.globl	mult
	.align	2
	.type	mult,@function
mult:                                   ; @mult
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	;DEBUG_VALUE: mult:a <- undef
	;DEBUG_VALUE: mult:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -16(r4)
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	mov.w	r13, -20(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#3, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov.w	#0, -8(r4)
	jmp	.LBB4_3
.LBB4_3:                                ; %for.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_7 Depth 2
	mov.w	-8(r4), r12
	cmp.w	#16, r12
	jhs	.LBB4_15
	jmp	.LBB4_4
.LBB4_4:                                ; %for.body
                                        ;   in Loop: Header=BB4_3 Depth=1
	call	#__mementos_checkpoint
	mov.w	#14, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_6
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then.3
                                        ;   in Loop: Header=BB4_3 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_6
.LBB4_6:                                ; %if.end.4
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov.w	-16(r4), r12
	mov.w	r12, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	#0, -6(r4)
	jmp	.LBB4_7
.LBB4_7:                                ; %for.cond.5
                                        ;   Parent Loop BB4_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-6(r4), r12
	cmp.w	#8, r12
	jge	.LBB4_13
	jmp	.LBB4_8
.LBB4_8:                                ; %for.body.7
                                        ;   in Loop: Header=BB4_7 Depth=2
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r12, r13
	jlo	.LBB4_11
	jmp	.LBB4_9
.LBB4_9:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB4_7 Depth=2
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	sub.w	r13, r12
	cmp.w	#8, r12
	jhs	.LBB4_11
	jmp	.LBB4_10
.LBB4_10:                               ; %if.then.10
                                        ;   in Loop: Header=BB4_7 Depth=2
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	sub.w	r13, r12
	mov.w	-2(r4), r14
	rla.w	r12
	add.w	r12, r14
	mov.w	0(r14), r15
	mov.w	-4(r4), r12
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r14
	call	#__mulhi3hw_noint
	mov.w	r15, -14(r4)
	mov.b	-13(r4), r12
	mov.w	-12(r4), r13
	add.w	r12, r13
	mov.w	r13, -12(r4)
	mov.b	-14(r4), r12
	mov.w	-10(r4), r13
	add.w	r12, r13
	mov.w	r13, -10(r4)
	jmp	.LBB4_11
.LBB4_11:                               ; %if.end.14
                                        ;   in Loop: Header=BB4_7 Depth=2
	jmp	.LBB4_12
.LBB4_12:                               ; %for.inc
                                        ;   in Loop: Header=BB4_7 Depth=2
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB4_7
.LBB4_13:                               ; %for.end
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov.b	-9(r4), r12
	mov.w	-12(r4), r13
	add.w	r12, r13
	mov.w	r13, -12(r4)
	mov.b	-10(r4), r12
	mov.w	r12, -10(r4)
	mov.w	-8(r4), r13
	rla.w	r13
	mov.w	r12, product(r13)
	mov.w	-12(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB4_14
.LBB4_14:                               ; %for.inc.19
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB4_3
.LBB4_15:                               ; %for.end.21
	call	#__mementos_checkpoint
	mov.w	#20, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_17
	jmp	.LBB4_16
.LBB4_16:                               ; %if.then.24
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_17
.LBB4_17:                               ; %if.end.25
	mov.w	#0, -6(r4)
	jmp	.LBB4_18
.LBB4_18:                               ; %for.cond.26
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#16, r12
	jge	.LBB4_21
	jmp	.LBB4_19
.LBB4_19:                               ; %for.body.28
                                        ;   in Loop: Header=BB4_18 Depth=1
	mov.w	-6(r4), r12
	rla.w	r12
	mov.w	product(r12), r13
	mov.w	-2(r4), r14
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB4_20
.LBB4_20:                               ; %for.inc.31
                                        ;   in Loop: Header=BB4_18 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB4_18
.LBB4_21:                               ; %for.end.33
	call	#__mementos_checkpoint
	mov.w	#27, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_23
	jmp	.LBB4_22
.LBB4_22:                               ; %if.then.36
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_23
.LBB4_23:                               ; %if.end.37
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	mult, .Lfunc_end4-mult

	.globl	reduce_normalizable
	.align	2
	.type	reduce_normalizable,@function
reduce_normalizable:                    ; @reduce_normalizable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#22, r1
	;DEBUG_VALUE: reduce_normalizable:m <- undef
	;DEBUG_VALUE: reduce_normalizable:n <- undef
	;DEBUG_VALUE: reduce_normalizable:d <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.b	#1, -19(r4)
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	mov.w	r11, -24(r4)            ; 2-byte Folded Spill
	mov.w	r10, -26(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#6, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	mov.w	-10(r4), r12
	add.w	#-7, r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB5_3
.LBB5_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jl	.LBB5_11
	jmp	.LBB5_4
.LBB5_4:                                ; %for.body
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-12(r4), r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -18(r4)
	mov.w	-12(r4), r12
	mov.w	-14(r4), r13
	sub.w	r13, r12
	mov.w	-8(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -16(r4)
	mov.w	-18(r4), r13
	cmp.w	r13, r12
	jhs	.LBB5_6
	jmp	.LBB5_5
.LBB5_5:                                ; %if.then.4
	jmp	.LBB5_11
.LBB5_6:                                ; %if.else
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-16(r4), r13
	cmp.w	r13, r12
	jhs	.LBB5_8
	jmp	.LBB5_7
.LBB5_7:                                ; %if.then.6
	mov.b	#0, -19(r4)
	jmp	.LBB5_11
.LBB5_8:                                ; %if.end.7
                                        ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_9
.LBB5_9:                                ; %if.end.8
                                        ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_10
.LBB5_10:                               ; %for.inc
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-12(r4), r12
	add.w	#-1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB5_3
.LBB5_11:                               ; %for.end
	call	#__mementos_checkpoint
	mov.w	#30, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_13
	jmp	.LBB5_12
.LBB5_12:                               ; %if.then.11
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_13
.LBB5_13:                               ; %if.end.12
	mov.b	-19(r4), r12
	and.w	#1, r12
	mov.w	r12, r15
	add.w	#22, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end5:
	.size	reduce_normalizable, .Lfunc_end5-reduce_normalizable

	.globl	reduce_normalize
	.align	2
	.type	reduce_normalize,@function
reduce_normalize:                       ; @reduce_normalize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#28, r1
	;DEBUG_VALUE: reduce_normalize:m <- undef
	;DEBUG_VALUE: reduce_normalize:n <- undef
	;DEBUG_VALUE: reduce_normalize:digit <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	mov.w	r11, -30(r4)            ; 2-byte Folded Spill
	mov.w	r10, -32(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	mov.w	-10(r4), r12
	add.w	#-7, r12
	mov.w	r12, -24(r4)
	mov.w	#0, -22(r4)
	mov.w	#0, -12(r4)
	jmp	.LBB6_1
.LBB6_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#8, r12
	jge	.LBB6_9
	jmp	.LBB6_2
.LBB6_2:                                ; %for.body
                                        ;   in Loop: Header=BB6_1 Depth=1
	;DEBUG_VALUE: DINO_MANUAL_VERSION_m_d <- [FP+-22]
	mov.w	-12(r4), r12
	mov.w	-24(r4), r13
	add.w	r13, r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -26(r4)
	call	#__mementos_checkpoint
	mov.w	#21, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB6_4
	jmp	.LBB6_3
.LBB6_3:                                ; %if.then
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	-12(r4), r13
	mov.w	-24(r4), r14
	add.w	r14, r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	call	#__dino_unset_recovery_bit
	jmp	.LBB6_4
.LBB6_4:                                ; %if.end
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-12(r4), r12
	mov.w	-24(r4), r13
	add.w	r13, r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -18(r4)
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -20(r4)
	mov.w	-22(r4), r13
	add.w	r13, r12
	mov.w	r12, -16(r4)
	mov.w	-18(r4), r13
	cmp.w	r12, r13
	jhs	.LBB6_6
	jmp	.LBB6_5
.LBB6_5:                                ; %if.then.9
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#256, r12
	mov.w	r12, -18(r4)
	mov.w	#1, -22(r4)
	jmp	.LBB6_7
.LBB6_6:                                ; %if.else
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	#0, -22(r4)
	jmp	.LBB6_7
.LBB6_7:                                ; %if.end.11
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	-16(r4), r13
	sub.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	-12(r4), r13
	mov.w	-24(r4), r14
	add.w	r14, r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB6_8
.LBB6_8:                                ; %for.inc
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB6_1
.LBB6_9:                                ; %for.end
	call	#__mementos_checkpoint
	mov.w	#29, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB6_11
	jmp	.LBB6_10
.LBB6_10:                               ; %if.then.17
	call	#__dino_unset_recovery_bit
	jmp	.LBB6_11
.LBB6_11:                               ; %if.end.18
	add.w	#28, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end6:
	.size	reduce_normalize, .Lfunc_end6-reduce_normalize

	.globl	reduce_quotient
	.align	2
	.type	reduce_quotient,@function
reduce_quotient:                        ; @reduce_quotient
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#44, r1
	;DEBUG_VALUE: reduce_quotient:quotient <- undef
	;DEBUG_VALUE: reduce_quotient:m <- undef
	;DEBUG_VALUE: reduce_quotient:n <- undef
	;DEBUG_VALUE: reduce_quotient:d <- undef
	mov.w	r12, r11
	mov.w	r13, r10
	mov.w	r14, r9
	mov.w	r15, r8
	mov.w	r15, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	r13, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	r11, -40(r4)            ; 2-byte Folded Spill
	mov.w	r10, -42(r4)            ; 2-byte Folded Spill
	mov.w	r9, -44(r4)             ; 2-byte Folded Spill
	mov.w	r8, -46(r4)             ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#16, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_2
.LBB7_2:                                ; %if.end
	mov.w	-14(r4), r12
	mov.w	14(r12), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	12(r12), r12
	add.w	r12, r13
	mov.w	r13, -26(r4)
	mov.w	-14(r4), r12
	mov.w	14(r12), r12
	mov.w	r12, -28(r4)
	mov.w	-16(r4), r12
	mov.w	-12(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -18(r4)
	mov.w	-16(r4), r12
	rla.w	r12
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	-2(r12), r12
	mov.w	r12, -20(r4)
	mov.w	-16(r4), r12
	rla.w	r12
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	-4(r12), r12
	mov.w	r12, -22(r4)
	call	#__mementos_checkpoint
	mov.w	#17, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:                                ; %if.then.12
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_4
.LBB7_4:                                ; %if.end.13
	mov.w	-18(r4), r12
	mov.w	-28(r4), r13
	cmp.w	r13, r12
	jne	.LBB7_6
	jmp	.LBB7_5
.LBB7_5:                                ; %if.then.15
	mov.w	#255, -24(r4)
	jmp	.LBB7_7
.LBB7_6:                                ; %if.else
	mov.w	-18(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-20(r4), r13
	add.w	r13, r12
	mov.w	r12, -38(r4)
	mov.w	-28(r4), r14
	mov.w	r12, r15
	call	#__udivhi3
	mov.w	r15, -24(r4)
	jmp	.LBB7_7
.LBB7_7:                                ; %if.end.20
	call	#__mementos_checkpoint
	mov.w	#18, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_9
	jmp	.LBB7_8
.LBB7_8:                                ; %if.then.23
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_9
.LBB7_9:                                ; %if.end.24
	mov.w	-18(r4), r12
	mov.w	-20(r4), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	-22(r4), r14
	add.w	r14, r13
	addc.w	#0, r12
	mov.w	r12, -30(r4)
	mov.w	r13, -32(r4)
	mov.w	-24(r4), r12
	add.w	#1, r12
	mov.w	r12, -24(r4)
	jmp	.LBB7_10
.LBB7_10:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	call	#__mementos_checkpoint
	mov.w	#19, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_12
	jmp	.LBB7_11
.LBB7_11:                               ; %if.then.36
                                        ;   in Loop: Header=BB7_10 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_12
.LBB7_12:                               ; %if.end.37
                                        ;   in Loop: Header=BB7_10 Depth=1
	mov.w	-24(r4), r12
	add.w	#-1, r12
	mov.w	r12, -24(r4)
	mov.w	-26(r4), r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -34(r4)
	mov.w	r14, -36(r4)
	jmp	.LBB7_13
.LBB7_13:                               ; %do.cond
                                        ;   in Loop: Header=BB7_10 Depth=1
	mov.w	-36(r4), r12
	mov.w	-34(r4), r13
	mov.w	-32(r4), r14
	mov.w	-30(r4), r15
	cmp.w	r13, r15
	mov.w	r2, r11
	mov.w	#1, r10
	mov.w	r10, r9
	bic.w	r11, r9
	cmp.w	r12, r14
	mov.w	r2, r12
	bic.w	r12, r10
	cmp.w	r15, r13
	mov.w	r9, -48(r4)             ; 2-byte Folded Spill
	mov.w	r10, -50(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_15
; BB#14:                                ; %do.cond
                                        ;   in Loop: Header=BB7_10 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
.LBB7_15:                               ; %do.cond
                                        ;   in Loop: Header=BB7_10 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB7_10
	jmp	.LBB7_16
.LBB7_16:                               ; %do.end
	mov.w	-24(r4), r12
	mov.w	-10(r4), r13
	mov.w	r12, 0(r13)
	call	#__mementos_checkpoint
	mov.w	#32, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_18
	jmp	.LBB7_17
.LBB7_17:                               ; %if.then.43
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_18
.LBB7_18:                               ; %if.end.44
	add.w	#44, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end7:
	.size	reduce_quotient, .Lfunc_end7-reduce_quotient

	.globl	reduce_multiply
	.align	2
	.type	reduce_multiply,@function
reduce_multiply:                        ; @reduce_multiply
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#26, r1
	;DEBUG_VALUE: reduce_multiply:product <- undef
	;DEBUG_VALUE: reduce_multiply:q <- undef
	;DEBUG_VALUE: reduce_multiply:n <- undef
	;DEBUG_VALUE: reduce_multiply:d <- undef
	mov.w	r12, r11
	mov.w	r13, r10
	mov.w	r14, r9
	mov.w	r15, r8
	mov.w	r15, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	r13, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	r11, -28(r4)            ; 2-byte Folded Spill
	mov.w	r10, -30(r4)            ; 2-byte Folded Spill
	mov.w	r9, -32(r4)             ; 2-byte Folded Spill
	mov.w	r8, -34(r4)             ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_2
.LBB8_2:                                ; %if.end
	mov.w	-16(r4), r12
	add.w	#-8, r12
	mov.w	r12, -20(r4)
	mov.w	#0, -18(r4)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	mov.w	-20(r4), r13
	cmp.w	r13, r12
	jhs	.LBB8_6
	jmp	.LBB8_4
.LBB8_4:                                ; %for.body
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-10(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	#0, 0(r13)
	jmp	.LBB8_5
.LBB8_5:                                ; %for.inc
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_3
.LBB8_6:                                ; %for.end
	mov.w	#0, -22(r4)
	mov.w	-20(r4), r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_7
.LBB8_7:                                ; %for.cond.1
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	cmp.w	#16, r12
	jge	.LBB8_15
	jmp	.LBB8_8
.LBB8_8:                                ; %for.body.3
                                        ;   in Loop: Header=BB8_7 Depth=1
	call	#__mementos_checkpoint
	mov.w	#24, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_10
	jmp	.LBB8_9
.LBB8_9:                                ; %if.then.6
                                        ;   in Loop: Header=BB8_7 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_10
.LBB8_10:                               ; %if.end.7
                                        ;   in Loop: Header=BB8_7 Depth=1
	mov.w	-22(r4), r12
	mov.w	r12, -24(r4)
	mov.w	-18(r4), r12
	mov.w	-20(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB8_12
	jmp	.LBB8_11
.LBB8_11:                               ; %if.then.9
                                        ;   in Loop: Header=BB8_7 Depth=1
	mov.w	-18(r4), r12
	mov.w	-20(r4), r13
	sub.w	r13, r12
	mov.w	-14(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -26(r4)
	mov.w	-12(r4), r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-24(r4), r12
	add.w	r15, r12
	mov.w	r12, -24(r4)
	jmp	.LBB8_13
.LBB8_12:                               ; %if.else
                                        ;   in Loop: Header=BB8_7 Depth=1
	mov.w	#0, -26(r4)
	jmp	.LBB8_13
.LBB8_13:                               ; %if.end.13
                                        ;   in Loop: Header=BB8_7 Depth=1
	mov.b	-23(r4), r12
	mov.w	r12, -22(r4)
	mov.b	-24(r4), r12
	mov.w	r12, -24(r4)
	mov.w	-18(r4), r13
	mov.w	-10(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB8_14
.LBB8_14:                               ; %for.inc.15
                                        ;   in Loop: Header=BB8_7 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_7
.LBB8_15:                               ; %for.end.17
	call	#__mementos_checkpoint
	mov.w	#33, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_17
	jmp	.LBB8_16
.LBB8_16:                               ; %if.then.20
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_17
.LBB8_17:                               ; %if.end.21
	add.w	#26, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end8:
	.size	reduce_multiply, .Lfunc_end8-reduce_multiply

	.globl	reduce_compare
	.align	2
	.type	reduce_compare,@function
reduce_compare:                         ; @reduce_compare
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: reduce_compare:a <- undef
	;DEBUG_VALUE: reduce_compare:b <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -8(r4)
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_2
.LBB9_2:                                ; %if.end
	mov.w	#15, -6(r4)
	jmp	.LBB9_3
.LBB9_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	jl	.LBB9_11
	jmp	.LBB9_4
.LBB9_4:                                ; %for.body
                                        ;   in Loop: Header=BB9_3 Depth=1
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r12, r13
	jhs	.LBB9_6
	jmp	.LBB9_5
.LBB9_5:                                ; %if.then.2
	mov.w	#1, -8(r4)
	jmp	.LBB9_11
.LBB9_6:                                ; %if.else
                                        ;   in Loop: Header=BB9_3 Depth=1
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %if.then.4
	mov.w	#-1, -8(r4)
	jmp	.LBB9_11
.LBB9_8:                                ; %if.end.5
                                        ;   in Loop: Header=BB9_3 Depth=1
	jmp	.LBB9_9
.LBB9_9:                                ; %if.end.6
                                        ;   in Loop: Header=BB9_3 Depth=1
	jmp	.LBB9_10
.LBB9_10:                               ; %for.inc
                                        ;   in Loop: Header=BB9_3 Depth=1
	mov.w	-6(r4), r12
	add.w	#-1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB9_3
.LBB9_11:                               ; %for.end
	call	#__mementos_checkpoint
	mov.w	#31, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_13
	jmp	.LBB9_12
.LBB9_12:                               ; %if.then.9
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_13
.LBB9_13:                               ; %if.end.10
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	reduce_compare, .Lfunc_end9-reduce_compare

	.globl	reduce_add
	.align	2
	.type	reduce_add,@function
reduce_add:                             ; @reduce_add
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#28, r1
	;DEBUG_VALUE: reduce_add:a <- undef
	;DEBUG_VALUE: reduce_add:b <- undef
	;DEBUG_VALUE: reduce_add:d <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	mov.w	r11, -30(r4)            ; 2-byte Folded Spill
	mov.w	r10, -32(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#10, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB10_2
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB10_2
.LBB10_2:                               ; %if.end
	mov.w	-10(r4), r12
	add.w	#-8, r12
	mov.w	r12, -16(r4)
	mov.w	#0, -18(r4)
	mov.w	-16(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB10_3
.LBB10_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#16, r12
	jge	.LBB10_11
	jmp	.LBB10_4
.LBB10_4:                               ; %for.body
                                        ;   in Loop: Header=BB10_3 Depth=1
	;DEBUG_VALUE: DINO_MANUAL_VERSION_a_i <- [FP+-22]
	mov.w	-12(r4), r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -26(r4)
	call	#__mementos_checkpoint
	mov.w	#22, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB10_6
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then.3
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-26(r4), r12
	mov.w	-12(r4), r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	call	#__dino_unset_recovery_bit
	jmp	.LBB10_6
.LBB10_6:                               ; %if.end.5
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-12(r4), r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -22(r4)
	mov.w	-12(r4), r12
	mov.w	-16(r4), r13
	sub.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	-12(r4), r12
	mov.w	-16(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB10_8
	jmp	.LBB10_7
.LBB10_7:                               ; %if.then.9
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -24(r4)
	jmp	.LBB10_9
.LBB10_8:                               ; %if.else
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	#0, -24(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB10_9
.LBB10_9:                               ; %if.end.11
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-22(r4), r13
	add.w	r13, r12
	mov.w	-24(r4), r13
	add.w	r13, r12
	mov.w	r12, -20(r4)
	mov.b	-19(r4), r12
	mov.w	r12, -18(r4)
	mov.b	-20(r4), r12
	mov.w	r12, -20(r4)
	mov.w	-12(r4), r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB10_10
.LBB10_10:                              ; %for.inc
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB10_3
.LBB10_11:                              ; %for.end
	call	#__mementos_checkpoint
	mov.w	#34, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB10_13
	jmp	.LBB10_12
.LBB10_12:                              ; %if.then.17
	call	#__dino_unset_recovery_bit
	jmp	.LBB10_13
.LBB10_13:                              ; %if.end.18
	add.w	#28, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end10:
	.size	reduce_add, .Lfunc_end10-reduce_add

	.globl	reduce_subtract
	.align	2
	.type	reduce_subtract,@function
reduce_subtract:                        ; @reduce_subtract
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#28, r1
	;DEBUG_VALUE: reduce_subtract:a <- undef
	;DEBUG_VALUE: reduce_subtract:b <- undef
	;DEBUG_VALUE: reduce_subtract:d <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	mov.w	r11, -30(r4)            ; 2-byte Folded Spill
	mov.w	r10, -32(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#11, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB11_2
.LBB11_2:                               ; %if.end
	mov.w	-10(r4), r12
	add.w	#-8, r12
	mov.w	r12, -24(r4)
	mov.w	#0, -22(r4)
	mov.w	-24(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB11_3
.LBB11_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#16, r12
	jge	.LBB11_11
	jmp	.LBB11_4
.LBB11_4:                               ; %for.body
                                        ;   in Loop: Header=BB11_3 Depth=1
	;DEBUG_VALUE: DINO_MANUAL_VERSION_a_i <- [FP+-22]
	mov.w	-12(r4), r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -26(r4)
	call	#__mementos_checkpoint
	mov.w	#23, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB11_6
	jmp	.LBB11_5
.LBB11_5:                               ; %if.then.3
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-26(r4), r12
	mov.w	-12(r4), r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	call	#__dino_unset_recovery_bit
	jmp	.LBB11_6
.LBB11_6:                               ; %if.end.5
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-12(r4), r12
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -14(r4)
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -20(r4)
	mov.w	-22(r4), r13
	add.w	r13, r12
	mov.w	r12, -16(r4)
	mov.w	-14(r4), r13
	cmp.w	r12, r13
	jhs	.LBB11_8
	jmp	.LBB11_7
.LBB11_7:                               ; %if.then.9
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-14(r4), r12
	add.w	#256, r12
	mov.w	r12, -14(r4)
	mov.w	#1, -22(r4)
	jmp	.LBB11_9
.LBB11_8:                               ; %if.else
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	#0, -22(r4)
	jmp	.LBB11_9
.LBB11_9:                               ; %if.end.11
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	sub.w	r13, r12
	mov.w	r12, -18(r4)
	mov.w	-12(r4), r13
	mov.w	-6(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB11_10
.LBB11_10:                              ; %for.inc
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB11_3
.LBB11_11:                              ; %for.end
	call	#__mementos_checkpoint
	mov.w	#35, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB11_13
	jmp	.LBB11_12
.LBB11_12:                              ; %if.then.16
	call	#__dino_unset_recovery_bit
	jmp	.LBB11_13
.LBB11_13:                              ; %if.end.17
	add.w	#28, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end11:
	.size	reduce_subtract, .Lfunc_end11-reduce_subtract

	.globl	reduce
	.align	2
	.type	reduce,@function
reduce:                                 ; @reduce
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	;DEBUG_VALUE: reduce:m <- undef
	;DEBUG_VALUE: reduce:n <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB12_2
.LBB12_2:                               ; %if.end
	mov.w	#16, -10(r4)
	jmp	.LBB12_3
.LBB12_3:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	add.w	#-1, r12
	mov.w	r12, -10(r4)
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -8(r4)
	jmp	.LBB12_4
.LBB12_4:                               ; %do.cond
                                        ;   in Loop: Header=BB12_3 Depth=1
	mov.w	-8(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -15(r4)            ; 1-byte Folded Spill
	jne	.LBB12_6
	jmp	.LBB12_5
.LBB12_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_3 Depth=1
	mov.w	-10(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -15(r4)            ; 1-byte Folded Spill
	jmp	.LBB12_6
.LBB12_6:                               ; %land.end
                                        ;   in Loop: Header=BB12_3 Depth=1
	mov.b	-15(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jne	.LBB12_3
	jmp	.LBB12_7
.LBB12_7:                               ; %do.end
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	-10(r4), r13
	call	#reduce_normalizable
	cmp.b	#0, r15
	jeq	.LBB12_9
	jmp	.LBB12_8
.LBB12_8:                               ; %if.then.3
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	-10(r4), r13
	call	#reduce_normalize
	jmp	.LBB12_12
.LBB12_9:                               ; %if.else
	mov.w	-10(r4), r12
	cmp.w	#7, r12
	jne	.LBB12_11
	jmp	.LBB12_10
.LBB12_10:                              ; %if.then.5
	jmp	.LBB12_19
.LBB12_11:                              ; %if.end.6
	jmp	.LBB12_12
.LBB12_12:                              ; %if.end.7
	jmp	.LBB12_13
.LBB12_13:                              ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	cmp.w	#8, r12
	jlo	.LBB12_17
	jmp	.LBB12_14
.LBB12_14:                              ; %while.body
                                        ;   in Loop: Header=BB12_13 Depth=1
	mov.w	-2(r4), r14
	mov.w	-4(r4), r13
	mov.w	-10(r4), r12
	mov.w	r4, r15
	sub.w	#6, r15
	call	#reduce_quotient
	mov.w	-6(r4), r14
	mov.w	-4(r4), r13
	mov.w	-10(r4), r12
	mov.w	#qxn, r15
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#reduce_multiply
	mov.w	-2(r4), r15
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	call	#reduce_compare
	cmp.w	#0, r15
	jge	.LBB12_16
	jmp	.LBB12_15
.LBB12_15:                              ; %if.then.11
                                        ;   in Loop: Header=BB12_13 Depth=1
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	-10(r4), r13
	call	#reduce_add
	jmp	.LBB12_16
.LBB12_16:                              ; %if.end.12
                                        ;   in Loop: Header=BB12_13 Depth=1
	mov.w	-2(r4), r15
	mov.w	-10(r4), r13
	mov.w	#qxn, r14
	call	#reduce_subtract
	mov.w	-10(r4), r13
	add.w	#-1, r13
	mov.w	r13, -10(r4)
	jmp	.LBB12_13
.LBB12_17:                              ; %while.end
	call	#__mementos_checkpoint
	mov.w	#28, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB12_19
	jmp	.LBB12_18
.LBB12_18:                              ; %if.then.16
	call	#__dino_unset_recovery_bit
	jmp	.LBB12_19
.LBB12_19:                              ; %if.end.17
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	reduce, .Lfunc_end12-reduce

	.globl	mod_mult
	.align	2
	.type	mod_mult,@function
mod_mult:                               ; @mod_mult
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#12, r1
	;DEBUG_VALUE: mod_mult:a <- undef
	;DEBUG_VALUE: mod_mult:b <- undef
	;DEBUG_VALUE: mod_mult:n <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r11, -14(r4)            ; 2-byte Folded Spill
	mov.w	r10, -16(r4)            ; 2-byte Folded Spill
	call	#mult
	mov.w	-6(r4), r15
	mov.w	-10(r4), r14
	call	#reduce
	add.w	#12, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end13:
	.size	mod_mult, .Lfunc_end13-mod_mult

	.globl	mod_exp
	.align	2
	.type	mod_exp,@function
mod_exp:                                ; @mod_exp
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#18, r1
	;DEBUG_VALUE: mod_exp:out_block <- undef
	;DEBUG_VALUE: mod_exp:base <- undef
	;DEBUG_VALUE: mod_exp:e <- undef
	;DEBUG_VALUE: mod_exp:n <- undef
	mov.w	r12, r11
	mov.w	r13, r10
	mov.w	r14, r9
	mov.w	r15, r8
	mov.w	r15, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	r13, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	r11, -20(r4)            ; 2-byte Folded Spill
	mov.w	r10, -22(r4)            ; 2-byte Folded Spill
	mov.w	r9, -24(r4)             ; 2-byte Folded Spill
	mov.w	r8, -26(r4)             ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB14_2
	jmp	.LBB14_1
.LBB14_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB14_2
.LBB14_2:                               ; %if.end
	mov.w	-10(r4), r12
	mov.w	#1, 0(r12)
	mov.w	#1, -18(r4)
	jmp	.LBB14_3
.LBB14_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jge	.LBB14_6
	jmp	.LBB14_4
.LBB14_4:                               ; %for.body
                                        ;   in Loop: Header=BB14_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-10(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	#0, 0(r13)
	jmp	.LBB14_5
.LBB14_5:                               ; %for.inc
                                        ;   in Loop: Header=BB14_3 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB14_3
.LBB14_6:                               ; %for.end
	jmp	.LBB14_7
.LBB14_7:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB14_13
	jmp	.LBB14_8
.LBB14_8:                               ; %while.body
                                        ;   in Loop: Header=BB14_7 Depth=1
	call	#__mementos_checkpoint
	mov.w	#13, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB14_10
	jmp	.LBB14_9
.LBB14_9:                               ; %if.then.5
                                        ;   in Loop: Header=BB14_7 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB14_10
.LBB14_10:                              ; %if.end.6
                                        ;   in Loop: Header=BB14_7 Depth=1
	mov.b	-14(r4), r12
	bit.b	#1, r12
	jeq	.LBB14_12
	jmp	.LBB14_11
.LBB14_11:                              ; %if.then.8
                                        ;   in Loop: Header=BB14_7 Depth=1
	mov.w	-10(r4), r15
	mov.w	-12(r4), r14
	mov.w	-16(r4), r13
	call	#mod_mult
	jmp	.LBB14_12
.LBB14_12:                              ; %if.end.9
                                        ;   in Loop: Header=BB14_7 Depth=1
	mov.w	-12(r4), r12
	mov.w	-16(r4), r13
	mov.w	r12, r15
	mov.w	r12, r14
	call	#mod_mult
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB14_7
.LBB14_13:                              ; %while.end
	call	#__mementos_checkpoint
	mov.w	#26, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB14_15
	jmp	.LBB14_14
.LBB14_14:                              ; %if.then.12
	call	#__dino_unset_recovery_bit
	jmp	.LBB14_15
.LBB14_15:                              ; %if.end.13
	add.w	#18, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end14:
	.size	mod_exp, .Lfunc_end14-mod_exp

	.globl	encrypt
	.align	2
	.type	encrypt,@function
encrypt:                                ; @encrypt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	push.w	r7
	sub.w	#26, r1
	;DEBUG_VALUE: encrypt:cyphertext <- undef
	;DEBUG_VALUE: encrypt:cyphertext_len <- undef
	;DEBUG_VALUE: encrypt:message <- undef
	;DEBUG_VALUE: encrypt:message_length <- undef
	;DEBUG_VALUE: encrypt:k <- undef
	mov.w	4(r4), r11
	mov.w	r12, r10
	mov.w	r13, r9
	mov.w	r14, r8
	mov.w	r15, r7
	mov.w	r15, -12(r4)
	mov.w	r14, -14(r4)
	mov.w	r13, -16(r4)
	mov.w	r12, -18(r4)
	mov.w	r11, -20(r4)
	mov.w	#0, -24(r4)
	mov.w	#0, -26(r4)
	mov.w	r10, -28(r4)            ; 2-byte Folded Spill
	mov.w	r9, -30(r4)             ; 2-byte Folded Spill
	mov.w	r8, -32(r4)             ; 2-byte Folded Spill
	mov.w	r7, -34(r4)             ; 2-byte Folded Spill
	jmp	.LBB15_1
.LBB15_1:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_5 Depth 2
                                        ;     Child Loop BB15_12 Depth 2
                                        ;     Child Loop BB15_16 Depth 2
	mov.w	-24(r4), r12
	mov.w	-18(r4), r13
	cmp.w	r13, r12
	jhs	.LBB15_20
	jmp	.LBB15_2
.LBB15_2:                               ; %while.body
                                        ;   in Loop: Header=BB15_1 Depth=1
	call	#__mementos_checkpoint
	mov.w	#1, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB15_4
	jmp	.LBB15_3
.LBB15_3:                               ; %if.then
                                        ;   in Loop: Header=BB15_1 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB15_4
.LBB15_4:                               ; %if.end
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	#0, -22(r4)
	jmp	.LBB15_5
.LBB15_5:                               ; %for.cond
                                        ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-22(r4), r12
	cmp.w	#7, r12
	jhs	.LBB15_11
	jmp	.LBB15_6
.LBB15_6:                               ; %for.body
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	r13, r12
	mov.w	-18(r4), r13
	cmp.w	r13, r12
	jhs	.LBB15_8
	jmp	.LBB15_7
.LBB15_7:                               ; %cond.true
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	add.w	r13, r12
	mov.w	-16(r4), r13
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	jmp	.LBB15_9
.LBB15_8:                               ; %cond.false
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov.w	#255, r12
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	jmp	.LBB15_9
.LBB15_9:                               ; %cond.end
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	mov.w	-22(r4), r13
	rla.w	r13
	mov.w	r12, in_block(r13)
	jmp	.LBB15_10
.LBB15_10:                              ; %for.inc
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov.w	-22(r4), r12
	add.w	#1, r12
	mov.w	r12, -22(r4)
	jmp	.LBB15_5
.LBB15_11:                              ; %for.end
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	#0, -22(r4)
	jmp	.LBB15_12
.LBB15_12:                              ; %for.cond.5
                                        ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-22(r4), r12
	cmp.w	#0, r12
	jne	.LBB15_15
	jmp	.LBB15_13
.LBB15_13:                              ; %for.body.8
                                        ;   in Loop: Header=BB15_12 Depth=2
	mov.w	-22(r4), r12
	mov.b	PAD_DIGITS(r12), r13
	rla.w	r12
	mov.w	r13, in_block+14(r12)
	jmp	.LBB15_14
.LBB15_14:                              ; %for.inc.13
                                        ;   in Loop: Header=BB15_12 Depth=2
	mov.w	-22(r4), r12
	add.w	#1, r12
	mov.w	r12, -22(r4)
	jmp	.LBB15_12
.LBB15_15:                              ; %for.end.15
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	32(r12), r13
	mov.w	#out_block, r15
	mov.w	#in_block, r14
	call	#mod_exp
	mov.w	#0, -22(r4)
	jmp	.LBB15_16
.LBB15_16:                              ; %for.cond.16
                                        ;   Parent Loop BB15_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-22(r4), r12
	cmp.w	#8, r12
	jge	.LBB15_19
	jmp	.LBB15_17
.LBB15_17:                              ; %for.body.19
                                        ;   in Loop: Header=BB15_16 Depth=2
	mov.w	-22(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.b	out_block(r13), r14
	mov.w	-26(r4), r13
	add.w	r12, r13
	mov.w	-12(r4), r12
	add.w	r13, r12
	mov.b	r14, 0(r12)
	jmp	.LBB15_18
.LBB15_18:                              ; %for.inc.24
                                        ;   in Loop: Header=BB15_16 Depth=2
	mov.w	-22(r4), r12
	add.w	#1, r12
	mov.w	r12, -22(r4)
	jmp	.LBB15_16
.LBB15_19:                              ; %for.end.26
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov.w	-24(r4), r12
	add.w	#7, r12
	mov.w	r12, -24(r4)
	mov.w	-26(r4), r12
	add.w	#8, r12
	mov.w	r12, -26(r4)
	jmp	.LBB15_1
.LBB15_20:                              ; %while.end
	mov.w	-26(r4), r12
	mov.w	-14(r4), r13
	mov.w	r12, 0(r13)
	call	#__mementos_checkpoint
	mov.w	#25, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB15_22
	jmp	.LBB15_21
.LBB15_21:                              ; %if.then.31
	call	#__dino_unset_recovery_bit
	jmp	.LBB15_22
.LBB15_22:                              ; %if.end.32
	add.w	#26, r1
	pop.w	r7
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end15:
	.size	encrypt, .Lfunc_end15-encrypt

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
	mov.w	#.L.str.5, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end16:
	.size	init, .Lfunc_end16-init

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	#0, -2(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -6(r4)
	cmp.w	#-1, r15
	jeq	.LBB17_2
	jmp	.LBB17_1
.LBB17_1:                               ; %if.then
	mov.w	-6(r4), r15
	call	#__mementos_restore
	jmp	.LBB17_2
.LBB17_2:                               ; %if.end
	jmp	.LBB17_3
.LBB17_3:                               ; %do.body
	call	#__mementos_checkpoint
	mov.w	#0, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB17_5
	jmp	.LBB17_4
.LBB17_4:                               ; %if.then.2
	call	#__dino_unset_recovery_bit
	jmp	.LBB17_5
.LBB17_5:                               ; %if.end.3
	mov.w	#11, -4(r4)
	mov.w	r1, r12
	mov.w	#pubkey, 0(r12)
	mov.w	#CYPHERTEXT, r15
	mov.w	#CYPHERTEXT_LEN, r14
	mov.w	#PLAINTEXT, r13
	mov.w	#11, r12
	call	#encrypt
	call	#__mementos_checkpoint
	mov.w	#12, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB17_7
	jmp	.LBB17_6
.LBB17_6:                               ; %if.then.6
	call	#__dino_unset_recovery_bit
	jmp	.LBB17_7
.LBB17_7:                               ; %if.end.7
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.6, 0(r14)
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.7, 0(r12)
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	&CYPHERTEXT_LEN, r14
	mov.w	#CYPHERTEXT, r12
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#print_hex_ascii
	jmp	.LBB17_8
.LBB17_8:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB17_8
.Lfunc_end17:
	.size	main, .Lfunc_end17-main

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
.Lfunc_end18:
	.size	init_hw, .Lfunc_end18-init_hw

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
.Lfunc_end19:
	.size	msp_watchdog_enable, .Lfunc_end19-msp_watchdog_enable

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
.Lfunc_end20:
	.size	msp_watchdog_disable, .Lfunc_end20-msp_watchdog_disable

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
.Lfunc_end21:
	.size	msp_watchdog_kick, .Lfunc_end21-msp_watchdog_kick

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
	jeq	.LBB22_4
	jmp	.LBB22_1
.LBB22_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB22_2
.LBB22_2:                               ; %while.body
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
	jne	.LBB22_2
	jmp	.LBB22_3
.LBB22_3:                               ; %while.end.loopexit
	jmp	.LBB22_4
.LBB22_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end22:
	.size	memcpy, .Lfunc_end22-memcpy

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
.Lfunc_end23:
	.size	my_memset, .Lfunc_end23-my_memset

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
.Lfunc_end24:
	.size	msp_clock_setup, .Lfunc_end24-msp_clock_setup

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
.Lfunc_end25:
	.size	mult16, .Lfunc_end25-mult16

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
	jmp	.LBB26_1
.LBB26_1:                               ; %while.cond
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
	jeq	.LBB26_3
	jmp	.LBB26_2
.LBB26_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB26_3
.LBB26_3:                               ; %land.end
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB26_10
	jmp	.LBB26_4
.LBB26_4:                               ; %while.body
                                        ;   in Loop: Header=BB26_1 Depth=1
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
	jeq	.LBB26_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB26_6:                               ; %while.body
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB26_8
	jmp	.LBB26_7
.LBB26_7:                               ; %if.then
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB26_9
.LBB26_8:                               ; %if.else
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB26_9
.LBB26_9:                               ; %if.end
                                        ;   in Loop: Header=BB26_1 Depth=1
	jmp	.LBB26_1
.LBB26_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end26:
	.size	sqrt16, .Lfunc_end26-sqrt16

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
	jmp	.LBB27_1
.LBB27_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB27_4
	jmp	.LBB27_2
.LBB27_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB27_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB27_4
	jmp	.LBB27_3
.LBB27_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB27_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB27_4
.LBB27_4:                               ; %land.end
                                        ;   in Loop: Header=BB27_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB27_6
	jmp	.LBB27_5
.LBB27_5:                               ; %while.body
                                        ;   in Loop: Header=BB27_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB27_1
.LBB27_6:                               ; %while.end
	jmp	.LBB27_7
.LBB27_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB27_11
	jmp	.LBB27_8
.LBB27_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB27_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB27_10
	jmp	.LBB27_9
.LBB27_9:                               ; %if.then
                                        ;   in Loop: Header=BB27_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB27_10
.LBB27_10:                              ; %if.end
                                        ;   in Loop: Header=BB27_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB27_7
.LBB27_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB27_13
	jmp	.LBB27_12
.LBB27_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB27_14
.LBB27_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB27_14
.LBB27_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end27:
	.size	udivmodhi4, .Lfunc_end27-udivmodhi4

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
	jge	.LBB28_2
	jmp	.LBB28_1
.LBB28_1:                               ; %if.then
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
	jmp	.LBB28_2
.LBB28_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB28_4
	jmp	.LBB28_3
.LBB28_3:                               ; %if.then.2
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
	jmp	.LBB28_4
.LBB28_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB28_6
	jmp	.LBB28_5
.LBB28_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB28_6
.LBB28_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__divhi3, .Lfunc_end28-__divhi3

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
	jge	.LBB29_2
	jmp	.LBB29_1
.LBB29_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB29_2
.LBB29_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB29_4
	jmp	.LBB29_3
.LBB29_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB29_4
.LBB29_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB29_6
	jmp	.LBB29_5
.LBB29_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB29_6
.LBB29_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	__modhi3, .Lfunc_end29-__modhi3

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
.Lfunc_end30:
	.size	__udivhi3, .Lfunc_end30-__udivhi3

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
.Lfunc_end31:
	.size	__umodhi3, .Lfunc_end31-__umodhi3

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
.Lfunc_end32:
	.size	__dino_task_boundary, .Lfunc_end32-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB33_2
	jmp	.LBB33_1
.LBB33_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB33_2
.LBB33_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end33:
	.size	__dino_empty_versioning, .Lfunc_end33-__dino_empty_versioning

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
.Lfunc_end34:
	.size	__dino_unset_recovery_bit, .Lfunc_end34-__dino_unset_recovery_bit

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
.Lfunc_end35:
	.size	__dino_recovery_bit_set, .Lfunc_end35-__dino_recovery_bit_set

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
	jne	.LBB36_2
	jmp	.LBB36_1
.LBB36_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB36_5
.LBB36_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB36_4
	jmp	.LBB36_3
.LBB36_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB36_5
.LBB36_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB36_5
.LBB36_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end36:
	.size	__dino_find_next_recovery, .Lfunc_end36-__dino_find_next_recovery

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
	jne	.LBB37_2
	jmp	.LBB37_1
.LBB37_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB37_5
.LBB37_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB37_4
	jmp	.LBB37_3
.LBB37_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB37_5
.LBB37_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB37_5
.LBB37_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end37:
	.size	__dino_find_active_recovery, .Lfunc_end37-__dino_find_active_recovery

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
.Lfunc_end38:
	.size	__dino_recovery_get, .Lfunc_end38-__dino_recovery_get

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
.Lfunc_end39:
	.size	__dino_recovery_set, .Lfunc_end39-__dino_recovery_set

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
.Lfunc_end40:
	.size	__dino_set_next_recovery, .Lfunc_end40-__dino_set_next_recovery

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
	jmp	.LBB41_1
.LBB41_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB41_4
	jmp	.LBB41_2
.LBB41_2:                               ; %for.body
                                        ;   in Loop: Header=BB41_1 Depth=1
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
	jmp	.LBB41_3
.LBB41_3:                               ; %for.inc
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB41_1
.LBB41_4:                               ; %for.end
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
.Lfunc_end41:
	.size	__mementos_restore, .Lfunc_end41-__mementos_restore

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
	jmp	.LBB42_1
.LBB42_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB42_2
.LBB42_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end42:
	.size	__mementos_setup_timer, .Lfunc_end42-__mementos_setup_timer

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
.Lfunc_end43:
	.size	TIMER0_A0_ISR, .Lfunc_end43-TIMER0_A0_ISR

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
	jmp	.LBB44_1
.LBB44_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB44_4
	jmp	.LBB44_2
.LBB44_2:                               ; %for.body
                                        ;   in Loop: Header=BB44_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB44_3
.LBB44_3:                               ; %for.inc
                                        ;   in Loop: Header=BB44_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB44_1
.LBB44_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB44_5
.LBB44_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB44_8
	jmp	.LBB44_6
.LBB44_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB44_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB44_7
.LBB44_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB44_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB44_5
.LBB44_8:                               ; %for.end.16
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
.Lfunc_end44:
	.size	__mementos_checkpoint, .Lfunc_end44-__mementos_checkpoint

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
	jeq	.LBB45_2
	jmp	.LBB45_1
.LBB45_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB45_3
	jmp	.LBB45_4
.LBB45_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB45_5
.LBB45_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB45_4
.LBB45_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB45_5
.LBB45_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end45:
	.size	__mementos_locate_next_bundle, .Lfunc_end45-__mementos_locate_next_bundle

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
	jeq	.LBB46_2
	jmp	.LBB46_1
.LBB46_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB46_3
.LBB46_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB46_3
.LBB46_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end46:
	.size	__mementos_find_active_bundle, .Lfunc_end46-__mementos_find_active_bundle

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
	jlo	.LBB47_2
	jmp	.LBB47_1
.LBB47_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB47_2
.LBB47_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end47:
	.size	__mementos_bundle_in_range, .Lfunc_end47-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end48:
	.size	__mementos_atboot_cleanup, .Lfunc_end48-__mementos_atboot_cleanup

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
.Lfunc_end49:
	.size	__mementos_inactive_cleanup, .Lfunc_end49-__mementos_inactive_cleanup

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
.Lfunc_end50:
	.size	__mementos_force_free, .Lfunc_end50-__mementos_force_free

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

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%02x "
	.size	.L.str, 6

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"   "
	.size	.L.str.1, 4

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	" "
	.size	.L.str.2, 2

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"%c"
	.size	.L.str.3, 3

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"\r\n"
	.size	.L.str.4, 3

	.type	curtask,@object         ; @curtask
	.section	.nv_vars,"aw",@progbits
	.align	1
curtask:
	.short	0                       ; 0x0
	.size	curtask, 2

	.type	product,@object         ; @product
	.align	1
product:
	.zero	32
	.size	product, 32

	.type	qxn,@object             ; @qxn
	.align	1
qxn:
	.zero	32
	.size	qxn, 32

	.type	in_block,@object        ; @in_block
	.align	1
in_block:
	.zero	32
	.size	in_block, 32

	.type	PAD_DIGITS,@object      ; @PAD_DIGITS
	.section	.ro_nv_vars,"a",@progbits
PAD_DIGITS:
	.byte	1
	.size	PAD_DIGITS, 1

	.type	out_block,@object       ; @out_block
	.section	.nv_vars,"aw",@progbits
	.align	1
out_block:
	.zero	32
	.size	out_block, 32

	.type	.L.str.5,@object        ; @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	".%u.\r\n"
	.size	.L.str.5, 7

	.type	CYPHERTEXT,@object      ; @CYPHERTEXT
	.section	.nv_vars,"aw",@progbits
CYPHERTEXT:
	.zero	16
	.size	CYPHERTEXT, 16

	.type	CYPHERTEXT_LEN,@object  ; @CYPHERTEXT_LEN
	.align	1
CYPHERTEXT_LEN:
	.short	0                       ; 0x0
	.size	CYPHERTEXT_LEN, 2

	.type	PLAINTEXT,@object       ; @PLAINTEXT
	.section	.ro_nv_vars,"a",@progbits
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	pubkey,@object          ; @pubkey
	.align	1
pubkey:
	.short	21                      ; 0x15
	.short	112                     ; 0x70
	.short	246                     ; 0xf6
	.short	66                      ; 0x42
	.short	14                      ; 0xe
	.short	130                     ; 0x82
	.short	113                     ; 0x71
	.short	166                     ; 0xa6
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	3                       ; 0x3
	.size	pubkey, 34

	.type	.L.str.6,@object        ; @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.6, 26

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"Cyphertext:\r\n"
	.size	.L.str.7, 14

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
