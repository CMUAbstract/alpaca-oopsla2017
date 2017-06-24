	.text
	.file	"ar.a.bc"
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

	.globl	accel_sample
	.align	2
	.type	accel_sample,@function
accel_sample:                           ; @accel_sample
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#12, r1
	;DEBUG_VALUE: accel_sample:seed <- undef
	;DEBUG_VALUE: accel_sample:result <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	-6(r4), r15
	mov.w	#17, r11
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	mov.w	r11, r14
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	#85, r12
	mov.w	r12, r14
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	call	#__umodhi3
	mov.b	r15, r10
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.b	r10, 0(r12)
	mov.w	-6(r4), r15
	mov.w	#289, r14
	call	#__mulhi3hw_noint
	mov.w	-16(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r10
	mov.w	-8(r4), r12
	mov.b	r10, 1(r12)
	mov.w	-6(r4), r15
	mov.w	#4913, r14
	call	#__mulhi3hw_noint
	mov.w	-16(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r10
	mov.w	-8(r4), r12
	mov.b	r10, 2(r12)
	add.w	#12, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end1:
	.size	accel_sample, .Lfunc_end1-accel_sample

	.globl	acquire_window
	.align	2
	.type	acquire_window,@function
acquire_window:                         ; @acquire_window
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: acquire_window:window <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, -8(r4)
	mov.w	&seed, r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB2_2
	jmp	.LBB2_1
.LBB2_1:                                ; %if.then
	mov.w	-10(r4), r12
	mov.w	r12, &seed
	call	#__dino_unset_recovery_bit
	jmp	.LBB2_2
.LBB2_2:                                ; %if.end
	jmp	.LBB2_3
.LBB2_3:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	cmp.w	#3, r12
	jhs	.LBB2_5
	jmp	.LBB2_4
.LBB2_4:                                ; %while.body
                                        ;   in Loop: Header=BB2_3 Depth=1
	mov.w	&seed, r15
	mov.w	r4, r14
	sub.w	#6, r14
	call	#accel_sample
	mov.w	&seed, r14
	add.w	#1, r14
	mov.w	r14, &seed
	mov.w	-8(r4), r14
	mov.w	r14, r15
	add.w	#1, r15
	mov.w	r15, -8(r4)
	mov.w	-2(r4), r15
	rla.w	r14
	rla.w	r14
	add.w	r14, r15
	mov.b	-3(r4), r12
	mov.b	r12, 3(r15)
	mov.b	-4(r4), r12
	mov.b	r12, 2(r15)
	mov.b	-5(r4), r12
	mov.b	r12, 1(r15)
	mov.b	-6(r4), r12
	mov.b	r12, 0(r15)
	jmp	.LBB2_3
.LBB2_5:                                ; %while.end
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	acquire_window, .Lfunc_end2-acquire_window

	.globl	transform
	.align	2
	.type	transform,@function
transform:                              ; @transform
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	;DEBUG_VALUE: transform:window <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB3_1
.LBB3_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#3, r12
	jhs	.LBB3_17
	jmp	.LBB3_2
.LBB3_2:                                ; %for.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	;DEBUG_VALUE: sample <- [FP+-6]
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	r13, -6(r4)
	mov.b	0(r13), r12
	cmp.w	#10, r12
	jl	.LBB3_5
	jmp	.LBB3_3
.LBB3_3:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	1(r12), r12
	cmp.w	#10, r12
	jl	.LBB3_5
	jmp	.LBB3_4
.LBB3_4:                                ; %lor.lhs.false.6
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	2(r12), r12
	cmp.w	#10, r12
	jge	.LBB3_15
	jmp	.LBB3_5
.LBB3_5:                                ; %if.then
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	0(r12), r12
	cmp.w	#11, r12
	jl	.LBB3_7
	jmp	.LBB3_6
.LBB3_6:                                ; %cond.true
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	0(r12), r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_8
.LBB3_7:                                ; %cond.false
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_8
.LBB3_8:                                ; %cond.end
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	mov.b	r13, 0(r12)
	mov.w	-6(r4), r12
	mov.b	1(r12), r12
	cmp.w	#11, r12
	jl	.LBB3_10
	jmp	.LBB3_9
.LBB3_9:                                ; %cond.true.22
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	1(r12), r12
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_11
.LBB3_10:                               ; %cond.false.25
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_11
.LBB3_11:                               ; %cond.end.26
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	mov.b	r13, 1(r12)
	mov.w	-6(r4), r12
	mov.b	2(r12), r12
	cmp.w	#11, r12
	jl	.LBB3_13
	jmp	.LBB3_12
.LBB3_12:                               ; %cond.true.34
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-6(r4), r12
	mov.b	2(r12), r12
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_14
.LBB3_13:                               ; %cond.false.37
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_14
.LBB3_14:                               ; %cond.end.38
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-14(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	mov.b	r13, 2(r12)
	jmp	.LBB3_15
.LBB3_15:                               ; %if.end
                                        ;   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_16
.LBB3_16:                               ; %for.inc
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB3_1
.LBB3_17:                               ; %for.end
	add.w	#14, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	transform, .Lfunc_end3-transform

	.globl	featurize
	.align	2
	.type	featurize,@function
featurize:                              ; @featurize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#38, r1
	;DEBUG_VALUE: featurize:features <- undef
	;DEBUG_VALUE: featurize:aWin <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#6, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	;DEBUG_VALUE: featurize:mean <- [FP+-8]
	;DEBUG_VALUE: featurize:stddev <- [FP+-12]
	mov.b	#0, -6(r4)
	mov.b	#0, -7(r4)
	mov.b	#0, -8(r4)
	mov.b	#0, -10(r4)
	mov.b	#0, -11(r4)
	mov.b	#0, -12(r4)
	;DEBUG_VALUE: featurize:i <- [FP+-14]
	mov.w	#0, -14(r4)
	jmp	.LBB4_3
.LBB4_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#3, r12
	jge	.LBB4_6
	jmp	.LBB4_4
.LBB4_4:                                ; %for.body
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.b	-8(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	1(r13), r12
	mov.b	-7(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -7(r4)
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	2(r13), r12
	mov.b	-6(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -6(r4)
	jmp	.LBB4_5
.LBB4_5:                                ; %for.inc
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB4_3
.LBB4_6:                                ; %for.end
	mov.b	-8(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -8(r4)
	mov.b	-7(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -7(r4)
	mov.b	-6(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -6(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB4_7
.LBB4_7:                                ; %for.cond.33
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#3, r12
	jge	.LBB4_19
	jmp	.LBB4_8
.LBB4_8:                                ; %for.body.36
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.b	-8(r4), r13
	cmp.w	r12, r13
	jge	.LBB4_10
	jmp	.LBB4_9
.LBB4_9:                                ; %cond.true
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	0(r13), r12
	mov.b	-8(r4), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_11
.LBB4_10:                               ; %cond.false
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.b	-8(r4), r12
	mov.w	-14(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	rla.w	r13
	add.w	r13, r14
	mov.b	0(r14), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_11
.LBB4_11:                               ; %cond.end
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.b	-12(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -12(r4)
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	1(r13), r12
	mov.b	-7(r4), r13
	cmp.w	r12, r13
	jge	.LBB4_13
	jmp	.LBB4_12
.LBB4_12:                               ; %cond.true.66
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	1(r13), r12
	mov.b	-7(r4), r13
	sub.w	r13, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_14
.LBB4_13:                               ; %cond.false.73
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.b	-7(r4), r12
	mov.w	-14(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	rla.w	r13
	add.w	r13, r14
	mov.b	1(r14), r13
	sub.w	r13, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_14
.LBB4_14:                               ; %cond.end.80
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	mov.b	-11(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -11(r4)
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	2(r13), r12
	mov.b	-6(r4), r13
	cmp.w	r12, r13
	jge	.LBB4_16
	jmp	.LBB4_15
.LBB4_15:                               ; %cond.true.93
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-14(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.b	2(r13), r12
	mov.b	-6(r4), r13
	sub.w	r13, r12
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_17
.LBB4_16:                               ; %cond.false.100
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.b	-6(r4), r12
	mov.w	-14(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	rla.w	r13
	add.w	r13, r14
	mov.b	2(r14), r13
	sub.w	r13, r12
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_17
.LBB4_17:                               ; %cond.end.107
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.b	-10(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -10(r4)
	jmp	.LBB4_18
.LBB4_18:                               ; %for.inc.113
                                        ;   in Loop: Header=BB4_7 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB4_7
.LBB4_19:                               ; %for.end.115
	mov.b	-12(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -12(r4)
	mov.b	-11(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -11(r4)
	mov.b	-10(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -10(r4)
	;DEBUG_VALUE: featurize:meanmag <- [FP+-16]
	mov.b	-8(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-7(r4), r12
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-6(r4), r14
	mov.w	r14, r15
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -16(r4)
	;DEBUG_VALUE: featurize:stddevmag <- [FP+-18]
	mov.b	-12(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-11(r4), r12
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-10(r4), r14
	mov.w	r14, r15
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -18(r4)
	mov.w	-16(r4), r14
	mov.w	#0, r12
	mov.w	r12, r15
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	call	#sqrt16
	mov.w	-2(r4), r12
	mov.w	r15, 0(r12)
	mov.w	-18(r4), r14
	mov.w	-38(r4), r15            ; 2-byte Folded Reload
	call	#sqrt16
	mov.w	-2(r4), r12
	mov.w	r15, 2(r12)
	add.w	#38, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	featurize, .Lfunc_end4-featurize

	.globl	classify
	.align	2
	.type	classify,@function
classify:                               ; @classify
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#80, r1
	;DEBUG_VALUE: classify:features <- undef
	;DEBUG_VALUE: classify:model <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	mov.w	r13, -38(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	mov.w	#0, -16(r4)
	jmp	.LBB5_3
.LBB5_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-16(r4), r12
	cmp.w	#16, r12
	jl	4
	br	#.LBB5_32
	jmp	.LBB5_4
.LBB5_4:                                ; %for.body
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-16(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	r13, -14(r4)
	;DEBUG_VALUE: stat_mean_err <- [FP+-16]
	mov.w	0(r13), r12
	mov.w	-6(r4), r13
	mov.w	0(r13), r13
	cmp.w	r12, r13
	jhs	.LBB5_6
	jmp	.LBB5_5
.LBB5_5:                                ; %cond.true
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-6(r4), r13
	mov.w	0(r13), r13
	sub.w	r13, r12
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_7
.LBB5_6:                                ; %cond.false
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-6(r4), r12
	mov.w	0(r12), r12
	mov.w	-14(r4), r13
	mov.w	0(r13), r13
	sub.w	r13, r12
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_7
.LBB5_7:                                ; %cond.end
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -20(r4)
	mov.w	#0, -18(r4)
	;DEBUG_VALUE: stat_sd_err <- [FP+-20]
	mov.w	-14(r4), r12
	mov.w	2(r12), r12
	mov.w	-6(r4), r13
	mov.w	2(r13), r13
	cmp.w	r12, r13
	jhs	.LBB5_9
	jmp	.LBB5_8
.LBB5_8:                                ; %cond.true.11
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	2(r12), r12
	mov.w	-6(r4), r13
	mov.w	2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_10
.LBB5_9:                                ; %cond.false.15
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-6(r4), r12
	mov.w	2(r12), r12
	mov.w	-14(r4), r13
	mov.w	2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_10
.LBB5_10:                               ; %cond.end.19
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-42(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -24(r4)
	mov.w	#0, -22(r4)
	mov.w	-16(r4), r12
	mov.w	-8(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	r13, r12
	add.w	#64, r12
	mov.w	r12, -14(r4)
	;DEBUG_VALUE: move_mean_err <- [FP+-24]
	mov.w	64(r13), r12
	mov.w	-6(r4), r13
	mov.w	0(r13), r13
	cmp.w	r12, r13
	jhs	.LBB5_12
	jmp	.LBB5_11
.LBB5_11:                               ; %cond.true.27
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-6(r4), r13
	mov.w	0(r13), r13
	sub.w	r13, r12
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_13
.LBB5_12:                               ; %cond.false.31
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-6(r4), r12
	mov.w	0(r12), r12
	mov.w	-14(r4), r13
	mov.w	0(r13), r13
	sub.w	r13, r12
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_13
.LBB5_13:                               ; %cond.end.35
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -28(r4)
	mov.w	#0, -26(r4)
	;DEBUG_VALUE: move_sd_err <- [FP+-28]
	mov.w	-14(r4), r12
	mov.w	2(r12), r12
	mov.w	-6(r4), r13
	mov.w	2(r13), r13
	cmp.w	r12, r13
	jhs	.LBB5_15
	jmp	.LBB5_14
.LBB5_14:                               ; %cond.true.42
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-14(r4), r12
	mov.w	2(r12), r12
	mov.w	-6(r4), r13
	mov.w	2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_16
.LBB5_15:                               ; %cond.false.46
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-6(r4), r12
	mov.w	2(r12), r12
	mov.w	-14(r4), r13
	mov.w	2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_16
.LBB5_16:                               ; %cond.end.50
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -32(r4)
	mov.w	#0, -30(r4)
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	mov.w	r13, -50(r4)            ; 2-byte Folded Spill
	mov.w	r14, -52(r4)            ; 2-byte Folded Spill
	mov.w	r15, -54(r4)            ; 2-byte Folded Spill
	mov.w	r11, -56(r4)            ; 2-byte Folded Spill
	mov.w	r10, -58(r4)            ; 2-byte Folded Spill
	jge	.LBB5_18
; BB#17:                                ; %cond.end.50
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-56(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -58(r4)            ; 2-byte Folded Spill
.LBB5_18:                               ; %cond.end.50
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-58(r4), r12            ; 2-byte Folded Reload
	mov.w	-48(r4), r13            ; 2-byte Folded Reload
	mov.w	-52(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-50(r4), r14            ; 2-byte Folded Reload
	mov.w	-54(r4), r15            ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
	mov.w	r13, -62(r4)            ; 2-byte Folded Spill
	jeq	.LBB5_20
; BB#19:                                ; %cond.end.50
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-60(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -62(r4)            ; 2-byte Folded Spill
.LBB5_20:                               ; %cond.end.50
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-62(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB5_22
	jmp	.LBB5_21
.LBB5_21:                               ; %if.then.55
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB5_23
.LBB5_22:                               ; %if.else
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB5_23
.LBB5_23:                               ; %if.end.57
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	mov.w	-24(r4), r14
	mov.w	-22(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
	mov.w	r13, -66(r4)            ; 2-byte Folded Spill
	mov.w	r14, -68(r4)            ; 2-byte Folded Spill
	mov.w	r15, -70(r4)            ; 2-byte Folded Spill
	mov.w	r11, -72(r4)            ; 2-byte Folded Spill
	mov.w	r10, -74(r4)            ; 2-byte Folded Spill
	jge	.LBB5_25
; BB#24:                                ; %if.end.57
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-72(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -74(r4)            ; 2-byte Folded Spill
.LBB5_25:                               ; %if.end.57
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-74(r4), r12            ; 2-byte Folded Reload
	mov.w	-64(r4), r13            ; 2-byte Folded Reload
	mov.w	-68(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-66(r4), r14            ; 2-byte Folded Reload
	mov.w	-70(r4), r15            ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -76(r4)            ; 2-byte Folded Spill
	mov.w	r13, -78(r4)            ; 2-byte Folded Spill
	jeq	.LBB5_27
; BB#26:                                ; %if.end.57
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-76(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -78(r4)            ; 2-byte Folded Spill
.LBB5_27:                               ; %if.end.57
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-78(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB5_29
	jmp	.LBB5_28
.LBB5_28:                               ; %if.then.60
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB5_30
.LBB5_29:                               ; %if.else.62
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB5_30
.LBB5_30:                               ; %if.end.64
                                        ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_31
.LBB5_31:                               ; %for.inc
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-16(r4), r12
	add.w	#1, r12
	mov.w	r12, -16(r4)
	br	#.LBB5_3
.LBB5_32:                               ; %for.end
	;DEBUG_VALUE: classify:class <- [FP+-30]
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	mov.w	#0, r14
	mov.w	#1, r15
	cmp.w	r12, r13
	mov.w	r14, -80(r4)            ; 2-byte Folded Spill
	mov.w	r15, -82(r4)            ; 2-byte Folded Spill
	jl	.LBB5_34
; BB#33:                                ; %for.end
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -82(r4)            ; 2-byte Folded Spill
.LBB5_34:                               ; %for.end
	mov.w	-82(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -34(r4)
	mov.w	r12, r15
	add.w	#80, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end5:
	.size	classify, .Lfunc_end5-classify

	.globl	record_stats
	.align	2
	.type	record_stats,@function
record_stats:                           ; @record_stats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	;DEBUG_VALUE: record_stats:stats <- undef
	;DEBUG_VALUE: record_stats:class <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	-2(r4), r14
	mov.w	4(r14), r15
	mov.w	r15, -6(r4)
	mov.w	2(r14), r15
	mov.w	r15, -8(r4)
	mov.w	0(r14), r14
	mov.w	r14, -10(r4)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#8, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	-2(r4), r12
	mov.w	-6(r4), r13
	mov.w	r13, 4(r12)
	mov.w	-8(r4), r13
	mov.w	r13, 2(r12)
	mov.w	-10(r4), r13
	mov.w	r13, 0(r12)
	call	#__dino_unset_recovery_bit
	jmp	.LBB6_2
.LBB6_2:                                ; %if.end
	mov.w	-2(r4), r12
	mov.w	0(r12), r13
	add.w	#1, r13
	mov.w	r13, 0(r12)
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_5
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jne	.LBB6_6
	jmp	.LBB6_4
.LBB6_4:                                ; %sw.bb
	mov.w	-2(r4), r12
	mov.w	2(r12), r13
	add.w	#1, r13
	mov.w	r13, 2(r12)
	jmp	.LBB6_6
.LBB6_5:                                ; %sw.bb.2
	mov.w	-2(r4), r12
	mov.w	4(r12), r13
	add.w	#1, r13
	mov.w	r13, 4(r12)
	jmp	.LBB6_6
.LBB6_6:                                ; %sw.epilog
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	record_stats, .Lfunc_end6-record_stats

	.globl	print_stats
	.align	2
	.type	print_stats,@function
print_stats:                            ; @print_stats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	sub.w	#52, r1
	;DEBUG_VALUE: print_stats:stats <- undef
	mov.w	r15, r12
	mov.w	r15, -8(r4)
	mov.w	4(r15), r13
	mov.w	#100, r14
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	r14, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	mov.w	0(r12), r14
	call	#__udivhi3
	mov.w	r15, -10(r4)
	mov.w	-8(r4), r12
	mov.w	2(r12), r15
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	0(r12), r14
	call	#__udivhi3
	mov.w	r15, -12(r4)
	mov.w	-8(r4), r12
	mov.w	4(r12), r13
	mov.w	2(r12), r12
	add.w	r12, r13
	mov.w	r13, -14(r4)
	mov.w	-8(r4), r12
	mov.w	4(r12), r14
	mov.w	-10(r4), r15
	mov.w	2(r12), r11
	mov.w	-12(r4), r10
	mov.w	0(r12), r12
	mov.b	#0, r9
	cmp.w	r12, r13
	mov.w	r13, -24(r4)            ; 2-byte Folded Spill
	mov.w	r10, -26(r4)            ; 2-byte Folded Spill
	mov.w	r14, -28(r4)            ; 2-byte Folded Spill
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r11, -32(r4)            ; 2-byte Folded Spill
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	mov.b	r9, -35(r4)             ; 1-byte Folded Spill
	jne	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %land.rhs
	mov.w	-14(r4), r12
	cmp.w	#128, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, -35(r4)            ; 1-byte Folded Spill
	jmp	.LBB7_2
.LBB7_2:                                ; %land.end
	mov.b	-35(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	mov.w	#88, r14
	mov.w	#86, r15
	bit.w	#1, r13
	mov.w	r14, -38(r4)            ; 2-byte Folded Spill
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	jne	.LBB7_4
; BB#3:                                 ; %land.end
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
.LBB7_4:                                ; %land.end
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	r1, r13
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 12(r13)
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 10(r13)
	mov.w	-26(r4), r11            ; 2-byte Folded Reload
	mov.w	r11, 8(r13)
	mov.w	-32(r4), r10            ; 2-byte Folded Reload
	mov.w	r10, 6(r13)
	mov.w	-30(r4), r9             ; 2-byte Folded Reload
	mov.w	r9, 4(r13)
	mov.w	-28(r4), r8             ; 2-byte Folded Reload
	mov.w	r8, 2(r13)
	mov.w	r12, 14(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	add.w	#52, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end7:
	.size	print_stats, .Lfunc_end7-print_stats

	.globl	warmup_sensor
	.align	2
	.type	warmup_sensor,@function
warmup_sensor:                          ; @warmup_sensor
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	#0, -2(r4)
	mov.w	&seed, r12
	mov.w	r12, -8(r4)
	call	#__mementos_checkpoint
	mov.w	#3, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov.w	-8(r4), r12
	mov.w	r12, &seed
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_2
.LBB8_2:                                ; %if.end
	jmp	.LBB8_3
.LBB8_3:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -2(r4)
	cmp.w	#3, r12
	jhs	.LBB8_5
	jmp	.LBB8_4
.LBB8_4:                                ; %while.body
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov.w	&seed, r15
	mov.w	r4, r14
	sub.w	#6, r14
	call	#accel_sample
	mov.w	&seed, r14
	add.w	#1, r14
	mov.w	r14, &seed
	jmp	.LBB8_3
.LBB8_5:                                ; %while.end
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	warmup_sensor, .Lfunc_end8-warmup_sensor

	.globl	train
	.align	2
	.type	train,@function
train:                                  ; @train
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	;DEBUG_VALUE: train:classModel <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#warmup_sensor
	mov.w	#0, -20(r4)
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-20(r4), r12
	cmp.w	#16, r12
	jhs	.LBB9_6
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	r4, r12
	sub.w	#14, r12
	mov.w	r12, r15
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	call	#acquire_window
	mov.w	-24(r4), r15            ; 2-byte Folded Reload
	call	#transform
	mov.w	r4, r15
	sub.w	#18, r15
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	call	#featurize
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then
                                        ;   in Loop: Header=BB9_1 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_4
.LBB9_4:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	rla.w	r12
	add.w	r12, r13
	mov.w	-16(r4), r12
	mov.w	r12, 2(r13)
	mov.w	-18(r4), r12
	mov.w	r12, 0(r13)
	jmp	.LBB9_5
.LBB9_5:                                ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	add.w	#1, r12
	mov.w	r12, -20(r4)
	jmp	.LBB9_1
.LBB9_6:                                ; %for.end
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	train, .Lfunc_end9-train

	.globl	recognize
	.align	2
	.type	recognize,@function
recognize:                              ; @recognize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#36, r1
	;DEBUG_VALUE: recognize:model <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, -8(r4)
	mov.w	#0, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	#0, -28(r4)
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-28(r4), r12
	cmp.w	#128, r12
	jhs	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	r4, r12
	sub.w	#20, r12
	mov.w	r12, r15
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#acquire_window
	mov.w	-32(r4), r15            ; 2-byte Folded Reload
	call	#transform
	mov.w	r4, r12
	sub.w	#24, r12
	mov.w	r12, r15
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	call	#featurize
	mov.w	-2(r4), r14
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	call	#classify
	mov.w	r15, -26(r4)
	mov.w	r4, r12
	sub.w	#8, r12
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	-36(r4), r14            ; 2-byte Folded Reload
	call	#record_stats
	jmp	.LBB10_3
.LBB10_3:                               ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	-28(r4), r12
	add.w	#1, r12
	mov.w	r12, -28(r4)
	jmp	.LBB10_1
.LBB10_4:                               ; %for.end
	mov.w	r4, r15
	sub.w	#8, r15
	call	#print_stats
	add.w	#36, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	recognize, .Lfunc_end10-recognize

	.globl	select_mode
	.align	2
	.type	select_mode,@function
select_mode:                            ; @select_mode
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	;DEBUG_VALUE: select_mode:prev_pin_state <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.b	#1, -3(r4)
	mov.w	&count, r15
	mov.w	r15, -6(r4)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov.w	-6(r4), r12
	mov.w	r12, &count
	call	#__dino_unset_recovery_bit
	jmp	.LBB11_2
.LBB11_2:                               ; %if.end
	mov.w	&count, r12
	add.w	#1, r12
	mov.w	r12, &count
	cmp.w	#3, r12
	jlo	.LBB11_4
	jmp	.LBB11_3
.LBB11_3:                               ; %if.then.1
	mov.b	#2, -3(r4)
	jmp	.LBB11_4
.LBB11_4:                               ; %if.end.2
	mov.w	&count, r12
	cmp.w	#5, r12
	jlo	.LBB11_6
	jmp	.LBB11_5
.LBB11_5:                               ; %if.then.4
	mov.b	#0, -3(r4)
	jmp	.LBB11_6
.LBB11_6:                               ; %if.end.5
	mov.w	&count, r12
	cmp.w	#7, r12
	jlo	.LBB11_9
	jmp	.LBB11_7
.LBB11_7:                               ; %if.then.7
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.1, 0(r14)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB11_8
.LBB11_8:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB11_8
.LBB11_9:                               ; %if.end.9
	mov.b	-3(r4), r12
	cmp.b	#2, r12
	jeq	.LBB11_11
	jmp	.LBB11_10
.LBB11_10:                              ; %lor.lhs.false
	mov.b	-3(r4), r12
	cmp.b	#1, r12
	jne	.LBB11_13
	jmp	.LBB11_11
.LBB11_11:                              ; %land.lhs.true
	mov.b	-3(r4), r12
	mov.w	-2(r4), r13
	mov.b	0(r13), r13
	cmp.w	r13, r12
	jne	.LBB11_13
	jmp	.LBB11_12
.LBB11_12:                              ; %if.then.19
	mov.b	#3, -3(r4)
	jmp	.LBB11_14
.LBB11_13:                              ; %if.else
	mov.b	-3(r4), r12
	mov.w	-2(r4), r13
	mov.b	r12, 0(r13)
	jmp	.LBB11_14
.LBB11_14:                              ; %if.end.20
	mov.b	-3(r4), r15
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	select_mode, .Lfunc_end11-select_mode

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
	call	#init_accel
	mov.w	&curtask, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	init, .Lfunc_end12-init

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	mov.w	#0, -2(r4)
	mov.b	#3, -3(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -6(r4)
	cmp.w	#-1, r15
	jeq	.LBB13_2
	jmp	.LBB13_1
.LBB13_1:                               ; %if.then
	mov.w	-6(r4), r15
	call	#__mementos_restore
	jmp	.LBB13_2
.LBB13_2:                               ; %if.end
	jmp	.LBB13_3
.LBB13_3:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB13_5
	jmp	.LBB13_4
.LBB13_4:                               ; %if.then.2
                                        ;   in Loop: Header=BB13_3 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB13_5
.LBB13_5:                               ; %if.end.3
                                        ;   in Loop: Header=BB13_3 Depth=1
	;DEBUG_VALUE: mode <- [FP+-8]
	mov.w	r4, r15
	sub.w	#3, r15
	call	#select_mode
	mov.w	r15, -8(r4)
	mov.w	r15, r12
	cmp.w	#0, r15
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB13_10
	jmp	.LBB13_6
.LBB13_6:                               ; %if.end.3
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jeq	.LBB13_9
	jmp	.LBB13_7
.LBB13_7:                               ; %if.end.3
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	cmp.w	#2, r12
	jne	.LBB13_11
	jmp	.LBB13_8
.LBB13_8:                               ; %sw.bb
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	#main.model, r15
	call	#train
	jmp	.LBB13_12
.LBB13_9:                               ; %sw.bb.5
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	#64, r12
	add.w	#main.model, r12
	mov.w	r12, r15
	call	#train
	jmp	.LBB13_12
.LBB13_10:                              ; %sw.bb.6
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	#main.model, r15
	call	#recognize
	jmp	.LBB13_12
.LBB13_11:                              ; %sw.default
                                        ;   in Loop: Header=BB13_3 Depth=1
	jmp	.LBB13_12
.LBB13_12:                              ; %sw.epilog
                                        ;   in Loop: Header=BB13_3 Depth=1
	jmp	.LBB13_3
.Lfunc_end13:
	.size	main, .Lfunc_end13-main

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
.Lfunc_end14:
	.size	init_hw, .Lfunc_end14-init_hw

	.align	2
	.type	init_accel,@function
init_accel:                             ; @init_accel
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end15:
	.size	init_accel, .Lfunc_end15-init_accel

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
.Lfunc_end16:
	.size	msp_watchdog_enable, .Lfunc_end16-msp_watchdog_enable

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
.Lfunc_end17:
	.size	msp_watchdog_disable, .Lfunc_end17-msp_watchdog_disable

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
.Lfunc_end18:
	.size	msp_watchdog_kick, .Lfunc_end18-msp_watchdog_kick

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
	jeq	.LBB19_4
	jmp	.LBB19_1
.LBB19_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB19_2
.LBB19_2:                               ; %while.body
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
	jne	.LBB19_2
	jmp	.LBB19_3
.LBB19_3:                               ; %while.end.loopexit
	jmp	.LBB19_4
.LBB19_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end19:
	.size	memcpy, .Lfunc_end19-memcpy

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
.Lfunc_end20:
	.size	my_memset, .Lfunc_end20-my_memset

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
.Lfunc_end21:
	.size	msp_clock_setup, .Lfunc_end21-msp_clock_setup

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
.Lfunc_end22:
	.size	mult16, .Lfunc_end22-mult16

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
	jmp	.LBB23_1
.LBB23_1:                               ; %while.cond
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
	jeq	.LBB23_3
	jmp	.LBB23_2
.LBB23_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB23_3
.LBB23_3:                               ; %land.end
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB23_10
	jmp	.LBB23_4
.LBB23_4:                               ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
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
	jeq	.LBB23_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB23_6:                               ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB23_8
	jmp	.LBB23_7
.LBB23_7:                               ; %if.then
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB23_9
.LBB23_8:                               ; %if.else
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB23_9
.LBB23_9:                               ; %if.end
                                        ;   in Loop: Header=BB23_1 Depth=1
	jmp	.LBB23_1
.LBB23_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end23:
	.size	sqrt16, .Lfunc_end23-sqrt16

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
	jmp	.LBB24_1
.LBB24_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB24_4
	jmp	.LBB24_2
.LBB24_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB24_4
	jmp	.LBB24_3
.LBB24_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB24_4
.LBB24_4:                               ; %land.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB24_6
	jmp	.LBB24_5
.LBB24_5:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB24_1
.LBB24_6:                               ; %while.end
	jmp	.LBB24_7
.LBB24_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB24_11
	jmp	.LBB24_8
.LBB24_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB24_10
	jmp	.LBB24_9
.LBB24_9:                               ; %if.then
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB24_10
.LBB24_10:                              ; %if.end
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB24_7
.LBB24_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB24_13
	jmp	.LBB24_12
.LBB24_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB24_14
.LBB24_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB24_14
.LBB24_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end24:
	.size	udivmodhi4, .Lfunc_end24-udivmodhi4

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
	jge	.LBB25_2
	jmp	.LBB25_1
.LBB25_1:                               ; %if.then
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
	jmp	.LBB25_2
.LBB25_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB25_4
	jmp	.LBB25_3
.LBB25_3:                               ; %if.then.2
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
	jmp	.LBB25_4
.LBB25_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB25_6
	jmp	.LBB25_5
.LBB25_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB25_6
.LBB25_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end25:
	.size	__divhi3, .Lfunc_end25-__divhi3

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
	jge	.LBB26_2
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB26_2
.LBB26_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB26_4
	jmp	.LBB26_3
.LBB26_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB26_4
.LBB26_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB26_6
	jmp	.LBB26_5
.LBB26_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB26_6
.LBB26_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__modhi3, .Lfunc_end26-__modhi3

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
.Lfunc_end27:
	.size	__udivhi3, .Lfunc_end27-__udivhi3

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
.Lfunc_end28:
	.size	__umodhi3, .Lfunc_end28-__umodhi3

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
.Lfunc_end29:
	.size	__dino_task_boundary, .Lfunc_end29-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB30_2
	jmp	.LBB30_1
.LBB30_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB30_2
.LBB30_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end30:
	.size	__dino_empty_versioning, .Lfunc_end30-__dino_empty_versioning

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
.Lfunc_end31:
	.size	__dino_unset_recovery_bit, .Lfunc_end31-__dino_unset_recovery_bit

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
.Lfunc_end32:
	.size	__dino_recovery_bit_set, .Lfunc_end32-__dino_recovery_bit_set

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
	jne	.LBB33_2
	jmp	.LBB33_1
.LBB33_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB33_5
.LBB33_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB33_4
	jmp	.LBB33_3
.LBB33_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB33_5
.LBB33_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB33_5
.LBB33_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	__dino_find_next_recovery, .Lfunc_end33-__dino_find_next_recovery

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
	jne	.LBB34_2
	jmp	.LBB34_1
.LBB34_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB34_5
.LBB34_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB34_4
	jmp	.LBB34_3
.LBB34_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB34_5
.LBB34_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB34_5
.LBB34_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end34:
	.size	__dino_find_active_recovery, .Lfunc_end34-__dino_find_active_recovery

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
.Lfunc_end35:
	.size	__dino_recovery_get, .Lfunc_end35-__dino_recovery_get

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
.Lfunc_end36:
	.size	__dino_recovery_set, .Lfunc_end36-__dino_recovery_set

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
.Lfunc_end37:
	.size	__dino_set_next_recovery, .Lfunc_end37-__dino_set_next_recovery

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
	jmp	.LBB38_1
.LBB38_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB38_4
	jmp	.LBB38_2
.LBB38_2:                               ; %for.body
                                        ;   in Loop: Header=BB38_1 Depth=1
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
	jmp	.LBB38_3
.LBB38_3:                               ; %for.inc
                                        ;   in Loop: Header=BB38_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB38_1
.LBB38_4:                               ; %for.end
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
.Lfunc_end38:
	.size	__mementos_restore, .Lfunc_end38-__mementos_restore

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
	jmp	.LBB39_1
.LBB39_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB39_2
.LBB39_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end39:
	.size	__mementos_setup_timer, .Lfunc_end39-__mementos_setup_timer

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
.Lfunc_end40:
	.size	TIMER0_A0_ISR, .Lfunc_end40-TIMER0_A0_ISR

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
	jmp	.LBB41_1
.LBB41_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB41_4
	jmp	.LBB41_2
.LBB41_2:                               ; %for.body
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB41_3
.LBB41_3:                               ; %for.inc
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB41_1
.LBB41_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB41_5
.LBB41_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB41_8
	jmp	.LBB41_6
.LBB41_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB41_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB41_7
.LBB41_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB41_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB41_5
.LBB41_8:                               ; %for.end.16
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
.Lfunc_end41:
	.size	__mementos_checkpoint, .Lfunc_end41-__mementos_checkpoint

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
	jeq	.LBB42_2
	jmp	.LBB42_1
.LBB42_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB42_3
	jmp	.LBB42_4
.LBB42_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB42_5
.LBB42_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB42_4
.LBB42_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB42_5
.LBB42_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end42:
	.size	__mementos_locate_next_bundle, .Lfunc_end42-__mementos_locate_next_bundle

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
	jeq	.LBB43_2
	jmp	.LBB43_1
.LBB43_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB43_3
.LBB43_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB43_3
.LBB43_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end43:
	.size	__mementos_find_active_bundle, .Lfunc_end43-__mementos_find_active_bundle

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
	jlo	.LBB44_2
	jmp	.LBB44_1
.LBB44_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB44_2
.LBB44_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end44:
	.size	__mementos_bundle_in_range, .Lfunc_end44-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end45:
	.size	__mementos_atboot_cleanup, .Lfunc_end45-__mementos_atboot_cleanup

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
.Lfunc_end46:
	.size	__mementos_inactive_cleanup, .Lfunc_end46-__mementos_inactive_cleanup

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
.Lfunc_end47:
	.size	__mementos_force_free, .Lfunc_end47-__mementos_force_free

	.type	count,@object           ; @count
	.section	.nv_vars,"aw",@progbits
	.globl	count
	.align	1
count:
	.short	0                       ; 0x0
	.size	count, 2

	.type	seed,@object            ; @seed
	.globl	seed
	.align	1
seed:
	.short	1                       ; 0x1
	.size	seed, 2

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
	.asciz	"stats: s %u (%u%%) m %u (%u%%) sum/tot %u/%u: %c\r\n"
	.size	.L.str, 51

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.1, 26

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	".%u.\r\n"
	.size	.L.str.2, 7

	.type	main.model,@object      ; @main.model
	.section	.nv_vars,"aw",@progbits
	.align	1
main.model:
	.zero	128
	.size	main.model, 128

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
