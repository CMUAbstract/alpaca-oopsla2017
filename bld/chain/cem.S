	.text
	.file	"cem.a.bc"
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
	sub.w	#24, r1
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	#0, -8(r4)
	mov.w	#1, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_compress, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_append_compressed, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_init_dict, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_measure_temp, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_compress, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_init_dict, r15
	call	#transition_to
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init

	.globl	task_init_dict
	.align	2
	.type	task_init_dict,@function
task_init_dict:                         ; @task_init_dict
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_init_dict_task_init_dict, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_init_dict, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r12, -8(r4)
	mov.w	#0, -6(r4)
	mov.w	#0, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r15
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r15)
	mov.w	r12, 10(r15)
	mov.w	#_ch_mc_task_init_dict_ch_roots, 8(r15)
	mov.w	#1, 6(r15)
	mov.w	#8, 4(r15)
	mov.w	#.L.str.7, 0(r15)
	call	#chan_out
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	cmp.w	#256, r12
	jhs	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_dict_task_init_dict, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	#_task_task_init_dict, r15
	call	#transition_to
	jmp	.LBB3_3
.LBB3_2:                                ; %if.else
	;DEBUG_VALUE: node_count <- [FP+-10]
	mov.w	#256, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_dict_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB3_3
.LBB3_3:                                ; %if.end
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_init_dict, .Lfunc_end3-task_init_dict

	.globl	task_sample
	.align	2
	.type	task_sample,@function
task_sample:                            ; @task_sample
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_sample_task_sample, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_sample, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_sample_task_letterize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	cmp.w	#2, r12
	jne	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.w	#0, -4(r4)
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_sample_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jne	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then.2
	mov.w	#_task_task_measure_temp, r15
	call	#transition_to
	jmp	.LBB4_5
.LBB4_4:                                ; %if.else
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	jmp	.LBB4_5
.LBB4_5:                                ; %if.end.3
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_sample, .Lfunc_end4-task_sample

	.globl	task_measure_temp
	.align	2
	.type	task_measure_temp,@function
task_measure_temp:                      ; @task_measure_temp
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_measure_temp_task_measure_temp, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_measure_temp, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r15
	call	#acquire_sample
	mov.w	r15, -4(r4)
	mov.w	r15, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_measure_temp_task_measure_temp, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_measure_temp_task_letterize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_out
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_measure_temp, .Lfunc_end5-task_measure_temp

	.globl	task_letterize
	.align	2
	.type	task_letterize,@function
task_letterize:                         ; @task_letterize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#30, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_measure_temp_task_letterize, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_sample_task_letterize, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	mov.b	-6(r4), r13
	mov.w	#255, r15
	cmp.b	#0, r13
	mov.b	r13, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.b	r13, -11(r4)            ; 1-byte Folded Spill
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	mov.b	r14, -15(r4)            ; 1-byte Folded Spill
	jeq	.LBB6_2
.LBB6_1:                                ; %entry
                                        ; =>This Inner Loop Header: Depth=1
	mov.b	-15(r4), r12            ; 1-byte Folded Reload
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	rla.w	r13
	sub.b	#1, r12
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	mov.b	r12, -15(r4)            ; 1-byte Folded Spill
	jne	.LBB6_1
.LBB6_2:                                ; %entry
	mov.w	-14(r4), r12            ; 2-byte Folded Reload
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	and.w	r12, r13
	mov.b	-11(r4), r14            ; 1-byte Folded Reload
	cmp.b	#0, r14
	mov.b	r14, -16(r4)            ; 1-byte Folded Spill
	mov.w	r13, -18(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_4
.LBB6_3:                                ; %entry
                                        ; =>This Inner Loop Header: Depth=1
	mov.b	-16(r4), r12            ; 1-byte Folded Reload
	mov.w	-18(r4), r13            ; 2-byte Folded Reload
	clrc
	rrc.w	r13
	sub.b	#1, r12
	mov.w	r13, -18(r4)            ; 2-byte Folded Spill
	mov.b	r12, -16(r4)            ; 1-byte Folded Spill
	jne	.LBB6_3
.LBB6_4:                                ; %entry
	mov.w	-18(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_letterize_ch_letter, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	#_task_task_compress, r15
	call	#transition_to
	add.w	#30, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_letterize, .Lfunc_end6-task_letterize

	.globl	task_compress
	.align	2
	.type	task_compress,@function
task_compress:                          ; @task_compress
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_find_sibling_task_compress, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_compress, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	cmp.w	#256, r12
	jhs	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 10(r13)
	mov.w	#_ch_mc_task_init_dict_ch_roots, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_in
	mov.w	4(r15), r12
	mov.w	r12, -2(r4)
	mov.w	2(r15), r12
	mov.w	r12, -4(r4)
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	jmp	.LBB7_3
.LBB7_2:                                ; %if.else
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_in
	mov.w	4(r15), r12
	mov.w	r12, -2(r4)
	mov.w	2(r15), r12
	mov.w	r12, -4(r4)
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	jmp	.LBB7_3
.LBB7_3:                                ; %if.end
	mov.w	r4, r12
	sub.w	#6, r12
	mov.w	r12, r13
	add.w	#4, r13
	mov.w	r1, r14
	mov.w	r13, 2(r14)
	mov.w	#0, 10(r14)
	mov.w	#_ch_mc_task_compress_ch_sibling, 8(r14)
	mov.w	#1, 6(r14)
	mov.w	#4, 4(r14)
	mov.w	#.L.str.11, 0(r14)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_compress_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#8, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_compress_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_compress_task_find_sibling, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: task_compress:sample_count <- [FP+-10]
	mov.w	r1, r12
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_append_compressed_task_compress, 14(r12)
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_compress_task_compress, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_compress, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	add.w	#1, r12
	mov.w	r12, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_compress_task_append_compressed, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_compress_task_compress, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_find_sibling, r15
	call	#transition_to
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_compress, .Lfunc_end7-task_compress

	.globl	task_find_sibling
	.align	2
	.type	task_find_sibling,@function
task_find_sibling:                      ; @task_find_sibling
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_find_sibling_task_find_sibling, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_compress_ch_sibling, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_letterize_ch_letter, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jeq	.LBB8_8
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov.w	-4(r4), r12
	cmp.w	#256, r12
	jhs	.LBB8_3
	jmp	.LBB8_2
.LBB8_2:                                ; %if.then.3
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 10(r13)
	mov.w	#_ch_mc_task_init_dict_ch_roots, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.14, 0(r13)
	call	#chan_in
	mov.w	r15, -2(r4)
	jmp	.LBB8_4
.LBB8_3:                                ; %if.else
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.14, 0(r13)
	call	#chan_in
	mov.w	r15, -2(r4)
	jmp	.LBB8_4
.LBB8_4:                                ; %if.end
	mov.w	-2(r4), r12
	mov.w	0(r12), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jne	.LBB8_6
	jmp	.LBB8_5
.LBB8_5:                                ; %if.then.8
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_find_sibling_task_compress, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	jmp	.LBB8_7
.LBB8_6:                                ; %if.else.9
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#0, 10(r13)
	mov.w	#_ch_task_find_sibling_task_find_sibling, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.11, 0(r13)
	call	#chan_out
	mov.w	#_task_task_find_sibling, r15
	call	#transition_to
	jmp	.LBB8_7
.LBB8_7:                                ; %if.end.11
	jmp	.LBB8_12
.LBB8_8:                                ; %if.else.12
	;DEBUG_VALUE: starting_node_idx <- [FP+-8]
	mov.w	-6(r4), r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_find_sibling_task_compress, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: child <- [FP+-10]
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_compress_task_find_sibling, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	cmp.w	#0, r12
	jne	.LBB8_10
	jmp	.LBB8_9
.LBB8_9:                                ; %if.then.15
	mov.w	#_task_task_add_insert, r15
	call	#transition_to
	jmp	.LBB8_11
.LBB8_10:                               ; %if.else.16
	mov.w	#_task_task_add_node, r15
	call	#transition_to
	jmp	.LBB8_11
.LBB8_11:                               ; %if.end.17
	jmp	.LBB8_12
.LBB8_12:                               ; %if.end.18
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_find_sibling, .Lfunc_end8-task_find_sibling

	.globl	task_add_node
	.align	2
	.type	task_add_node,@function
task_add_node:                          ; @task_add_node
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_add_node_task_add_node, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_compress_ch_sibling, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	cmp.w	#256, r12
	jhs	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 10(r13)
	mov.w	#_ch_mc_task_init_dict_ch_roots, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.14, 0(r13)
	call	#chan_in
	mov.w	r15, -2(r4)
	jmp	.LBB9_3
.LBB9_2:                                ; %if.else
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#8, 2(r13)
	mov.w	#.L.str.14, 0(r13)
	call	#chan_in
	mov.w	r15, -2(r4)
	jmp	.LBB9_3
.LBB9_3:                                ; %if.end
	mov.w	-2(r4), r12
	mov.w	2(r12), r12
	cmp.w	#0, r12
	jeq	.LBB9_5
	jmp	.LBB9_4
.LBB9_4:                                ; %if.then.5
	;DEBUG_VALUE: next_sibling <- [FP+-6]
	mov.w	-2(r4), r12
	mov.w	2(r12), r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_node_task_add_node, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_add_node, r15
	call	#transition_to
	jmp	.LBB9_6
.LBB9_5:                                ; %if.else.7
	;DEBUG_VALUE: sibling_node_obj <- [FP+-12]
	mov.w	-2(r4), r12
	mov.w	4(r12), r13
	mov.w	r13, -8(r4)
	mov.w	2(r12), r13
	mov.w	r13, -10(r4)
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_node_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_add_node_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#8, 4(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_out
	mov.w	#_task_task_add_insert, r15
	call	#transition_to
	jmp	.LBB9_6
.LBB9_6:                                ; %if.end.8
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_add_node, .Lfunc_end9-task_add_node

	.globl	task_add_insert
	.align	2
	.type	task_add_insert,@function
task_add_insert:                        ; @task_add_insert
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#46, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_add_insert_task_add_insert, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_dict_task_add_insert, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	cmp.w	#512, r12
	jne	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	jmp	.LBB10_2
.LBB10_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB10_2
.LBB10_3:                               ; %if.end
	;DEBUG_VALUE: task_add_insert:parent <- [FP+-4]
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_compress_task_add_insert, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: task_add_insert:parent_node <- [FP+-6]
	mov.w	r1, r12
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_compress_task_add_insert, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#8, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	r15, -6(r4)
	;DEBUG_VALUE: task_add_insert:letter <- [FP+-8]
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_letterize_ch_letter, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	;DEBUG_VALUE: task_add_insert:child <- [FP+-10]
	mov.w	-2(r4), r12
	mov.w	r12, -10(r4)
	;DEBUG_VALUE: task_add_insert:child_node <- [FP+-16]
	mov.w	-8(r4), r12
	mov.w	r12, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	#0, -12(r4)
	mov.w	-6(r4), r12
	mov.w	4(r12), r12
	cmp.w	#0, r12
	jne	.LBB10_5
	jmp	.LBB10_4
.LBB10_4:                               ; %if.then.8
	;DEBUG_VALUE: parent_node_obj <- [FP+-22]
	mov.w	-6(r4), r12
	mov.w	4(r12), r13
	mov.w	r13, -18(r4)
	mov.w	2(r12), r13
	mov.w	r13, -20(r4)
	mov.w	0(r12), r12
	mov.w	r12, -22(r4)
	mov.w	-10(r4), r12
	mov.w	r12, -18(r4)
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r4, r14
	sub.w	#22, r14
	mov.w	r14, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#8, 4(r13)
	mov.w	#.L.str.10, 0(r13)
	call	#chan_out
	jmp	.LBB10_6
.LBB10_5:                               ; %if.else
	;DEBUG_VALUE: last_sibling <- [FP+-24]
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_add_node_task_add_insert, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -24(r4)
	;DEBUG_VALUE: last_sibling_node <- [FP+-30]
	mov.w	r1, r12
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_add_node_task_add_insert, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#8, 2(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_in
	mov.w	4(r15), r12
	mov.w	r12, -26(r4)
	mov.w	2(r15), r12
	mov.w	r12, -28(r4)
	mov.w	0(r15), r12
	mov.w	r12, -30(r4)
	mov.w	-10(r4), r12
	mov.w	r12, -28(r4)
	mov.w	-24(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r15
	mov.w	r4, r13
	sub.w	#30, r13
	mov.w	r13, 2(r15)
	mov.w	r12, 10(r15)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 8(r15)
	mov.w	#1, 6(r15)
	mov.w	#8, 4(r15)
	mov.w	#.L.str.16, 0(r15)
	call	#chan_out
	jmp	.LBB10_6
.LBB10_6:                               ; %if.end.13
	;DEBUG_VALUE: task_add_insert:symbol <- [FP+-32]
	mov.w	-4(r4), r12
	mov.w	r12, -32(r4)
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_mc_task_add_insert_ch_dict, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#8, 4(r13)
	mov.w	#.L.str.17, 0(r13)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#32, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_insert_task_append_compressed, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_out
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_insert_task_add_insert, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_append_compressed, r15
	call	#transition_to
	add.w	#46, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_add_insert, .Lfunc_end10-task_add_insert

	.globl	task_append_compressed
	.align	2
	.type	task_append_compressed,@function
task_append_compressed:                 ; @task_append_compressed
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_add_insert_task_append_compressed, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_append_compressed_task_append_compressed, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_append_compressed, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r15
	mov.w	r12, 10(r15)
	mov.w	r4, r12
	sub.w	#2, r12
	mov.w	r12, 2(r15)
	mov.w	#_ch_task_append_compressed_task_print, 8(r15)
	mov.w	#1, 6(r15)
	mov.w	#4, 4(r15)
	mov.w	#.L.str.19, 0(r15)
	call	#chan_out
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	cmp.w	#64, r12
	jne	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov.w	#0, -4(r4)
	;DEBUG_VALUE: sample_count <- [FP+-6]
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_compress_task_append_compressed, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r12)
	mov.w	#512, 10(r12)
	mov.w	#_ch_task_append_compressed_task_print, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#chan_out
	mov.w	#0, -6(r4)
	mov.w	r1, r12
	mov.w	-8(r4), r15             ; 2-byte Folded Reload
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_append_compressed_task_compress, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_append_compressed_task_append_compressed, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_2:                               ; %if.else
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_append_compressed_task_append_compressed, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_3:                               ; %if.end
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_append_compressed, .Lfunc_end11-task_append_compressed

	.globl	task_print
	.align	2
	.type	task_print,@function
task_print:                             ; @task_print
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#28, r1
	mov.w	r1, r12
	mov.w	#512, 8(r12)
	mov.w	#_ch_task_append_compressed_task_print, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	&overflow, r12
	mov.w	&0x03D0, r15
	mov.w	r1, r13
	mov.w	r15, 4(r13)
	mov.w	r12, 2(r13)
	mov.w	#.L.str.20, 0(r13)
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.21, 0(r12)
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB12_1
.LBB12_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#64, r12
	jhs	.LBB12_7
	jmp	.LBB12_2
.LBB12_2:                               ; %for.body
                                        ;   in Loop: Header=BB12_1 Depth=1
	;DEBUG_VALUE: index <- [FP+-6]
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_append_compressed_task_print, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.22, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.23, 0(r13)
	call	#printf
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	jeq	.LBB12_5
	jmp	.LBB12_3
.LBB12_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	bit.w	#7, r12
	jne	.LBB12_5
	jmp	.LBB12_4
.LBB12_4:                               ; %if.then
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.24, 0(r12)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB12_5
.LBB12_5:                               ; %if.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_6
.LBB12_6:                               ; %for.inc
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB12_1
.LBB12_7:                               ; %for.end
	mov.w	r1, r12
	mov.w	#.L.str.24, 0(r12)
	call	#printf
	mov.w	-4(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#64, 4(r13)
	mov.w	#.L.str.25, 0(r13)
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	#_task_task_done, r12
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#transition_to
	add.w	#28, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_print, .Lfunc_end12-task_print

	.globl	task_done
	.align	2
	.type	task_done,@function
task_done:                              ; @task_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_done, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_done, .Lfunc_end13-task_done

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
.Lfunc_end14:
	.size	_entry_task, .Lfunc_end14-_entry_task

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
.Lfunc_end15:
	.size	_init, .Lfunc_end15-_init

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
.Lfunc_end16:
	.size	init_hw, .Lfunc_end16-init_hw

	.align	2
	.type	acquire_sample,@function
acquire_sample:                         ; @acquire_sample
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: acquire_sample:prev_sample <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	add.w	#1, r15
	and.w	#3, r15
	mov.w	r15, -4(r4)
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end17:
	.size	acquire_sample, .Lfunc_end17-acquire_sample

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
.Lfunc_end18:
	.size	msp_watchdog_enable, .Lfunc_end18-msp_watchdog_enable

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
.Lfunc_end19:
	.size	msp_watchdog_disable, .Lfunc_end19-msp_watchdog_disable

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
.Lfunc_end20:
	.size	msp_watchdog_kick, .Lfunc_end20-msp_watchdog_kick

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
	jeq	.LBB21_4
	jmp	.LBB21_1
.LBB21_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB21_2
.LBB21_2:                               ; %while.body
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
	jne	.LBB21_2
	jmp	.LBB21_3
.LBB21_3:                               ; %while.end.loopexit
	jmp	.LBB21_4
.LBB21_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end21:
	.size	memcpy, .Lfunc_end21-memcpy

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
.Lfunc_end22:
	.size	my_memset, .Lfunc_end22-my_memset

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
.Lfunc_end23:
	.size	msp_clock_setup, .Lfunc_end23-msp_clock_setup

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
.Lfunc_end24:
	.size	mult16, .Lfunc_end24-mult16

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
	jmp	.LBB25_1
.LBB25_1:                               ; %while.cond
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
	jeq	.LBB25_3
	jmp	.LBB25_2
.LBB25_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB25_3
.LBB25_3:                               ; %land.end
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB25_10
	jmp	.LBB25_4
.LBB25_4:                               ; %while.body
                                        ;   in Loop: Header=BB25_1 Depth=1
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
	jeq	.LBB25_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB25_6:                               ; %while.body
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB25_8
	jmp	.LBB25_7
.LBB25_7:                               ; %if.then
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB25_9
.LBB25_8:                               ; %if.else
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB25_9
.LBB25_9:                               ; %if.end
                                        ;   in Loop: Header=BB25_1 Depth=1
	jmp	.LBB25_1
.LBB25_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end25:
	.size	sqrt16, .Lfunc_end25-sqrt16

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
	jmp	.LBB26_1
.LBB26_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB26_4
	jmp	.LBB26_2
.LBB26_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB26_4
	jmp	.LBB26_3
.LBB26_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB26_4
.LBB26_4:                               ; %land.end
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB26_6
	jmp	.LBB26_5
.LBB26_5:                               ; %while.body
                                        ;   in Loop: Header=BB26_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB26_1
.LBB26_6:                               ; %while.end
	jmp	.LBB26_7
.LBB26_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB26_11
	jmp	.LBB26_8
.LBB26_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB26_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB26_10
	jmp	.LBB26_9
.LBB26_9:                               ; %if.then
                                        ;   in Loop: Header=BB26_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB26_10
.LBB26_10:                              ; %if.end
                                        ;   in Loop: Header=BB26_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB26_7
.LBB26_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB26_13
	jmp	.LBB26_12
.LBB26_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB26_14
.LBB26_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB26_14
.LBB26_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end26:
	.size	udivmodhi4, .Lfunc_end26-udivmodhi4

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
	jge	.LBB27_2
	jmp	.LBB27_1
.LBB27_1:                               ; %if.then
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
	jmp	.LBB27_2
.LBB27_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB27_4
	jmp	.LBB27_3
.LBB27_3:                               ; %if.then.2
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
	jmp	.LBB27_4
.LBB27_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB27_6
	jmp	.LBB27_5
.LBB27_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB27_6
.LBB27_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	__divhi3, .Lfunc_end27-__divhi3

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
	jge	.LBB28_2
	jmp	.LBB28_1
.LBB28_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
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
	jmp	.LBB28_4
.LBB28_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB28_6
	jmp	.LBB28_5
.LBB28_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB28_6
.LBB28_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__modhi3, .Lfunc_end28-__modhi3

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
.Lfunc_end29:
	.size	__udivhi3, .Lfunc_end29-__udivhi3

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
.Lfunc_end30:
	.size	__umodhi3, .Lfunc_end30-__umodhi3

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
	jeq	.LBB31_7
	jmp	.LBB31_1
.LBB31_1:                               ; %if.then
	;DEBUG_VALUE: i <- [FP+-4]
	;DEBUG_VALUE: dirty_self_fields <- [FP+-6]
	mov.w	-2(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB31_2
.LBB31_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	72(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#1, r12
	jl	.LBB31_6
	jmp	.LBB31_3
.LBB31_3:                               ; %while.body
                                        ;   in Loop: Header=BB31_2 Depth=1
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
	jeq	.LBB31_5
	jmp	.LBB31_4
.LBB31_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB31_2 Depth=1
	mov.w	-8(r4), r12
	;APP
	SWPB 0(r12)

	;NO_APP
	jmp	.LBB31_5
.LBB31_5:                               ; %if.end
                                        ;   in Loop: Header=BB31_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 72(r13)
	jmp	.LBB31_2
.LBB31_6:                               ; %while.end
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 74(r13)
	jmp	.LBB31_7
.LBB31_7:                               ; %if.end.8
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	task_prologue, .Lfunc_end31-task_prologue

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
.Lfunc_end32:
	.size	transition_to, .Lfunc_end32-transition_to

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
	jmp	.LBB33_1
.LBB33_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB33_12
	jmp	.LBB33_2
.LBB33_2:                               ; %for.body
                                        ;   in Loop: Header=BB33_1 Depth=1
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
	jne	.LBB33_7
	jmp	.LBB33_3
.LBB33_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB33_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-28]
	mov.w	-26(r4), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.b	0(r12), r13
	bit.b	#2, r13
	jeq	.LBB33_5
	jmp	.LBB33_4
.LBB33_4:                               ; %cond.true
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB33_6
.LBB33_5:                               ; %cond.false
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB33_6
.LBB33_6:                               ; %cond.end
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	jmp	.LBB33_8
.LBB33_7:                               ; %sw.default
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB33_8
.LBB33_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB33_10
	jmp	.LBB33_9
.LBB33_9:                               ; %if.then
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB33_10
.LBB33_10:                              ; %if.end
                                        ;   in Loop: Header=BB33_1 Depth=1
	jmp	.LBB33_11
.LBB33_11:                              ; %for.inc
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB33_1
.LBB33_12:                              ; %for.end
	;DEBUG_VALUE: chan_in:value <- [FP+-32]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	r12, r15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	chan_in, .Lfunc_end33-chan_in

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
	jmp	.LBB34_1
.LBB34_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r13, r12
	jge	.LBB34_10
	jmp	.LBB34_2
.LBB34_2:                               ; %for.body
                                        ;   in Loop: Header=BB34_1 Depth=1
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
	jne	.LBB34_7
	jmp	.LBB34_3
.LBB34_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB34_1 Depth=1
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
	jeq	.LBB34_5
	jmp	.LBB34_4
.LBB34_4:                               ; %cond.true
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB34_6
.LBB34_5:                               ; %cond.false
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB34_6
.LBB34_6:                               ; %cond.end
                                        ;   in Loop: Header=BB34_1 Depth=1
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
	jmp	.LBB34_8
.LBB34_7:                               ; %sw.default
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB34_8
.LBB34_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB34_1 Depth=1
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
	jmp	.LBB34_9
.LBB34_9:                               ; %for.inc
                                        ;   in Loop: Header=BB34_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB34_1
.LBB34_10:                              ; %for.end
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end34:
	.size	chan_out, .Lfunc_end34-chan_out

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
.Lfunc_end35:
	.size	main, .Lfunc_end35-main

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

	.type	_task_task_init_dict,@object ; @_task_task_init_dict
	.globl	_task_task_init_dict
	.align	1
_task_task_init_dict:
	.short	task_init_dict
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_init_dict\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init_dict, 108

	.type	_task_task_sample,@object ; @_task_task_sample
	.globl	_task_task_sample
	.align	1
_task_task_sample:
	.short	task_sample
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_sample\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_sample, 108

	.type	_task_task_measure_temp,@object ; @_task_task_measure_temp
	.globl	_task_task_measure_temp
	.align	1
_task_task_measure_temp:
	.short	task_measure_temp
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_measure_temp\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_measure_temp, 108

	.type	_task_task_letterize,@object ; @_task_task_letterize
	.globl	_task_task_letterize
	.align	1
_task_task_letterize:
	.short	task_letterize
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_letterize\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_letterize, 108

	.type	_task_task_compress,@object ; @_task_task_compress
	.globl	_task_task_compress
	.align	1
_task_task_compress:
	.short	task_compress
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_compress\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_compress, 108

	.type	_task_task_find_sibling,@object ; @_task_task_find_sibling
	.globl	_task_task_find_sibling
	.align	1
_task_task_find_sibling:
	.short	task_find_sibling
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_find_sibling\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_find_sibling, 108

	.type	_task_task_add_node,@object ; @_task_task_add_node
	.globl	_task_task_add_node
	.align	1
_task_task_add_node:
	.short	task_add_node
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_add_node\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_add_node, 108

	.type	_task_task_add_insert,@object ; @_task_task_add_insert
	.globl	_task_task_add_insert
	.align	1
_task_task_add_insert:
	.short	task_add_insert
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_add_insert\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_add_insert, 108

	.type	_task_task_append_compressed,@object ; @_task_task_append_compressed
	.globl	_task_task_append_compressed
	.align	1
_task_task_append_compressed:
	.short	task_append_compressed
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_append_compressed\000\000\000\000\000\000\000\000\000"
	.size	_task_task_append_compressed, 108

	.type	_task_task_print,@object ; @_task_task_print
	.globl	_task_task_print
	.align	1
_task_task_print:
	.short	task_print
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_print\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print, 108

	.type	_task_task_done,@object ; @_task_task_done
	.globl	_task_task_done
	.align	1
_task_task_done:
	.short	task_done
	.long	4096                    ; 0x1000
	.short	12                      ; 0xc
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_done, 108

	.type	_ch_task_init_task_init_dict,@object ; @_ch_task_init_task_init_dict
	.globl	_ch_task_init_task_init_dict
	.align	1
_ch_task_init_task_init_dict:
	.zero	6
	.size	_ch_task_init_task_init_dict, 6

	.type	_ch_task_init_task_sample,@object ; @_ch_task_init_task_sample
	.globl	_ch_task_init_task_sample
	.align	1
_ch_task_init_task_sample:
	.zero	6
	.size	_ch_task_init_task_sample, 6

	.type	_ch_task_init_task_measure_temp,@object ; @_ch_task_init_task_measure_temp
	.globl	_ch_task_init_task_measure_temp
	.align	1
_ch_task_init_task_measure_temp:
	.zero	6
	.size	_ch_task_init_task_measure_temp, 6

	.type	_ch_task_init_task_compress,@object ; @_ch_task_init_task_compress
	.globl	_ch_task_init_task_compress
	.align	1
_ch_task_init_task_compress:
	.zero	10
	.size	_ch_task_init_task_compress, 10

	.type	_ch_task_init_dict_task_init_dict,@object ; @_ch_task_init_dict_task_init_dict
	.globl	_ch_task_init_dict_task_init_dict
	.align	1
_ch_task_init_dict_task_init_dict:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_init_dict_task_init_dict, 12

	.type	_ch_mc_task_init_dict_ch_roots,@object ; @_ch_mc_task_init_dict_ch_roots
	.globl	_ch_mc_task_init_dict_ch_roots
	.align	1
_ch_mc_task_init_dict_ch_roots:
	.short	2                       ; 0x2
	.zero	2048
	.size	_ch_mc_task_init_dict_ch_roots, 2050

	.type	_ch_task_init_task_append_compressed,@object ; @_ch_task_init_task_append_compressed
	.globl	_ch_task_init_task_append_compressed
	.align	1
_ch_task_init_task_append_compressed:
	.zero	6
	.size	_ch_task_init_task_append_compressed, 6

	.type	_ch_task_init_dict_task_add_insert,@object ; @_ch_task_init_dict_task_add_insert
	.globl	_ch_task_init_dict_task_add_insert
	.align	1
_ch_task_init_dict_task_add_insert:
	.zero	6
	.size	_ch_task_init_dict_task_add_insert, 6

	.type	_ch_mc_task_add_insert_ch_dict,@object ; @_ch_mc_task_add_insert_ch_dict
	.globl	_ch_mc_task_add_insert_ch_dict
	.align	1
_ch_mc_task_add_insert_ch_dict:
	.short	2                       ; 0x2
	.zero	4096
	.size	_ch_mc_task_add_insert_ch_dict, 4098

	.type	_ch_task_sample_task_sample,@object ; @_ch_task_sample_task_sample
	.globl	_ch_task_sample_task_sample
	.align	1
_ch_task_sample_task_sample:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_sample_task_sample, 12

	.type	_ch_task_measure_temp_task_measure_temp,@object ; @_ch_task_measure_temp_task_measure_temp
	.globl	_ch_task_measure_temp_task_measure_temp
	.align	1
_ch_task_measure_temp_task_measure_temp:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_measure_temp_task_measure_temp, 12

	.type	_ch_task_measure_temp_task_letterize,@object ; @_ch_task_measure_temp_task_letterize
	.globl	_ch_task_measure_temp_task_letterize
	.align	1
_ch_task_measure_temp_task_letterize:
	.zero	6
	.size	_ch_task_measure_temp_task_letterize, 6

	.type	_ch_task_sample_task_letterize,@object ; @_ch_task_sample_task_letterize
	.globl	_ch_task_sample_task_letterize
	.align	1
_ch_task_sample_task_letterize:
	.zero	6
	.size	_ch_task_sample_task_letterize, 6

	.type	_ch_mc_task_letterize_ch_letter,@object ; @_ch_mc_task_letterize_ch_letter
	.globl	_ch_mc_task_letterize_ch_letter
	.align	1
_ch_mc_task_letterize_ch_letter:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_letterize_ch_letter, 6

	.type	_ch_task_compress_task_add_insert,@object ; @_ch_task_compress_task_add_insert
	.globl	_ch_task_compress_task_add_insert
	.align	1
_ch_task_compress_task_add_insert:
	.zero	14
	.size	_ch_task_compress_task_add_insert, 14

	.type	_ch_task_compress_task_find_sibling,@object ; @_ch_task_compress_task_find_sibling
	.globl	_ch_task_compress_task_find_sibling
	.align	1
_ch_task_compress_task_find_sibling:
	.zero	6
	.size	_ch_task_compress_task_find_sibling, 6

	.type	_ch_task_compress_task_append_compressed,@object ; @_ch_task_compress_task_append_compressed
	.globl	_ch_task_compress_task_append_compressed
	.align	1
_ch_task_compress_task_append_compressed:
	.zero	6
	.size	_ch_task_compress_task_append_compressed, 6

	.type	_ch_mc_task_compress_ch_sibling,@object ; @_ch_mc_task_compress_ch_sibling
	.globl	_ch_mc_task_compress_ch_sibling
	.align	1
_ch_mc_task_compress_ch_sibling:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_compress_ch_sibling, 6

	.type	_ch_task_compress_task_compress,@object ; @_ch_task_compress_task_compress
	.globl	_ch_task_compress_task_compress
	.align	1
_ch_task_compress_task_compress:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_compress_task_compress, 12

	.type	_ch_task_find_sibling_task_compress,@object ; @_ch_task_find_sibling_task_compress
	.globl	_ch_task_find_sibling_task_compress
	.align	1
_ch_task_find_sibling_task_compress:
	.zero	6
	.size	_ch_task_find_sibling_task_compress, 6

	.type	_ch_task_find_sibling_task_find_sibling,@object ; @_ch_task_find_sibling_task_find_sibling
	.globl	_ch_task_find_sibling_task_find_sibling
	.align	1
_ch_task_find_sibling_task_find_sibling:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_find_sibling_task_find_sibling, 12

	.type	_ch_task_add_node_task_add_node,@object ; @_ch_task_add_node_task_add_node
	.globl	_ch_task_add_node_task_add_node
	.align	1
_ch_task_add_node_task_add_node:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_add_node_task_add_node, 12

	.type	_ch_task_add_node_task_add_insert,@object ; @_ch_task_add_node_task_add_insert
	.globl	_ch_task_add_node_task_add_insert
	.align	1
_ch_task_add_node_task_add_insert:
	.zero	14
	.size	_ch_task_add_node_task_add_insert, 14

	.type	_ch_task_add_insert_task_add_insert,@object ; @_ch_task_add_insert_task_add_insert
	.globl	_ch_task_add_insert_task_add_insert
	.align	1
_ch_task_add_insert_task_add_insert:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_add_insert_task_add_insert, 12

	.type	_ch_task_add_insert_task_append_compressed,@object ; @_ch_task_add_insert_task_append_compressed
	.globl	_ch_task_add_insert_task_append_compressed
	.align	1
_ch_task_add_insert_task_append_compressed:
	.zero	6
	.size	_ch_task_add_insert_task_append_compressed, 6

	.type	_ch_task_append_compressed_task_append_compressed,@object ; @_ch_task_append_compressed_task_append_compressed
	.globl	_ch_task_append_compressed_task_append_compressed
	.align	1
_ch_task_append_compressed_task_append_compressed:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_append_compressed_task_append_compressed, 12

	.type	_ch_task_append_compressed_task_print,@object ; @_ch_task_append_compressed_task_print
	.globl	_ch_task_append_compressed_task_print
	.align	1
_ch_task_append_compressed_task_print:
	.zero	518
	.size	_ch_task_append_compressed_task_print, 518

	.type	_ch_task_append_compressed_task_compress,@object ; @_ch_task_append_compressed_task_compress
	.globl	_ch_task_append_compressed_task_compress
	.align	1
_ch_task_append_compressed_task_compress:
	.zero	6
	.size	_ch_task_append_compressed_task_compress, 6

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

	.type	_task__entry_task,@object ; @_task__entry_task
	.section	.nv_vars,"aw",@progbits
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

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"parent"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"out_len"
	.size	.L.str.2, 8

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"letter"
	.size	.L.str.3, 7

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"prev_sample"
	.size	.L.str.4, 12

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"letter_idx"
	.size	.L.str.5, 11

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	"sample_count"
	.size	.L.str.6, 13

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"dict[letter]"
	.size	.L.str.7, 13

	.type	.L.str.8,@object        ; @.str.8
.L.str.8:
	.asciz	"node_count"
	.size	.L.str.8, 11

	.type	.L.str.9,@object        ; @.str.9
.L.str.9:
	.asciz	"sample"
	.size	.L.str.9, 7

	.type	.L.str.10,@object       ; @.str.10
.L.str.10:
	.asciz	"dict[parent]"
	.size	.L.str.10, 13

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"sibling"
	.size	.L.str.11, 8

	.type	.L.str.12,@object       ; @.str.12
.L.str.12:
	.asciz	"parent_node"
	.size	.L.str.12, 12

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"child"
	.size	.L.str.13, 6

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"dict[sibling]"
	.size	.L.str.14, 14

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"sibling_node"
	.size	.L.str.15, 13

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"dict[last_sibling]"
	.size	.L.str.16, 19

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"dict[child]"
	.size	.L.str.17, 12

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"symbol"
	.size	.L.str.18, 7

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	"compressed_data[out_len]"
	.size	.L.str.19, 25

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.20, 26

	.type	.L.str.21,@object       ; @.str.21
.L.str.21:
	.asciz	"compressed block:\r\n"
	.size	.L.str.21, 20

	.type	.L.str.22,@object       ; @.str.22
.L.str.22:
	.asciz	"compressed_data[i]"
	.size	.L.str.22, 19

	.type	.L.str.23,@object       ; @.str.23
.L.str.23:
	.asciz	"%04x "
	.size	.L.str.23, 6

	.type	.L.str.24,@object       ; @.str.24
.L.str.24:
	.asciz	"\r\n"
	.size	.L.str.24, 3

	.type	.L.str.25,@object       ; @.str.25
.L.str.25:
	.asciz	"rate: samples/block: %u/%u\r\n"
	.size	.L.str.25, 29

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
