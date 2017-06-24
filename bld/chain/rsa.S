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
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	6(r12), r12
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

	.globl	task_init
	.align	2
	.type	task_init,@function
task_init:                              ; @task_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#11, -6(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.b	pubkey(r12), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_init_ch_modulus, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.1, 0(r13)
	call	#chan_out
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	;DEBUG_VALUE: task_init:zero <- [FP+-8]
	mov.w	#0, -8(r4)
	mov.w	#8, r12
	add.w	#pubkey, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#8, 10(r13)
	mov.w	#_ch_task_init_task_pad, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.2, 0(r13)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_pad, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_pad, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_mult_block_get_result, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_pad, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init

	.globl	task_pad
	.align	2
	.type	task_pad,@function
task_pad:                               ; @task_pad
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#30, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_pad_task_pad, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_pad, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_pad, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r15
	cmp.w	r12, r15
	jlo	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	mov.w	#_task_task_print_cyphertext, r15
	call	#transition_to
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	mov.w	#0, -2(r4)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jne	.LBB3_6
	jmp	.LBB3_4
.LBB3_4:                                ; %for.body
                                        ;   in Loop: Header=BB3_3 Depth=1
	jmp	.LBB3_5
.LBB3_5:                                ; %for.inc
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_3
.LBB3_6:                                ; %for.end
	mov.w	#6, -2(r4)
	jmp	.LBB3_7
.LBB3_7:                                ; %for.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB3_10
	jmp	.LBB3_8
.LBB3_8:                                ; %for.body.5
                                        ;   in Loop: Header=BB3_7 Depth=1
	jmp	.LBB3_9
.LBB3_9:                                ; %for.inc.6
                                        ;   in Loop: Header=BB3_7 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_7
.LBB3_10:                               ; %for.end.7
	;DEBUG_VALUE: task_pad:one <- [FP+-12]
	mov.w	#1, -12(r4)
	;DEBUG_VALUE: task_pad:zero <- [FP+-14]
	mov.w	#0, -14(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB3_11
.LBB3_11:                               ; %for.cond.8
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#7, r12
	jhs	.LBB3_17
	jmp	.LBB3_12
.LBB3_12:                               ; %for.body.10
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB3_14
	jmp	.LBB3_13
.LBB3_13:                               ; %cond.true
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.b	PLAINTEXT(r12), r12
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_15
.LBB3_14:                               ; %cond.false
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	#255, r12
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_15
.LBB3_15:                               ; %cond.end
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -8(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#8, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_pad_ch_base, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.6, 0(r13)
	call	#chan_out
	jmp	.LBB3_16
.LBB3_16:                               ; %for.inc.13
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_11
.LBB3_17:                               ; %for.end.15
	mov.w	#7, -2(r4)
	jmp	.LBB3_18
.LBB3_18:                               ; %for.cond.16
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB3_21
	jmp	.LBB3_19
.LBB3_19:                               ; %for.body.19
                                        ;   in Loop: Header=BB3_18 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#12, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_pad_ch_base, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.6, 0(r13)
	call	#chan_out
	jmp	.LBB3_20
.LBB3_20:                               ; %for.inc.20
                                        ;   in Loop: Header=BB3_18 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_18
.LBB3_21:                               ; %for.end.22
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_pad_task_mult_block, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	mov.w	#1, -2(r4)
	jmp	.LBB3_22
.LBB3_22:                               ; %for.cond.23
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB3_25
	jmp	.LBB3_23
.LBB3_23:                               ; %for.body.26
                                        ;   in Loop: Header=BB3_22 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#14, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_pad_task_mult_block, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.8, 0(r13)
	call	#chan_out
	jmp	.LBB3_24
.LBB3_24:                               ; %for.inc.27
                                        ;   in Loop: Header=BB3_22 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_22
.LBB3_25:                               ; %for.end.29
	mov.w	r1, r12
	mov.w	#8, 8(r12)
	mov.w	#_ch_task_init_task_pad, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#10, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_pad_task_exp, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	-4(r4), r12
	add.w	#7, r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_pad_task_pad, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	#_task_task_exp, r15
	call	#transition_to
	add.w	#30, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_pad, .Lfunc_end3-task_pad

	.globl	task_exp
	.align	2
	.type	task_exp,@function
task_exp:                               ; @task_exp
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_exp_task_exp, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_pad_task_exp, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	and.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, -3(r4)
	mov.w	-2(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_exp_task_exp, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-6(r4), r15             ; 2-byte Folded Reload
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_exp_task_mult_block_get_result, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.b	-3(r4), r12
	bit.w	#1, r12
	jeq	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.w	#_task_task_mult_block, r15
	call	#transition_to
	jmp	.LBB4_3
.LBB4_2:                                ; %if.else
	mov.w	#_task_task_square_base, r15
	call	#transition_to
	jmp	.LBB4_3
.LBB4_3:                                ; %if.end
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_exp, .Lfunc_end4-task_exp

	.globl	task_mult_block
	.align	2
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#0, -2(r4)
	jmp	.LBB5_1
.LBB5_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB5_4
	jmp	.LBB5_2
.LBB5_2:                                ; %for.body
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_square_base_get_result_ch_square_base, 10(r13)
	mov.w	#_ch_mc_task_pad_ch_base, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.6, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.9, 0(r13)
	call	#chan_out
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block, 10(r13)
	mov.w	#_ch_task_pad_task_mult_block, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.8, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#32, r12
	mov.w	r1, r13
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_call_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_out
	jmp	.LBB5_3
.LBB5_3:                                ; %for.inc
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB5_1
.LBB5_4:                                ; %for.end
	;DEBUG_VALUE: task_mult_block:next_task <- [FP+-8]
	mov.w	#_task_task_mult_block_get_result, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_mult_mod, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_mult_block, .Lfunc_end5-task_mult_block

	.globl	task_mult_block_get_result
	.align	2
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	#7, -2(r4)
	jmp	.LBB6_1
.LBB6_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB6_4
	jmp	.LBB6_2
.LBB6_2:                                ; %for.body
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_ret_ch_mult_mod, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.8, 0(r13)
	call	#chan_out
	jmp	.LBB6_3
.LBB6_3:                                ; %for.inc
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB6_1
.LBB6_4:                                ; %for.end
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_exp_task_mult_block_get_result, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	cmp.w	#0, r12
	jeq	.LBB6_6
	jmp	.LBB6_5
.LBB6_5:                                ; %if.then
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block_get_result, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_mult_block_get_result, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#8, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block_get_result, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_square_base, r15
	call	#transition_to
	jmp	.LBB6_14
.LBB6_6:                                ; %if.else
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block_get_result, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_mult_block_get_result, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	add.w	#8, r12
	cmp.w	#17, r12
	jhs	.LBB6_12
	jmp	.LBB6_7
.LBB6_7:                                ; %if.then.6
	mov.w	#0, -2(r4)
	jmp	.LBB6_8
.LBB6_8:                                ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB6_11
	jmp	.LBB6_9
.LBB6_9:                                ; %for.body.9
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_ret_ch_mult_mod, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_mult_block_get_result_task_print_cyphertext, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.13, 0(r13)
	call	#chan_out
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB6_10
.LBB6_10:                               ; %for.inc.11
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB6_8
.LBB6_11:                               ; %for.end.13
	jmp	.LBB6_13
.LBB6_12:                               ; %if.else.14
	mov.w	-8(r4), r12
	add.w	#8, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#16, 4(r13)
	mov.w	#.L.str.14, 0(r13)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB6_13
.LBB6_13:                               ; %if.end
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_mult_block_get_result_task_mult_block_get_result, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_task_mult_block_get_result_task_print_cyphertext, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_pad, r15
	call	#transition_to
	jmp	.LBB6_14
.LBB6_14:                               ; %if.end.17
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_mult_block_get_result, .Lfunc_end6-task_mult_block_get_result

	.globl	task_square_base
	.align	2
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#0, -2(r4)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB7_4
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_square_base_get_result_ch_square_base, 10(r13)
	mov.w	#_ch_mc_task_pad_ch_base, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.6, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.9, 0(r13)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#32, r12
	mov.w	r1, r13
	mov.w	-8(r4), r15             ; 2-byte Folded Reload
	mov.w	r15, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_call_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_out
	jmp	.LBB7_3
.LBB7_3:                                ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB7_1
.LBB7_4:                                ; %for.end
	;DEBUG_VALUE: task_square_base:next_task <- [FP+-6]
	mov.w	#_task_task_square_base_get_result, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_mult_mod, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_square_base, .Lfunc_end7-task_square_base

	.globl	task_square_base_get_result
	.align	2
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	#0, -2(r4)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_ret_ch_mult_mod, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_square_base_get_result_ch_square_base, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.6, 0(r13)
	call	#chan_out
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov.w	#_task_task_exp, r15
	call	#transition_to
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_square_base_get_result, .Lfunc_end8-task_square_base_get_result

	.globl	task_print_cyphertext
	.align	2
	.type	task_print_cyphertext,@function
task_print_cyphertext:                  ; @task_print_cyphertext
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#38, r1
	mov.w	#0, -4(r4)
	mov.w	r1, r12
	mov.w	#64, 8(r12)
	mov.w	#_ch_task_mult_block_get_result_task_print_cyphertext, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	&overflow, r12
	mov.w	&0x03D0, r15
	mov.w	r1, r13
	mov.w	r15, 4(r13)
	mov.w	r12, 2(r13)
	mov.w	#.L.str.15, 0(r13)
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.16, 0(r12)
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB9_6
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_mult_block_get_result_task_print_cyphertext, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.17, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.18, 0(r13)
	call	#printf
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r12, r14
	add.w	r13, r14
	and.w	#-8, r14
	sub.w	r14, r12
	cmp.w	#0, r12
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	jne	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.19, 0(r12)
	call	#printf
	mov.w	#0, -4(r4)
	mov.w	r1, r12
	mov.w	#.L.str.20, 0(r12)
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_4
.LBB9_4:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	jmp	.LBB9_5
.LBB9_5:                                ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB9_1
.LBB9_6:                                ; %for.end
	mov.w	r1, r12
	mov.w	#.L.str.20, 0(r12)
	call	#printf
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_7
.LBB9_7:                                ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB9_7
.Lfunc_end9:
	.size	task_print_cyphertext, .Lfunc_end9-task_print_cyphertext

	.globl	task_mult_mod
	.align	2
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#0, -2(r4)
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_call_ch_mult_mod, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.9, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#32, r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_call_ch_mult_mod, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_mult_mod_task_mult, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.9, 0(r13)
	call	#chan_out
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#32, r12
	mov.w	r1, r13
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_task_mult_mod_task_mult, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_out
	jmp	.LBB10_3
.LBB10_3:                               ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB10_1
.LBB10_4:                               ; %for.end
	;DEBUG_VALUE: task_mult_mod:zero <- [FP+-8]
	mov.w	#0, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_task_mult_mod_task_mult, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#68, 10(r12)
	mov.w	#_ch_task_mult_mod_task_mult, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.22, 0(r12)
	call	#chan_out
	mov.w	#_task_task_mult, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_mult_mod, .Lfunc_end10-task_mult_mod

	.globl	task_mult
	.align	2
	.type	task_mult,@function
task_mult:                              ; @task_mult
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#34, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_mult_task_mult, 10(r12)
	mov.w	#64, 8(r12)
	mov.w	#_ch_task_mult_mod_task_mult, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_mult_task_mult, 10(r12)
	mov.w	#68, 8(r12)
	mov.w	#_ch_task_mult_mod_task_mult, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.22, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	mov.w	r12, -12(r4)
	mov.w	#0, -8(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB11_1
.LBB11_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB11_7
	jmp	.LBB11_2
.LBB11_2:                               ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	cmp.w	#0, r12
	jl	.LBB11_5
	jmp	.LBB11_3
.LBB11_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	cmp.w	#8, r12
	jge	.LBB11_5
	jmp	.LBB11_4
.LBB11_4:                               ; %if.then
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_mult_mod_task_mult, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.23, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#32, r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_mult_mod_task_mult, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	r15, -10(r4)
	mov.b	-9(r4), r12
	mov.w	-8(r4), r13
	add.w	r12, r13
	mov.w	r13, -8(r4)
	mov.b	-10(r4), r12
	mov.w	-12(r4), r13
	add.w	r12, r13
	mov.w	r13, -12(r4)
	jmp	.LBB11_5
.LBB11_5:                               ; %if.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	jmp	.LBB11_6
.LBB11_6:                               ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB11_1
.LBB11_7:                               ; %for.end
	mov.b	-11(r4), r12
	mov.w	-8(r4), r13
	add.w	r12, r13
	mov.w	r13, -8(r4)
	mov.b	-12(r4), r12
	mov.w	r12, -12(r4)
	mov.w	-16(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#12, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.24, 0(r13)
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-16(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.24, 0(r13)
	call	#chan_out
	mov.w	-16(r4), r12
	add.w	#1, r12
	mov.w	r12, -16(r4)
	cmp.w	#16, r12
	jge	.LBB11_9
	jmp	.LBB11_8
.LBB11_8:                               ; %if.then.14
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_mult_task_mult, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.22, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_mult_task_mult, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_out
	mov.w	#_task_task_mult, r15
	call	#transition_to
	jmp	.LBB11_10
.LBB11_9:                               ; %if.else
	;DEBUG_VALUE: next_task <- [FP+-18]
	mov.w	#_task_task_reduce_digits, -18(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#18, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	jmp	.LBB11_10
.LBB11_10:                              ; %if.end.15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_mult, .Lfunc_end11-task_mult

	.globl	task_reduce_digits
	.align	2
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#16, -2(r4)
	jmp	.LBB12_1
.LBB12_1:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.25, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	jmp	.LBB12_2
.LBB12_2:                               ; %do.cond
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -5(r4)             ; 1-byte Folded Spill
	jne	.LBB12_6
	jmp	.LBB12_3
.LBB12_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	#0, r13
	mov.w	#1, r14
	cmp.w	#1, r12
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	jge	.LBB12_5
; BB#4:                                 ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB12_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB12_6
.LBB12_6:                               ; %land.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jne	.LBB12_1
	jmp	.LBB12_7
.LBB12_7:                               ; %do.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jne	.LBB12_9
	jmp	.LBB12_8
.LBB12_8:                               ; %if.then
	mov.w	#_task_task_init, r15
	call	#transition_to
	jmp	.LBB12_9
.LBB12_9:                               ; %if.end
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_reduce_digits_ch_digit, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_out
	mov.w	#_task_task_reduce_normalizable, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_reduce_digits, .Lfunc_end12-task_reduce_digits

	.globl	task_reduce_normalizable
	.align	2
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.b	#1, -11(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_reduce_digits_ch_digit, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	add.w	#-7, r12
	mov.w	r12, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#10, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_reduce_normalizable_task_reduce_normalize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.26, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB13_1
.LBB13_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB13_9
	jmp	.LBB13_2
.LBB13_2:                               ; %for.body
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	-10(r4), r13
	sub.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.27, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB13_4
	jmp	.LBB13_3
.LBB13_3:                               ; %if.then
	jmp	.LBB13_9
.LBB13_4:                               ; %if.else
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB13_6
	jmp	.LBB13_5
.LBB13_5:                               ; %if.then.6
	mov.b	#0, -11(r4)
	jmp	.LBB13_9
.LBB13_6:                               ; %if.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_7
.LBB13_7:                               ; %if.end.7
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_8
.LBB13_8:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB13_1
.LBB13_9:                               ; %for.end
	mov.b	-11(r4), r12
	bit.w	#1, r12
	jne	.LBB13_16
	jmp	.LBB13_10
.LBB13_10:                              ; %land.lhs.true
	mov.w	-8(r4), r12
	cmp.w	#7, r12
	jne	.LBB13_16
	jmp	.LBB13_11
.LBB13_11:                              ; %if.then.9
	mov.w	#0, -2(r4)
	jmp	.LBB13_12
.LBB13_12:                              ; %for.cond.10
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB13_15
	jmp	.LBB13_13
.LBB13_13:                              ; %for.body.12
                                        ;   in Loop: Header=BB13_12 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_ret_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB13_14
.LBB13_14:                              ; %for.inc.14
                                        ;   in Loop: Header=BB13_12 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB13_12
.LBB13_15:                              ; %for.end.15
	;DEBUG_VALUE: next_task <- [FP+-14]
	mov.w	r1, r12
	mov.w	#64, 8(r12)
	mov.w	#_ch_call_ch_mult_mod, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	mov.w	r12, r15
	call	#transition_to
	jmp	.LBB13_16
.LBB13_16:                              ; %if.end.17
	mov.b	-11(r4), r12
	bit.w	#1, r12
	jeq	.LBB13_18
	jmp	.LBB13_17
.LBB13_17:                              ; %if.then.19
	mov.w	#_task_task_reduce_normalize, r15
	call	#transition_to
	jmp	.LBB13_19
.LBB13_18:                              ; %if.else.20
	mov.w	#_task_task_reduce_n_divisor, r15
	call	#transition_to
	jmp	.LBB13_19
.LBB13_19:                              ; %if.end.21
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_reduce_normalizable, .Lfunc_end13-task_reduce_normalizable

	.globl	task_reduce_normalize
	.align	2
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_reduce_normalizable_task_reduce_normalize, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.26, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB14_1
.LBB14_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	cmp.w	r13, r12
	jhs	.LBB14_4
	jmp	.LBB14_2
.LBB14_2:                               ; %for.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB14_3
.LBB14_3:                               ; %for.inc
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_1
.LBB14_4:                               ; %for.end
	mov.w	#0, -12(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB14_5
.LBB14_5:                               ; %for.cond.2
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB14_11
	jmp	.LBB14_6
.LBB14_6:                               ; %for.body.4
                                        ;   in Loop: Header=BB14_5 Depth=1
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	add.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.28, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.1, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	r12, -10(r4)
	mov.w	-4(r4), r13
	cmp.w	r12, r13
	jhs	.LBB14_8
	jmp	.LBB14_7
.LBB14_7:                               ; %if.then
                                        ;   in Loop: Header=BB14_5 Depth=1
	mov.w	-4(r4), r12
	add.w	#256, r12
	mov.w	r12, -4(r4)
	mov.w	#1, -12(r4)
	jmp	.LBB14_9
.LBB14_8:                               ; %if.else
                                        ;   in Loop: Header=BB14_5 Depth=1
	mov.w	#0, -12(r4)
	jmp	.LBB14_9
.LBB14_9:                               ; %if.end
                                        ;   in Loop: Header=BB14_5 Depth=1
	mov.w	-4(r4), r12
	mov.w	-10(r4), r13
	sub.w	r13, r12
	mov.w	r12, -8(r4)
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	add.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.28, 0(r13)
	mov.w	r14, -20(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	add.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	-20(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.28, 0(r13)
	call	#chan_out
	jmp	.LBB14_10
.LBB14_10:                              ; %for.inc.12
                                        ;   in Loop: Header=BB14_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_5
.LBB14_11:                              ; %for.end.14
	mov.w	-14(r4), r12
	add.w	#8, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_12
.LBB14_12:                              ; %for.cond.16
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#16, r12
	jge	.LBB14_15
	jmp	.LBB14_13
.LBB14_13:                              ; %for.body.18
                                        ;   in Loop: Header=BB14_12 Depth=1
	;DEBUG_VALUE: zero <- [FP+-18]
	mov.w	#0, -18(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#18, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB14_14
.LBB14_14:                              ; %for.inc.19
                                        ;   in Loop: Header=BB14_12 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_12
.LBB14_15:                              ; %for.end.21
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB14_17
	jmp	.LBB14_16
.LBB14_16:                              ; %if.then.23
	mov.w	#_task_task_reduce_n_divisor, -16(r4)
	jmp	.LBB14_22
.LBB14_17:                              ; %if.else.24
	mov.w	#0, -2(r4)
	jmp	.LBB14_18
.LBB14_18:                              ; %for.cond.25
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB14_21
	jmp	.LBB14_19
.LBB14_19:                              ; %for.body.27
                                        ;   in Loop: Header=BB14_18 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_ret_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB14_20
.LBB14_20:                              ; %for.inc.29
                                        ;   in Loop: Header=BB14_18 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_18
.LBB14_21:                              ; %for.end.31
	mov.w	r1, r12
	mov.w	#64, 8(r12)
	mov.w	#_ch_call_ch_mult_mod, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	jmp	.LBB14_22
.LBB14_22:                              ; %if.end.33
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end14:
	.size	task_reduce_normalize, .Lfunc_end14-task_reduce_normalize

	.globl	task_reduce_n_divisor
	.align	2
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	mov.w	r1, r12
	mov.w	#28, 8(r12)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.29, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#24, 8(r12)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.30, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	add.w	r12, r15
	mov.w	r15, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_reduce_n_divisor_task_reduce_quotient, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.31, 0(r12)
	call	#chan_out
	mov.w	#_task_task_reduce_quotient, r15
	call	#transition_to
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end15:
	.size	task_reduce_n_divisor, .Lfunc_end15-task_reduce_n_divisor

	.globl	task_reduce_quotient
	.align	2
	.type	task_reduce_quotient,@function
task_reduce_quotient:                   ; @task_reduce_quotient
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	sub.w	#46, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_reduce_quotient_task_reduce_quotient, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_reduce_digits_ch_digit, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r15
	mov.w	r12, 16(r15)
	mov.w	r12, 12(r15)
	mov.w	r12, 8(r15)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 14(r15)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r15)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r15)
	mov.w	#3, 4(r15)
	mov.w	#4, 2(r15)
	mov.w	#.L.str.25, 0(r15)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#-4, r12
	mov.w	r1, r15
	mov.w	r12, 16(r15)
	mov.w	r12, 12(r15)
	mov.w	r12, 8(r15)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 14(r15)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r15)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r15)
	mov.w	#3, 4(r15)
	mov.w	#4, 2(r15)
	mov.w	#.L.str.32, 0(r15)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	add.w	#-8, r12
	mov.w	r1, r15
	mov.w	r12, 16(r15)
	mov.w	r12, 12(r15)
	mov.w	r12, 8(r15)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 14(r15)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r15)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r15)
	mov.w	#3, 4(r15)
	mov.w	#4, 2(r15)
	mov.w	#.L.str.33, 0(r15)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	mov.w	r1, r12
	mov.w	#28, 8(r12)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.29, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	mov.w	-10(r4), r15
	cmp.w	r12, r15
	jne	.LBB16_2
	jmp	.LBB16_1
.LBB16_1:                               ; %if.then
	mov.w	#255, -20(r4)
	jmp	.LBB16_3
.LBB16_2:                               ; %if.else
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	-16(r4), r14
	mov.w	r12, r15
	call	#__udivhi3
	mov.w	r15, -20(r4)
	jmp	.LBB16_3
.LBB16_3:                               ; %if.end
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	-14(r4), r14
	add.w	r14, r13
	addc.w	#0, r12
	mov.w	r12, -26(r4)
	mov.w	r13, -28(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_reduce_n_divisor_task_reduce_quotient, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.31, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -18(r4)
	mov.w	-20(r4), r12
	add.w	#1, r12
	mov.w	r12, -20(r4)
	jmp	.LBB16_4
.LBB16_4:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-20(r4), r12
	add.w	#-1, r12
	mov.w	r12, -20(r4)
	mov.w	-18(r4), r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -22(r4)
	mov.w	r14, -24(r4)
	jmp	.LBB16_5
.LBB16_5:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-28(r4), r14
	mov.w	-26(r4), r15
	cmp.w	r13, r15
	mov.w	r2, r11
	mov.w	#1, r10
	mov.w	r10, r9
	bic.w	r11, r9
	cmp.w	r12, r14
	mov.w	r2, r12
	bic.w	r12, r10
	cmp.w	r15, r13
	mov.w	r9, -30(r4)             ; 2-byte Folded Spill
	mov.w	r10, -32(r4)            ; 2-byte Folded Spill
	jeq	.LBB16_7
; BB#6:                                 ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
.LBB16_7:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB16_4
	jmp	.LBB16_8
.LBB16_8:                               ; %do.end
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#20, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_reduce_quotient_task_reduce_multiply, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.34, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_reduce_quotient_ch_reduce_digit, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	mov.w	r13, -34(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-8(r4), r12
	add.w	#-1, r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	-34(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_reduce_quotient_task_reduce_quotient, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_out
	mov.w	#_task_task_reduce_multiply, r15
	call	#transition_to
	add.w	#46, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end16:
	.size	task_reduce_quotient, .Lfunc_end16-task_reduce_quotient

	.globl	task_reduce_multiply
	.align	2
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_reduce_quotient_ch_reduce_digit, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_reduce_quotient_task_reduce_multiply, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.34, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-12(r4), r12
	add.w	#-8, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB17_1
.LBB17_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	cmp.w	r13, r12
	jhs	.LBB17_4
	jmp	.LBB17_2
.LBB17_2:                               ; %for.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	;DEBUG_VALUE: zero <- [FP+-16]
	mov.w	#0, -16(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#16, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB17_3
.LBB17_3:                               ; %for.inc
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_1
.LBB17_4:                               ; %for.end
	mov.w	#0, -10(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_5
.LBB17_5:                               ; %for.cond.2
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#16, r12
	jge	.LBB17_11
	jmp	.LBB17_6
.LBB17_6:                               ; %for.body.4
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-10(r4), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB17_8
	jmp	.LBB17_7
.LBB17_7:                               ; %if.then
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-2(r4), r12
	mov.w	-14(r4), r13
	sub.w	r13, r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.27, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	-6(r4), r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-4(r4), r12
	add.w	r15, r12
	mov.w	r12, -4(r4)
	jmp	.LBB17_9
.LBB17_8:                               ; %if.else
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	#0, -8(r4)
	jmp	.LBB17_9
.LBB17_9:                               ; %if.end
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.b	-3(r4), r12
	mov.w	r12, -10(r4)
	mov.b	-4(r4), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_reduce_multiply_ch_qn, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB17_10
.LBB17_10:                              ; %for.inc.9
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_5
.LBB17_11:                              ; %for.end.11
	;DEBUG_VALUE: task_reduce_multiply:next_task <- [FP+-18]
	mov.w	#_task_task_reduce_compare, -18(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#18, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end17:
	.size	task_reduce_multiply, .Lfunc_end17-task_reduce_multiply

	.globl	task_reduce_compare
	.align	2
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.b	#61, -7(r4)
	mov.w	#15, -2(r4)
	jmp	.LBB18_1
.LBB18_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB18_9
	jmp	.LBB18_2
.LBB18_2:                               ; %for.body
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 16(r13)
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 14(r13)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#3, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_reduce_multiply_ch_qn, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB18_4
	jmp	.LBB18_3
.LBB18_3:                               ; %if.then
	mov.b	#62, -7(r4)
	jmp	.LBB18_9
.LBB18_4:                               ; %if.else
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB18_6
	jmp	.LBB18_5
.LBB18_5:                               ; %if.then.4
	mov.b	#60, -7(r4)
	jmp	.LBB18_9
.LBB18_6:                               ; %if.end
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_7
.LBB18_7:                               ; %if.end.5
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_8
.LBB18_8:                               ; %for.inc
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB18_1
.LBB18_9:                               ; %for.end
	mov.b	-7(r4), r12
	cmp.b	#60, r12
	jne	.LBB18_11
	jmp	.LBB18_10
.LBB18_10:                              ; %if.then.8
	mov.w	#_task_task_reduce_add, r15
	call	#transition_to
	jmp	.LBB18_12
.LBB18_11:                              ; %if.else.9
	mov.w	#_task_task_reduce_subtract, r15
	call	#transition_to
	jmp	.LBB18_12
.LBB18_12:                              ; %if.end.10
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end18:
	.size	task_reduce_compare, .Lfunc_end18-task_reduce_compare

	.globl	task_reduce_add
	.align	2
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#40, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_reduce_quotient_ch_reduce_digit, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	add.w	#-8, r12
	mov.w	r12, -16(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB19_1
.LBB19_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-16(r4), r13
	cmp.w	r13, r12
	jhs	.LBB19_4
	jmp	.LBB19_2
.LBB19_2:                               ; %for.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	;DEBUG_VALUE: zero <- [FP+-18]
	mov.w	#0, -18(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#18, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB19_3
.LBB19_3:                               ; %for.inc
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB19_1
.LBB19_4:                               ; %for.end
	mov.w	#0, -10(r4)
	mov.w	-16(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB19_5
.LBB19_5:                               ; %for.cond.1
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#16, r12
	jge	.LBB19_11
	jmp	.LBB19_6
.LBB19_6:                               ; %for.body.3
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 16(r13)
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 14(r13)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r13)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r13)
	mov.w	#3, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	mov.w	-16(r4), r13
	sub.w	r13, r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	-16(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB19_8
	jmp	.LBB19_7
.LBB19_7:                               ; %if.then
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_init_ch_modulus, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.35, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	jmp	.LBB19_9
.LBB19_8:                               ; %if.else
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	#0, -8(r4)
	mov.w	#0, -4(r4)
	jmp	.LBB19_9
.LBB19_9:                               ; %if.end
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	add.w	r13, r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	r12, -12(r4)
	mov.b	-11(r4), r12
	mov.w	r12, -10(r4)
	mov.b	-12(r4), r12
	mov.w	r12, -12(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#12, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_reduce_add_task_reduce_subtract, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB19_10
.LBB19_10:                              ; %for.inc.10
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB19_5
.LBB19_11:                              ; %for.end.12
	;DEBUG_VALUE: task_reduce_add:next_task <- [FP+-20]
	mov.w	#_task_task_reduce_subtract, -20(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#20, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#40, r1
	pop.w	r4
	ret
.Lfunc_end19:
	.size	task_reduce_add, .Lfunc_end19-task_reduce_add

	.globl	task_reduce_subtract
	.align	2
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#50, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_reduce_quotient_ch_reduce_digit, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	add.w	#-8, r12
	mov.w	r12, -16(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB20_1
.LBB20_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-16(r4), r13
	cmp.w	r13, r12
	jhs	.LBB20_4
	jmp	.LBB20_2
.LBB20_2:                               ; %for.body
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	#10, r14
	mov.w	r12, r15
	mov.w	r13, -24(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 20(r12)
	mov.w	-24(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 16(r12)
	mov.w	r13, 12(r12)
	mov.w	r13, 8(r12)
	mov.w	#_ch_task_reduce_subtract_task_reduce_subtract, 18(r12)
	mov.w	#_ch_task_reduce_add_task_reduce_subtract, 14(r12)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r12)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: zero <- [FP+-18]
	mov.w	#0, -18(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#18, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB20_3
.LBB20_3:                               ; %for.inc
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB20_1
.LBB20_4:                               ; %for.end
	mov.w	#0, -14(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB20_5
.LBB20_5:                               ; %for.cond.2
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#16, r12
	jge	.LBB20_16
	jmp	.LBB20_6
.LBB20_6:                               ; %for.body.4
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	#10, r14
	mov.w	r12, r15
	mov.w	r13, -26(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 20(r12)
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 16(r12)
	mov.w	r13, 12(r12)
	mov.w	r13, 8(r12)
	mov.w	#_ch_task_reduce_subtract_task_reduce_subtract, 18(r12)
	mov.w	#_ch_task_reduce_add_task_reduce_subtract, 14(r12)
	mov.w	#_ch_mc_task_reduce_normalize_ch_normalized_product, 10(r12)
	mov.w	#_ch_mc_task_mult_ch_product, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	-16(r4), r13
	cmp.w	r13, r12
	jlo	.LBB20_11
	jmp	.LBB20_7
.LBB20_7:                               ; %if.then
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_reduce_multiply_ch_qn, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r13
	add.w	r13, r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r13
	cmp.w	r12, r13
	jhs	.LBB20_9
	jmp	.LBB20_8
.LBB20_8:                               ; %if.then.9
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-4(r4), r12
	add.w	#256, r12
	mov.w	r12, -4(r4)
	mov.w	#1, -14(r4)
	jmp	.LBB20_10
.LBB20_9:                               ; %if.else
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	#0, -14(r4)
	jmp	.LBB20_10
.LBB20_10:                              ; %if.end
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	sub.w	r13, r12
	mov.w	r12, -8(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#8, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-2(r4), r15
	mov.w	#10, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_reduce_subtract_task_reduce_subtract, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	jmp	.LBB20_12
.LBB20_11:                              ; %if.else.12
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -8(r4)
	jmp	.LBB20_12
.LBB20_12:                              ; %if.end.13
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#8, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_call_ch_print_product, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	mov.w	-12(r4), r12
	cmp.w	#8, r12
	jne	.LBB20_14
	jmp	.LBB20_13
.LBB20_13:                              ; %if.then.15
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#8, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_ret_ch_mult_mod, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_out
	jmp	.LBB20_14
.LBB20_14:                              ; %if.end.16
                                        ;   in Loop: Header=BB20_5 Depth=1
	jmp	.LBB20_15
.LBB20_15:                              ; %for.inc.17
                                        ;   in Loop: Header=BB20_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB20_5
.LBB20_16:                              ; %for.end.19
	mov.w	-12(r4), r12
	cmp.w	#9, r12
	jlo	.LBB20_18
	jmp	.LBB20_17
.LBB20_17:                              ; %if.then.21
	;DEBUG_VALUE: next_task <- [FP+-20]
	mov.w	#_task_task_reduce_quotient, -20(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#20, r13
	mov.w	r13, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	jmp	.LBB20_19
.LBB20_18:                              ; %if.else.22
	;DEBUG_VALUE: next_task <- [FP+-22]
	mov.w	r1, r12
	mov.w	#64, 8(r12)
	mov.w	#_ch_call_ch_mult_mod, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -22(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#22, r15
	mov.w	r15, 2(r12)
	mov.w	#64, 10(r12)
	mov.w	#_ch_call_ch_print_product, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	jmp	.LBB20_19
.LBB20_19:                              ; %if.end.25
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#50, r1
	pop.w	r4
	ret
.Lfunc_end20:
	.size	task_reduce_subtract, .Lfunc_end20-task_reduce_subtract

	.globl	task_print_product
	.align	2
	.type	task_print_product,@function
task_print_product:                     ; @task_print_product
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	#15, -4(r4)
	jmp	.LBB21_1
.LBB21_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jl	.LBB21_4
	jmp	.LBB21_2
.LBB21_2:                               ; %for.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_call_ch_print_product, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	jmp	.LBB21_3
.LBB21_3:                               ; %for.inc
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#-1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB21_1
.LBB21_4:                               ; %for.end
	mov.w	r1, r12
	mov.w	#64, 8(r12)
	mov.w	#_ch_call_ch_print_product, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r15
	call	#transition_to
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end21:
	.size	task_print_product, .Lfunc_end21-task_print_product

	.globl	_entry_task
	.align	2
	.type	_entry_task,@function
_entry_task:                            ; @_entry_task
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_init, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end22:
	.size	_entry_task, .Lfunc_end22-_entry_task

	.globl	_init
	.align	2
	.type	_init,@function
_init:                                  ; @_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#init
	pop.w	r4
	ret
.Lfunc_end23:
	.size	_init, .Lfunc_end23-_init

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
.Lfunc_end24:
	.size	init_hw, .Lfunc_end24-init_hw

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
.Lfunc_end25:
	.size	msp_watchdog_enable, .Lfunc_end25-msp_watchdog_enable

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
.Lfunc_end26:
	.size	msp_watchdog_disable, .Lfunc_end26-msp_watchdog_disable

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
.Lfunc_end27:
	.size	msp_watchdog_kick, .Lfunc_end27-msp_watchdog_kick

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
	jeq	.LBB28_4
	jmp	.LBB28_1
.LBB28_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB28_2
.LBB28_2:                               ; %while.body
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
	jne	.LBB28_2
	jmp	.LBB28_3
.LBB28_3:                               ; %while.end.loopexit
	jmp	.LBB28_4
.LBB28_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end28:
	.size	memcpy, .Lfunc_end28-memcpy

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
.Lfunc_end29:
	.size	my_memset, .Lfunc_end29-my_memset

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
.Lfunc_end30:
	.size	msp_clock_setup, .Lfunc_end30-msp_clock_setup

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
.Lfunc_end31:
	.size	mult16, .Lfunc_end31-mult16

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
	jmp	.LBB32_1
.LBB32_1:                               ; %while.cond
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
	jeq	.LBB32_3
	jmp	.LBB32_2
.LBB32_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB32_3
.LBB32_3:                               ; %land.end
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB32_10
	jmp	.LBB32_4
.LBB32_4:                               ; %while.body
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jeq	.LBB32_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB32_6:                               ; %while.body
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB32_8
	jmp	.LBB32_7
.LBB32_7:                               ; %if.then
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB32_9
.LBB32_8:                               ; %if.else
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB32_9
.LBB32_9:                               ; %if.end
                                        ;   in Loop: Header=BB32_1 Depth=1
	jmp	.LBB32_1
.LBB32_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end32:
	.size	sqrt16, .Lfunc_end32-sqrt16

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
	jmp	.LBB33_1
.LBB33_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB33_4
	jmp	.LBB33_2
.LBB33_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB33_4
	jmp	.LBB33_3
.LBB33_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB33_4
.LBB33_4:                               ; %land.end
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB33_6
	jmp	.LBB33_5
.LBB33_5:                               ; %while.body
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB33_1
.LBB33_6:                               ; %while.end
	jmp	.LBB33_7
.LBB33_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB33_11
	jmp	.LBB33_8
.LBB33_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB33_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB33_10
	jmp	.LBB33_9
.LBB33_9:                               ; %if.then
                                        ;   in Loop: Header=BB33_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB33_10
.LBB33_10:                              ; %if.end
                                        ;   in Loop: Header=BB33_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB33_7
.LBB33_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB33_13
	jmp	.LBB33_12
.LBB33_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB33_14
.LBB33_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB33_14
.LBB33_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end33:
	.size	udivmodhi4, .Lfunc_end33-udivmodhi4

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
	jge	.LBB34_2
	jmp	.LBB34_1
.LBB34_1:                               ; %if.then
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
	jmp	.LBB34_2
.LBB34_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB34_4
	jmp	.LBB34_3
.LBB34_3:                               ; %if.then.2
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
	jmp	.LBB34_4
.LBB34_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB34_6
	jmp	.LBB34_5
.LBB34_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB34_6
.LBB34_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end34:
	.size	__divhi3, .Lfunc_end34-__divhi3

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
	jge	.LBB35_2
	jmp	.LBB35_1
.LBB35_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB35_2
.LBB35_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB35_4
	jmp	.LBB35_3
.LBB35_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB35_4
.LBB35_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB35_6
	jmp	.LBB35_5
.LBB35_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB35_6
.LBB35_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end35:
	.size	__modhi3, .Lfunc_end35-__modhi3

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
.Lfunc_end36:
	.size	__udivhi3, .Lfunc_end36-__udivhi3

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
.Lfunc_end37:
	.size	__umodhi3, .Lfunc_end37-__umodhi3

	.globl	task_prologue
	.align	2
	.type	task_prologue,@function
task_prologue:                          ; @task_prologue
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	r12, -2(r4)
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	74(r13), r13
	cmp.w	r13, r12
	jeq	.LBB38_7
	jmp	.LBB38_1
.LBB38_1:                               ; %if.then
	;DEBUG_VALUE: i <- [FP+-4]
	;DEBUG_VALUE: dirty_self_fields <- [FP+-6]
	mov.w	-2(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB38_2
.LBB38_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	72(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#1, r12
	jl	.LBB38_6
	jmp	.LBB38_3
.LBB38_3:                               ; %while.body
                                        ;   in Loop: Header=BB38_2 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-8]
	mov.w	-4(r4), r12
	add.w	#-1, r12
	mov.w	r12, -4(r4)
	mov.w	-6(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -8(r4)
	mov.b	0(r12), r14
	bit.b	#1, r14
	jeq	.LBB38_5
	jmp	.LBB38_4
.LBB38_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB38_2 Depth=1
	mov.w	-8(r4), r12
	;APP
	SWPB 0(r12)

	;NO_APP
	jmp	.LBB38_5
.LBB38_5:                               ; %if.end
                                        ;   in Loop: Header=BB38_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 72(r13)
	jmp	.LBB38_2
.LBB38_6:                               ; %while.end
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 74(r13)
	jmp	.LBB38_7
.LBB38_7:                               ; %if.end.8
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end38:
	.size	task_prologue, .Lfunc_end38-task_prologue

	.globl	transition_to
	.align	2
	.type	transition_to,@function
transition_to:                          ; @transition_to
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: transition_to:next_task <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	&curctx, r15
	mov.w	4(r15), r15
	mov.w	r15, -4(r4)
	mov.w	-2(r4), r13
	mov.w	r13, 0(r15)
	mov.w	&curctx, r13
	mov.w	2(r13), r13
	add.w	#1, r13
	mov.w	-4(r4), r15
	mov.w	r13, 2(r15)
	mov.w	&curctx, r13
	mov.w	-4(r4), r15
	mov.w	r13, 4(r15)
	mov.w	-4(r4), r13
	mov.w	r13, &curctx
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#task_prologue
	mov.w	-2(r4), r12
	mov.w	0(r12), r12
	;APP
	mov #0x2400, r1
br r12

	;NO_APP
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end39:
	.size	transition_to, .Lfunc_end39-transition_to

	.globl	chan_in
	.align	2
	.type	chan_in,@function
chan_in:                                ; @chan_in
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#34, r1
	;DEBUG_VALUE: chan_in:field_name <- undef
	;DEBUG_VALUE: chan_in:var_size <- undef
	;DEBUG_VALUE: chan_in:count <- undef
	mov.w	8(r4), r12
	mov.w	6(r4), r13
	mov.w	4(r4), r14
	mov.w	r14, -2(r4)
	mov.w	r13, -4(r4)
	mov.w	r12, -6(r4)
	mov.w	#0, -12(r4)
	mov.w	#0, -16(r4)
	mov.w	r4, r12
	add.w	#10, r12
	mov.w	r12, -8(r4)
	mov.w	#0, -10(r4)
	jmp	.LBB40_1
.LBB40_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB40_12
	jmp	.LBB40_2
.LBB40_2:                               ; %for.body
                                        ;   in Loop: Header=BB40_1 Depth=1
	;DEBUG_VALUE: chan <- [FP+-18]
	mov.w	-8(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -8(r4)
	mov.w	0(r12), r12
	mov.w	r12, -18(r4)
	;DEBUG_VALUE: field_offset <- [FP+-20]
	mov.w	-8(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -8(r4)
	mov.w	0(r12), r12
	mov.w	r12, -20(r4)
	;DEBUG_VALUE: chan_data <- [FP+-22]
	mov.w	-18(r4), r12
	add.w	#2, r12
	mov.w	r12, -22(r4)
	;DEBUG_VALUE: chan_meta <- [FP+-24]
	mov.w	-18(r4), r12
	mov.w	r12, -24(r4)
	;DEBUG_VALUE: field <- [FP+-26]
	mov.w	-22(r4), r12
	mov.w	-20(r4), r13
	add.w	r13, r12
	mov.w	r12, -26(r4)
	mov.w	-24(r4), r12
	mov.w	0(r12), r12
	cmp.w	#1, r12
	jne	.LBB40_7
	jmp	.LBB40_3
.LBB40_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB40_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-28]
	mov.w	-26(r4), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.b	0(r12), r13
	bit.b	#2, r13
	jeq	.LBB40_5
	jmp	.LBB40_4
.LBB40_4:                               ; %cond.true
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB40_6
.LBB40_5:                               ; %cond.false
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB40_6
.LBB40_6:                               ; %cond.end
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	jmp	.LBB40_8
.LBB40_7:                               ; %sw.default
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB40_8
.LBB40_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB40_10
	jmp	.LBB40_9
.LBB40_9:                               ; %if.then
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB40_10
.LBB40_10:                              ; %if.end
                                        ;   in Loop: Header=BB40_1 Depth=1
	jmp	.LBB40_11
.LBB40_11:                              ; %for.inc
                                        ;   in Loop: Header=BB40_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB40_1
.LBB40_12:                              ; %for.end
	;DEBUG_VALUE: chan_in:value <- [FP+-32]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	r12, r15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end40:
	.size	chan_in, .Lfunc_end40-chan_in

	.globl	chan_out
	.align	2
	.type	chan_out,@function
chan_out:                               ; @chan_out
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#34, r1
	;DEBUG_VALUE: chan_out:field_name <- undef
	;DEBUG_VALUE: chan_out:value <- undef
	;DEBUG_VALUE: chan_out:var_size <- undef
	;DEBUG_VALUE: chan_out:count <- undef
	mov.w	10(r4), r12
	mov.w	8(r4), r13
	mov.w	6(r4), r14
	mov.w	4(r4), r15
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r13, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r4, r12
	add.w	#12, r12
	mov.w	r12, -10(r4)
	mov.w	#0, -12(r4)
	jmp	.LBB41_1
.LBB41_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r13, r12
	jge	.LBB41_10
	jmp	.LBB41_2
.LBB41_2:                               ; %for.body
                                        ;   in Loop: Header=BB41_1 Depth=1
	;DEBUG_VALUE: chan <- [FP+-16]
	mov.w	-10(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -10(r4)
	mov.w	0(r12), r12
	mov.w	r12, -16(r4)
	;DEBUG_VALUE: field_offset <- [FP+-18]
	mov.w	-10(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -10(r4)
	mov.w	0(r12), r12
	mov.w	r12, -18(r4)
	;DEBUG_VALUE: chan_data <- [FP+-20]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -20(r4)
	;DEBUG_VALUE: chan_meta <- [FP+-22]
	mov.w	-16(r4), r12
	mov.w	r12, -22(r4)
	;DEBUG_VALUE: field <- [FP+-24]
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	add.w	r13, r12
	mov.w	r12, -24(r4)
	mov.w	-22(r4), r12
	mov.w	0(r12), r12
	cmp.w	#1, r12
	jne	.LBB41_7
	jmp	.LBB41_3
.LBB41_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB41_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-26]
	mov.w	-24(r4), r12
	mov.w	r12, -26(r4)
	;DEBUG_VALUE: curtask <- [FP+-28]
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.w	-26(r4), r12
	mov.b	1(r12), r13
	bit.b	#2, r13
	jeq	.LBB41_5
	jmp	.LBB41_4
.LBB41_4:                               ; %cond.true
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB41_6
.LBB41_5:                               ; %cond.false
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB41_6
.LBB41_6:                               ; %cond.end
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-24(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	mov.w	-26(r4), r12
	mov.w	0(r12), r13
	and.w	#-257, r13
	mov.w	r13, 0(r12)
	mov.w	-26(r4), r12
	mov.w	0(r12), r13
	bis.w	#1, r13
	mov.w	r13, 0(r12)
	mov.w	-26(r4), r12
	mov.w	-28(r4), r13
	mov.w	72(r13), r14
	mov.w	r14, r15
	add.w	#1, r15
	mov.w	r15, 72(r13)
	mov.w	-28(r4), r13
	rla.w	r14
	add.w	r14, r13
	mov.w	r12, 8(r13)
	jmp	.LBB41_8
.LBB41_7:                               ; %sw.default
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB41_8
.LBB41_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-14(r4), r13
	mov.w	r12, 0(r13)
	;DEBUG_VALUE: var_value <- [FP+-32]
	mov.w	-14(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	-4(r4), r14
	mov.w	-6(r4), r13
	add.w	#-2, r13
	mov.w	r12, r15
	call	#memcpy
	jmp	.LBB41_9
.LBB41_9:                               ; %for.inc
                                        ;   in Loop: Header=BB41_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB41_1
.LBB41_10:                              ; %for.end
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end41:
	.size	chan_out, .Lfunc_end41-chan_out

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	#0, -2(r4)
	call	#_init
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	call	#task_prologue
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	0(r12), r12
	;APP
	br r12

	;NO_APP
	mov.w	#0, r15
	add.w	#2, r1
	pop.w	r4
	ret
.Lfunc_end42:
	.size	main, .Lfunc_end42-main

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

	.type	_task_task_init,@object ; @_task_task_init
	.section	.nv_vars,"aw",@progbits
	.globl	_task_task_init
	.align	1
_task_task_init:
	.short	task_init
	.long	2                       ; 0x2
	.short	1                       ; 0x1
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_init\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init, 108

	.type	_task_task_pad,@object  ; @_task_task_pad
	.globl	_task_task_pad
	.align	1
_task_task_pad:
	.short	task_pad
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_pad\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_pad, 108

	.type	_task_task_exp,@object  ; @_task_task_exp
	.globl	_task_task_exp
	.align	1
_task_task_exp:
	.short	task_exp
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_exp\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_exp, 108

	.type	_task_task_mult_block,@object ; @_task_task_mult_block
	.globl	_task_task_mult_block
	.align	1
_task_task_mult_block:
	.short	task_mult_block
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_mult_block\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult_block, 108

	.type	_task_task_mult_block_get_result,@object ; @_task_task_mult_block_get_result
	.globl	_task_task_mult_block_get_result
	.align	1
_task_task_mult_block_get_result:
	.short	task_mult_block_get_result
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_mult_block_get_result\000\000\000\000\000"
	.size	_task_task_mult_block_get_result, 108

	.type	_task_task_square_base,@object ; @_task_task_square_base
	.globl	_task_task_square_base
	.align	1
_task_task_square_base:
	.short	task_square_base
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_square_base\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_square_base, 108

	.type	_task_task_square_base_get_result,@object ; @_task_task_square_base_get_result
	.globl	_task_task_square_base_get_result
	.align	1
_task_task_square_base_get_result:
	.short	task_square_base_get_result
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_square_base_get_result\000\000\000\000"
	.size	_task_task_square_base_get_result, 108

	.type	_task_task_print_cyphertext,@object ; @_task_task_print_cyphertext
	.globl	_task_task_print_cyphertext
	.align	1
_task_task_print_cyphertext:
	.short	task_print_cyphertext
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_print_cyphertext\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print_cyphertext, 108

	.type	_task_task_mult_mod,@object ; @_task_task_mult_mod
	.globl	_task_task_mult_mod
	.align	1
_task_task_mult_mod:
	.short	task_mult_mod
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_mult_mod\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult_mod, 108

	.type	_task_task_mult,@object ; @_task_task_mult
	.globl	_task_task_mult
	.align	1
_task_task_mult:
	.short	task_mult
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_mult\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult, 108

	.type	_task_task_reduce_digits,@object ; @_task_task_reduce_digits
	.globl	_task_task_reduce_digits
	.align	1
_task_task_reduce_digits:
	.short	task_reduce_digits
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_digits\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_digits, 108

	.type	_task_task_reduce_normalizable,@object ; @_task_task_reduce_normalizable
	.globl	_task_task_reduce_normalizable
	.align	1
_task_task_reduce_normalizable:
	.short	task_reduce_normalizable
	.long	4096                    ; 0x1000
	.short	12                      ; 0xc
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_normalizable\000\000\000\000\000\000\000"
	.size	_task_task_reduce_normalizable, 108

	.type	_task_task_reduce_normalize,@object ; @_task_task_reduce_normalize
	.globl	_task_task_reduce_normalize
	.align	1
_task_task_reduce_normalize:
	.short	task_reduce_normalize
	.long	8192                    ; 0x2000
	.short	13                      ; 0xd
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_normalize\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_normalize, 108

	.type	_task_task_reduce_n_divisor,@object ; @_task_task_reduce_n_divisor
	.globl	_task_task_reduce_n_divisor
	.align	1
_task_task_reduce_n_divisor:
	.short	task_reduce_n_divisor
	.long	16384                   ; 0x4000
	.short	14                      ; 0xe
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_n_divisor\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_n_divisor, 108

	.type	_task_task_reduce_quotient,@object ; @_task_task_reduce_quotient
	.globl	_task_task_reduce_quotient
	.align	1
_task_task_reduce_quotient:
	.short	task_reduce_quotient
	.long	32768                   ; 0x8000
	.short	15                      ; 0xf
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_quotient\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_quotient, 108

	.type	_task_task_reduce_multiply,@object ; @_task_task_reduce_multiply
	.globl	_task_task_reduce_multiply
	.align	1
_task_task_reduce_multiply:
	.short	task_reduce_multiply
	.long	65536                   ; 0x10000
	.short	16                      ; 0x10
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_multiply\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_multiply, 108

	.type	_task_task_reduce_compare,@object ; @_task_task_reduce_compare
	.globl	_task_task_reduce_compare
	.align	1
_task_task_reduce_compare:
	.short	task_reduce_compare
	.long	131072                  ; 0x20000
	.short	17                      ; 0x11
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_compare\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_compare, 108

	.type	_task_task_reduce_add,@object ; @_task_task_reduce_add
	.globl	_task_task_reduce_add
	.align	1
_task_task_reduce_add:
	.short	task_reduce_add
	.long	262144                  ; 0x40000
	.short	18                      ; 0x12
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_add\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_add, 108

	.type	_task_task_reduce_subtract,@object ; @_task_task_reduce_subtract
	.globl	_task_task_reduce_subtract
	.align	1
_task_task_reduce_subtract:
	.short	task_reduce_subtract
	.long	524288                  ; 0x80000
	.short	19                      ; 0x13
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_reduce_subtract\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_subtract, 108

	.type	_task_task_print_product,@object ; @_task_task_print_product
	.globl	_task_task_print_product
	.align	1
_task_task_print_product:
	.short	task_print_product
	.long	1048576                 ; 0x100000
	.short	20                      ; 0x14
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_print_product\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print_product, 108

	.type	_ch_mc_task_init_ch_base,@object ; @_ch_mc_task_init_ch_base
	.globl	_ch_mc_task_init_ch_base
	.align	1
_ch_mc_task_init_ch_base:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_init_ch_base, 66

	.type	_ch_task_init_task_pad,@object ; @_ch_task_init_task_pad
	.globl	_ch_task_init_task_pad
	.align	1
_ch_task_init_task_pad:
	.zero	14
	.size	_ch_task_init_task_pad, 14

	.type	_ch_task_init_task_mult_block_get_result,@object ; @_ch_task_init_task_mult_block_get_result
	.globl	_ch_task_init_task_mult_block_get_result
	.align	1
_ch_task_init_task_mult_block_get_result:
	.zero	6
	.size	_ch_task_init_task_mult_block_get_result, 6

	.type	_ch_task_pad_task_exp,@object ; @_ch_task_pad_task_exp
	.globl	_ch_task_pad_task_exp
	.align	1
_ch_task_pad_task_exp:
	.zero	6
	.size	_ch_task_pad_task_exp, 6

	.type	_ch_task_pad_task_mult_block,@object ; @_ch_task_pad_task_mult_block
	.globl	_ch_task_pad_task_mult_block
	.align	1
_ch_task_pad_task_mult_block:
	.zero	66
	.size	_ch_task_pad_task_mult_block, 66

	.type	_ch_task_pad_task_pad,@object ; @_ch_task_pad_task_pad
	.globl	_ch_task_pad_task_pad
	.align	1
_ch_task_pad_task_pad:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_pad_task_pad, 12

	.type	_ch_mc_task_pad_ch_base,@object ; @_ch_mc_task_pad_ch_base
	.globl	_ch_mc_task_pad_ch_base
	.align	1
_ch_mc_task_pad_ch_base:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_pad_ch_base, 66

	.type	_ch_task_exp_task_exp,@object ; @_ch_task_exp_task_exp
	.globl	_ch_task_exp_task_exp
	.align	1
_ch_task_exp_task_exp:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_exp_task_exp, 12

	.type	_ch_task_exp_task_mult_block_get_result,@object ; @_ch_task_exp_task_mult_block_get_result
	.globl	_ch_task_exp_task_mult_block_get_result
	.align	1
_ch_task_exp_task_mult_block_get_result:
	.zero	6
	.size	_ch_task_exp_task_mult_block_get_result, 6

	.type	_ch_task_mult_block_get_result_task_mult_block,@object ; @_ch_task_mult_block_get_result_task_mult_block
	.globl	_ch_task_mult_block_get_result_task_mult_block
	.align	1
_ch_task_mult_block_get_result_task_mult_block:
	.zero	66
	.size	_ch_task_mult_block_get_result_task_mult_block, 66

	.type	_ch_task_mult_block_get_result_task_mult_block_get_result,@object ; @_ch_task_mult_block_get_result_task_mult_block_get_result
	.globl	_ch_task_mult_block_get_result_task_mult_block_get_result
	.align	1
_ch_task_mult_block_get_result_task_mult_block_get_result:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_mult_block_get_result_task_mult_block_get_result, 12

	.type	_ch_task_mult_block_get_result_task_print_cyphertext,@object ; @_ch_task_mult_block_get_result_task_print_cyphertext
	.globl	_ch_task_mult_block_get_result_task_print_cyphertext
	.align	1
_ch_task_mult_block_get_result_task_print_cyphertext:
	.zero	70
	.size	_ch_task_mult_block_get_result_task_print_cyphertext, 70

	.type	_ch_mc_task_square_base_get_result_ch_square_base,@object ; @_ch_mc_task_square_base_get_result_ch_square_base
	.globl	_ch_mc_task_square_base_get_result_ch_square_base
	.align	1
_ch_mc_task_square_base_get_result_ch_square_base:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_square_base_get_result_ch_square_base, 66

	.type	_ch_call_ch_mult_mod,@object ; @_ch_call_ch_mult_mod
	.globl	_ch_call_ch_mult_mod
	.align	1
_ch_call_ch_mult_mod:
	.short	3                       ; 0x3
	.zero	68
	.size	_ch_call_ch_mult_mod, 70

	.type	_ch_ret_ch_mult_mod,@object ; @_ch_ret_ch_mult_mod
	.globl	_ch_ret_ch_mult_mod
	.align	1
_ch_ret_ch_mult_mod:
	.short	4                       ; 0x4
	.zero	64
	.size	_ch_ret_ch_mult_mod, 66

	.type	_ch_task_mult_mod_task_mult,@object ; @_ch_task_mult_mod_task_mult
	.globl	_ch_task_mult_mod_task_mult
	.align	1
_ch_task_mult_mod_task_mult:
	.zero	74
	.size	_ch_task_mult_mod_task_mult, 74

	.type	_ch_mc_task_init_ch_modulus,@object ; @_ch_mc_task_init_ch_modulus
	.globl	_ch_mc_task_init_ch_modulus
	.align	1
_ch_mc_task_init_ch_modulus:
	.short	2                       ; 0x2
	.zero	32
	.size	_ch_mc_task_init_ch_modulus, 34

	.type	_ch_task_mult_task_mult,@object ; @_ch_task_mult_task_mult
	.globl	_ch_task_mult_task_mult
	.align	1
_ch_task_mult_task_mult:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_mult_task_mult, 22

	.type	_ch_mc_task_mult_ch_mult_product,@object ; @_ch_mc_task_mult_ch_mult_product
	.globl	_ch_mc_task_mult_ch_mult_product
	.align	1
_ch_mc_task_mult_ch_mult_product:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_mult_ch_mult_product, 66

	.type	_ch_mc_task_reduce_digits_ch_digit,@object ; @_ch_mc_task_reduce_digits_ch_digit
	.globl	_ch_mc_task_reduce_digits_ch_digit
	.align	1
_ch_mc_task_reduce_digits_ch_digit:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_reduce_digits_ch_digit, 6

	.type	_ch_task_reduce_normalizable_task_reduce_normalize,@object ; @_ch_task_reduce_normalizable_task_reduce_normalize
	.globl	_ch_task_reduce_normalizable_task_reduce_normalize
	.align	1
_ch_task_reduce_normalizable_task_reduce_normalize:
	.zero	6
	.size	_ch_task_reduce_normalizable_task_reduce_normalize, 6

	.type	_ch_mc_task_mult_ch_product,@object ; @_ch_mc_task_mult_ch_product
	.globl	_ch_mc_task_mult_ch_product
	.align	1
_ch_mc_task_mult_ch_product:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_mult_ch_product, 66

	.type	_ch_mc_task_reduce_normalize_ch_normalized_product,@object ; @_ch_mc_task_reduce_normalize_ch_normalized_product
	.globl	_ch_mc_task_reduce_normalize_ch_normalized_product
	.align	1
_ch_mc_task_reduce_normalize_ch_normalized_product:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_reduce_normalize_ch_normalized_product, 66

	.type	_ch_task_reduce_add_task_reduce_subtract,@object ; @_ch_task_reduce_add_task_reduce_subtract
	.globl	_ch_task_reduce_add_task_reduce_subtract
	.align	1
_ch_task_reduce_add_task_reduce_subtract:
	.zero	66
	.size	_ch_task_reduce_add_task_reduce_subtract, 66

	.type	_ch_mc_task_reduce_subtract_ch_reduce_subtract_product,@object ; @_ch_mc_task_reduce_subtract_ch_reduce_subtract_product
	.globl	_ch_mc_task_reduce_subtract_ch_reduce_subtract_product
	.align	1
_ch_mc_task_reduce_subtract_ch_reduce_subtract_product:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_reduce_subtract_ch_reduce_subtract_product, 66

	.type	_ch_task_reduce_subtract_task_reduce_subtract,@object ; @_ch_task_reduce_subtract_task_reduce_subtract
	.globl	_ch_task_reduce_subtract_task_reduce_subtract
	.align	1
_ch_task_reduce_subtract_task_reduce_subtract:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_reduce_subtract_task_reduce_subtract, 162

	.type	_ch_task_reduce_n_divisor_task_reduce_quotient,@object ; @_ch_task_reduce_n_divisor_task_reduce_quotient
	.globl	_ch_task_reduce_n_divisor_task_reduce_quotient
	.align	1
_ch_task_reduce_n_divisor_task_reduce_quotient:
	.zero	6
	.size	_ch_task_reduce_n_divisor_task_reduce_quotient, 6

	.type	_ch_task_reduce_quotient_task_reduce_quotient,@object ; @_ch_task_reduce_quotient_task_reduce_quotient
	.globl	_ch_task_reduce_quotient_task_reduce_quotient
	.align	1
_ch_task_reduce_quotient_task_reduce_quotient:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_reduce_quotient_task_reduce_quotient, 12

	.type	_ch_mc_task_reduce_quotient_ch_reduce_digit,@object ; @_ch_mc_task_reduce_quotient_ch_reduce_digit
	.globl	_ch_mc_task_reduce_quotient_ch_reduce_digit
	.align	1
_ch_mc_task_reduce_quotient_ch_reduce_digit:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_reduce_quotient_ch_reduce_digit, 6

	.type	_ch_task_reduce_quotient_task_reduce_multiply,@object ; @_ch_task_reduce_quotient_task_reduce_multiply
	.globl	_ch_task_reduce_quotient_task_reduce_multiply
	.align	1
_ch_task_reduce_quotient_task_reduce_multiply:
	.zero	6
	.size	_ch_task_reduce_quotient_task_reduce_multiply, 6

	.type	_ch_mc_task_reduce_multiply_ch_qn,@object ; @_ch_mc_task_reduce_multiply_ch_qn
	.globl	_ch_mc_task_reduce_multiply_ch_qn
	.align	1
_ch_mc_task_reduce_multiply_ch_qn:
	.short	2                       ; 0x2
	.zero	64
	.size	_ch_mc_task_reduce_multiply_ch_qn, 66

	.type	_ch_call_ch_print_product,@object ; @_ch_call_ch_print_product
	.globl	_ch_call_ch_print_product
	.align	1
_ch_call_ch_print_product:
	.short	3                       ; 0x3
	.zero	68
	.size	_ch_call_ch_print_product, 70

	.type	_task__entry_task,@object ; @_task__entry_task
	.globl	_task__entry_task
	.align	1
_task__entry_task:
	.short	_entry_task
	.long	1                       ; 0x1
	.short	0                       ; 0x0
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"_entry_task\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task__entry_task, 108

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	".%u.\r\n"
	.size	.L.str, 7

	.type	pubkey,@object          ; @pubkey
	.section	.ro_nv_vars,"a",@progbits
	.align	1
pubkey:
	.ascii	"\025p\366B\016\202q\246"
	.short	3                       ; 0x3
	.size	pubkey, 10

	.type	.L.str.1,@object        ; @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"NN[i]"
	.size	.L.str.1, 6

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"E"
	.size	.L.str.2, 2

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"message_length"
	.size	.L.str.3, 15

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"block_offset"
	.size	.L.str.4, 13

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"cyphertext_len"
	.size	.L.str.5, 15

	.type	PLAINTEXT,@object       ; @PLAINTEXT
	.section	.ro_nv_vars,"a",@progbits
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	.L.str.6,@object        ; @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"base[i]"
	.size	.L.str.6, 8

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"block[0]"
	.size	.L.str.7, 9

	.type	.L.str.8,@object        ; @.str.8
.L.str.8:
	.asciz	"block[i]"
	.size	.L.str.8, 9

	.type	.L.str.9,@object        ; @.str.9
.L.str.9:
	.asciz	"A[i]"
	.size	.L.str.9, 5

	.type	.L.str.10,@object       ; @.str.10
.L.str.10:
	.asciz	"B[i]"
	.size	.L.str.10, 5

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"next_task"
	.size	.L.str.11, 10

	.type	.L.str.12,@object       ; @.str.12
.L.str.12:
	.asciz	"product[i]"
	.size	.L.str.12, 11

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"cyphertext[cyphertext_len]"
	.size	.L.str.13, 27

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"WARN: block dropped: cyphertext overlow [%u > %u]\r\n"
	.size	.L.str.14, 52

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.15, 26

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"Cyphertext:\r\n"
	.size	.L.str.16, 14

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"cyphertext[i]"
	.size	.L.str.17, 14

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"%02x "
	.size	.L.str.18, 6

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	" "
	.size	.L.str.19, 2

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"\r\n"
	.size	.L.str.20, 3

	.type	.L.str.21,@object       ; @.str.21
.L.str.21:
	.asciz	"digit"
	.size	.L.str.21, 6

	.type	.L.str.22,@object       ; @.str.22
.L.str.22:
	.asciz	"carry"
	.size	.L.str.22, 6

	.type	.L.str.23,@object       ; @.str.23
.L.str.23:
	.asciz	"A[digit - i]"
	.size	.L.str.23, 13

	.type	.L.str.24,@object       ; @.str.24
.L.str.24:
	.asciz	"product[digit]"
	.size	.L.str.24, 15

	.type	.L.str.25,@object       ; @.str.25
.L.str.25:
	.asciz	"product[d]"
	.size	.L.str.25, 11

	.type	.L.str.26,@object       ; @.str.26
.L.str.26:
	.asciz	"offset"
	.size	.L.str.26, 7

	.type	.L.str.27,@object       ; @.str.27
.L.str.27:
	.asciz	"NN[i - offset]"
	.size	.L.str.27, 15

	.type	.L.str.28,@object       ; @.str.28
.L.str.28:
	.asciz	"product[i + offset]"
	.size	.L.str.28, 20

	.type	.L.str.29,@object       ; @.str.29
.L.str.29:
	.asciz	"NN[NUM_DIGITS - 1]"
	.size	.L.str.29, 19

	.type	.L.str.30,@object       ; @.str.30
.L.str.30:
	.asciz	"NN[NUM_DIGITS - 2]"
	.size	.L.str.30, 19

	.type	.L.str.31,@object       ; @.str.31
.L.str.31:
	.asciz	"n_div"
	.size	.L.str.31, 6

	.type	.L.str.32,@object       ; @.str.32
.L.str.32:
	.asciz	"product[d - 1]"
	.size	.L.str.32, 15

	.type	.L.str.33,@object       ; @.str.33
.L.str.33:
	.asciz	"product[d - 2]"
	.size	.L.str.33, 15

	.type	.L.str.34,@object       ; @.str.34
.L.str.34:
	.asciz	"quotient"
	.size	.L.str.34, 9

	.type	.L.str.35,@object       ; @.str.35
.L.str.35:
	.asciz	"NN[j]"
	.size	.L.str.35, 6

	.type	watchdog_bits,@object   ; @watchdog_bits
	.local	watchdog_bits
	.comm	watchdog_bits,1,1
	.type	curtime,@object         ; @curtime
	.section	.nv_vars,"aw",@progbits
	.globl	curtime
	.align	1
curtime:
	.short	0                       ; 0x0
	.size	curtime, 2

	.type	context_1,@object       ; @context_1
	.globl	context_1
	.align	1
context_1:
	.zero	6
	.size	context_1, 6

	.type	context_0,@object       ; @context_0
	.globl	context_0
	.align	1
context_0:
	.short	_task__entry_task
	.short	0                       ; 0x0
	.short	context_1
	.size	context_0, 6

	.type	curctx,@object          ; @curctx
	.globl	curctx
	.align	1
curctx:
	.short	context_0
	.size	curctx, 2

	.type	_numBoots,@object       ; @_numBoots
	.globl	_numBoots
	.align	1
_numBoots:
	.short	0                       ; 0x0
	.size	_numBoots, 2


	.globl	__interrupt_vector_51
__interrupt_vector_51 = TimerB1_ISR
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
