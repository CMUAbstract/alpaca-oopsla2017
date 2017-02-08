	.text
	.file	"templog.a.bc"
	.globl	init
	.align	2
	.type	init,@function
init:                                   ; @init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	call	#init_hw
	call	#edb_init
	;APP
	eint { nop
	;NO_APP
	jmp	.LBB0_1
.LBB0_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	6(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB0_2
.LBB0_2:                                ; %do.end
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end0:
	.size	init, .Lfunc_end0-init

	.globl	task_init
	.align	2
	.type	task_init,@function
task_init:                              ; @task_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	#11, -4(r4)
	jmp	.LBB1_1
.LBB1_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.1, 0(r12)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_2
.LBB1_2:                                ; %do.end
	jmp	.LBB1_3
.LBB1_3:                                ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#2, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_4
.LBB1_4:                                ; %do.end.3
	jmp	.LBB1_5
.LBB1_5:                                ; %do.body.4
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#2, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_6
.LBB1_6:                                ; %do.end.6
	jmp	.LBB1_7
.LBB1_7:                                ; %do.body.7
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_8
.LBB1_8:                                ; %do.end.9
	mov.w	#0, -2(r4)
	jmp	.LBB1_9
.LBB1_9:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB1_12
	jmp	.LBB1_10
.LBB1_10:                               ; %for.body
                                        ;   in Loop: Header=BB1_9 Depth=1
	mov.w	-2(r4), r12
	mov.b	pubkey(r12), r13
	rla.w	r12
	mov.w	r13, _global_modulus(r12)
	jmp	.LBB1_11
.LBB1_11:                               ; %for.inc
                                        ;   in Loop: Header=BB1_9 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB1_9
.LBB1_12:                               ; %for.end
	jmp	.LBB1_13
.LBB1_13:                               ; %do.body.11
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.5, 0(r12)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_14
.LBB1_14:                               ; %do.end.13
	mov.w	-4(r4), r12
	mov.w	r12, &_global_message_length
	mov.w	#0, &_global_block_offset
	mov.w	#0, &_global_cyphertext_len
	jmp	.LBB1_15
.LBB1_15:                               ; %do.body.14
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.6, 0(r12)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB1_16
.LBB1_16:                               ; %do.end.16
	mov.w	#_task_task_pad, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	task_init, .Lfunc_end1-task_init

	.globl	task_pad
	.align	2
	.type	task_pad,@function
task_pad:                               ; @task_pad
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	&_global_block_offset, r12
	mov.w	r12, &_global_block_offset_bak
	jmp	.LBB2_1
.LBB2_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_message_length, r12
	mov.w	&_global_block_offset_bak, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.7, 0(r14)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_2
.LBB2_2:                                ; %do.end
	mov.w	&_global_block_offset_bak, r12
	mov.w	&_global_message_length, r13
	cmp.w	r13, r12
	jlo	.LBB2_6
	jmp	.LBB2_3
.LBB2_3:                                ; %if.then
	jmp	.LBB2_4
.LBB2_4:                                ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.8, 0(r12)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_5
.LBB2_5:                                ; %do.end.3
	mov.w	#_global_block_offset, r14
	mov.w	#_global_block_offset_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_print_cyphertext, r15
	call	#transition_to
	jmp	.LBB2_6
.LBB2_6:                                ; %if.end
	jmp	.LBB2_7
.LBB2_7:                                ; %do.body.4
	call	#request_non_interactive_debug_mode
	mov.w	&_global_block_offset_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.9, 0(r13)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_8
.LBB2_8:                                ; %do.end.6
	mov.w	#0, -2(r4)
	jmp	.LBB2_9
.LBB2_9:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jne	.LBB2_14
	jmp	.LBB2_10
.LBB2_10:                               ; %for.body
                                        ;   in Loop: Header=BB2_9 Depth=1
	jmp	.LBB2_11
.LBB2_11:                               ; %do.body.8
                                        ;   in Loop: Header=BB2_9 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	mov.b	PAD_DIGITS(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#printf
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_12
.LBB2_12:                               ; %do.end.10
                                        ;   in Loop: Header=BB2_9 Depth=1
	jmp	.LBB2_13
.LBB2_13:                               ; %for.inc
                                        ;   in Loop: Header=BB2_9 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_9
.LBB2_14:                               ; %for.end
	jmp	.LBB2_15
.LBB2_15:                               ; %do.body.11
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.11, 0(r12)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_16
.LBB2_16:                               ; %do.end.13
	mov.w	#6, -2(r4)
	jmp	.LBB2_17
.LBB2_17:                               ; %for.cond.14
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB2_22
	jmp	.LBB2_18
.LBB2_18:                               ; %for.body.17
                                        ;   in Loop: Header=BB2_17 Depth=1
	jmp	.LBB2_19
.LBB2_19:                               ; %do.body.18
                                        ;   in Loop: Header=BB2_17 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_block_offset_bak, r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.b	PLAINTEXT(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_20
.LBB2_20:                               ; %do.end.22
                                        ;   in Loop: Header=BB2_17 Depth=1
	jmp	.LBB2_21
.LBB2_21:                               ; %for.inc.23
                                        ;   in Loop: Header=BB2_17 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_17
.LBB2_22:                               ; %for.end.24
	jmp	.LBB2_23
.LBB2_23:                               ; %do.body.25
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.12, 0(r12)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_24
.LBB2_24:                               ; %do.end.27
	;DEBUG_VALUE: task_pad:zero <- [FP+-4]
	mov.w	#0, -4(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB2_25
.LBB2_25:                               ; %for.cond.28
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#7, r12
	jhs	.LBB2_31
	jmp	.LBB2_26
.LBB2_26:                               ; %for.body.31
                                        ;   in Loop: Header=BB2_25 Depth=1
	mov.w	&_global_block_offset_bak, r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.w	&_global_message_length, r13
	cmp.w	r13, r12
	jhs	.LBB2_28
	jmp	.LBB2_27
.LBB2_27:                               ; %cond.true
                                        ;   in Loop: Header=BB2_25 Depth=1
	mov.w	&_global_block_offset_bak, r12
	mov.w	-2(r4), r13
	add.w	r13, r12
	mov.b	PLAINTEXT(r12), r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_29
.LBB2_28:                               ; %cond.false
                                        ;   in Loop: Header=BB2_25 Depth=1
	mov.w	#255, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_29
.LBB2_29:                               ; %cond.end
                                        ;   in Loop: Header=BB2_25 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.w	-2(r4), r13
	rla.w	r13
	mov.w	r12, _global_base(r13)
	jmp	.LBB2_30
.LBB2_30:                               ; %for.inc.39
                                        ;   in Loop: Header=BB2_25 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_25
.LBB2_31:                               ; %for.end.41
	mov.w	#7, -2(r4)
	jmp	.LBB2_32
.LBB2_32:                               ; %for.cond.42
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB2_35
	jmp	.LBB2_33
.LBB2_33:                               ; %for.body.45
                                        ;   in Loop: Header=BB2_32 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	#1, _global_base(r12)
	jmp	.LBB2_34
.LBB2_34:                               ; %for.inc.47
                                        ;   in Loop: Header=BB2_32 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_32
.LBB2_35:                               ; %for.end.49
	mov.w	#1, &_global_block
	mov.w	#1, -2(r4)
	jmp	.LBB2_36
.LBB2_36:                               ; %for.cond.50
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB2_39
	jmp	.LBB2_37
.LBB2_37:                               ; %for.body.53
                                        ;   in Loop: Header=BB2_36 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	#0, _global_block(r12)
	jmp	.LBB2_38
.LBB2_38:                               ; %for.inc.55
                                        ;   in Loop: Header=BB2_36 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_36
.LBB2_39:                               ; %for.end.57
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
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_pad, .Lfunc_end2-task_pad

	.globl	task_exp
	.align	2
	.type	task_exp,@function
task_exp:                               ; @task_exp
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&_global_exponent, r12
	mov.w	r12, &_global_exponent_bak
	jmp	.LBB3_1
.LBB3_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_exponent_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.13, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB3_2
.LBB3_2:                                ; %do.end
	mov.b	&_global_exponent_bak, r12
	bit.b	#1, r12
	jeq	.LBB3_4
	jmp	.LBB3_3
.LBB3_3:                                ; %if.then
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
	jmp	.LBB3_5
.LBB3_4:                                ; %if.else
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
	jmp	.LBB3_5
.LBB3_5:                                ; %if.end
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_exp, .Lfunc_end3-task_exp

	.globl	task_mult_block
	.align	2
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	jmp	.LBB4_1
.LBB4_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.14, 0(r12)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB4_2
.LBB4_2:                                ; %do.end
	mov.w	#_task_task_mult_block_get_result, &_global_next_task
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_mult_block, .Lfunc_end4-task_mult_block

	.globl	task_mult_block_get_result
	.align	2
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	&_global_cyphertext_len, r12
	mov.w	r12, &_global_cyphertext_len_bak
	jmp	.LBB5_1
.LBB5_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.15, 0(r12)
	call	#printf
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB5_2
.LBB5_2:                                ; %do.end
	mov.w	#7, -2(r4)
	jmp	.LBB5_3
.LBB5_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB5_8
	jmp	.LBB5_4
.LBB5_4:                                ; %for.body
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_block(r12)
	jmp	.LBB5_5
.LBB5_5:                                ; %do.body.2
                                        ;   in Loop: Header=BB5_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB5_6
.LBB5_6:                                ; %do.end.5
                                        ;   in Loop: Header=BB5_3 Depth=1
	jmp	.LBB5_7
.LBB5_7:                                ; %for.inc
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB5_3
.LBB5_8:                                ; %for.end
	jmp	.LBB5_9
.LBB5_9:                                ; %do.body.6
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.12, 0(r12)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB5_10
.LBB5_10:                               ; %do.end.8
	mov.w	&_global_exponent, r12
	cmp.w	#0, r12
	jeq	.LBB5_12
	jmp	.LBB5_11
.LBB5_11:                               ; %if.then
	mov.w	#_global_cyphertext_len, r14
	mov.w	#_global_cyphertext_len_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_square_base, r15
	call	#transition_to
	jmp	.LBB5_24
.LBB5_12:                               ; %if.else
	jmp	.LBB5_13
.LBB5_13:                               ; %do.body.10
	call	#request_non_interactive_debug_mode
	mov.w	&_global_cyphertext_len_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.16, 0(r13)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB5_14
.LBB5_14:                               ; %do.end.12
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#8, r12
	cmp.w	#17, r12
	jhs	.LBB5_20
	jmp	.LBB5_15
.LBB5_15:                               ; %if.then.14
	mov.w	#0, -2(r4)
	jmp	.LBB5_16
.LBB5_16:                               ; %for.cond.15
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB5_19
	jmp	.LBB5_17
.LBB5_17:                               ; %for.body.17
                                        ;   in Loop: Header=BB5_16 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.w	&_global_cyphertext_len_bak, r13
	rla.w	r13
	mov.w	r12, _global_cyphertext(r13)
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_cyphertext_len_bak
	jmp	.LBB5_18
.LBB5_18:                               ; %for.inc.20
                                        ;   in Loop: Header=BB5_16 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB5_16
.LBB5_19:                               ; %for.end.22
	jmp	.LBB5_21
.LBB5_20:                               ; %if.else.23
	mov.w	&_global_cyphertext_len_bak, r12
	add.w	#8, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#16, 4(r13)
	mov.w	#.L.str.17, 0(r13)
	call	#printf
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_21
.LBB5_21:                               ; %if.end
	jmp	.LBB5_22
.LBB5_22:                               ; %do.body.26
	call	#request_non_interactive_debug_mode
	mov.w	&_global_cyphertext_len_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.18, 0(r13)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB5_23
.LBB5_23:                               ; %do.end.28
	mov.w	#_global_cyphertext_len, r14
	mov.w	#_global_cyphertext_len_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_pad, r15
	call	#transition_to
	jmp	.LBB5_24
.LBB5_24:                               ; %if.end.29
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_mult_block_get_result, .Lfunc_end5-task_mult_block_get_result

	.globl	task_square_base
	.align	2
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	jmp	.LBB6_1
.LBB6_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.19, 0(r12)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB6_2
.LBB6_2:                                ; %do.end
	mov.w	#_task_task_square_base_get_result, &_global_next_task
	mov.w	#_task_task_mult_mod, r15
	call	#transition_to
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_square_base, .Lfunc_end6-task_square_base

	.globl	task_square_base_get_result
	.align	2
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	jmp	.LBB7_1
.LBB7_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.20, 0(r12)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB7_2
.LBB7_2:                                ; %do.end
	mov.w	#0, -2(r4)
	jmp	.LBB7_3
.LBB7_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jge	.LBB7_8
	jmp	.LBB7_4
.LBB7_4:                                ; %for.body
                                        ;   in Loop: Header=BB7_3 Depth=1
	jmp	.LBB7_5
.LBB7_5:                                ; %do.body.1
                                        ;   in Loop: Header=BB7_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.21, 0(r14)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB7_6
.LBB7_6:                                ; %do.end.3
                                        ;   in Loop: Header=BB7_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_base(r12)
	jmp	.LBB7_7
.LBB7_7:                                ; %for.inc
                                        ;   in Loop: Header=BB7_3 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB7_3
.LBB7_8:                                ; %for.end
	mov.w	#_task_task_exp, r15
	call	#transition_to
	add.w	#14, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_square_base_get_result, .Lfunc_end7-task_square_base_get_result

	.globl	task_print_cyphertext
	.align	2
	.type	task_print_cyphertext,@function
task_print_cyphertext:                  ; @task_print_cyphertext
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	#0, -4(r4)
	jmp	.LBB8_1
.LBB8_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_cyphertext_len, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.22, 0(r13)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB8_2
.LBB8_2:                                ; %do.end
	mov.w	#0, -2(r4)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	&_global_cyphertext_len, r13
	cmp.w	r13, r12
	jhs	.LBB8_14
	jmp	.LBB8_4
.LBB8_4:                                ; %for.body
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_cyphertext(r12), r12
	mov.w	r12, -6(r4)
	jmp	.LBB8_5
.LBB8_5:                                ; %do.body.1
                                        ;   in Loop: Header=BB8_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-6(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.23, 0(r13)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB8_6
.LBB8_6:                                ; %do.end.3
                                        ;   in Loop: Header=BB8_3 Depth=1
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
	jne	.LBB8_12
	jmp	.LBB8_7
.LBB8_7:                                ; %if.then
                                        ;   in Loop: Header=BB8_3 Depth=1
	jmp	.LBB8_8
.LBB8_8:                                ; %do.body.5
                                        ;   in Loop: Header=BB8_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.24, 0(r12)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB8_9
.LBB8_9:                                ; %do.end.7
                                        ;   in Loop: Header=BB8_3 Depth=1
	jmp	.LBB8_10
.LBB8_10:                               ; %do.body.8
                                        ;   in Loop: Header=BB8_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.12, 0(r12)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB8_11
.LBB8_11:                               ; %do.end.10
                                        ;   in Loop: Header=BB8_3 Depth=1
	jmp	.LBB8_12
.LBB8_12:                               ; %if.end
                                        ;   in Loop: Header=BB8_3 Depth=1
	jmp	.LBB8_13
.LBB8_13:                               ; %for.inc
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB8_3
.LBB8_14:                               ; %for.end
	mov.w	#_task_task_print_cyphertext, r15
	call	#transition_to
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_print_cyphertext, .Lfunc_end8-task_print_cyphertext

	.globl	task_mult_mod
	.align	2
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	jmp	.LBB9_1
.LBB9_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.25, 0(r12)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB9_2
.LBB9_2:                                ; %do.end
	mov.w	#0, &_global_digit
	mov.w	#0, &_global_carry
	mov.w	#_task_task_mult, r15
	call	#transition_to
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_mult_mod, .Lfunc_end9-task_mult_mod

	.globl	task_mult
	.align	2
	.type	task_mult,@function
task_mult:                              ; @task_mult
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#32, r1
	mov.w	&_global_carry, r12
	mov.w	r12, &_global_carry_bak
	mov.w	&_global_digit, r12
	mov.w	r12, &_global_digit_bak
	jmp	.LBB10_1
.LBB10_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_digit_bak, r12
	mov.w	&_global_carry_bak, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.26, 0(r14)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB10_2
.LBB10_2:                               ; %do.end
	mov.w	&_global_carry_bak, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -10(r4)
	mov.w	#0, -4(r4)
	jmp	.LBB10_3
.LBB10_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#8, r12
	jge	.LBB10_11
	jmp	.LBB10_4
.LBB10_4:                               ; %for.body
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	&_global_digit_bak, r12
	mov.w	-4(r4), r13
	sub.w	r13, r12
	cmp.w	#0, r12
	jlo	.LBB10_9
	jmp	.LBB10_5
.LBB10_5:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	&_global_digit_bak, r12
	mov.w	-4(r4), r13
	sub.w	r13, r12
	cmp.w	#8, r12
	jhs	.LBB10_9
	jmp	.LBB10_6
.LBB10_6:                               ; %if.then
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	&_global_digit_bak, r12
	mov.w	-4(r4), r13
	sub.w	r13, r12
	rla.w	r12
	mov.w	_global_base(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r12
	rla.w	r12
	mov.w	_global_block(r12), r12
	mov.w	r12, -8(r4)
	mov.w	-6(r4), r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	r15, -12(r4)
	mov.b	-11(r4), r12
	mov.w	-10(r4), r13
	add.w	r12, r13
	mov.w	r13, -10(r4)
	mov.b	-12(r4), r12
	mov.w	-14(r4), r13
	add.w	r12, r13
	mov.w	r13, -14(r4)
	jmp	.LBB10_7
.LBB10_7:                               ; %do.body.7
                                        ;   in Loop: Header=BB10_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	mov.w	-8(r4), r14
	mov.w	-14(r4), r15
	mov.w	r1, r11
	mov.w	r15, 8(r11)
	mov.w	r14, 6(r11)
	mov.w	r13, 4(r11)
	mov.w	r12, 2(r11)
	mov.w	#.L.str.27, 0(r11)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB10_8
.LBB10_8:                               ; %do.end.9
                                        ;   in Loop: Header=BB10_3 Depth=1
	jmp	.LBB10_9
.LBB10_9:                               ; %if.end
                                        ;   in Loop: Header=BB10_3 Depth=1
	jmp	.LBB10_10
.LBB10_10:                              ; %for.inc
                                        ;   in Loop: Header=BB10_3 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB10_3
.LBB10_11:                              ; %for.end
	mov.b	-13(r4), r12
	mov.w	-10(r4), r13
	add.w	r12, r13
	mov.w	r13, -10(r4)
	mov.b	-14(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB10_12
.LBB10_12:                              ; %do.body.13
	call	#request_non_interactive_debug_mode
	mov.w	-10(r4), r12
	mov.w	-14(r4), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.28, 0(r14)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB10_13
.LBB10_13:                              ; %do.end.15
	mov.w	-14(r4), r12
	mov.w	&_global_digit_bak, r13
	rla.w	r13
	mov.w	r12, _global_product(r13)
	mov.b	#0, &_global_print_which
	mov.w	&_global_digit_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_digit_bak
	cmp.w	#16, r12
	jhs	.LBB10_15
	jmp	.LBB10_14
.LBB10_14:                              ; %if.then.19
	mov.w	-10(r4), r12
	mov.w	r12, &_global_carry_bak
	mov.w	#_global_carry_bak, r15
	mov.w	#_global_carry, r14
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_digit, r14
	mov.w	#_global_digit_bak, r15
	mov.w	-22(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_mult, r15
	call	#transition_to
	jmp	.LBB10_16
.LBB10_15:                              ; %if.else
	mov.w	#_task_task_reduce_digits, &_global_next_task_print
	mov.w	#_global_carry, r14
	mov.w	#_global_carry_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_digit, r14
	mov.w	#_global_digit_bak, r15
	mov.w	-24(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	jmp	.LBB10_16
.LBB10_16:                              ; %if.end.20
	add.w	#32, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_mult, .Lfunc_end10-task_mult

	.globl	task_reduce_digits
	.align	2
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	jmp	.LBB11_1
.LBB11_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.29, 0(r12)
	call	#printf
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB11_2
.LBB11_2:                               ; %do.end
	mov.w	#16, -2(r4)
	jmp	.LBB11_3
.LBB11_3:                               ; %do.body.1
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB11_4
.LBB11_4:                               ; %do.body.2
                                        ;   in Loop: Header=BB11_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.30, 0(r14)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB11_5
.LBB11_5:                               ; %do.end.4
                                        ;   in Loop: Header=BB11_3 Depth=1
	jmp	.LBB11_6
.LBB11_6:                               ; %do.cond
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -7(r4)             ; 1-byte Folded Spill
	jne	.LBB11_10
	jmp	.LBB11_7
.LBB11_7:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-2(r4), r12
	mov.w	#0, r13
	mov.w	#1, r14
	cmp.w	#1, r12
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	mov.w	r14, -12(r4)            ; 2-byte Folded Spill
	jge	.LBB11_9
; BB#8:                                 ; %land.rhs
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
.LBB11_9:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -7(r4)             ; 1-byte Folded Spill
	jmp	.LBB11_10
.LBB11_10:                              ; %land.end
                                        ;   in Loop: Header=BB11_3 Depth=1
	mov.b	-7(r4), r12             ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jne	.LBB11_3
	jmp	.LBB11_11
.LBB11_11:                              ; %do.end.7
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	cmp.w	#0, r12
	jne	.LBB11_15
	jmp	.LBB11_12
.LBB11_12:                              ; %if.then
	jmp	.LBB11_13
.LBB11_13:                              ; %do.body.10
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.31, 0(r12)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB11_14
.LBB11_14:                              ; %do.end.13
	mov.w	#_task_task_init, r15
	call	#transition_to
	jmp	.LBB11_15
.LBB11_15:                              ; %if.end
	jmp	.LBB11_16
.LBB11_16:                              ; %do.body.14
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.32, 0(r13)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB11_17
.LBB11_17:                              ; %do.end.17
	mov.w	-2(r4), r12
	mov.w	r12, &_global_reduce
	mov.w	#_task_task_reduce_normalizable, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_reduce_digits, .Lfunc_end11-task_reduce_digits

	.globl	task_reduce_normalizable
	.align	2
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#30, r1
	mov.b	#1, -11(r4)
	jmp	.LBB12_1
.LBB12_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.33, 0(r12)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB12_2
.LBB12_2:                               ; %do.end
	mov.w	&_global_reduce, r12
	mov.w	r12, -10(r4)
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, &_global_offset
	jmp	.LBB12_3
.LBB12_3:                               ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce, r12
	mov.w	&_global_offset, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.34, 0(r14)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB12_4
.LBB12_4:                               ; %do.end.3
	mov.w	&_global_reduce, r12
	mov.w	r12, -4(r4)
	jmp	.LBB12_5
.LBB12_5:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jl	.LBB12_15
	jmp	.LBB12_6
.LBB12_6:                               ; %for.body
                                        ;   in Loop: Header=BB12_5 Depth=1
	jmp	.LBB12_7
.LBB12_7:                               ; %do.body.4
                                        ;   in Loop: Header=BB12_5 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	&_global_offset, r14
	mov.w	r12, r15
	sub.w	r14, r15
	mov.w	r15, r14
	rla.w	r14
	mov.w	_global_modulus(r14), r14
	mov.w	r1, r11
	mov.w	r14, 8(r11)
	mov.w	r15, 6(r11)
	mov.w	r13, 4(r11)
	mov.w	r12, 2(r11)
	mov.w	#.L.str.35, 0(r11)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB12_8
.LBB12_8:                               ; %do.end.9
                                        ;   in Loop: Header=BB12_5 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	&_global_offset, r14
	sub.w	r14, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	cmp.w	r13, r12
	jhs	.LBB12_10
	jmp	.LBB12_9
.LBB12_9:                               ; %if.then
	jmp	.LBB12_15
.LBB12_10:                              ; %if.else
                                        ;   in Loop: Header=BB12_5 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	&_global_offset, r14
	sub.w	r14, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	cmp.w	r12, r13
	jhs	.LBB12_12
	jmp	.LBB12_11
.LBB12_11:                              ; %if.then.18
	mov.b	#0, -11(r4)
	jmp	.LBB12_15
.LBB12_12:                              ; %if.end
                                        ;   in Loop: Header=BB12_5 Depth=1
	jmp	.LBB12_13
.LBB12_13:                              ; %if.end.19
                                        ;   in Loop: Header=BB12_5 Depth=1
	jmp	.LBB12_14
.LBB12_14:                              ; %for.inc
                                        ;   in Loop: Header=BB12_5 Depth=1
	mov.w	-4(r4), r12
	add.w	#-1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB12_5
.LBB12_15:                              ; %for.end
	mov.b	-11(r4), r12
	bit.w	#1, r12
	jne	.LBB12_20
	jmp	.LBB12_16
.LBB12_16:                              ; %land.lhs.true
	mov.w	&_global_reduce, r12
	cmp.w	#7, r12
	jne	.LBB12_20
	jmp	.LBB12_17
.LBB12_17:                              ; %if.then.21
	jmp	.LBB12_18
.LBB12_18:                              ; %do.body.22
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.36, 0(r12)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB12_19
.LBB12_19:                              ; %do.end.24
	mov.w	&_global_next_task, r15
	call	#transition_to
	jmp	.LBB12_20
.LBB12_20:                              ; %if.end.25
	jmp	.LBB12_21
.LBB12_21:                              ; %do.body.26
	call	#request_non_interactive_debug_mode
	mov.b	-11(r4), r12
	and.w	#1, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.37, 0(r13)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB12_22
.LBB12_22:                              ; %do.end.29
	mov.b	-11(r4), r12
	bit.w	#1, r12
	jeq	.LBB12_24
	jmp	.LBB12_23
.LBB12_23:                              ; %if.then.31
	mov.w	#_task_task_reduce_normalize, r15
	call	#transition_to
	jmp	.LBB12_25
.LBB12_24:                              ; %if.else.32
	mov.w	#_task_task_reduce_n_divisor, r15
	call	#transition_to
	jmp	.LBB12_25
.LBB12_25:                              ; %if.end.33
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_reduce_normalizable, .Lfunc_end12-task_reduce_normalizable

	.globl	task_reduce_normalize
	.align	2
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	sub.w	#42, r1
	jmp	.LBB13_1
.LBB13_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.38, 0(r12)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB13_2
.LBB13_2:                               ; %do.end
	;DEBUG_VALUE: task_reduce_normalize:i <- [FP+-12]
	mov.b	#0, &_global_print_which
	mov.w	#0, -16(r4)
	mov.w	#0, -18(r4)
	jmp	.LBB13_3
.LBB13_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jge	.LBB13_15
	jmp	.LBB13_4
.LBB13_4:                               ; %for.body
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	&_global_offset, r13
	add.w	r13, r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jeq	.LBB13_6
	jmp	.LBB13_5
.LBB13_5:                               ; %for.body.split1
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB13_6
.LBB13_6:                               ; %for.body.split
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -8(r4)
	mov.w	-18(r4), r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -10(r4)
	mov.w	-16(r4), r13
	add.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	-8(r4), r13
	cmp.w	r12, r13
	jhs	.LBB13_8
	jmp	.LBB13_7
.LBB13_7:                               ; %if.then
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-8(r4), r12
	add.w	#256, r12
	mov.w	r12, -8(r4)
	mov.w	#1, -16(r4)
	jmp	.LBB13_9
.LBB13_8:                               ; %if.else
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	#0, -16(r4)
	jmp	.LBB13_9
.LBB13_9:                               ; %if.end
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-8(r4), r12
	mov.w	-14(r4), r13
	sub.w	r13, r12
	mov.w	r12, -12(r4)
	jmp	.LBB13_10
.LBB13_10:                              ; %do.body.5
                                        ;   in Loop: Header=BB13_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-18(r4), r12
	mov.w	&_global_offset, r13
	mov.w	r12, r14
	add.w	r13, r14
	mov.w	-8(r4), r13
	mov.w	-10(r4), r15
	mov.w	-16(r4), r11
	mov.w	-12(r4), r10
	mov.w	r1, r9
	mov.w	r10, 12(r9)
	mov.w	r11, 10(r9)
	mov.w	r15, 8(r9)
	mov.w	r12, 6(r9)
	mov.w	r13, 4(r9)
	mov.w	r14, 2(r9)
	mov.w	#.L.str.39, 0(r9)
	call	#printf
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB13_11
.LBB13_11:                              ; %do.end.8
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-12(r4), r12
	mov.w	-18(r4), r13
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
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	mov.w	r14, -30(r4)            ; 2-byte Folded Spill
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	jeq	.LBB13_13
	jmp	.LBB13_12
.LBB13_12:                              ; %do.end.8.split2
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	#2, r13
	mov.w	-32(r4), r15            ; 2-byte Folded Reload
	mov.w	-30(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	mov.w	-26(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB13_13
.LBB13_13:                              ; %do.end.8.split
                                        ;   in Loop: Header=BB13_3 Depth=1
	jmp	.LBB13_14
.LBB13_14:                              ; %for.inc
                                        ;   in Loop: Header=BB13_3 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB13_3
.LBB13_15:                              ; %for.end
	mov.w	&_global_offset, r12
	cmp.w	#0, r12
	jeq	.LBB13_17
	jmp	.LBB13_16
.LBB13_16:                              ; %if.then.12
	mov.w	#_task_task_reduce_n_divisor, &_global_next_task_print
	jmp	.LBB13_20
.LBB13_17:                              ; %if.else.13
	jmp	.LBB13_18
.LBB13_18:                              ; %do.body.14
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.40, 0(r12)
	call	#printf
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB13_19
.LBB13_19:                              ; %do.end.16
	mov.w	&_global_next_task, r12
	mov.w	r12, &_global_next_task_print
	jmp	.LBB13_20
.LBB13_20:                              ; %if.end.17
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#42, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_reduce_normalize, .Lfunc_end13-task_reduce_normalize

	.globl	task_reduce_n_divisor
	.align	2
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	jmp	.LBB14_1
.LBB14_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.41, 0(r12)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB14_2
.LBB14_2:                               ; %do.end
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
	jmp	.LBB14_3
.LBB14_3:                               ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_modulus+14, r12
	mov.w	&_global_modulus+12, r13
	mov.w	&_global_n_div, r14
	mov.w	r1, r15
	mov.w	r14, 6(r15)
	mov.w	r13, 4(r15)
	mov.w	r12, 2(r15)
	mov.w	#.L.str.42, 0(r15)
	call	#printf
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB14_4
.LBB14_4:                               ; %do.end.3
	mov.w	#_task_task_reduce_quotient, r15
	call	#transition_to
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end14:
	.size	task_reduce_n_divisor, .Lfunc_end14-task_reduce_n_divisor

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
	sub.w	#54, r1
	mov.w	&_global_quotient, r12
	mov.w	r12, &_global_quotient_bak
	mov.w	&_global_reduce, r12
	mov.w	r12, &_global_reduce_bak
	jmp	.LBB15_1
.LBB15_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.43, 0(r13)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_2
.LBB15_2:                               ; %do.end
	jmp	.LBB15_3
.LBB15_3:                               ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_modulus+14, r12
	mov.w	&_global_reduce_bak, r13
	rla.w	r13
	mov.w	_global_product(r13), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.44, 0(r14)
	call	#printf
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_4
.LBB15_4:                               ; %do.end.3
	mov.w	&_global_reduce_bak, r12
	rla.w	r12
	mov.w	_global_product(r12), r12
	mov.w	&_global_modulus+14, r13
	cmp.w	r13, r12
	jne	.LBB15_6
	jmp	.LBB15_5
.LBB15_5:                               ; %if.then
	mov.w	#255, &_global_quotient_bak
	jmp	.LBB15_7
.LBB15_6:                               ; %if.else
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
	jmp	.LBB15_7
.LBB15_7:                               ; %if.end
	jmp	.LBB15_8
.LBB15_8:                               ; %do.body.7
	call	#request_non_interactive_debug_mode
	mov.w	-10(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.45, 0(r13)
	call	#printf
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_9
.LBB15_9:                               ; %do.end.9
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
	jmp	.LBB15_10
.LBB15_10:                              ; %do.body.21
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce_bak, r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	_global_product-2(r12), r14
	mov.w	_global_product-4(r12), r12
	mov.w	-18(r4), r15
	mov.w	-20(r4), r11
	mov.w	r1, r10
	mov.w	r11, 10(r10)
	mov.w	r15, 8(r10)
	mov.w	r12, 6(r10)
	mov.w	r14, 4(r10)
	mov.w	r13, 2(r10)
	mov.w	#.L.str.46, 0(r10)
	call	#printf
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_11
.LBB15_11:                              ; %do.end.31
	jmp	.LBB15_12
.LBB15_12:                              ; %do.body.32
	call	#request_non_interactive_debug_mode
	mov.w	&_global_n_div, r12
	mov.w	&_global_quotient_bak, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.47, 0(r14)
	call	#printf
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_13
.LBB15_13:                              ; %do.end.34
	mov.w	&_global_quotient_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_quotient_bak
	jmp	.LBB15_14
.LBB15_14:                              ; %do.body.35
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&_global_quotient_bak, r12
	add.w	#-1, r12
	mov.w	r12, &_global_quotient_bak
	mov.w	&_global_n_div, r15
	mov.w	r12, r14
	call	#mult16
	mov.w	r15, -14(r4)
	mov.w	r14, -16(r4)
	jmp	.LBB15_15
.LBB15_15:                              ; %do.body.37
                                        ;   in Loop: Header=BB15_14 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-14(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.48, 0(r13)
	call	#printf
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_16
.LBB15_16:                              ; %do.end.42
                                        ;   in Loop: Header=BB15_14 Depth=1
	jmp	.LBB15_17
.LBB15_17:                              ; %do.body.43
                                        ;   in Loop: Header=BB15_14 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-16(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.49, 0(r13)
	call	#printf
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_18
.LBB15_18:                              ; %do.end.47
                                        ;   in Loop: Header=BB15_14 Depth=1
	jmp	.LBB15_19
.LBB15_19:                              ; %do.body.48
                                        ;   in Loop: Header=BB15_14 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_quotient_bak, r12
	mov.w	-14(r4), r13
	mov.w	-16(r4), r14
	mov.w	r1, r15
	mov.w	r14, 6(r15)
	mov.w	r13, 4(r15)
	mov.w	r12, 2(r15)
	mov.w	#.L.str.50, 0(r15)
	call	#printf
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_20
.LBB15_20:                              ; %do.end.55
                                        ;   in Loop: Header=BB15_14 Depth=1
	jmp	.LBB15_21
.LBB15_21:                              ; %do.cond
                                        ;   in Loop: Header=BB15_14 Depth=1
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
	mov.w	r9, -38(r4)             ; 2-byte Folded Spill
	mov.w	r10, -40(r4)            ; 2-byte Folded Spill
	jeq	.LBB15_23
; BB#22:                                ; %do.cond
                                        ;   in Loop: Header=BB15_14 Depth=1
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
.LBB15_23:                              ; %do.cond
                                        ;   in Loop: Header=BB15_14 Depth=1
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB15_14
	jmp	.LBB15_24
.LBB15_24:                              ; %do.end.58
	jmp	.LBB15_25
.LBB15_25:                              ; %do.body.59
	call	#request_non_interactive_debug_mode
	mov.w	&_global_quotient_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.51, 0(r13)
	call	#printf
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB15_26
.LBB15_26:                              ; %do.end.62
	mov.w	#_global_reduce_bak, r15
	mov.w	&_global_reduce_bak, r12
	add.w	#-1, r12
	mov.w	r12, &_global_reduce_bak
	mov.w	#_global_quotient, r14
	mov.w	#_global_quotient_bak, r12
	mov.w	#2, r13
	mov.w	r15, -44(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r13, -46(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_reduce, r14
	mov.w	-44(r4), r15            ; 2-byte Folded Reload
	mov.w	-46(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_reduce_multiply, r15
	call	#transition_to
	add.w	#54, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end15:
	.size	task_reduce_quotient, .Lfunc_end15-task_reduce_quotient

	.globl	task_reduce_multiply
	.align	2
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	sub.w	#30, r1
	jmp	.LBB16_1
.LBB16_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce, r12
	add.w	#1, r12
	mov.w	&_global_quotient, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.52, 0(r14)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB16_2
.LBB16_2:                               ; %do.end
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -16(r4)
	jmp	.LBB16_3
.LBB16_3:                               ; %do.body.2
	call	#request_non_interactive_debug_mode
	mov.w	-16(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.53, 0(r13)
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB16_4
.LBB16_4:                               ; %do.end.4
	mov.w	#0, -8(r4)
	jmp	.LBB16_5
.LBB16_5:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	mov.w	-16(r4), r13
	cmp.w	r13, r12
	jhs	.LBB16_8
	jmp	.LBB16_6
.LBB16_6:                               ; %for.body
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	mov.w	#0, _global_product2(r12)
	jmp	.LBB16_7
.LBB16_7:                               ; %for.inc
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB16_5
.LBB16_8:                               ; %for.end
	mov.w	#0, -14(r4)
	mov.w	-16(r4), r12
	mov.w	r12, -8(r4)
	jmp	.LBB16_9
.LBB16_9:                               ; %for.cond.5
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	cmp.w	#16, r12
	jge	.LBB16_17
	jmp	.LBB16_10
.LBB16_10:                              ; %for.body.7
                                        ;   in Loop: Header=BB16_9 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	mov.w	-8(r4), r12
	mov.w	-16(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB16_12
	jmp	.LBB16_11
.LBB16_11:                              ; %if.then
                                        ;   in Loop: Header=BB16_9 Depth=1
	mov.w	-8(r4), r12
	mov.w	-16(r4), r13
	sub.w	r13, r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -12(r4)
	mov.w	&_global_quotient, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-10(r4), r12
	add.w	r15, r12
	mov.w	r12, -10(r4)
	jmp	.LBB16_13
.LBB16_12:                              ; %if.else
                                        ;   in Loop: Header=BB16_9 Depth=1
	mov.w	#0, -12(r4)
	jmp	.LBB16_13
.LBB16_13:                              ; %if.end
                                        ;   in Loop: Header=BB16_9 Depth=1
	jmp	.LBB16_14
.LBB16_14:                              ; %do.body.13
                                        ;   in Loop: Header=BB16_9 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-8(r4), r12
	mov.w	-16(r4), r13
	mov.w	r12, r14
	sub.w	r13, r14
	mov.w	-12(r4), r13
	mov.w	&_global_quotient, r15
	mov.w	-14(r4), r11
	mov.w	-10(r4), r10
	mov.w	r1, r9
	mov.w	r10, 12(r9)
	mov.w	r12, 10(r9)
	mov.w	r11, 8(r9)
	mov.w	r15, 6(r9)
	mov.w	r13, 4(r9)
	mov.w	r14, 2(r9)
	mov.w	#.L.str.54, 0(r9)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB16_15
.LBB16_15:                              ; %do.end.16
                                        ;   in Loop: Header=BB16_9 Depth=1
	mov.b	-9(r4), r12
	mov.w	r12, -14(r4)
	mov.b	-10(r4), r12
	mov.w	r12, -10(r4)
	mov.w	-8(r4), r13
	rla.w	r13
	mov.w	r12, _global_product2(r13)
	jmp	.LBB16_16
.LBB16_16:                              ; %for.inc.18
                                        ;   in Loop: Header=BB16_9 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB16_9
.LBB16_17:                              ; %for.end.20
	mov.b	#1, &_global_print_which
	mov.w	#_task_task_reduce_compare, &_global_next_task_print
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#30, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end16:
	.size	task_reduce_multiply, .Lfunc_end16-task_reduce_multiply

	.globl	task_reduce_compare
	.align	2
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.b	#61, -3(r4)
	jmp	.LBB17_1
.LBB17_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.55, 0(r12)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB17_2
.LBB17_2:                               ; %do.end
	mov.w	#15, -2(r4)
	jmp	.LBB17_3
.LBB17_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jl	.LBB17_13
	jmp	.LBB17_4
.LBB17_4:                               ; %for.body
                                        ;   in Loop: Header=BB17_3 Depth=1
	jmp	.LBB17_5
.LBB17_5:                               ; %do.body.1
                                        ;   in Loop: Header=BB17_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product(r13), r14
	mov.w	_global_product2(r13), r13
	mov.w	r1, r15
	mov.w	r13, 8(r15)
	mov.w	r12, 6(r15)
	mov.w	r14, 4(r15)
	mov.w	r12, 2(r15)
	mov.w	#.L.str.56, 0(r15)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB17_6
.LBB17_6:                               ; %do.end.4
                                        ;   in Loop: Header=BB17_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	_global_product2(r12), r12
	cmp.w	r13, r12
	jhs	.LBB17_8
	jmp	.LBB17_7
.LBB17_7:                               ; %if.then
	mov.b	#62, -3(r4)
	jmp	.LBB17_13
.LBB17_8:                               ; %if.else
                                        ;   in Loop: Header=BB17_3 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	_global_product2(r12), r12
	cmp.w	r12, r13
	jhs	.LBB17_10
	jmp	.LBB17_9
.LBB17_9:                               ; %if.then.11
	mov.b	#60, -3(r4)
	jmp	.LBB17_13
.LBB17_10:                              ; %if.end
                                        ;   in Loop: Header=BB17_3 Depth=1
	jmp	.LBB17_11
.LBB17_11:                              ; %if.end.12
                                        ;   in Loop: Header=BB17_3 Depth=1
	jmp	.LBB17_12
.LBB17_12:                              ; %for.inc
                                        ;   in Loop: Header=BB17_3 Depth=1
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB17_3
.LBB17_13:                              ; %for.end
	jmp	.LBB17_14
.LBB17_14:                              ; %do.body.13
	call	#request_non_interactive_debug_mode
	mov.b	-3(r4), r12
	sxt	r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.57, 0(r13)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB17_15
.LBB17_15:                              ; %do.end.15
	mov.b	-3(r4), r12
	cmp.b	#60, r12
	jne	.LBB17_17
	jmp	.LBB17_16
.LBB17_16:                              ; %if.then.19
	mov.w	#_task_task_reduce_add, r15
	call	#transition_to
	jmp	.LBB17_18
.LBB17_17:                              ; %if.else.20
	mov.w	#_task_task_reduce_subtract, r15
	call	#transition_to
	jmp	.LBB17_18
.LBB17_18:                              ; %if.end.21
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end17:
	.size	task_reduce_compare, .Lfunc_end17-task_reduce_compare

	.globl	task_reduce_add
	.align	2
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#64, r1
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -20(r4)
	jmp	.LBB18_1
.LBB18_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce, r12
	add.w	#1, r12
	mov.w	-20(r4), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.58, 0(r14)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB18_2
.LBB18_2:                               ; %do.end
	mov.w	#0, -18(r4)
	mov.w	-20(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB18_3
.LBB18_3:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	cmp.w	#16, r12
	jl	4
	br	#.LBB18_23
	jmp	.LBB18_4
.LBB18_4:                               ; %for.body
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-10(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_6
	jmp	.LBB18_5
.LBB18_5:                               ; %for.body.split1
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB18_6
.LBB18_6:                               ; %for.body.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	mov.w	-20(r4), r13
	sub.w	r13, r12
	mov.w	r12, -12(r4)
	mov.w	-10(r4), r12
	mov.w	-20(r4), r13
	add.w	#8, r13
	cmp.w	r13, r12
	jhs	.LBB18_8
	jmp	.LBB18_7
.LBB18_7:                               ; %if.then
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-12(r4), r12
	rla.w	r12
	mov.w	_global_modulus(r12), r12
	mov.w	r12, -16(r4)
	jmp	.LBB18_9
.LBB18_8:                               ; %if.else
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	#0, -16(r4)
	mov.w	#0, -12(r4)
	jmp	.LBB18_9
.LBB18_9:                               ; %if.end
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-18(r4), r12
	mov.w	-14(r4), r13
	add.w	r13, r12
	mov.w	-16(r4), r13
	add.w	r13, r12
	mov.w	-10(r4), r13
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
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	mov.w	r14, -30(r4)            ; 2-byte Folded Spill
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_11
	jmp	.LBB18_10
.LBB18_10:                              ; %if.end.split2
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	#2, r13
	mov.w	-32(r4), r15            ; 2-byte Folded Reload
	mov.w	-30(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	mov.w	-26(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB18_11
.LBB18_11:                              ; %if.end.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	jmp	.LBB18_12
.LBB18_12:                              ; %do.body.9
                                        ;   in Loop: Header=BB18_3 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-10(r4), r12
	mov.w	r12, r13
	mov.w	-14(r4), r14
	mov.w	-12(r4), r15
	mov.w	-16(r4), r11
	mov.w	-18(r4), r10
	mov.w	r12, r9
	rla.w	r9
	mov.w	_global_product_isDirty(r9), r9
	mov.w	&_numBoots, r8
	cmp.w	r8, r9
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	mov.w	r13, -36(r4)            ; 2-byte Folded Spill
	mov.w	r14, -38(r4)            ; 2-byte Folded Spill
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	mov.w	r11, -42(r4)            ; 2-byte Folded Spill
	mov.w	r10, -44(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_14
	jmp	.LBB18_13
.LBB18_13:                              ; %do.body.9.split3
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB18_14
.LBB18_14:                              ; %do.body.9.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 10(r13)
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 8(r13)
	mov.w	-40(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 6(r13)
	mov.w	-38(r4), r11            ; 2-byte Folded Reload
	mov.w	r11, 4(r13)
	mov.w	-36(r4), r10            ; 2-byte Folded Reload
	mov.w	r10, 2(r13)
	mov.w	#.L.str.59, 0(r13)
	call	#printf
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB18_15
.LBB18_15:                              ; %do.end.12
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-10(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_17
	jmp	.LBB18_16
.LBB18_16:                              ; %do.end.12.split4
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB18_17
.LBB18_17:                              ; %do.end.12.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.b	_global_product_bak+1(r12), r12
	mov.w	r12, -18(r4)
	mov.w	-10(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_19
	jmp	.LBB18_18
.LBB18_18:                              ; %do.end.12.split.split5
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB18_19
.LBB18_19:                              ; %do.end.12.split.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
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
	mov.w	r15, -52(r4)            ; 2-byte Folded Spill
	mov.w	r13, -54(r4)            ; 2-byte Folded Spill
	mov.w	r14, -56(r4)            ; 2-byte Folded Spill
	mov.w	r11, -58(r4)            ; 2-byte Folded Spill
	jeq	.LBB18_21
	jmp	.LBB18_20
.LBB18_20:                              ; %do.end.12.split.split.split6
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	#2, r13
	mov.w	-56(r4), r15            ; 2-byte Folded Reload
	mov.w	-54(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-52(r4), r13            ; 2-byte Folded Reload
	mov.w	-58(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB18_21
.LBB18_21:                              ; %do.end.12.split.split.split
                                        ;   in Loop: Header=BB18_3 Depth=1
	jmp	.LBB18_22
.LBB18_22:                              ; %for.inc
                                        ;   in Loop: Header=BB18_3 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	br	#.LBB18_3
.LBB18_23:                              ; %for.end
	mov.b	#0, &_global_print_which
	mov.w	#_task_task_reduce_subtract, &_global_next_task_print
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#64, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end18:
	.size	task_reduce_add, .Lfunc_end18-task_reduce_add

	.globl	task_reduce_subtract
	.align	2
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#56, r1
	jmp	.LBB19_1
.LBB19_1:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.60, 0(r12)
	call	#printf
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB19_2
.LBB19_2:                               ; %do.end
	;DEBUG_VALUE: task_reduce_subtract:i <- [FP+-2]
	;DEBUG_VALUE: task_reduce_subtract:m <- [FP+-4]
	;DEBUG_VALUE: task_reduce_subtract:s <- [FP+-6]
	;DEBUG_VALUE: task_reduce_subtract:qn <- [FP+-8]
	;DEBUG_VALUE: task_reduce_subtract:borrow <- [FP+-10]
	;DEBUG_VALUE: task_reduce_subtract:offset <- [FP+-12]
	mov.w	&_global_reduce, r12
	add.w	#-7, r12
	mov.w	r12, -20(r4)
	jmp	.LBB19_3
.LBB19_3:                               ; %do.body.1
	call	#request_non_interactive_debug_mode
	mov.w	&_global_reduce, r12
	add.w	#1, r12
	mov.w	-20(r4), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.61, 0(r14)
	call	#printf
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB19_4
.LBB19_4:                               ; %do.end.4
	mov.w	#0, -18(r4)
	mov.w	#0, -10(r4)
	jmp	.LBB19_5
.LBB19_5:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	cmp.w	#16, r12
	jge	.LBB19_21
	jmp	.LBB19_6
.LBB19_6:                               ; %for.body
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-10(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_product_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_8
	jmp	.LBB19_7
.LBB19_7:                               ; %for.body.split1
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB19_8
.LBB19_8:                               ; %for.body.split
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-10(r4), r12
	mov.w	-20(r4), r13
	cmp.w	r13, r12
	jlo	.LBB19_19
	jmp	.LBB19_9
.LBB19_9:                               ; %if.then
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	_global_product2(r12), r12
	mov.w	r12, -16(r4)
	mov.w	-18(r4), r13
	add.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB19_11
	jmp	.LBB19_10
.LBB19_10:                              ; %if.then.9
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-12(r4), r12
	add.w	#256, r12
	mov.w	r12, -12(r4)
	mov.w	#1, -18(r4)
	jmp	.LBB19_12
.LBB19_11:                              ; %if.else
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	#0, -18(r4)
	jmp	.LBB19_12
.LBB19_12:                              ; %if.end
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-12(r4), r12
	mov.w	-14(r4), r13
	sub.w	r13, r12
	mov.w	-10(r4), r13
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
	mov.w	r11, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	mov.w	r14, -32(r4)            ; 2-byte Folded Spill
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_14
	jmp	.LBB19_13
.LBB19_13:                              ; %if.end.split2
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	#2, r13
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-30(r4), r13            ; 2-byte Folded Reload
	mov.w	-28(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB19_14
.LBB19_14:                              ; %if.end.split
                                        ;   in Loop: Header=BB19_5 Depth=1
	jmp	.LBB19_15
.LBB19_15:                              ; %do.body.13
                                        ;   in Loop: Header=BB19_5 Depth=1
	call	#request_non_interactive_debug_mode
	mov.w	-10(r4), r12
	mov.w	r12, r13
	mov.w	-12(r4), r14
	mov.w	r12, r15
	mov.w	-16(r4), r11
	mov.w	-18(r4), r10
	mov.w	r12, r9
	rla.w	r9
	mov.w	_global_product_isDirty(r9), r9
	mov.w	&_numBoots, r8
	cmp.w	r8, r9
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	mov.w	r13, -38(r4)            ; 2-byte Folded Spill
	mov.w	r14, -40(r4)            ; 2-byte Folded Spill
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	mov.w	r11, -44(r4)            ; 2-byte Folded Spill
	mov.w	r10, -46(r4)            ; 2-byte Folded Spill
	jeq	.LBB19_17
	jmp	.LBB19_16
.LBB19_16:                              ; %do.body.13.split3
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product(r12), r13
	mov.w	r13, _global_product_bak(r12)
	jmp	.LBB19_17
.LBB19_17:                              ; %do.body.13.split
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_product_bak(r12), r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 10(r13)
	mov.w	-44(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 8(r13)
	mov.w	-42(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 6(r13)
	mov.w	-40(r4), r11            ; 2-byte Folded Reload
	mov.w	r11, 4(r13)
	mov.w	-38(r4), r10            ; 2-byte Folded Reload
	mov.w	r10, 2(r13)
	mov.w	#.L.str.62, 0(r13)
	call	#printf
	mov.w	r15, -48(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB19_18
.LBB19_18:                              ; %do.end.16
                                        ;   in Loop: Header=BB19_5 Depth=1
	jmp	.LBB19_19
.LBB19_19:                              ; %if.end.17
                                        ;   in Loop: Header=BB19_5 Depth=1
	jmp	.LBB19_20
.LBB19_20:                              ; %for.inc
                                        ;   in Loop: Header=BB19_5 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB19_5
.LBB19_21:                              ; %for.end
	mov.b	#0, &_global_print_which
	mov.w	&_global_reduce, r12
	add.w	#1, r12
	cmp.w	#9, r12
	jlo	.LBB19_23
	jmp	.LBB19_22
.LBB19_22:                              ; %if.then.20
	mov.w	#_task_task_reduce_quotient, &_global_next_task_print
	jmp	.LBB19_26
.LBB19_23:                              ; %if.else.21
	jmp	.LBB19_24
.LBB19_24:                              ; %do.body.22
	call	#request_non_interactive_debug_mode
	mov.w	r1, r12
	mov.w	#.L.str.63, 0(r12)
	call	#printf
	mov.w	r15, -50(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB19_25
.LBB19_25:                              ; %do.end.24
	mov.w	&_global_next_task, r12
	mov.w	r12, &_global_next_task_print
	jmp	.LBB19_26
.LBB19_26:                              ; %if.end.25
	mov.w	#_task_task_print_product, r15
	call	#transition_to
	add.w	#56, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end19:
	.size	task_reduce_subtract, .Lfunc_end19-task_reduce_subtract

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
.Lfunc_end20:
	.size	task_print_product, .Lfunc_end20-task_print_product

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
.Lfunc_end21:
	.size	_entry_task, .Lfunc_end21-_entry_task

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
.Lfunc_end22:
	.size	_init, .Lfunc_end22-_init

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
.Lfunc_end23:
	.size	clear_isDirty, .Lfunc_end23-clear_isDirty

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
	mov.w	&_numBoots, r12
	cmp.w	#-1, r12
	jne	.LBB38_2
	jmp	.LBB38_1
.LBB38_1:                               ; %if.then
	call	#clear_isDirty
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	jmp	.LBB38_2
.LBB38_2:                               ; %if.end
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
	jeq	.LBB38_7
	jmp	.LBB38_3
.LBB38_3:                               ; %if.then.3
	jmp	.LBB38_4
.LBB38_4:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB38_6
	jmp	.LBB38_5
.LBB38_5:                               ; %while.body
                                        ;   in Loop: Header=BB38_4 Depth=1
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
	jmp	.LBB38_4
.LBB38_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 8(r13)
	jmp	.LBB38_8
.LBB38_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB38_8
.LBB38_8:                               ; %if.end.10
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
	jeq	.LBB39_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB39_2:                               ; %entry
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
.Lfunc_end39:
	.size	transition_to, .Lfunc_end39-transition_to

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
.Lfunc_end40:
	.size	write_to_gbuf, .Lfunc_end40-write_to_gbuf

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
.Lfunc_end41:
	.size	main, .Lfunc_end41-main

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

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"init\r\n"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"digit: %u\r\n"
	.size	.L.str.2, 12

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"unsigned: %u\r\n"
	.size	.L.str.3, 15

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"init: out modulus\r\n"
	.size	.L.str.4, 20

	.type	pubkey,@object          ; @pubkey
	.section	.ro_nv_vars,"a",@progbits
	.align	1
pubkey:
	.ascii	"\025p\366B\016\202q\246"
	.short	3                       ; 0x3
	.size	pubkey, 10

	.type	.L.str.5,@object        ; @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"init: out exp\r\n"
	.size	.L.str.5, 16

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	"init: done\r\n"
	.size	.L.str.6, 13

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"pad: len=%u offset=%u\r\n"
	.size	.L.str.7, 24

	.type	.L.str.8,@object        ; @.str.8
.L.str.8:
	.asciz	"pad: message done\r\n"
	.size	.L.str.8, 20

	.type	.L.str.9,@object        ; @.str.9
.L.str.9:
	.asciz	"process block: padded block at offset=%u: "
	.size	.L.str.9, 43

	.type	PAD_DIGITS,@object      ; @PAD_DIGITS
	.section	.rodata,"a",@progbits
PAD_DIGITS:
	.byte	1
	.size	PAD_DIGITS, 1

	.type	.L.str.10,@object       ; @.str.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10:
	.asciz	"%x "
	.size	.L.str.10, 4

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"'"
	.size	.L.str.11, 2

	.type	PLAINTEXT,@object       ; @PLAINTEXT
	.section	.ro_nv_vars,"a",@progbits
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	.L.str.12,@object       ; @.str.12
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.12:
	.asciz	"\r\n"
	.size	.L.str.12, 3

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"exp: e=%x\r\n"
	.size	.L.str.13, 12

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"mult block\r\n"
	.size	.L.str.14, 13

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"mult block get result: block: "
	.size	.L.str.15, 31

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"mult block get result: cyphertext len=%u\r\n"
	.size	.L.str.16, 43

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"WARN: block dropped: cyphertext overlow [%u > %u]\r\n"
	.size	.L.str.17, 52

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"mult block get results: block done, cyphertext_len=%u\r\n"
	.size	.L.str.18, 56

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	"square base\r\n"
	.size	.L.str.19, 14

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"square base get result\r\n"
	.size	.L.str.20, 25

	.type	.L.str.21,@object       ; @.str.21
.L.str.21:
	.asciz	"suqare base get result: base[%u]=%x\r\n"
	.size	.L.str.21, 38

	.type	.L.str.22,@object       ; @.str.22
.L.str.22:
	.asciz	"print cyphertext: len=%u\r\n"
	.size	.L.str.22, 27

	.type	.L.str.23,@object       ; @.str.23
.L.str.23:
	.asciz	"%02x "
	.size	.L.str.23, 6

	.type	.L.str.24,@object       ; @.str.24
.L.str.24:
	.asciz	" "
	.size	.L.str.24, 2

	.type	.L.str.25,@object       ; @.str.25
.L.str.25:
	.asciz	"mult mod\r\n"
	.size	.L.str.25, 11

	.type	.L.str.26,@object       ; @.str.26
.L.str.26:
	.asciz	"mult: digit=%u carry=%x\r\n"
	.size	.L.str.26, 26

	.type	.L.str.27,@object       ; @.str.27
.L.str.27:
	.asciz	"mult: i=%u a=%x b=%x p=%x\r\n"
	.size	.L.str.27, 28

	.type	.L.str.28,@object       ; @.str.28
.L.str.28:
	.asciz	"mult: c=%x p=%x\r\n"
	.size	.L.str.28, 18

	.type	.L.str.29,@object       ; @.str.29
.L.str.29:
	.asciz	"reduce: digits\r\n"
	.size	.L.str.29, 17

	.type	.L.str.30,@object       ; @.str.30
.L.str.30:
	.asciz	"reduce digits: p[%u]=%x\r\n"
	.size	.L.str.30, 26

	.type	.L.str.31,@object       ; @.str.31
.L.str.31:
	.asciz	"reduce: digits: all digits of message are zero\r\n"
	.size	.L.str.31, 49

	.type	.L.str.32,@object       ; @.str.32
.L.str.32:
	.asciz	"reduce: digits: d = %u\r\n"
	.size	.L.str.32, 25

	.type	.L.str.33,@object       ; @.str.33
.L.str.33:
	.asciz	"reduce: normalizable\r\n"
	.size	.L.str.33, 23

	.type	.L.str.34,@object       ; @.str.34
.L.str.34:
	.asciz	"reduce: normalizable: d=%u offset=%u\r\n"
	.size	.L.str.34, 39

	.type	.L.str.35,@object       ; @.str.35
.L.str.35:
	.asciz	"normalizable: m[%u]=%x n[%u]=%x\r\n"
	.size	.L.str.35, 34

	.type	.L.str.36,@object       ; @.str.36
.L.str.36:
	.asciz	"reduce: normalizable: reduction done: message < modulus\r\n"
	.size	.L.str.36, 58

	.type	.L.str.37,@object       ; @.str.37
.L.str.37:
	.asciz	"normalizable: %u\r\n"
	.size	.L.str.37, 19

	.type	.L.str.38,@object       ; @.str.38
.L.str.38:
	.asciz	"normalize\r\n"
	.size	.L.str.38, 12

	.type	.L.str.39,@object       ; @.str.39
.L.str.39:
	.asciz	"normalize: m[%u]=%x n[%u]=%x b=%u d=%x\r\n"
	.size	.L.str.39, 41

	.type	.L.str.40,@object       ; @.str.40
.L.str.40:
	.asciz	"reduce: normalize: reduction done: no digits to reduce\r\n"
	.size	.L.str.40, 57

	.type	.L.str.41,@object       ; @.str.41
.L.str.41:
	.asciz	"reduce: n divisor\r\n"
	.size	.L.str.41, 20

	.type	.L.str.42,@object       ; @.str.42
.L.str.42:
	.asciz	"reduce: n divisor: n[1]=%x n[0]=%x n_div=%x\r\n"
	.size	.L.str.42, 46

	.type	.L.str.43,@object       ; @.str.43
.L.str.43:
	.asciz	"reduce: quotient: d=%u\r\n"
	.size	.L.str.43, 25

	.type	.L.str.44,@object       ; @.str.44
.L.str.44:
	.asciz	"reduce: quotient: m_n=%x m[d]=%x\r\n"
	.size	.L.str.44, 35

	.type	.L.str.45,@object       ; @.str.45
.L.str.45:
	.asciz	"reduce: quotient: q0=%x\r\n"
	.size	.L.str.45, 26

	.type	.L.str.46,@object       ; @.str.46
.L.str.46:
	.asciz	"reduce: quotient: m[d]=%x m[d-1]=%x m[d-2]=%x n_q=%x%x\r\n"
	.size	.L.str.46, 57

	.type	.L.str.47,@object       ; @.str.47
.L.str.47:
	.asciz	"reduce: quotient: n_div=%x q0=%x\r\n"
	.size	.L.str.47, 35

	.type	.L.str.48,@object       ; @.str.48
.L.str.48:
	.asciz	"QN1 = %x\r\n"
	.size	.L.str.48, 11

	.type	.L.str.49,@object       ; @.str.49
.L.str.49:
	.asciz	"QN0 = %x\r\n"
	.size	.L.str.49, 11

	.type	.L.str.50,@object       ; @.str.50
.L.str.50:
	.asciz	"reduce: quotient: q=%x qn=%x%x\r\n"
	.size	.L.str.50, 33

	.type	.L.str.51,@object       ; @.str.51
.L.str.51:
	.asciz	"reduce: quotient: q=%x\r\n"
	.size	.L.str.51, 25

	.type	.L.str.52,@object       ; @.str.52
.L.str.52:
	.asciz	"reduce: multiply: d=%x q=%x\r\n"
	.size	.L.str.52, 30

	.type	.L.str.53,@object       ; @.str.53
.L.str.53:
	.asciz	"reduce: multiply: offset=%u\r\n"
	.size	.L.str.53, 30

	.type	.L.str.54,@object       ; @.str.54
.L.str.54:
	.asciz	"reduce: multiply: n[%u]=%x q=%x c=%x m[%u]=%x\r\n"
	.size	.L.str.54, 48

	.type	.L.str.55,@object       ; @.str.55
.L.str.55:
	.asciz	"reduce: compare\r\n"
	.size	.L.str.55, 18

	.type	.L.str.56,@object       ; @.str.56
.L.str.56:
	.asciz	"reduce: compare: m[%u]=%x qn[%u]=%x\r\n"
	.size	.L.str.56, 38

	.type	.L.str.57,@object       ; @.str.57
.L.str.57:
	.asciz	"reduce: compare: relation %c\r\n"
	.size	.L.str.57, 31

	.type	.L.str.58,@object       ; @.str.58
.L.str.58:
	.asciz	"reduce: add: d=%u offset=%u\r\n"
	.size	.L.str.58, 30

	.type	.L.str.59,@object       ; @.str.59
.L.str.59:
	.asciz	"reduce: add: m[%u]=%x n[%u]=%x c=%x r=%x\r\n"
	.size	.L.str.59, 43

	.type	.L.str.60,@object       ; @.str.60
.L.str.60:
	.asciz	"subtract entered!!"
	.size	.L.str.60, 19

	.type	.L.str.61,@object       ; @.str.61
.L.str.61:
	.asciz	"reduce: subtract: d=%u offset=%u\r\n"
	.size	.L.str.61, 35

	.type	.L.str.62,@object       ; @.str.62
.L.str.62:
	.asciz	"reduce: subtract: m[%u]=%x qn[%u]=%x b=%u r=%x\r\n"
	.size	.L.str.62, 49

	.type	.L.str.63,@object       ; @.str.63
.L.str.63:
	.asciz	"reduce: subtract: reduction done\r\n"
	.size	.L.str.63, 35

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
