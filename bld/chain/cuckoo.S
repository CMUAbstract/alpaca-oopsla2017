	.text
	.file	"cuckoo.a.bc"
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

	.globl	task_init
	.align	2
	.type	task_init,@function
task_init:                              ; @task_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	#0, -2(r4)
	jmp	.LBB1_1
.LBB1_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#128, r12
	jhs	.LBB1_4
	jmp	.LBB1_2
.LBB1_2:                                ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	;DEBUG_VALUE: fp <- [FP+-4]
	mov.w	#0, -4(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#4, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_init_ch_filter, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str, 0(r13)
	call	#chan_out
	jmp	.LBB1_3
.LBB1_3:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB1_1
.LBB1_4:                                ; %for.end
	;DEBUG_VALUE: task_init:count <- [FP+-6]
	mov.w	#0, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_lookup_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_lookup_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#init_key, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: task_init:next_task <- [FP+-8]
	mov.w	#_task_task_insert, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	task_init, .Lfunc_end1-task_init

	.globl	task_generate_key
	.align	2
	.type	task_generate_key,@function
task_generate_key:                      ; @task_generate_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	r1, r12
	mov.w	#0, 20(r12)
	mov.w	#_ch_task_generate_key_task_generate_key, 18(r12)
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_lookup_done_task_generate_key, 14(r12)
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_insert_done_task_generate_key, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_generate_key, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	#17, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	add.w	#17, r15
	mov.w	r15, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#2, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_generate_key_task_generate_key, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_generate_key_ch_key, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#4, 12(r12)
	mov.w	#_ch_task_insert_done_task_generate_key, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_generate_key, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r12, r15
	call	#transition_to
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_generate_key, .Lfunc_end2-task_generate_key

	.globl	task_calc_indexes
	.align	2
	.type	task_calc_indexes,@function
task_calc_indexes:                      ; @task_calc_indexes
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_call_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r15
	call	#hash_to_fingerprint
	mov.w	r15, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_calc_indexes_task_calc_indexes_index_2, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	mov.w	#_task_task_calc_indexes_index_1, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_calc_indexes, .Lfunc_end3-task_calc_indexes

	.globl	task_calc_indexes_index_1
	.align	2
	.type	task_calc_indexes_index_1,@function
task_calc_indexes_index_1:              ; @task_calc_indexes_index_1
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_call_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r15
	call	#hash_to_index
	mov.w	r15, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#4, 14(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_calc_indexes_index_1_task_calc_indexes_index_2, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_calc_indexes_index_2, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_calc_indexes_index_1, .Lfunc_end4-task_calc_indexes_index_1

	.globl	task_calc_indexes_index_2
	.align	2
	.type	task_calc_indexes_index_2,@function
task_calc_indexes_index_2:              ; @task_calc_indexes_index_2
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_calc_indexes_task_calc_indexes_index_2, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_calc_indexes_index_1_task_calc_indexes_index_2, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r15
	call	#hash_to_index
	mov.w	r15, -6(r4)
	mov.w	-4(r4), r12
	xor.w	r15, r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#8, r15
	mov.w	r15, 2(r12)
	mov.w	#8, 10(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#4, 8(r12)
	mov.w	#_ch_call_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	r12, r15
	call	#transition_to
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_calc_indexes_index_2, .Lfunc_end5-task_calc_indexes_index_2

	.globl	task_insert
	.align	2
	.type	task_insert,@function
task_insert:                            ; @task_insert
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_generate_key_ch_key, 6(r12)
	mov.w	#1, 4(r12)
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
	mov.w	#_ch_call_ch_calc_indexes, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_add, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_call_ch_calc_indexes, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_calc_indexes, r15
	call	#transition_to
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_insert, .Lfunc_end6-task_insert

	.globl	task_add
	.align	2
	.type	task_add,@function
task_add:                               ; @task_add
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#44, r1
	mov.b	#1, -1(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	#4, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	r12, r15
	rla.w	r15
	rla.w	r15
	mov.w	#10, r14
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 12(r12)
	mov.w	-20(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 8(r12)
	mov.w	#_ch_task_add_task_add, 10(r12)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	cmp.w	#0, r12
	jne	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	#10, r14
	mov.w	r12, r15
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 14(r12)
	mov.w	-22(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 10(r12)
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_add_task_add, 12(r12)
	mov.w	#_ch_mc_task_add_ch_filter_add, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#1, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	br	#.LBB7_9
.LBB7_2:                                ; %if.else
	;DEBUG_VALUE: index2 <- [FP+-10]
	mov.w	r1, r12
	mov.w	#8, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	;DEBUG_VALUE: fp2 <- [FP+-12]
	mov.w	r12, r15
	rla.w	r15
	rla.w	r15
	mov.w	#10, r14
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 12(r12)
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 8(r12)
	mov.w	#_ch_task_add_task_add, 10(r12)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	cmp.w	#0, r12
	jne	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:                                ; %if.then.6
	mov.w	-10(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	#10, r14
	mov.w	r12, r15
	mov.w	r13, -26(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 14(r12)
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 10(r12)
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_add_task_add, 12(r12)
	mov.w	#_ch_mc_task_add_ch_filter_add, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#1, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB7_8
.LBB7_4:                                ; %if.else.7
	;DEBUG_VALUE: fp_victim <- [FP+-14]
	;DEBUG_VALUE: index_victim <- [FP+-16]
	call	#rand
	mov.w	r15, r12
	clrc
	rrc.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.w	r15, r13
	add.w	r12, r13
	and.w	#-2, r13
	sub.w	r13, r15
	cmp.w	#0, r15
	jeq	.LBB7_6
	jmp	.LBB7_5
.LBB7_5:                                ; %if.then.10
	mov.w	-6(r4), r12
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB7_7
.LBB7_6:                                ; %if.else.11
	mov.w	-10(r4), r12
	mov.w	r12, -16(r4)
	mov.w	-12(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB7_7
.LBB7_7:                                ; %if.end
	mov.w	-16(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	#10, r14
	mov.w	r12, r15
	mov.w	r13, -28(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 14(r12)
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 10(r12)
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_add_task_add, 12(r12)
	mov.w	#_ch_mc_task_add_ch_filter_add, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_add_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#14, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_add_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: relocation_count <- [FP+-18]
	mov.w	#0, -18(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#18, r13
	mov.w	r13, 2(r12)
	mov.w	#8, 10(r12)
	mov.w	#_ch_task_add_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.16, 0(r12)
	call	#chan_out
	mov.w	#_task_task_relocate, r15
	call	#transition_to
	jmp	.LBB7_8
.LBB7_8:                                ; %if.end.12
	jmp	.LBB7_9
.LBB7_9:                                ; %if.end.13
	add.w	#44, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_add, .Lfunc_end7-task_add

	.globl	task_relocate
	.align	2
	.type	task_relocate,@function
task_relocate:                          ; @task_relocate
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#42, r1
	mov.w	r1, r12
	mov.w	#1280, 12(r12)
	mov.w	#_ch_task_relocate_task_relocate, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_add_task_relocate, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#1290, 12(r12)
	mov.w	#_ch_task_relocate_task_relocate, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_add_task_relocate, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r15
	call	#hash_to_index
	mov.w	r15, -6(r4)
	mov.w	-4(r4), r12
	xor.w	r15, r12
	mov.w	r12, -8(r4)
	mov.w	r12, r15
	rla.w	r15
	rla.w	r15
	mov.w	#10, r13
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r13, r14
	mov.w	r13, -20(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 16(r12)
	mov.w	-18(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 12(r12)
	mov.w	r13, 8(r12)
	mov.w	#_ch_task_relocate_task_relocate, 14(r12)
	mov.w	#_ch_mc_task_add_ch_filter_add, 10(r12)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.17, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	-8(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	mov.w	r12, r15
	mov.w	-20(r4), r14            ; 2-byte Folded Reload
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 14(r12)
	mov.w	-22(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 10(r12)
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_relocate_task_relocate, 12(r12)
	mov.w	#_ch_mc_task_relocate_ch_filter_relocate, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.17, 0(r12)
	call	#chan_out
	mov.w	-10(r4), r12
	cmp.w	#0, r12
	jne	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	;DEBUG_VALUE: success <- [FP+-11]
	mov.b	#1, -11(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#11, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_relocate_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB8_5
.LBB8_2:                                ; %if.else
	;DEBUG_VALUE: relocation_count <- [FP+-14]
	mov.w	r1, r12
	mov.w	#1300, 12(r12)
	mov.w	#_ch_task_relocate_task_relocate, 10(r12)
	mov.w	#8, 8(r12)
	mov.w	#_ch_task_add_task_relocate, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.16, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	cmp.w	#8, r12
	jlo	.LBB8_4
	jmp	.LBB8_3
.LBB8_3:                                ; %if.then.5
	mov.w	-10(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.18, 0(r13)
	call	#printf
	;DEBUG_VALUE: success <- [FP+-15]
	mov.b	#0, -15(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#15, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_relocate_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB8_4
.LBB8_4:                                ; %if.end
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#14, r13
	mov.w	r13, 2(r12)
	mov.w	#1300, 10(r12)
	mov.w	#_ch_task_relocate_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.16, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#1290, 10(r12)
	mov.w	#_ch_task_relocate_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#1280, 10(r12)
	mov.w	#_ch_task_relocate_task_relocate, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_out
	mov.w	#_task_task_relocate, r15
	call	#transition_to
	jmp	.LBB8_5
.LBB8_5:                                ; %if.end.8
	add.w	#42, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_relocate, .Lfunc_end8-task_relocate

	.globl	task_insert_done
	.align	2
	.type	task_insert_done,@function
task_insert_done:                       ; @task_insert_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_insert_done_task_insert_done, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_insert_done, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_insert_done_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_relocate_task_insert_done, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_add_task_insert_done, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.b	0(r15), r13
	and.b	#1, r13
	mov.b	r13, -3(r4)
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_insert_done_task_insert_done, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_insert_done, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.b	-3(r4), r15
	and.w	#1, r15
	add.w	r15, r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_insert_done_task_insert_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	-2(r4), r12
	cmp.w	#32, r12
	jhs	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	;DEBUG_VALUE: next_task <- [FP+-8]
	mov.w	#_task_task_insert, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_insert_done_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_2:                                ; %if.else
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_insert_done_task_print_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: next_task <- [FP+-10]
	mov.w	#_task_task_lookup, -10(r4)
	mov.w	r1, r12
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_insert_done_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#init_key, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_insert_done_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_3:                                ; %if.end
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_insert_done, .Lfunc_end9-task_insert_done

	.globl	task_lookup
	.align	2
	.type	task_lookup,@function
task_lookup:                            ; @task_lookup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_generate_key_ch_key, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_lookup_task_lookup_done, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_call_ch_calc_indexes, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_lookup_search, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_call_ch_calc_indexes, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_calc_indexes, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_lookup, .Lfunc_end10-task_lookup

	.globl	task_lookup_search
	.align	2
	.type	task_lookup_search,@function
task_lookup_search:                     ; @task_lookup_search
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	mov.b	#0, -5(r4)
	mov.w	r1, r12
	mov.w	#4, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	#8, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_ret_ch_calc_indexes, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r15
	mov.w	r12, 16(r15)
	mov.w	r12, 12(r15)
	mov.w	r12, 8(r15)
	mov.w	#_ch_mc_task_relocate_ch_filter_relocate, 14(r15)
	mov.w	#_ch_mc_task_add_ch_filter_add, 10(r15)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r15)
	mov.w	#3, 4(r15)
	mov.w	#4, 2(r15)
	mov.w	#.L.str.10, 0(r15)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	mov.w	-12(r4), r15
	cmp.w	r15, r12
	jne	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov.b	#1, -5(r4)
	jmp	.LBB11_5
.LBB11_2:                               ; %if.else
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 16(r13)
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_relocate_ch_filter_relocate, 14(r13)
	mov.w	#_ch_mc_task_add_ch_filter_add, 10(r13)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r13)
	mov.w	#3, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.12, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	-12(r4), r13
	cmp.w	r13, r12
	jne	.LBB11_4
	jmp	.LBB11_3
.LBB11_3:                               ; %if.then.6
	mov.b	#1, -5(r4)
	jmp	.LBB11_4
.LBB11_4:                               ; %if.end
	jmp	.LBB11_5
.LBB11_5:                               ; %if.end.7
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#5, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_lookup_search_task_lookup_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.19, 0(r12)
	call	#chan_out
	mov.b	-5(r4), r12
	bit.w	#1, r12
	jne	.LBB11_7
	jmp	.LBB11_6
.LBB11_6:                               ; %if.then.8
	mov.w	-12(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.20, 0(r13)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB11_7
.LBB11_7:                               ; %if.end.10
	mov.w	#_task_task_lookup_done, r15
	call	#transition_to
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_lookup_search, .Lfunc_end11-task_lookup_search

	.globl	task_lookup_done
	.align	2
	.type	task_lookup_done,@function
task_lookup_done:                       ; @task_lookup_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_lookup_search_task_lookup_done, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.19, 0(r12)
	call	#chan_in
	mov.b	0(r15), r13
	and.b	#1, r13
	mov.b	r13, -1(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_lookup_done_task_lookup_done, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_lookup_done, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	add.w	#1, r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_lookup_done_task_lookup_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_lookup_done_task_lookup_done, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_lookup_done, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.b	-1(r4), r15
	and.w	#1, r15
	add.w	r15, r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_lookup_done_task_lookup_done, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	-4(r4), r12
	cmp.w	#32, r12
	jhs	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	;DEBUG_VALUE: next_task <- [FP+-8]
	mov.w	#_task_task_lookup, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_lookup_done_task_generate_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB12_3
.LBB12_2:                               ; %if.else
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_lookup_done_task_print_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_out
	mov.w	#_task_task_print_stats, r15
	call	#transition_to
	jmp	.LBB12_3
.LBB12_3:                               ; %if.end
	add.w	#22, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_lookup_done, .Lfunc_end12-task_lookup_done

	.globl	task_print_stats
	.align	2
	.type	task_print_stats,@function
task_print_stats:                       ; @task_print_stats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#36, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_insert_done_task_print_stats, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_lookup_done_task_print_stats, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.4, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	&overflow, r12
	mov.w	&0x03D0, r15
	mov.w	r1, r13
	mov.w	r15, 4(r13)
	mov.w	r12, 2(r13)
	mov.w	#.L.str.21, 0(r13)
	call	#printf
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#32, 6(r14)
	mov.w	#.L.str.22, 0(r14)
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.23, 0(r12)
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB13_1
.LBB13_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#128, r12
	jhs	.LBB13_7
	jmp	.LBB13_2
.LBB13_2:                               ; %for.body
                                        ;   in Loop: Header=BB13_1 Depth=1
	;DEBUG_VALUE: fp <- [FP+-8]
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 16(r13)
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_relocate_ch_filter_relocate, 14(r13)
	mov.w	#_ch_mc_task_add_ch_filter_add, 10(r13)
	mov.w	#_ch_mc_task_init_ch_filter, 6(r13)
	mov.w	#3, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.24, 0(r13)
	call	#printf
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB13_5
	jmp	.LBB13_3
.LBB13_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	bit.w	#7, r12
	jne	.LBB13_5
	jmp	.LBB13_4
.LBB13_4:                               ; %if.then
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.25, 0(r12)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	jmp	.LBB13_5
.LBB13_5:                               ; %if.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_6
.LBB13_6:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB13_1
.LBB13_7:                               ; %for.end
	mov.w	#_task_task_done, r15
	call	#transition_to
	add.w	#36, r1
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_print_stats, .Lfunc_end13-task_print_stats

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
.Lfunc_end14:
	.size	task_done, .Lfunc_end14-task_done

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
	mov.w	#.L.str.26, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end15:
	.size	init, .Lfunc_end15-init

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
.Lfunc_end16:
	.size	_entry_task, .Lfunc_end16-_entry_task

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
.Lfunc_end17:
	.size	_init, .Lfunc_end17-_init

	.align	2
	.type	hash_to_fingerprint,@function
hash_to_fingerprint:                    ; @hash_to_fingerprint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: hash_to_fingerprint:key <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r4, r15
	sub.w	#2, r15
	;DEBUG_VALUE: hash_to_fingerprint:key <- [R15+0]
	mov.w	#2, r14
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#djb_hash
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end18:
	.size	hash_to_fingerprint, .Lfunc_end18-hash_to_fingerprint

	.align	2
	.type	hash_to_index,@function
hash_to_index:                          ; @hash_to_index
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: hash_to_index:fp <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r4, r15
	sub.w	#2, r15
	;DEBUG_VALUE: hash_to_index:fp <- [R15+0]
	mov.w	#2, r14
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#djb_hash
	mov.w	r15, -4(r4)
	and.w	#127, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end19:
	.size	hash_to_index, .Lfunc_end19-hash_to_index

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
.Lfunc_end20:
	.size	init_hw, .Lfunc_end20-init_hw

	.align	2
	.type	djb_hash,@function
djb_hash:                               ; @djb_hash
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:len <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#5381, -6(r4)
	mov.w	#0, -8(r4)
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB21_1
.LBB21_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB21_4
	jmp	.LBB21_2
.LBB21_2:                               ; %for.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	add.w	r12, r13
	mov.w	-2(r4), r12
	mov.b	0(r12), r12
	add.w	r12, r13
	mov.w	r13, -6(r4)
	jmp	.LBB21_3
.LBB21_3:                               ; %for.inc
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB21_1
.LBB21_4:                               ; %for.end
	mov.w	-6(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end21:
	.size	djb_hash, .Lfunc_end21-djb_hash

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
.Lfunc_end22:
	.size	msp_watchdog_enable, .Lfunc_end22-msp_watchdog_enable

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
.Lfunc_end23:
	.size	msp_watchdog_disable, .Lfunc_end23-msp_watchdog_disable

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
.Lfunc_end24:
	.size	msp_watchdog_kick, .Lfunc_end24-msp_watchdog_kick

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
	jeq	.LBB25_4
	jmp	.LBB25_1
.LBB25_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB25_2
.LBB25_2:                               ; %while.body
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
	jne	.LBB25_2
	jmp	.LBB25_3
.LBB25_3:                               ; %while.end.loopexit
	jmp	.LBB25_4
.LBB25_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end25:
	.size	memcpy, .Lfunc_end25-memcpy

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
.Lfunc_end26:
	.size	my_memset, .Lfunc_end26-my_memset

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
.Lfunc_end27:
	.size	msp_clock_setup, .Lfunc_end27-msp_clock_setup

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
.Lfunc_end28:
	.size	mult16, .Lfunc_end28-mult16

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
	jmp	.LBB29_1
.LBB29_1:                               ; %while.cond
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
	jeq	.LBB29_3
	jmp	.LBB29_2
.LBB29_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB29_3
.LBB29_3:                               ; %land.end
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB29_10
	jmp	.LBB29_4
.LBB29_4:                               ; %while.body
                                        ;   in Loop: Header=BB29_1 Depth=1
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
	jeq	.LBB29_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB29_6:                               ; %while.body
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB29_8
	jmp	.LBB29_7
.LBB29_7:                               ; %if.then
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB29_9
.LBB29_8:                               ; %if.else
                                        ;   in Loop: Header=BB29_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB29_9
.LBB29_9:                               ; %if.end
                                        ;   in Loop: Header=BB29_1 Depth=1
	jmp	.LBB29_1
.LBB29_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end29:
	.size	sqrt16, .Lfunc_end29-sqrt16

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
	jmp	.LBB30_1
.LBB30_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB30_4
	jmp	.LBB30_2
.LBB30_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB30_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB30_4
	jmp	.LBB30_3
.LBB30_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB30_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB30_4
.LBB30_4:                               ; %land.end
                                        ;   in Loop: Header=BB30_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB30_6
	jmp	.LBB30_5
.LBB30_5:                               ; %while.body
                                        ;   in Loop: Header=BB30_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB30_1
.LBB30_6:                               ; %while.end
	jmp	.LBB30_7
.LBB30_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB30_11
	jmp	.LBB30_8
.LBB30_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB30_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB30_10
	jmp	.LBB30_9
.LBB30_9:                               ; %if.then
                                        ;   in Loop: Header=BB30_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB30_10
.LBB30_10:                              ; %if.end
                                        ;   in Loop: Header=BB30_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB30_7
.LBB30_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB30_13
	jmp	.LBB30_12
.LBB30_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB30_14
.LBB30_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB30_14
.LBB30_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end30:
	.size	udivmodhi4, .Lfunc_end30-udivmodhi4

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
	jge	.LBB31_2
	jmp	.LBB31_1
.LBB31_1:                               ; %if.then
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
	jmp	.LBB31_2
.LBB31_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB31_4
	jmp	.LBB31_3
.LBB31_3:                               ; %if.then.2
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
	jmp	.LBB31_4
.LBB31_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB31_6
	jmp	.LBB31_5
.LBB31_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB31_6
.LBB31_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	__divhi3, .Lfunc_end31-__divhi3

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
	jge	.LBB32_2
	jmp	.LBB32_1
.LBB32_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB32_2
.LBB32_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB32_4
	jmp	.LBB32_3
.LBB32_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB32_4
.LBB32_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB32_6
	jmp	.LBB32_5
.LBB32_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB32_6
.LBB32_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end32:
	.size	__modhi3, .Lfunc_end32-__modhi3

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
.Lfunc_end33:
	.size	__udivhi3, .Lfunc_end33-__udivhi3

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
.Lfunc_end34:
	.size	__umodhi3, .Lfunc_end34-__umodhi3

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
	jeq	.LBB35_7
	jmp	.LBB35_1
.LBB35_1:                               ; %if.then
	;DEBUG_VALUE: i <- [FP+-4]
	;DEBUG_VALUE: dirty_self_fields <- [FP+-6]
	mov.w	-2(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB35_2
.LBB35_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	72(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#1, r12
	jl	.LBB35_6
	jmp	.LBB35_3
.LBB35_3:                               ; %while.body
                                        ;   in Loop: Header=BB35_2 Depth=1
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
	jeq	.LBB35_5
	jmp	.LBB35_4
.LBB35_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB35_2 Depth=1
	mov.w	-8(r4), r12
	;APP
	SWPB 0(r12)

	;NO_APP
	jmp	.LBB35_5
.LBB35_5:                               ; %if.end
                                        ;   in Loop: Header=BB35_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 72(r13)
	jmp	.LBB35_2
.LBB35_6:                               ; %while.end
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 74(r13)
	jmp	.LBB35_7
.LBB35_7:                               ; %if.end.8
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end35:
	.size	task_prologue, .Lfunc_end35-task_prologue

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
.Lfunc_end36:
	.size	transition_to, .Lfunc_end36-transition_to

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
	jmp	.LBB37_1
.LBB37_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB37_12
	jmp	.LBB37_2
.LBB37_2:                               ; %for.body
                                        ;   in Loop: Header=BB37_1 Depth=1
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
	jne	.LBB37_7
	jmp	.LBB37_3
.LBB37_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB37_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-28]
	mov.w	-26(r4), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.b	0(r12), r13
	bit.b	#2, r13
	jeq	.LBB37_5
	jmp	.LBB37_4
.LBB37_4:                               ; %cond.true
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB37_6
.LBB37_5:                               ; %cond.false
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB37_6
.LBB37_6:                               ; %cond.end
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	jmp	.LBB37_8
.LBB37_7:                               ; %sw.default
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB37_8
.LBB37_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB37_10
	jmp	.LBB37_9
.LBB37_9:                               ; %if.then
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB37_10
.LBB37_10:                              ; %if.end
                                        ;   in Loop: Header=BB37_1 Depth=1
	jmp	.LBB37_11
.LBB37_11:                              ; %for.inc
                                        ;   in Loop: Header=BB37_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB37_1
.LBB37_12:                              ; %for.end
	;DEBUG_VALUE: chan_in:value <- [FP+-32]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	r12, r15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end37:
	.size	chan_in, .Lfunc_end37-chan_in

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
	jmp	.LBB38_1
.LBB38_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r13, r12
	jge	.LBB38_10
	jmp	.LBB38_2
.LBB38_2:                               ; %for.body
                                        ;   in Loop: Header=BB38_1 Depth=1
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
	jne	.LBB38_7
	jmp	.LBB38_3
.LBB38_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB38_1 Depth=1
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
	jeq	.LBB38_5
	jmp	.LBB38_4
.LBB38_4:                               ; %cond.true
                                        ;   in Loop: Header=BB38_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB38_6
.LBB38_5:                               ; %cond.false
                                        ;   in Loop: Header=BB38_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB38_6
.LBB38_6:                               ; %cond.end
                                        ;   in Loop: Header=BB38_1 Depth=1
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
	jmp	.LBB38_8
.LBB38_7:                               ; %sw.default
                                        ;   in Loop: Header=BB38_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB38_8
.LBB38_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB38_1 Depth=1
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
	jmp	.LBB38_9
.LBB38_9:                               ; %for.inc
                                        ;   in Loop: Header=BB38_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB38_1
.LBB38_10:                              ; %for.end
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end38:
	.size	chan_out, .Lfunc_end38-chan_out

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
.Lfunc_end39:
	.size	main, .Lfunc_end39-main

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

	.type	_task_task_generate_key,@object ; @_task_task_generate_key
	.globl	_task_task_generate_key
	.align	1
_task_task_generate_key:
	.short	task_generate_key
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_generate_key\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_generate_key, 108

	.type	_task_task_insert,@object ; @_task_task_insert
	.globl	_task_task_insert
	.align	1
_task_task_insert:
	.short	task_insert
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_insert\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_insert, 108

	.type	_task_task_calc_indexes,@object ; @_task_task_calc_indexes
	.globl	_task_task_calc_indexes
	.align	1
_task_task_calc_indexes:
	.short	task_calc_indexes
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_calc_indexes\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_calc_indexes, 108

	.type	_task_task_calc_indexes_index_1,@object ; @_task_task_calc_indexes_index_1
	.globl	_task_task_calc_indexes_index_1
	.align	1
_task_task_calc_indexes_index_1:
	.short	task_calc_indexes_index_1
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_calc_indexes_index_1\000\000\000\000\000\000"
	.size	_task_task_calc_indexes_index_1, 108

	.type	_task_task_calc_indexes_index_2,@object ; @_task_task_calc_indexes_index_2
	.globl	_task_task_calc_indexes_index_2
	.align	1
_task_task_calc_indexes_index_2:
	.short	task_calc_indexes_index_2
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_calc_indexes_index_2\000\000\000\000\000\000"
	.size	_task_task_calc_indexes_index_2, 108

	.type	_task_task_add,@object  ; @_task_task_add
	.globl	_task_task_add
	.align	1
_task_task_add:
	.short	task_add
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_add\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_add, 108

	.type	_task_task_relocate,@object ; @_task_task_relocate
	.globl	_task_task_relocate
	.align	1
_task_task_relocate:
	.short	task_relocate
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_relocate\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_relocate, 108

	.type	_task_task_insert_done,@object ; @_task_task_insert_done
	.globl	_task_task_insert_done
	.align	1
_task_task_insert_done:
	.short	task_insert_done
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_insert_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_insert_done, 108

	.type	_task_task_lookup,@object ; @_task_task_lookup
	.globl	_task_task_lookup
	.align	1
_task_task_lookup:
	.short	task_lookup
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_lookup\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_lookup, 108

	.type	_task_task_lookup_search,@object ; @_task_task_lookup_search
	.globl	_task_task_lookup_search
	.align	1
_task_task_lookup_search:
	.short	task_lookup_search
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_lookup_search\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_lookup_search, 108

	.type	_task_task_lookup_done,@object ; @_task_task_lookup_done
	.globl	_task_task_lookup_done
	.align	1
_task_task_lookup_done:
	.short	task_lookup_done
	.long	4096                    ; 0x1000
	.short	12                      ; 0xc
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_lookup_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_lookup_done, 108

	.type	_task_task_print_stats,@object ; @_task_task_print_stats
	.globl	_task_task_print_stats
	.align	1
_task_task_print_stats:
	.short	task_print_stats
	.long	8192                    ; 0x2000
	.short	13                      ; 0xd
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_print_stats\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print_stats, 108

	.type	_task_task_done,@object ; @_task_task_done
	.globl	_task_task_done
	.align	1
_task_task_done:
	.short	task_done
	.long	16384                   ; 0x4000
	.short	14                      ; 0xe
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_done, 108

	.type	_ch_task_init_task_generate_key,@object ; @_ch_task_init_task_generate_key
	.globl	_ch_task_init_task_generate_key
	.align	1
_ch_task_init_task_generate_key:
	.zero	10
	.size	_ch_task_init_task_generate_key, 10

	.type	_ch_task_init_task_insert_done,@object ; @_ch_task_init_task_insert_done
	.globl	_ch_task_init_task_insert_done
	.align	1
_ch_task_init_task_insert_done:
	.zero	10
	.size	_ch_task_init_task_insert_done, 10

	.type	_ch_task_init_task_lookup_done,@object ; @_ch_task_init_task_lookup_done
	.globl	_ch_task_init_task_lookup_done
	.align	1
_ch_task_init_task_lookup_done:
	.zero	10
	.size	_ch_task_init_task_lookup_done, 10

	.type	_ch_mc_task_generate_key_ch_key,@object ; @_ch_mc_task_generate_key_ch_key
	.globl	_ch_mc_task_generate_key_ch_key
	.align	1
_ch_mc_task_generate_key_ch_key:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_generate_key_ch_key, 6

	.type	_ch_task_insert_task_insert,@object ; @_ch_task_insert_task_insert
	.globl	_ch_task_insert_task_insert
	.align	1
_ch_task_insert_task_insert:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_insert_task_insert, 12

	.type	_ch_mc_task_init_ch_filter,@object ; @_ch_mc_task_init_ch_filter
	.globl	_ch_mc_task_init_ch_filter
	.align	1
_ch_mc_task_init_ch_filter:
	.short	2                       ; 0x2
	.zero	512
	.size	_ch_mc_task_init_ch_filter, 514

	.type	_ch_mc_task_add_ch_filter_add,@object ; @_ch_mc_task_add_ch_filter_add
	.globl	_ch_mc_task_add_ch_filter_add
	.align	1
_ch_mc_task_add_ch_filter_add:
	.short	2                       ; 0x2
	.zero	512
	.size	_ch_mc_task_add_ch_filter_add, 514

	.type	_ch_mc_task_relocate_ch_filter_relocate,@object ; @_ch_mc_task_relocate_ch_filter_relocate
	.globl	_ch_mc_task_relocate_ch_filter_relocate
	.align	1
_ch_mc_task_relocate_ch_filter_relocate:
	.short	2                       ; 0x2
	.zero	512
	.size	_ch_mc_task_relocate_ch_filter_relocate, 514

	.type	_ch_call_ch_calc_indexes,@object ; @_ch_call_ch_calc_indexes
	.globl	_ch_call_ch_calc_indexes
	.align	1
_ch_call_ch_calc_indexes:
	.short	3                       ; 0x3
	.zero	8
	.size	_ch_call_ch_calc_indexes, 10

	.type	_ch_ret_ch_calc_indexes,@object ; @_ch_ret_ch_calc_indexes
	.globl	_ch_ret_ch_calc_indexes
	.align	1
_ch_ret_ch_calc_indexes:
	.short	4                       ; 0x4
	.zero	12
	.size	_ch_ret_ch_calc_indexes, 14

	.type	_ch_task_calc_indexes_task_calc_indexes_index_2,@object ; @_ch_task_calc_indexes_task_calc_indexes_index_2
	.globl	_ch_task_calc_indexes_task_calc_indexes_index_2
	.align	1
_ch_task_calc_indexes_task_calc_indexes_index_2:
	.zero	6
	.size	_ch_task_calc_indexes_task_calc_indexes_index_2, 6

	.type	_ch_task_calc_indexes_index_1_task_calc_indexes_index_2,@object ; @_ch_task_calc_indexes_index_1_task_calc_indexes_index_2
	.globl	_ch_task_calc_indexes_index_1_task_calc_indexes_index_2
	.align	1
_ch_task_calc_indexes_index_1_task_calc_indexes_index_2:
	.zero	6
	.size	_ch_task_calc_indexes_index_1_task_calc_indexes_index_2, 6

	.type	_ch_task_add_task_relocate,@object ; @_ch_task_add_task_relocate
	.globl	_ch_task_add_task_relocate
	.align	1
_ch_task_add_task_relocate:
	.zero	14
	.size	_ch_task_add_task_relocate, 14

	.type	_ch_task_add_task_add,@object ; @_ch_task_add_task_add
	.globl	_ch_task_add_task_add
	.align	1
_ch_task_add_task_add:
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
	.size	_ch_task_add_task_add, 1282

	.type	_ch_task_add_task_insert_done,@object ; @_ch_task_add_task_insert_done
	.globl	_ch_task_add_task_insert_done
	.align	1
_ch_task_add_task_insert_done:
	.zero	6
	.size	_ch_task_add_task_insert_done, 6

	.type	_ch_task_relocate_task_relocate,@object ; @_ch_task_relocate_task_relocate
	.globl	_ch_task_relocate_task_relocate
	.align	1
_ch_task_relocate_task_relocate:
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
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_relocate_task_relocate, 1312

	.type	_ch_task_relocate_task_insert_done,@object ; @_ch_task_relocate_task_insert_done
	.globl	_ch_task_relocate_task_insert_done
	.align	1
_ch_task_relocate_task_insert_done:
	.zero	6
	.size	_ch_task_relocate_task_insert_done, 6

	.type	_ch_task_lookup_task_lookup_done,@object ; @_ch_task_lookup_task_lookup_done
	.globl	_ch_task_lookup_task_lookup_done
	.align	1
_ch_task_lookup_task_lookup_done:
	.zero	10
	.size	_ch_task_lookup_task_lookup_done, 10

	.type	_ch_task_insert_done_task_insert_done,@object ; @_ch_task_insert_done_task_insert_done
	.globl	_ch_task_insert_done_task_insert_done
	.align	1
_ch_task_insert_done_task_insert_done:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_insert_done_task_insert_done, 22

	.type	_ch_task_lookup_done_task_lookup_done,@object ; @_ch_task_lookup_done_task_lookup_done
	.globl	_ch_task_lookup_done_task_lookup_done
	.align	1
_ch_task_lookup_done_task_lookup_done:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_lookup_done_task_lookup_done, 22

	.type	_ch_task_insert_done_task_generate_key,@object ; @_ch_task_insert_done_task_generate_key
	.globl	_ch_task_insert_done_task_generate_key
	.align	1
_ch_task_insert_done_task_generate_key:
	.zero	10
	.size	_ch_task_insert_done_task_generate_key, 10

	.type	_ch_task_lookup_done_task_generate_key,@object ; @_ch_task_lookup_done_task_generate_key
	.globl	_ch_task_lookup_done_task_generate_key
	.align	1
_ch_task_lookup_done_task_generate_key:
	.zero	10
	.size	_ch_task_lookup_done_task_generate_key, 10

	.type	_ch_task_insert_done_task_print_stats,@object ; @_ch_task_insert_done_task_print_stats
	.globl	_ch_task_insert_done_task_print_stats
	.align	1
_ch_task_insert_done_task_print_stats:
	.zero	6
	.size	_ch_task_insert_done_task_print_stats, 6

	.type	_ch_task_lookup_done_task_print_stats,@object ; @_ch_task_lookup_done_task_print_stats
	.globl	_ch_task_lookup_done_task_print_stats
	.align	1
_ch_task_lookup_done_task_print_stats:
	.zero	6
	.size	_ch_task_lookup_done_task_print_stats, 6

	.type	_ch_task_generate_key_task_generate_key,@object ; @_ch_task_generate_key_task_generate_key
	.globl	_ch_task_generate_key_task_generate_key
	.align	1
_ch_task_generate_key_task_generate_key:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_generate_key_task_generate_key, 12

	.type	_ch_task_lookup_search_task_lookup_done,@object ; @_ch_task_lookup_search_task_lookup_done
	.globl	_ch_task_lookup_search_task_lookup_done
	.align	1
_ch_task_lookup_search_task_lookup_done:
	.zero	6
	.size	_ch_task_lookup_search_task_lookup_done, 6

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

	.type	work_x,@object          ; @work_x
	.comm	work_x,2,2
	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"filter[i]"
	.size	.L.str, 10

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"insert_count"
	.size	.L.str.1, 13

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"lookup_count"
	.size	.L.str.2, 13

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"inserted_count"
	.size	.L.str.3, 15

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"member_count"
	.size	.L.str.4, 13

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"key"
	.size	.L.str.5, 4

	.type	init_key,@object        ; @init_key
	.data
	.align	1
init_key:
	.short	1                       ; 0x1
	.size	init_key, 2

	.type	.L.str.6,@object        ; @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"next_task"
	.size	.L.str.6, 10

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"fingerprint"
	.size	.L.str.7, 12

	.type	.L.str.8,@object        ; @.str.8
.L.str.8:
	.asciz	"index1"
	.size	.L.str.8, 7

	.type	.L.str.9,@object        ; @.str.9
.L.str.9:
	.asciz	"index2"
	.size	.L.str.9, 7

	.type	.L.str.10,@object       ; @.str.10
.L.str.10:
	.asciz	"filter[index1]"
	.size	.L.str.10, 15

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"success"
	.size	.L.str.11, 8

	.type	.L.str.12,@object       ; @.str.12
.L.str.12:
	.asciz	"filter[index2]"
	.size	.L.str.12, 15

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"filter[index_victim]"
	.size	.L.str.13, 21

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"index_victim"
	.size	.L.str.14, 13

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"fp_victim"
	.size	.L.str.15, 10

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"relocation_count"
	.size	.L.str.16, 17

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"filter[index2_victim]"
	.size	.L.str.17, 22

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"insert: lost fp %04x\r\n"
	.size	.L.str.18, 23

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	"member"
	.size	.L.str.19, 7

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"lookup: key %04x not member\r\n"
	.size	.L.str.20, 30

	.type	.L.str.21,@object       ; @.str.21
.L.str.21:
	.asciz	"REAL TIME end is 65536*%u+%u\r\n"
	.size	.L.str.21, 31

	.type	.L.str.22,@object       ; @.str.22
.L.str.22:
	.asciz	"stats: inserts %u members %u total %u\r\n"
	.size	.L.str.22, 40

	.type	.L.str.23,@object       ; @.str.23
.L.str.23:
	.asciz	"filter:\r\n"
	.size	.L.str.23, 10

	.type	.L.str.24,@object       ; @.str.24
.L.str.24:
	.asciz	"%04x "
	.size	.L.str.24, 6

	.type	.L.str.25,@object       ; @.str.25
.L.str.25:
	.asciz	"\r\n"
	.size	.L.str.25, 3

	.type	.L.str.26,@object       ; @.str.26
.L.str.26:
	.asciz	".%u.\r\n"
	.size	.L.str.26, 7

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
