	.text
	.file	"templog.a.bc"
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
	sub.w	#4, r1
	mov.w	#11, -4(r4)
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
	mov.b	pubkey(r12), r13
	rla.w	r12
	mov.w	r13, _global_modulus(r12)
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	mov.w	-4(r4), r12
	mov.w	r12, &_global_message_length
	mov.w	#0, &_global_block_offset
	mov.w	#0, &_global_cyphertext_len
	mov.w	#_task_task_pad, r15
	call	#transition_to
	add.w	#4, r1
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
	sub.w	#6, r1
	mov.w	&_global_block_offset, r12
	mov.w	r12, &_global_block_offset_bak
	mov.w	&_global_message_length, r13
	cmp.w	r13, r12
	jlo	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	mov.w	#_global_block_offset, r14
	mov.w	#_global_block_offset_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
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
.LBB3_7:                                ; %for.cond.2
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB3_10
	jmp	.LBB3_8
.LBB3_8:                                ; %for.body.4
                                        ;   in Loop: Header=BB3_7 Depth=1
	jmp	.LBB3_9
.LBB3_9:                                ; %for.inc.5
                                        ;   in Loop: Header=BB3_7 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_7
.LBB3_10:                               ; %for.end.6
	;DEBUG_VALUE: task_pad:zero <- [FP+-4]
	mov.w	#0, -4(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB3_11
.LBB3_11:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#7, r12
	jhs	.LBB3_17
	jmp	.LBB3_12
.LBB3_12:                               ; %for.body.9
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	&_global_block_offset_bak, r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.w	&_global_message_length, r13
	cmp.w	r13, r12
	jhs	.LBB3_14
	jmp	.LBB3_13
.LBB3_13:                               ; %cond.true
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	&_global_block_offset_bak, r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.b	PLAINTEXT(r12), r12
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jmp	.LBB3_15
.LBB3_14:                               ; %cond.false
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	#255, r12
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jmp	.LBB3_15
.LBB3_15:                               ; %cond.end
                                        ;   in Loop: Header=BB3_11 Depth=1
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	mov.w	-2(r4), r13
	rla.w	r13
	mov.w	r12, _global_base(r13)
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
	mov.w	#1, _global_base(r12)
	jmp	.LBB3_20
.LBB3_20:                               ; %for.inc.21
                                        ;   in Loop: Header=BB3_18 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_18
.LBB3_21:                               ; %for.end.23
	mov.w	#1, &_global_block
	mov.w	#1, -2(r4)
	jmp	.LBB3_22
.LBB3_22:                               ; %for.cond.24
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB3_25
	jmp	.LBB3_23
.LBB3_23:                               ; %for.body.27
                                        ;   in Loop: Header=BB3_22 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	#0, _global_block(r12)
	jmp	.LBB3_24
.LBB3_24:                               ; %for.inc.29
                                        ;   in Loop: Header=BB3_22 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_22
.LBB3_25:                               ; %for.end.31
	mov.w	&pubkey+8, r12
	mov.w	r12, &_global_exponent
	mov.w	#_global_block_offset_bak, r15
	mov.w	&_global_block_offset_bak, r12
	add.w	#7, r12
	mov.w	r12, &_global_block_offset_bak
	mov.w	#_global_block_offset, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_exp, r15
	call	#transition_to
	add.w	#6, r1
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
	mov.w	&_global_exponent, r12
	mov.w	r12, &_global_exponent_bak
	mov.b	&_global_exponent_bak, r13
	bit.b	#1, r13
	jeq	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.w	#_global_exponent_bak, r15
	mov.w	&_global_exponent_bak, r12
	clrc
	rrc.w	r12
	mov.w	r12, &_global_exponent_bak
	mov.w	#_global_exponent, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_mult_block, r15
	call	#transition_to
	jmp	.LBB4_3
.LBB4_2:                                ; %if.else
	mov.w	#_global_exponent_bak, r15
	mov.w	&_global_exponent_bak, r12
	clrc
	rrc.w	r12
	mov.w	r12, &_global_exponent_bak
	mov.w	#_global_exponent, r14
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_square_base, r15
	call	#transition_to
	jmp	.LBB4_3
.LBB4_3:                                ; %if.end
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
	mov.w	#_task_task_mult_block_get_result, &_global_next_task
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
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
	sub.w	#10, r1
	mov.w	&_global_cyphertext_len, r12
	mov.w	r12, &_global_cyphertext_len_bak
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
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_block(r12)
	jmp	.LBB6_3
.LBB6_3:                                ; %for.inc
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB6_1
.LBB6_4:                                ; %for.end
	mov.w	&_global_exponent, r12
	cmp.w	#0, r12
	jeq	.LBB6_6
	jmp	.LBB6_5
.LBB6_5:                                ; %if.then
	mov.w	#_global_cyphertext_len, r14
	mov.w	#_global_cyphertext_len_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_square_base, r15
	call	#transition_to
	jmp	.LBB6_14
.LBB6_6:                                ; %if.else
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#8, r12
	cmp.w	#17, r12
	jhs	.LBB6_12
	jmp	.LBB6_7
.LBB6_7:                                ; %if.then.4
	mov.w	#0, -2(r4)
	jmp	.LBB6_8
.LBB6_8:                                ; %for.cond.5
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB6_11
	jmp	.LBB6_9
.LBB6_9:                                ; %for.body.7
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.w	&_global_cyphertext_len_bak, r13
	rla.w	r13
	mov.w	r12, _global_cyphertext(r13)
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_cyphertext_len_bak
	jmp	.LBB6_10
.LBB6_10:                               ; %for.inc.10
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB6_8
.LBB6_11:                               ; %for.end.12
	jmp	.LBB6_13
.LBB6_12:                               ; %if.else.13
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#8, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#16, 4(r13)
	mov.w	#.L.str.1, 0(r13)
	call	#printf
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	jmp	.LBB6_13
.LBB6_13:                               ; %if.end
	mov.w	#_global_cyphertext_len, r14
	mov.w	#_global_cyphertext_len_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_pad, r15
	call	#transition_to
	jmp	.LBB6_14
.LBB6_14:                               ; %if.end.15
	add.w	#10, r1
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
	mov.w	#_task_task_square_base_get_result, &_global_next_task
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
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
	sub.w	#4, r1
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
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_base(r12)
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
	add.w	#4, r1
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
	sub.w	#28, r1
	mov.w	#0, -4(r4)
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.2, 0(r14)
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	&_global_cyphertext_len, r13
	cmp.w	r13, r12
	jhs	.LBB9_6
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_cyphertext(r12), r12
	mov.w	r12, -6(r4)
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.3, 0(r13)
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
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	jne	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.5, 0(r12)
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
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
	mov.w	#0, &_global_digit
	mov.w	#0, &_global_carry
	mov.w	#_task_task_mult, r15
	call	#transition_to
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
	sub.w	#16, r1
	mov.w	&_global_carry, r12
	mov.w	r12, &_global_carry_bak
	mov.w	&_global_digit, r12
	mov.w	r12, &_global_digit_bak
	mov.w	&_global_carry_bak, r12
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
	mov.w	&_global_digit_bak, r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	cmp.w	#0, r12
	jlo	.LBB11_5
	jmp	.LBB11_3
.LBB11_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	&_global_digit_bak, r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	cmp.w	#8, r12
	jhs	.LBB11_5
	jmp	.LBB11_4
.LBB11_4:                               ; %if.then
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov.w	&_global_digit_bak, r12
	mov.w	-2(r4), r13
	sub.w	r13, r12
	rla.w	r12
	mov.w	_global_base(r12), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_block(r12), r12
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
	mov.w	&_global_digit_bak, r13
	rla.w	r13
	mov.w	r12, _global_product(r13)
	mov.b	#0, &_global_print_which
	mov.w	&_global_digit_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_digit_bak
	cmp.w	#16, r12
	jhs	.LBB11_9
	jmp	.LBB11_8
.LBB11_8:                               ; %if.then.13
	mov.w	-8(r4), r12
	mov.w	r12, &_global_carry_bak
	mov.w	#_global_carry_bak, r15
	mov.w	#_global_carry, r14
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_digit, r14
	mov.w	#_global_digit_bak, r15
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_mult, r15
	call	#transition_to
	jmp	.LBB11_10
.LBB11_9:                               ; %if.else
	mov.w	#_task_task_reduce_digits, &_global_next_task_print
	mov.w	#_global_carry, r14
	mov.w	#_global_carry_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_digit, r14
	mov.w	#_global_digit_bak, r15
	mov.w	-16(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	jmp	.LBB11_10
.LBB11_10:                              ; %if.end.14
	add.w	#16, r1
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
	sub.w	#8, r1
	mov.w	#16, -2(r4)
	jmp	.LBB12_1
.LBB12_1:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB12_2
.LBB12_2:                               ; %do.cond
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -3(r4)             ; 1-byte Folded Spill
	jne	.LBB12_6
	jmp	.LBB12_3
.LBB12_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	#0, r13
	mov.w	#1, r14
	cmp.w	#1, r12
	mov.w	r13, -6(r4)             ; 2-byte Folded Spill
	mov.w	r14, -8(r4)             ; 2-byte Folded Spill
	jge	.LBB12_5
; BB#4:                                 ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
.LBB12_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -3(r4)             ; 1-byte Folded Spill
	jmp	.LBB12_6
.LBB12_6:                               ; %land.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.b	-3(r4), r12             ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jne	.LBB12_1
	jmp	.LBB12_7
.LBB12_7:                               ; %do.end
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	cmp.w	#0, r12
	jne	.LBB12_9
	jmp	.LBB12_8
.LBB12_8:                               ; %if.then
	mov.w	#_task_task_init, r15
	call	#transition_to
	jmp	.LBB12_9
.LBB12_9:                               ; %if.end
	mov.w	-2(r4), r12
	mov.w	r12, &_global_reduce
	mov.w	#_task_task_reduce_normalizable, r15
	call	#transition_to
	add.w	#8, r1
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
	sub.w	#10, r1
	mov.b	#1, -9(r4)
	mov.w	&_global_reduce, r12
	mov.w	r12, -8(r4)
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, &_global_offset
	mov.w	&_global_reduce, r12
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
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	&_global_offset, r14
	sub.w	r14, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	cmp.w	r13, r12
	jhs	.LBB13_4
	jmp	.LBB13_3
.LBB13_3:                               ; %if.then
	jmp	.LBB13_9
.LBB13_4:                               ; %if.else
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	&_global_offset, r14
	sub.w	r14, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	cmp.w	r12, r13
	jhs	.LBB13_6
	jmp	.LBB13_5
.LBB13_5:                               ; %if.then.8
	mov.b	#0, -9(r4)
	jmp	.LBB13_9
.LBB13_6:                               ; %if.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_7
.LBB13_7:                               ; %if.end.9
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_8
.LBB13_8:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB13_1
.LBB13_9:                               ; %for.end
	mov.b	-9(r4), r12
	bit.w	#1, r12
	jne	.LBB13_12
	jmp	.LBB13_10
.LBB13_10:                              ; %land.lhs.true
	mov.w	&_global_reduce, r12
	cmp.w	#7, r12
	jne	.LBB13_12
	jmp	.LBB13_11
.LBB13_11:                              ; %if.then.11
	mov.w	&_global_next_task, r15
	call	#transition_to
	jmp	.LBB13_12
.LBB13_12:                              ; %if.end.12
	mov.b	-9(r4), r12
	bit.w	#1, r12
	jeq	.LBB13_14
	jmp	.LBB13_13
.LBB13_13:                              ; %if.then.14
	mov.w	#_task_task_reduce_normalize, r15
	call	#transition_to
	jmp	.LBB13_15
.LBB13_14:                              ; %if.else.15
	mov.w	#_task_task_reduce_n_divisor, r15
	call	#transition_to
	jmp	.LBB13_15
.LBB13_15:                              ; %if.end.16
	add.w	#10, r1
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
	push.w	r11
	sub.w	#22, r1
	mov.b	#0, &_global_print_which
	mov.w	#0, -12(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB14_1
.LBB14_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#8, r12
	jge	.LBB14_11
	jmp	.LBB14_2
.LBB14_2:                               ; %for.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	&_global_offset, r13
	add.w	r13, r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB14_4
	jmp	.LBB14_3
.LBB14_3:                               ; %for.body.split1
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB14_4
.LBB14_4:                               ; %for.body.split
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -4(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	r12, -10(r4)
	mov.w	-4(r4), r13
	cmp.w	r12, r13
	jhs	.LBB14_6
	jmp	.LBB14_5
.LBB14_5:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#256, r12
	mov.w	r12, -4(r4)
	mov.w	#1, -12(r4)
	jmp	.LBB14_7
.LBB14_6:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	#0, -12(r4)
	jmp	.LBB14_7
.LBB14_7:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	-10(r4), r13
	sub.w	r13, r12
	mov.w	r12, -8(r4)
	mov.w	-14(r4), r13
	mov.w	&_global_offset, r14
	add.w	r14, r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_product, r14
	mov.w	r13, r15
	add.w	#_global_product_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_product_bak(r13)
	mov.w	r13, r12
	add.w	#_global_product_isDirty, r12
	mov.w	_global_product_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r14, -22(r4)            ; 2-byte Folded Spill
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB14_9
	jmp	.LBB14_8
.LBB14_8:                               ; %if.end.split2
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	#2, r13
	mov.w	-24(r4), r15            ; 2-byte Folded Reload
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB14_9
.LBB14_9:                               ; %if.end.split
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_10
.LBB14_10:                              ; %for.inc
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB14_1
.LBB14_11:                              ; %for.end
	mov.w	&_global_offset, r12
	cmp.w	#0, r12
	jeq	.LBB14_13
	jmp	.LBB14_12
.LBB14_12:                              ; %if.then.8
	mov.w	#_task_task_reduce_n_divisor, &_global_next_task_print
	jmp	.LBB14_14
.LBB14_13:                              ; %if.else.9
	mov.w	&_global_next_task, r12
	mov.w	r12, &_global_next_task_print
	jmp	.LBB14_14
.LBB14_14:                              ; %if.end.10
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r11
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
	mov.w	&_global_modulus+14, r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	&_global_modulus+12, r13
	add.w	r13, r12
	mov.w	r12, &_global_n_div
	mov.w	#_task_task_reduce_quotient, r15
	call	#transition_to
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
	sub.w	#22, r1
	mov.w	&_global_quotient, r12
	mov.w	r12, &_global_quotient_bak
	mov.w	&_global_reduce, r12
	mov.w	r12, &_global_reduce_bak
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.w	&_global_modulus+14, r13
	cmp.w	r13, r12
	jne	.LBB16_2
	jmp	.LBB16_1
.LBB16_1:                               ; %if.then
	mov.w	#255, &_global_quotient_bak
	jmp	.LBB16_3
.LBB16_2:                               ; %if.else
	mov.w	&_global_reduce_bak, r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	_global_product-2(r12), r12
	add.w	r12, r13
	mov.w	&_global_modulus+14, r14
	mov.w	r13, r15
	call	#__udivhi3
	mov.w	r15, &_global_quotient_bak
	jmp	.LBB16_3
.LBB16_3:                               ; %if.end
	mov.w	&_global_reduce_bak, r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	_global_product-2(r12), r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	mov.w	_global_product-4(r12), r12
	add.w	r12, r14
	addc.w	#0, r13
	mov.w	r13, -18(r4)
	mov.w	r14, -20(r4)
	mov.w	&_global_quotient_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_quotient_bak
	jmp	.LBB16_4
.LBB16_4:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&_global_quotient_bak, r12
	add.w	#-1, r12
	mov.w	r12, &_global_quotient_bak
	mov.w	&_global_n_div, r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -14(r4)
	mov.w	r14, -16(r4)
	jmp	.LBB16_5
.LBB16_5:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	cmp.w	r13, r15
	mov.w	r2, r11
	mov.w	#1, r10
	mov.w	r10, r9
	bic.w	r11, r9
	cmp.w	r12, r14
	mov.w	r2, r12
	bic.w	r12, r10
	cmp.w	r15, r13
	mov.w	r9, -22(r4)             ; 2-byte Folded Spill
	mov.w	r10, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB16_7
; BB#6:                                 ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
.LBB16_7:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB16_4
	jmp	.LBB16_8
.LBB16_8:                               ; %do.end
	mov.w	#_global_reduce_bak, r15
	mov.w	&_global_reduce_bak, r12
	add.w	#-1, r12
	mov.w	r12, &_global_reduce_bak
	mov.w	#_global_quotient, r14
	mov.w	#_global_quotient_bak, r12
	mov.w	#2, r13
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r13, -28(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_reduce, r14
	mov.w	-26(r4), r15            ; 2-byte Folded Reload
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_reduce_multiply, r15
	call	#transition_to
	add.w	#22, r1
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
	sub.w	#10, r1
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -10(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB17_1
.LBB17_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jhs	.LBB17_4
	jmp	.LBB17_2
.LBB17_2:                               ; %for.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	#0, _global_product2(r12)
	jmp	.LBB17_3
.LBB17_3:                               ; %for.inc
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_1
.LBB17_4:                               ; %for.end
	mov.w	#0, -8(r4)
	mov.w	-10(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_5
.LBB17_5:                               ; %for.cond.1
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#16, r12
	jge	.LBB17_11
	jmp	.LBB17_6
.LBB17_6:                               ; %for.body.3
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-8(r4), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r12
	mov.w	-10(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB17_8
	jmp	.LBB17_7
.LBB17_7:                               ; %if.then
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-2(r4), r12
	mov.w	-10(r4), r13
	sub.w	r13, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -6(r4)
	mov.w	&_global_quotient, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-4(r4), r12
	add.w	r15, r12
	mov.w	r12, -4(r4)
	jmp	.LBB17_9
.LBB17_8:                               ; %if.else
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	#0, -6(r4)
	jmp	.LBB17_9
.LBB17_9:                               ; %if.end
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.b	-3(r4), r12
	mov.w	r12, -8(r4)
	mov.b	-4(r4), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r13
	rla.w	r13
	mov.w	r12, _global_product2(r13)
	jmp	.LBB17_10
.LBB17_10:                              ; %for.inc.10
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_5
.LBB17_11:                              ; %for.end.12
	mov.b	#1, &_global_print_which
	mov.w	#_task_task_reduce_compare, &_global_next_task_print
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#10, r1
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
	sub.w	#4, r1
	mov.b	#61, -3(r4)
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
	mov.w	_global_product(r12), r13
	mov.w	_global_product2(r12), r12
	cmp.w	r13, r12
	jhs	.LBB18_4
	jmp	.LBB18_3
.LBB18_3:                               ; %if.then
	mov.b	#62, -3(r4)
	jmp	.LBB18_9
.LBB18_4:                               ; %if.else
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	_global_product2(r12), r12
	cmp.w	r12, r13
	jhs	.LBB18_6
	jmp	.LBB18_5
.LBB18_5:                               ; %if.then.6
	mov.b	#60, -3(r4)
	jmp	.LBB18_9
.LBB18_6:                               ; %if.end
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_7
.LBB18_7:                               ; %if.end.7
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_8
.LBB18_8:                               ; %for.inc
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB18_1
.LBB18_9:                               ; %for.end
	mov.b	-3(r4), r12
	cmp.b	#60, r12
	jne	.LBB18_11
	jmp	.LBB18_10
.LBB18_10:                              ; %if.then.10
	mov.w	#_task_task_reduce_add, r15
	call	#transition_to
	jmp	.LBB18_12
.LBB18_11:                              ; %if.else.11
	mov.w	#_task_task_reduce_subtract, r15
	call	#transition_to
	jmp	.LBB18_12
.LBB18_12:                              ; %if.end.12
	add.w	#4, r1
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
	push.w	r11
	sub.w	#34, r1
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -4(r4)
	jmp	.LBB19_1
.LBB19_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#16, r12
	jge	.LBB19_17
	jmp	.LBB19_2
.LBB19_2:                               ; %for.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_4
	jmp	.LBB19_3
.LBB19_3:                               ; %for.body.split1
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB19_4
.LBB19_4:                               ; %for.body.split
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -8(r4)
	mov.w	-4(r4), r12
	mov.w	-14(r4), r13
	sub.w	r13, r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r12
	mov.w	-14(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB19_6
	jmp	.LBB19_5
.LBB19_5:                               ; %if.then
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-6(r4), r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -10(r4)
	jmp	.LBB19_7
.LBB19_6:                               ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	#0, -10(r4)
	mov.w	#0, -6(r4)
	jmp	.LBB19_7
.LBB19_7:                               ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	-10(r4), r13
	add.w	r13, r12
	mov.w	-4(r4), r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_product, r14
	mov.w	r13, r15
	add.w	#_global_product_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_product_bak(r13)
	mov.w	r13, r12
	add.w	#_global_product_isDirty, r12
	mov.w	_global_product_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r14, -22(r4)            ; 2-byte Folded Spill
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_9
	jmp	.LBB19_8
.LBB19_8:                               ; %if.end.split2
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	#2, r13
	mov.w	-24(r4), r15            ; 2-byte Folded Reload
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB19_9
.LBB19_9:                               ; %if.end.split
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_11
	jmp	.LBB19_10
.LBB19_10:                              ; %if.end.split.split3
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB19_11
.LBB19_11:                              ; %if.end.split.split
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.b	_global_product_bak+1(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_13
	jmp	.LBB19_12
.LBB19_12:                              ; %if.end.split.split.split4
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB19_13
.LBB19_13:                              ; %if.end.split.split.split
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	r12, r13
	add.w	#_global_product, r13
	mov.w	r12, r14
	add.w	#_global_product_bak, r14
	mov.b	_global_product_bak(r12), r15
	mov.w	&_numBoots, r11
	mov.w	r15, _global_product_bak(r12)
	mov.w	r12, r15
	add.w	#_global_product_isDirty, r15
	mov.w	_global_product_isDirty(r12), r12
	cmp.w	r11, r12
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r13, -32(r4)            ; 2-byte Folded Spill
	mov.w	r14, -34(r4)            ; 2-byte Folded Spill
	mov.w	r11, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_15
	jmp	.LBB19_14
.LBB19_14:                              ; %if.end.split.split.split.split5
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	#2, r13
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-30(r4), r13            ; 2-byte Folded Reload
	mov.w	-36(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB19_15
.LBB19_15:                              ; %if.end.split.split.split.split
                                        ;   in Loop: Header=BB19_1 Depth=1
	jmp	.LBB19_16
.LBB19_16:                              ; %for.inc
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB19_1
.LBB19_17:                              ; %for.end
	mov.b	#0, &_global_print_which
	mov.w	#_task_task_reduce_subtract, &_global_next_task_print
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#34, r1
	pop.w	r11
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
	push.w	r11
	sub.w	#22, r1
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -12(r4)
	mov.w	#0, -4(r4)
	jmp	.LBB20_1
.LBB20_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#16, r12
	jge	.LBB20_13
	jmp	.LBB20_2
.LBB20_2:                               ; %for.body
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB20_4
	jmp	.LBB20_3
.LBB20_3:                               ; %for.body.split1
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB20_4
.LBB20_4:                               ; %for.body.split
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r12
	mov.w	-14(r4), r13
	cmp.w	r13, r12
	jlo	.LBB20_11
	jmp	.LBB20_5
.LBB20_5:                               ; %if.then
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	mov.w	_global_product2(r12), r12
	mov.w	r12, -10(r4)
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.w	r12, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	r12, r13
	jhs	.LBB20_7
	jmp	.LBB20_6
.LBB20_6:                               ; %if.then.5
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#256, r12
	mov.w	r12, -6(r4)
	mov.w	#1, -12(r4)
	jmp	.LBB20_8
.LBB20_7:                               ; %if.else
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	#0, -12(r4)
	jmp	.LBB20_8
.LBB20_8:                               ; %if.end
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	sub.w	r13, r12
	mov.w	-4(r4), r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_product, r14
	mov.w	r13, r15
	add.w	#_global_product_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_product_bak(r13)
	mov.w	r13, r12
	add.w	#_global_product_isDirty, r12
	mov.w	_global_product_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r14, -22(r4)            ; 2-byte Folded Spill
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB20_10
	jmp	.LBB20_9
.LBB20_9:                               ; %if.end.split2
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	#2, r13
	mov.w	-24(r4), r15            ; 2-byte Folded Reload
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB20_10
.LBB20_10:                              ; %if.end.split
                                        ;   in Loop: Header=BB20_1 Depth=1
	jmp	.LBB20_11
.LBB20_11:                              ; %if.end.9
                                        ;   in Loop: Header=BB20_1 Depth=1
	jmp	.LBB20_12
.LBB20_12:                              ; %for.inc
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB20_1
.LBB20_13:                              ; %for.end
	mov.b	#0, &_global_print_which
	mov.w	&_global_reduce, r12
	add.w	#1, r12
	cmp.w	#9, r12
	jlo	.LBB20_15
	jmp	.LBB20_14
.LBB20_14:                              ; %if.then.12
	mov.w	#_task_task_reduce_quotient, &_global_next_task_print
	jmp	.LBB20_16
.LBB20_15:                              ; %if.else.13
	mov.w	&_global_next_task, r12
	mov.w	r12, &_global_next_task_print
	jmp	.LBB20_16
.LBB20_16:                              ; %if.end.14
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r11
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
	sub.w	#2, r1
	mov.w	&_global_next_task_print, r15
	call	#transition_to
	add.w	#2, r1
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

	.globl	clear_isDirty
	.align	2
	.type	clear_isDirty,@function
clear_isDirty:                          ; @clear_isDirty
; BB#0:                                 ; %entry
	mov.w	#_global_product_isDirty, r15
	mov.w	#0, r14
	mov.w	#64, r13
	call	#my_memset
	ret
.Lfunc_end24:
	.size	clear_isDirty, .Lfunc_end24-clear_isDirty

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
.Lfunc_end25:
	.size	init_hw, .Lfunc_end25-init_hw

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
.Lfunc_end26:
	.size	msp_watchdog_enable, .Lfunc_end26-msp_watchdog_enable

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
.Lfunc_end27:
	.size	msp_watchdog_disable, .Lfunc_end27-msp_watchdog_disable

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
.Lfunc_end28:
	.size	msp_watchdog_kick, .Lfunc_end28-msp_watchdog_kick

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
	jeq	.LBB29_4
	jmp	.LBB29_1
.LBB29_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB29_2
.LBB29_2:                               ; %while.body
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
	jne	.LBB29_2
	jmp	.LBB29_3
.LBB29_3:                               ; %while.end.loopexit
	jmp	.LBB29_4
.LBB29_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	memcpy, .Lfunc_end29-memcpy

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
.Lfunc_end30:
	.size	my_memset, .Lfunc_end30-my_memset

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
.Lfunc_end31:
	.size	msp_clock_setup, .Lfunc_end31-msp_clock_setup

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
.Lfunc_end32:
	.size	mult16, .Lfunc_end32-mult16

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
	jmp	.LBB33_1
.LBB33_1:                               ; %while.cond
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
	jeq	.LBB33_3
	jmp	.LBB33_2
.LBB33_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB33_3
.LBB33_3:                               ; %land.end
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB33_10
	jmp	.LBB33_4
.LBB33_4:                               ; %while.body
                                        ;   in Loop: Header=BB33_1 Depth=1
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
	jeq	.LBB33_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB33_6:                               ; %while.body
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB33_8
	jmp	.LBB33_7
.LBB33_7:                               ; %if.then
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB33_9
.LBB33_8:                               ; %if.else
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB33_9
.LBB33_9:                               ; %if.end
                                        ;   in Loop: Header=BB33_1 Depth=1
	jmp	.LBB33_1
.LBB33_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end33:
	.size	sqrt16, .Lfunc_end33-sqrt16

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
	jmp	.LBB34_1
.LBB34_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB34_4
	jmp	.LBB34_2
.LBB34_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB34_4
	jmp	.LBB34_3
.LBB34_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB34_4
.LBB34_4:                               ; %land.end
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB34_6
	jmp	.LBB34_5
.LBB34_5:                               ; %while.body
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB34_1
.LBB34_6:                               ; %while.end
	jmp	.LBB34_7
.LBB34_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB34_11
	jmp	.LBB34_8
.LBB34_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB34_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB34_10
	jmp	.LBB34_9
.LBB34_9:                               ; %if.then
                                        ;   in Loop: Header=BB34_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB34_10
.LBB34_10:                              ; %if.end
                                        ;   in Loop: Header=BB34_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB34_7
.LBB34_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB34_13
	jmp	.LBB34_12
.LBB34_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB34_14
.LBB34_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB34_14
.LBB34_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end34:
	.size	udivmodhi4, .Lfunc_end34-udivmodhi4

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
	jge	.LBB35_2
	jmp	.LBB35_1
.LBB35_1:                               ; %if.then
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
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB35_4
.LBB35_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB35_6
	jmp	.LBB35_5
.LBB35_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB35_6
.LBB35_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end35:
	.size	__divhi3, .Lfunc_end35-__divhi3

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
	jge	.LBB36_2
	jmp	.LBB36_1
.LBB36_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB36_2
.LBB36_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB36_4
	jmp	.LBB36_3
.LBB36_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB36_4
.LBB36_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB36_6
	jmp	.LBB36_5
.LBB36_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB36_6
.LBB36_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end36:
	.size	__modhi3, .Lfunc_end36-__modhi3

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
.Lfunc_end37:
	.size	__udivhi3, .Lfunc_end37-__udivhi3

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
.Lfunc_end38:
	.size	__umodhi3, .Lfunc_end38-__umodhi3

	.globl	task_prologue
	.align	2
	.type	task_prologue,@function
task_prologue:                          ; @task_prologue
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&_numBoots, r12
	cmp.w	#-1, r12
	jne	.LBB39_2
	jmp	.LBB39_1
.LBB39_1:                               ; %if.then
	call	#clear_isDirty
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	jmp	.LBB39_2
.LBB39_2:                               ; %if.end
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	;DEBUG_VALUE: task_prologue:curtask <- [FP+-2]
	mov.w	&curctx, r12
	mov.w	4(r12), r12
	mov.w	0(r12), r12
	mov.w	r12, -2(r4)
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	8(r13), r13
	cmp.w	r13, r12
	jeq	.LBB39_7
	jmp	.LBB39_3
.LBB39_3:                               ; %if.then.3
	jmp	.LBB39_4
.LBB39_4:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB39_6
	jmp	.LBB39_5
.LBB39_5:                               ; %while.body
                                        ;   in Loop: Header=BB39_4 Depth=1
	;DEBUG_VALUE: w_data_dest <- [FP+-4]
	mov.w	&data_dest_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: w_data_src <- [FP+-6]
	mov.w	&data_src_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -6(r4)
	;DEBUG_VALUE: w_data_size <- [FP+-8]
	mov.w	&data_size_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -8(r4)
	mov.w	-4(r4), r15
	mov.w	-6(r4), r14
	mov.w	r12, r13
	call	#memcpy
	mov.w	&gv_index, r12
	add.w	#1, r12
	mov.w	r12, &gv_index
	jmp	.LBB39_4
.LBB39_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 8(r13)
	jmp	.LBB39_8
.LBB39_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB39_8
.LBB39_8:                               ; %if.end.10
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end39:
	.size	task_prologue, .Lfunc_end39-task_prologue

	.globl	transition_to
	.align	2
	.type	transition_to,@function
transition_to:                          ; @transition_to
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: transition_to:next_task <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	&curctx, r15
	mov.w	#context_0, r13
	mov.w	#context_2, r14
	cmp.w	r13, r15
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB40_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB40_2:                               ; %entry
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r13
	mov.w	r13, 0(r12)
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	add.w	#1, r12
	mov.w	-4(r4), r13
	mov.w	r12, 2(r13)
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-4(r4), r13
	mov.w	4(r13), r13
	mov.w	r12, 2(r13)
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	-4(r4), r13
	mov.w	4(r13), r13
	mov.w	r12, 0(r13)
	mov.w	-4(r4), r12
	mov.w	r12, &curctx
	call	#task_prologue
	mov.w	-2(r4), r12
	mov.w	0(r12), r12
	;APP
	mov #0x2400, r1
br r12

	;NO_APP
	add.w	#10, r1
	pop.w	r4
	ret
.Lfunc_end40:
	.size	transition_to, .Lfunc_end40-transition_to

	.globl	write_to_gbuf
	.align	2
	.type	write_to_gbuf,@function
write_to_gbuf:                          ; @write_to_gbuf
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#12, r1
	;DEBUG_VALUE: write_to_gbuf:data_src <- undef
	;DEBUG_VALUE: write_to_gbuf:data_dest <- undef
	;DEBUG_VALUE: write_to_gbuf:var_size <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	&data_size_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	-8(r4), r13
	mov.w	&data_dest_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	-6(r4), r13
	mov.w	&data_src_base, r14
	mov.w	&num_dirty_gv, r15
	rla.w	r15
	add.w	r15, r14
	mov.w	r13, 0(r14)
	mov.w	&num_dirty_gv, r13
	add.w	#1, r13
	mov.w	r13, &num_dirty_gv
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r11, -14(r4)            ; 2-byte Folded Spill
	mov.w	r10, -16(r4)            ; 2-byte Folded Spill
	add.w	#12, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end41:
	.size	write_to_gbuf, .Lfunc_end41-write_to_gbuf

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
	.short	0                       ; 0x0
	.asciz	"task_init\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init, 42

	.type	_task_task_pad,@object  ; @_task_task_pad
	.globl	_task_task_pad
	.align	1
_task_task_pad:
	.short	task_pad
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.short	0                       ; 0x0
	.asciz	"task_pad\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_pad, 42

	.type	_task_task_exp,@object  ; @_task_task_exp
	.globl	_task_task_exp
	.align	1
_task_task_exp:
	.short	task_exp
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.short	0                       ; 0x0
	.asciz	"task_exp\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_exp, 42

	.type	_task_task_mult_block,@object ; @_task_task_mult_block
	.globl	_task_task_mult_block
	.align	1
_task_task_mult_block:
	.short	task_mult_block
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.short	0                       ; 0x0
	.asciz	"task_mult_block\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult_block, 42

	.type	_task_task_mult_block_get_result,@object ; @_task_task_mult_block_get_result
	.globl	_task_task_mult_block_get_result
	.align	1
_task_task_mult_block_get_result:
	.short	task_mult_block_get_result
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.short	0                       ; 0x0
	.asciz	"task_mult_block_get_result\000\000\000\000\000"
	.size	_task_task_mult_block_get_result, 42

	.type	_task_task_square_base,@object ; @_task_task_square_base
	.globl	_task_task_square_base
	.align	1
_task_task_square_base:
	.short	task_square_base
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.short	0                       ; 0x0
	.asciz	"task_square_base\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_square_base, 42

	.type	_task_task_square_base_get_result,@object ; @_task_task_square_base_get_result
	.globl	_task_task_square_base_get_result
	.align	1
_task_task_square_base_get_result:
	.short	task_square_base_get_result
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.short	0                       ; 0x0
	.asciz	"task_square_base_get_result\000\000\000\000"
	.size	_task_task_square_base_get_result, 42

	.type	_task_task_print_cyphertext,@object ; @_task_task_print_cyphertext
	.globl	_task_task_print_cyphertext
	.align	1
_task_task_print_cyphertext:
	.short	task_print_cyphertext
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.short	0                       ; 0x0
	.asciz	"task_print_cyphertext\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print_cyphertext, 42

	.type	_task_task_mult_mod,@object ; @_task_task_mult_mod
	.globl	_task_task_mult_mod
	.align	1
_task_task_mult_mod:
	.short	task_mult_mod
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.short	0                       ; 0x0
	.asciz	"task_mult_mod\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult_mod, 42

	.type	_task_task_mult,@object ; @_task_task_mult
	.globl	_task_task_mult
	.align	1
_task_task_mult:
	.short	task_mult
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.short	0                       ; 0x0
	.asciz	"task_mult\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_mult, 42

	.type	_task_task_reduce_digits,@object ; @_task_task_reduce_digits
	.globl	_task_task_reduce_digits
	.align	1
_task_task_reduce_digits:
	.short	task_reduce_digits
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.short	0                       ; 0x0
	.asciz	"task_reduce_digits\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_digits, 42

	.type	_task_task_reduce_normalizable,@object ; @_task_task_reduce_normalizable
	.globl	_task_task_reduce_normalizable
	.align	1
_task_task_reduce_normalizable:
	.short	task_reduce_normalizable
	.long	4096                    ; 0x1000
	.short	12                      ; 0xc
	.short	0                       ; 0x0
	.asciz	"task_reduce_normalizable\000\000\000\000\000\000\000"
	.size	_task_task_reduce_normalizable, 42

	.type	_task_task_reduce_normalize,@object ; @_task_task_reduce_normalize
	.globl	_task_task_reduce_normalize
	.align	1
_task_task_reduce_normalize:
	.short	task_reduce_normalize
	.long	8192                    ; 0x2000
	.short	13                      ; 0xd
	.short	0                       ; 0x0
	.asciz	"task_reduce_normalize\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_normalize, 42

	.type	_task_task_reduce_n_divisor,@object ; @_task_task_reduce_n_divisor
	.globl	_task_task_reduce_n_divisor
	.align	1
_task_task_reduce_n_divisor:
	.short	task_reduce_n_divisor
	.long	16384                   ; 0x4000
	.short	14                      ; 0xe
	.short	0                       ; 0x0
	.asciz	"task_reduce_n_divisor\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_n_divisor, 42

	.type	_task_task_reduce_quotient,@object ; @_task_task_reduce_quotient
	.globl	_task_task_reduce_quotient
	.align	1
_task_task_reduce_quotient:
	.short	task_reduce_quotient
	.long	32768                   ; 0x8000
	.short	15                      ; 0xf
	.short	0                       ; 0x0
	.asciz	"task_reduce_quotient\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_quotient, 42

	.type	_task_task_reduce_multiply,@object ; @_task_task_reduce_multiply
	.globl	_task_task_reduce_multiply
	.align	1
_task_task_reduce_multiply:
	.short	task_reduce_multiply
	.long	65536                   ; 0x10000
	.short	16                      ; 0x10
	.short	0                       ; 0x0
	.asciz	"task_reduce_multiply\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_multiply, 42

	.type	_task_task_reduce_compare,@object ; @_task_task_reduce_compare
	.globl	_task_task_reduce_compare
	.align	1
_task_task_reduce_compare:
	.short	task_reduce_compare
	.long	131072                  ; 0x20000
	.short	17                      ; 0x11
	.short	0                       ; 0x0
	.asciz	"task_reduce_compare\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_compare, 42

	.type	_task_task_reduce_add,@object ; @_task_task_reduce_add
	.globl	_task_task_reduce_add
	.align	1
_task_task_reduce_add:
	.short	task_reduce_add
	.long	262144                  ; 0x40000
	.short	18                      ; 0x12
	.short	0                       ; 0x0
	.asciz	"task_reduce_add\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_add, 42

	.type	_task_task_reduce_subtract,@object ; @_task_task_reduce_subtract
	.globl	_task_task_reduce_subtract
	.align	1
_task_task_reduce_subtract:
	.short	task_reduce_subtract
	.long	524288                  ; 0x80000
	.short	19                      ; 0x13
	.short	0                       ; 0x0
	.asciz	"task_reduce_subtract\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_reduce_subtract, 42

	.type	_task_task_print_product,@object ; @_task_task_print_product
	.globl	_task_task_print_product
	.align	1
_task_task_print_product:
	.short	task_print_product
	.long	1048576                 ; 0x100000
	.short	20                      ; 0x14
	.short	0                       ; 0x0
	.asciz	"task_print_product\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print_product, 42

	.type	_global_modulus,@object ; @_global_modulus
	.globl	_global_modulus
	.align	1
_global_modulus:
	.zero	16
	.size	_global_modulus, 16

	.type	_global_message_length,@object ; @_global_message_length
	.globl	_global_message_length
	.align	1
_global_message_length:
	.short	0                       ; 0x0
	.size	_global_message_length, 2

	.type	_global_block_offset_bak,@object ; @_global_block_offset_bak
	.globl	_global_block_offset_bak
	.align	1
_global_block_offset_bak:
	.short	0                       ; 0x0
	.size	_global_block_offset_bak, 2

	.type	_global_block_offset,@object ; @_global_block_offset
	.globl	_global_block_offset
	.align	1
_global_block_offset:
	.short	0                       ; 0x0
	.size	_global_block_offset, 2

	.type	_global_cyphertext_len_bak,@object ; @_global_cyphertext_len_bak
	.globl	_global_cyphertext_len_bak
	.align	1
_global_cyphertext_len_bak:
	.short	0                       ; 0x0
	.size	_global_cyphertext_len_bak, 2

	.type	_global_cyphertext_len,@object ; @_global_cyphertext_len
	.globl	_global_cyphertext_len
	.align	1
_global_cyphertext_len:
	.short	0                       ; 0x0
	.size	_global_cyphertext_len, 2

	.type	_global_base,@object    ; @_global_base
	.globl	_global_base
	.align	1
_global_base:
	.zero	64
	.size	_global_base, 64

	.type	_global_block,@object   ; @_global_block
	.globl	_global_block
	.align	1
_global_block:
	.zero	64
	.size	_global_block, 64

	.type	_global_exponent_bak,@object ; @_global_exponent_bak
	.globl	_global_exponent_bak
	.align	1
_global_exponent_bak:
	.short	0                       ; 0x0
	.size	_global_exponent_bak, 2

	.type	_global_exponent,@object ; @_global_exponent
	.globl	_global_exponent
	.align	1
_global_exponent:
	.short	0                       ; 0x0
	.size	_global_exponent, 2

	.type	_global_next_task,@object ; @_global_next_task
	.globl	_global_next_task
	.align	1
_global_next_task:
	.short	0
	.size	_global_next_task, 2

	.type	_global_product_bak,@object ; @_global_product_bak
	.globl	_global_product_bak
	.align	1
_global_product_bak:
	.zero	64
	.size	_global_product_bak, 64

	.type	_global_product_isDirty,@object ; @_global_product_isDirty
	.globl	_global_product_isDirty
	.align	1
_global_product_isDirty:
	.zero	64
	.size	_global_product_isDirty, 64

	.type	_global_product,@object ; @_global_product
	.globl	_global_product
	.align	1
_global_product:
	.zero	64
	.size	_global_product, 64

	.type	_global_cyphertext,@object ; @_global_cyphertext
	.globl	_global_cyphertext
	.align	1
_global_cyphertext:
	.zero	32
	.size	_global_cyphertext, 32

	.type	_global_digit_bak,@object ; @_global_digit_bak
	.globl	_global_digit_bak
	.align	1
_global_digit_bak:
	.short	0                       ; 0x0
	.size	_global_digit_bak, 2

	.type	_global_digit,@object   ; @_global_digit
	.globl	_global_digit
	.align	1
_global_digit:
	.short	0                       ; 0x0
	.size	_global_digit, 2

	.type	_global_carry_bak,@object ; @_global_carry_bak
	.globl	_global_carry_bak
	.align	1
_global_carry_bak:
	.short	0                       ; 0x0
	.size	_global_carry_bak, 2

	.type	_global_carry,@object   ; @_global_carry
	.globl	_global_carry
	.align	1
_global_carry:
	.short	0                       ; 0x0
	.size	_global_carry, 2

	.type	_global_print_which,@object ; @_global_print_which
	.globl	_global_print_which
_global_print_which:
	.byte	0                       ; 0x0
	.size	_global_print_which, 1

	.type	_global_next_task_print,@object ; @_global_next_task_print
	.globl	_global_next_task_print
	.align	1
_global_next_task_print:
	.short	0
	.size	_global_next_task_print, 2

	.type	_global_reduce_bak,@object ; @_global_reduce_bak
	.globl	_global_reduce_bak
	.align	1
_global_reduce_bak:
	.short	0                       ; 0x0
	.size	_global_reduce_bak, 2

	.type	_global_reduce,@object  ; @_global_reduce
	.globl	_global_reduce
	.align	1
_global_reduce:
	.short	0                       ; 0x0
	.size	_global_reduce, 2

	.type	_global_offset,@object  ; @_global_offset
	.globl	_global_offset
	.align	1
_global_offset:
	.short	0                       ; 0x0
	.size	_global_offset, 2

	.type	_global_n_div,@object   ; @_global_n_div
	.globl	_global_n_div
	.align	1
_global_n_div:
	.short	0                       ; 0x0
	.size	_global_n_div, 2

	.type	_global_quotient_bak,@object ; @_global_quotient_bak
	.globl	_global_quotient_bak
	.align	1
_global_quotient_bak:
	.short	0                       ; 0x0
	.size	_global_quotient_bak, 2

	.type	_global_quotient,@object ; @_global_quotient
	.globl	_global_quotient
	.align	1
_global_quotient:
	.short	0                       ; 0x0
	.size	_global_quotient, 2

	.type	_global_product2,@object ; @_global_product2
	.globl	_global_product2
	.align	1
_global_product2:
	.zero	64
	.size	_global_product2, 64

	.type	_task__entry_task,@object ; @_task__entry_task
	.globl	_task__entry_task
	.align	1
_task__entry_task:
	.short	_entry_task
	.long	1                       ; 0x1
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"_entry_task\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task__entry_task, 42

	.type	_global_exponent_next,@object ; @_global_exponent_next
	.globl	_global_exponent_next
	.align	1
_global_exponent_next:
	.short	0                       ; 0x0
	.size	_global_exponent_next, 2

	.type	data_src,@object        ; @data_src
	.globl	data_src
	.align	1
data_src:
	.zero	64
	.size	data_src, 64

	.type	data_dest,@object       ; @data_dest
	.globl	data_dest
	.align	1
data_dest:
	.zero	64
	.size	data_dest, 64

	.type	data_size,@object       ; @data_size
	.globl	data_size
	.align	1
data_size:
	.zero	64
	.size	data_size, 64

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

	.type	PLAINTEXT,@object       ; @PLAINTEXT
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	.L.str.1,@object        ; @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"WARN: block dropped: cyphertext overlow [%u > %u]\r\n"
	.size	.L.str.1, 52

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.2, 26

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"%02x "
	.size	.L.str.3, 6

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	" "
	.size	.L.str.4, 2

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"\r\n"
	.size	.L.str.5, 3

	.type	watchdog_bits,@object   ; @watchdog_bits
	.local	watchdog_bits
	.comm	watchdog_bits,1,1
	.type	data_src_base,@object   ; @data_src_base
	.section	.nv_vars,"aw",@progbits
	.globl	data_src_base
	.align	1
data_src_base:
	.short	data_src
	.size	data_src_base, 2

	.type	data_dest_base,@object  ; @data_dest_base
	.globl	data_dest_base
	.align	1
data_dest_base:
	.short	data_dest
	.size	data_dest_base, 2

	.type	data_size_base,@object  ; @data_size_base
	.globl	data_size_base
	.align	1
data_size_base:
	.short	data_size
	.size	data_size_base, 2

	.type	gv_index,@object        ; @gv_index
	.globl	gv_index
	.align	1
gv_index:
	.short	0                       ; 0x0
	.size	gv_index, 2

	.type	num_dirty_gv,@object    ; @num_dirty_gv
	.globl	num_dirty_gv
	.align	1
num_dirty_gv:
	.short	0                       ; 0x0
	.size	num_dirty_gv, 2

	.type	curtime,@object         ; @curtime
	.globl	curtime
	.align	1
curtime:
	.short	0                       ; 0x0
	.size	curtime, 2

	.type	context_3,@object       ; @context_3
	.globl	context_3
	.align	1
context_3:
	.zero	6
	.size	context_3, 6

	.type	context_2,@object       ; @context_2
	.globl	context_2
	.align	1
context_2:
	.short	_task__entry_task
	.short	0                       ; 0x0
	.short	context_3
	.size	context_2, 6

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
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 52ed5ec631b0bbf5c714baa0cd83c33ebfe0c6aa) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.ident	"clang version 3.8.0 (http://llvm.org/git/clang.git 5d5e0a9c209901f8d08ce6f71fcf11258e1ea946) (http://llvm.org/git/llvm.git 81386d4b4fdd80f038fd4ebddc59613770ea236c)"
	.section	".note.GNU-stack","",@progbits
