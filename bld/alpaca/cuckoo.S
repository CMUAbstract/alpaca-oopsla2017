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
	sub.w	#2, r1
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
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	#0, _global_filter(r12)
	jmp	.LBB1_3
.LBB1_3:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB1_1
.LBB1_4:                                ; %for.end
	mov.w	#0, &_global_insert_count
	mov.w	#0, &_global_lookup_count
	mov.w	#0, &_global_inserted_count
	mov.w	#0, &_global_member_count
	mov.w	&init_key, r12
	mov.w	r12, &_global_key
	mov.w	#_task_task_insert, &_global_next_task
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	add.w	#2, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	task_init, .Lfunc_end1-task_init

	.globl	task_init_array
	.align	2
	.type	task_init_array,@function
task_init_array:                        ; @task_init_array
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&_global_index, r12
	mov.w	r12, &_global_index_bak
	mov.w	#0, -2(r4)
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#31, r12
	jhs	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	&_global_index_bak, r15
	mov.w	#31, r14
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-4(r4), r12             ; 2-byte Folded Reload
	add.w	r15, r12
	rla.w	r12
	mov.w	#0, _global_filter(r12)
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	mov.w	&_global_index_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_index_bak
	cmp.w	#4, r12
	jne	.LBB2_6
	jmp	.LBB2_5
.LBB2_5:                                ; %if.then
	mov.w	#_global_index, r14
	mov.w	#_global_index_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB2_7
.LBB2_6:                                ; %if.else
	mov.w	#_global_index, r14
	mov.w	#_global_index_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_init_array, r15
	call	#transition_to
	jmp	.LBB2_7
.LBB2_7:                                ; %if.end
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_init_array, .Lfunc_end2-task_init_array

	.globl	task_generate_key
	.align	2
	.type	task_generate_key,@function
task_generate_key:                      ; @task_generate_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	#_global_key, r14
	mov.w	&_global_key, r12
	mov.w	r12, &_global_key_bak
	mov.w	#_global_key_bak, r15
	mov.w	#17, r13
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r14, -4(r4)             ; 2-byte Folded Spill
	mov.w	r13, r14
	call	#__mulhi3hw_noint
	add.w	#17, r15
	mov.w	r15, &_global_key_bak
	mov.w	&_global_next_task, r15
	mov.w	#2, r13
	mov.w	-2(r4), r12             ; 2-byte Folded Reload
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	-4(r4), r14             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-6(r4), r15             ; 2-byte Folded Reload
	call	#transition_to
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_generate_key, .Lfunc_end3-task_generate_key

	.globl	task_calc_indexes
	.align	2
	.type	task_calc_indexes,@function
task_calc_indexes:                      ; @task_calc_indexes
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	&_global_key, r15
	call	#hash_to_fingerprint
	mov.w	r15, &_global_fingerprint
	mov.w	#_task_task_calc_indexes_index_1, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_calc_indexes, .Lfunc_end4-task_calc_indexes

	.globl	task_calc_indexes_index_1
	.align	2
	.type	task_calc_indexes_index_1,@function
task_calc_indexes_index_1:              ; @task_calc_indexes_index_1
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	&_global_key, r15
	call	#hash_to_index
	mov.w	r15, &_global_index1
	mov.w	#_task_task_calc_indexes_index_2, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_calc_indexes_index_1, .Lfunc_end5-task_calc_indexes_index_1

	.globl	task_calc_indexes_index_2
	.align	2
	.type	task_calc_indexes_index_2,@function
task_calc_indexes_index_2:              ; @task_calc_indexes_index_2
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	&_global_fingerprint, r15
	call	#hash_to_index
	mov.w	r15, -2(r4)
	mov.w	&_global_index1, r12
	xor.w	r15, r12
	mov.w	r12, &_global_index2
	mov.w	&_global_next_task, r15
	call	#transition_to
	add.w	#2, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_calc_indexes_index_2, .Lfunc_end6-task_calc_indexes_index_2

	.globl	task_insert
	.align	2
	.type	task_insert,@function
task_insert:                            ; @task_insert
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_add, &_global_next_task
	mov.w	#_task_task_calc_indexes, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_insert, .Lfunc_end7-task_insert

	.globl	task_add
	.align	2
	.type	task_add,@function
task_add:                               ; @task_add
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#44, r1
	mov.w	&_global_fingerprint, r12
	mov.w	r12, &_global_fingerprint_bak
	mov.w	&_global_index1, r12
	mov.w	r12, &_global_index1_bak
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_filter_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jeq	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %entry.split1
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB8_2
.LBB8_2:                                ; %entry.split
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	cmp.w	#0, r12
	jne	.LBB8_6
	jmp	.LBB8_3
.LBB8_3:                                ; %if.then
	mov.b	#1, &_global_success
	mov.w	&_global_fingerprint_bak, r12
	mov.w	&_global_index1_bak, r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_filter, r14
	mov.w	r13, r15
	add.w	#_global_filter_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_filter_bak(r13)
	mov.w	r13, r12
	add.w	#_global_filter_isDirty, r12
	mov.w	_global_filter_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -10(r4)            ; 2-byte Folded Spill
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r14, -14(r4)            ; 2-byte Folded Spill
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_5
	jmp	.LBB8_4
.LBB8_4:                                ; %if.then.split2
	mov.w	#2, r13
	mov.w	-16(r4), r15            ; 2-byte Folded Reload
	mov.w	-14(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	mov.w	-10(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB8_5
.LBB8_5:                                ; %if.then.split
	mov.w	#_global_fingerprint, r14
	mov.w	#_global_fingerprint_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	#_global_index1_bak, r15
	mov.w	-18(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	br	#.LBB8_23
.LBB8_6:                                ; %if.else
	mov.w	&_global_index2, r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_filter_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %if.else.split3
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB8_8
.LBB8_8:                                ; %if.else.split
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	cmp.w	#0, r12
	jne	.LBB8_12
	jmp	.LBB8_9
.LBB8_9:                                ; %if.then.4
	mov.b	#1, &_global_success
	mov.w	&_global_fingerprint_bak, r12
	mov.w	&_global_index2, r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_filter, r14
	mov.w	r13, r15
	add.w	#_global_filter_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_filter_bak(r13)
	mov.w	r13, r12
	add.w	#_global_filter_isDirty, r12
	mov.w	_global_filter_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	mov.w	r14, -26(r4)            ; 2-byte Folded Spill
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ; %if.then.4.split4
	mov.w	#2, r13
	mov.w	-28(r4), r15            ; 2-byte Folded Reload
	mov.w	-26(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-24(r4), r13            ; 2-byte Folded Reload
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB8_11
.LBB8_11:                               ; %if.then.4.split
	mov.w	#_global_fingerprint, r14
	mov.w	#_global_fingerprint_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	#_global_index1_bak, r15
	mov.w	-30(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_12:                               ; %if.else.6
	;DEBUG_VALUE: fp_victim <- [FP+-2]
	;DEBUG_VALUE: index_victim <- [FP+-4]
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
	jeq	.LBB8_16
	jmp	.LBB8_13
.LBB8_13:                               ; %if.then.8
	mov.w	&_global_index1_bak, r12
	mov.w	r12, -6(r4)
	mov.w	&_global_index1_bak, r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_filter_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_15
	jmp	.LBB8_14
.LBB8_14:                               ; %if.then.8.split5
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB8_15
.LBB8_15:                               ; %if.then.8.split
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	mov.w	r12, -4(r4)
	jmp	.LBB8_19
.LBB8_16:                               ; %if.else.10
	mov.w	&_global_index2, r12
	mov.w	r12, -6(r4)
	mov.w	&_global_index2, r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_filter_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_18
	jmp	.LBB8_17
.LBB8_17:                               ; %if.else.10.split6
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB8_18
.LBB8_18:                               ; %if.else.10.split
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	mov.w	r12, -4(r4)
	jmp	.LBB8_19
.LBB8_19:                               ; %if.end
	mov.w	&_global_fingerprint_bak, r12
	mov.w	-6(r4), r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_filter, r14
	mov.w	r13, r15
	add.w	#_global_filter_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_filter_bak(r13)
	mov.w	r13, r12
	add.w	#_global_filter_isDirty, r12
	mov.w	_global_filter_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -36(r4)            ; 2-byte Folded Spill
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	mov.w	r14, -40(r4)            ; 2-byte Folded Spill
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_21
	jmp	.LBB8_20
.LBB8_20:                               ; %if.end.split7
	mov.w	#2, r13
	mov.w	-42(r4), r15            ; 2-byte Folded Reload
	mov.w	-40(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	mov.w	-36(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB8_21
.LBB8_21:                               ; %if.end.split
	mov.w	-6(r4), r12
	mov.w	r12, &_global_index1_bak
	mov.w	#_global_index1_bak, r15
	mov.w	-4(r4), r12
	mov.w	r12, &_global_fingerprint_bak
	mov.w	#_global_fingerprint_bak, r12
	mov.w	#0, &_global_relocation_count
	mov.w	#_global_fingerprint, r14
	mov.w	#2, r13
	mov.w	r15, -44(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r13, -46(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	-44(r4), r15            ; 2-byte Folded Reload
	mov.w	-46(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_relocate, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_22:                               ; %if.end.13
	jmp	.LBB8_23
.LBB8_23:                               ; %if.end.14
	add.w	#44, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_add, .Lfunc_end8-task_add

	.globl	task_relocate
	.align	2
	.type	task_relocate,@function
task_relocate:                          ; @task_relocate
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#40, r1
	mov.w	&_global_fingerprint, r12
	mov.w	r12, &_global_fingerprint_bak
	mov.w	&_global_index1, r12
	mov.w	r12, &_global_index1_bak
	mov.w	&_global_relocation_count, r12
	mov.w	r12, &_global_relocation_count_bak
	mov.w	&_global_fingerprint_bak, r12
	mov.w	r12, -4(r4)
	mov.w	r12, r15
	call	#hash_to_index
	mov.w	r15, -6(r4)
	mov.w	&_global_index1_bak, r12
	xor.w	r15, r12
	mov.w	r12, -8(r4)
	mov.w	r12, r15
	rla.w	r15
	mov.w	_global_filter_isDirty(r15), r15
	mov.w	&_numBoots, r13
	cmp.w	r13, r15
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %entry.split1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB9_2
.LBB9_2:                                ; %entry.split
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	cmp.w	#0, r12
	jne	.LBB9_6
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then
	mov.b	#1, &_global_success
	mov.w	-4(r4), r12
	mov.w	-8(r4), r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_filter, r14
	mov.w	r13, r15
	add.w	#_global_filter_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_filter_bak(r13)
	mov.w	r13, r12
	add.w	#_global_filter_isDirty, r12
	mov.w	_global_filter_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	mov.w	r14, -16(r4)            ; 2-byte Folded Spill
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_5
	jmp	.LBB9_4
.LBB9_4:                                ; %if.then.split2
	mov.w	#2, r13
	mov.w	-18(r4), r15            ; 2-byte Folded Reload
	mov.w	-16(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	mov.w	-12(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB9_5
.LBB9_5:                                ; %if.then.split
	mov.w	#_global_fingerprint, r14
	mov.w	#_global_fingerprint_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	#_global_index1_bak, r15
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_relocation_count, r14
	mov.w	#_global_relocation_count_bak, r15
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB9_13
.LBB9_6:                                ; %if.else
	mov.w	&_global_relocation_count_bak, r12
	cmp.w	#8, r12
	jlo	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %if.then.2
	mov.w	#_global_relocation_count_bak, r15
	mov.w	&_global_relocation_count_bak, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.b	#0, &_global_success
	mov.w	#_global_fingerprint, r14
	mov.w	#_global_fingerprint_bak, r12
	mov.w	#2, r13
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r13, -26(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	#_global_index1_bak, r15
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_relocation_count, r14
	mov.w	-22(r4), r15            ; 2-byte Folded Reload
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_insert_done, r15
	call	#transition_to
	jmp	.LBB9_8
.LBB9_8:                                ; %if.end
	mov.w	&_global_relocation_count_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_relocation_count_bak
	mov.w	-8(r4), r12
	mov.w	r12, &_global_index1_bak
	mov.w	-8(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_filter_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_10
	jmp	.LBB9_9
.LBB9_9:                                ; %if.end.split3
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter(r12), r13
	mov.w	r13, _global_filter_bak(r12)
	jmp	.LBB9_10
.LBB9_10:                               ; %if.end.split
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	mov.w	_global_filter_bak(r12), r12
	mov.w	r12, &_global_fingerprint_bak
	mov.w	-4(r4), r12
	mov.w	-8(r4), r13
	rla.w	r13
	mov.w	r13, r14
	add.w	#_global_filter, r14
	mov.w	r13, r15
	add.w	#_global_filter_bak, r15
	mov.w	&_numBoots, r11
	mov.w	r12, _global_filter_bak(r13)
	mov.w	r13, r12
	add.w	#_global_filter_isDirty, r12
	mov.w	_global_filter_isDirty(r13), r13
	cmp.w	r11, r13
	mov.w	r11, -30(r4)            ; 2-byte Folded Spill
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	mov.w	r14, -34(r4)            ; 2-byte Folded Spill
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_12
	jmp	.LBB9_11
.LBB9_11:                               ; %if.end.split.split4
	mov.w	#2, r13
	mov.w	-36(r4), r15            ; 2-byte Folded Reload
	mov.w	-34(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-32(r4), r13            ; 2-byte Folded Reload
	mov.w	-30(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB9_12
.LBB9_12:                               ; %if.end.split.split
	mov.w	#_global_fingerprint, r14
	mov.w	#_global_fingerprint_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_index1, r14
	mov.w	#_global_index1_bak, r15
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_relocation_count, r14
	mov.w	#_global_relocation_count_bak, r15
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_relocate, r15
	call	#transition_to
	jmp	.LBB9_13
.LBB9_13:                               ; %if.end.6
	add.w	#40, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_relocate, .Lfunc_end9-task_relocate

	.globl	task_insert_done
	.align	2
	.type	task_insert_done,@function
task_insert_done:                       ; @task_insert_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&_global_insert_count, r12
	mov.w	r12, &_global_insert_count_bak
	mov.w	&_global_inserted_count, r12
	mov.w	r12, &_global_inserted_count_bak
	mov.w	&_global_insert_count_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_insert_count_bak
	mov.b	&_global_success, r12
	and.w	#1, r12
	mov.w	&_global_inserted_count_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_inserted_count_bak
	mov.w	&_global_insert_count_bak, r12
	cmp.w	#32, r12
	jhs	.LBB10_2
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	mov.w	#_task_task_insert, &_global_next_task
	mov.w	#_global_insert_count, r14
	mov.w	#_global_insert_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -2(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_inserted_count, r14
	mov.w	#_global_inserted_count_bak, r15
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB10_3
.LBB10_2:                               ; %if.else
	mov.w	#_task_task_lookup, &_global_next_task
	mov.w	&init_key, r12
	mov.w	r12, &_global_key
	mov.w	#_global_insert_count, r14
	mov.w	#_global_insert_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_inserted_count, r14
	mov.w	#_global_inserted_count_bak, r15
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB10_3
.LBB10_3:                               ; %if.end
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_insert_done, .Lfunc_end10-task_insert_done

	.globl	task_lookup
	.align	2
	.type	task_lookup,@function
task_lookup:                            ; @task_lookup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_lookup_search, &_global_next_task
	mov.w	#_task_task_calc_indexes, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_lookup, .Lfunc_end11-task_lookup

	.globl	task_lookup_search
	.align	2
	.type	task_lookup_search,@function
task_lookup_search:                     ; @task_lookup_search
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&_global_index1, r12
	rla.w	r12
	mov.w	_global_filter(r12), r12
	mov.w	&_global_fingerprint, r13
	cmp.w	r13, r12
	jne	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	mov.b	#1, &_global_member
	jmp	.LBB12_6
.LBB12_2:                               ; %if.else
	mov.w	&_global_index2, r12
	rla.w	r12
	mov.w	_global_filter(r12), r12
	mov.w	&_global_fingerprint, r13
	cmp.w	r13, r12
	jne	.LBB12_4
	jmp	.LBB12_3
.LBB12_3:                               ; %if.then.3
	mov.b	#1, &_global_member
	jmp	.LBB12_5
.LBB12_4:                               ; %if.else.4
	mov.b	#0, &_global_member
	jmp	.LBB12_5
.LBB12_5:                               ; %if.end
	jmp	.LBB12_6
.LBB12_6:                               ; %if.end.5
	mov.b	&_global_member, r12
	bit.w	#1, r12
	jne	.LBB12_8
	jmp	.LBB12_7
.LBB12_7:                               ; %if.then.6
	mov.w	&_global_fingerprint, r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.1, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	jmp	.LBB12_8
.LBB12_8:                               ; %if.end.7
	mov.w	#_task_task_lookup_done, r15
	call	#transition_to
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_lookup_search, .Lfunc_end12-task_lookup_search

	.globl	task_lookup_done
	.align	2
	.type	task_lookup_done,@function
task_lookup_done:                       ; @task_lookup_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&_global_lookup_count, r12
	mov.w	r12, &_global_lookup_count_bak
	mov.w	&_global_member_count, r12
	mov.w	r12, &_global_member_count_bak
	mov.w	&_global_lookup_count_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_lookup_count_bak
	mov.b	&_global_member, r12
	and.w	#1, r12
	mov.w	&_global_member_count_bak, r13
	add.w	r12, r13
	mov.w	r13, &_global_member_count_bak
	mov.w	&_global_lookup_count_bak, r12
	cmp.w	#32, r12
	jhs	.LBB13_2
	jmp	.LBB13_1
.LBB13_1:                               ; %if.then
	mov.w	#_task_task_lookup, &_global_next_task
	mov.w	#_global_lookup_count, r14
	mov.w	#_global_lookup_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -2(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_member_count, r14
	mov.w	#_global_member_count_bak, r15
	mov.w	-2(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_generate_key, r15
	call	#transition_to
	jmp	.LBB13_3
.LBB13_2:                               ; %if.else
	mov.w	#_global_lookup_count, r14
	mov.w	#_global_lookup_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_member_count, r14
	mov.w	#_global_member_count_bak, r15
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_print_stats, r15
	call	#transition_to
	jmp	.LBB13_3
.LBB13_3:                               ; %if.end
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_lookup_done, .Lfunc_end13-task_lookup_done

	.globl	task_print_stats
	.align	2
	.type	task_print_stats,@function
task_print_stats:                       ; @task_print_stats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.2, 0(r14)
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.3, 0(r12)
	mov.w	r15, -4(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	jmp	.LBB14_1
.LBB14_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#128, r12
	jhs	.LBB14_7
	jmp	.LBB14_2
.LBB14_2:                               ; %for.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	mov.w	_global_filter(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.4, 0(r13)
	call	#printf
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	jeq	.LBB14_5
	jmp	.LBB14_3
.LBB14_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	bit.w	#7, r12
	jne	.LBB14_5
	jmp	.LBB14_4
.LBB14_4:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.5, 0(r12)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB14_5
.LBB14_5:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_6
.LBB14_6:                               ; %for.inc
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB14_1
.LBB14_7:                               ; %for.end
	mov.w	&_global_inserted_count, r12
	mov.w	&_global_member_count, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#32, 6(r14)
	mov.w	#.L.str.6, 0(r14)
	call	#printf
	mov.w	#_task_task_done, r12
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end14:
	.size	task_print_stats, .Lfunc_end14-task_print_stats

	.globl	task_done
	.align	2
	.type	task_done,@function
task_done:                              ; @task_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#0, r15
	call	#exit
.Lfunc_end15:
	.size	task_done, .Lfunc_end15-task_done

	.globl	init
	.align	2
	.type	init,@function
init:                                   ; @init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&timer, r12
	mov.w	0(r12), r13
	and.w	#-6401, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#512, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#192, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	and.w	#-17, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#32, r13
	mov.w	r13, 0(r12)
	mov.w	&timer, r12
	mov.w	0(r12), r13
	bis.w	#2, r13
	mov.w	r13, 0(r12)
	call	#init_hw
	call	#mspconsole_init
	;APP
	eint { nop
	;NO_APP
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	2(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.7, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end16:
	.size	init, .Lfunc_end16-init

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
.Lfunc_end17:
	.size	_entry_task, .Lfunc_end17-_entry_task

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
.Lfunc_end18:
	.size	_init, .Lfunc_end18-_init

	.globl	clear_isDirty
	.align	2
	.type	clear_isDirty,@function
clear_isDirty:                          ; @clear_isDirty
; BB#0:                                 ; %entry
	mov.w	#_global_filter_isDirty, r15
	mov.w	#0, r14
	mov.w	#256, r13
	call	#my_memset
	ret
.Lfunc_end19:
	.size	clear_isDirty, .Lfunc_end19-clear_isDirty

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
.Lfunc_end20:
	.size	hash_to_fingerprint, .Lfunc_end20-hash_to_fingerprint

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
.Lfunc_end21:
	.size	hash_to_index, .Lfunc_end21-hash_to_index

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
.Lfunc_end22:
	.size	init_hw, .Lfunc_end22-init_hw

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
	jmp	.LBB23_1
.LBB23_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB23_4
	jmp	.LBB23_2
.LBB23_2:                               ; %for.body
                                        ;   in Loop: Header=BB23_1 Depth=1
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
	jmp	.LBB23_3
.LBB23_3:                               ; %for.inc
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB23_1
.LBB23_4:                               ; %for.end
	mov.w	-6(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end23:
	.size	djb_hash, .Lfunc_end23-djb_hash

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
.Lfunc_end24:
	.size	msp_watchdog_enable, .Lfunc_end24-msp_watchdog_enable

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
.Lfunc_end25:
	.size	msp_watchdog_disable, .Lfunc_end25-msp_watchdog_disable

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
.Lfunc_end26:
	.size	msp_watchdog_kick, .Lfunc_end26-msp_watchdog_kick

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
	jeq	.LBB27_4
	jmp	.LBB27_1
.LBB27_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB27_2
.LBB27_2:                               ; %while.body
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
	jne	.LBB27_2
	jmp	.LBB27_3
.LBB27_3:                               ; %while.end.loopexit
	jmp	.LBB27_4
.LBB27_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	memcpy, .Lfunc_end27-memcpy

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
.Lfunc_end28:
	.size	my_memset, .Lfunc_end28-my_memset

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
.Lfunc_end29:
	.size	msp_clock_setup, .Lfunc_end29-msp_clock_setup

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
.Lfunc_end30:
	.size	mult16, .Lfunc_end30-mult16

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
	jmp	.LBB31_1
.LBB31_1:                               ; %while.cond
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
	jeq	.LBB31_3
	jmp	.LBB31_2
.LBB31_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB31_3
.LBB31_3:                               ; %land.end
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB31_10
	jmp	.LBB31_4
.LBB31_4:                               ; %while.body
                                        ;   in Loop: Header=BB31_1 Depth=1
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
	jeq	.LBB31_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB31_6:                               ; %while.body
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB31_8
	jmp	.LBB31_7
.LBB31_7:                               ; %if.then
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB31_9
.LBB31_8:                               ; %if.else
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB31_9
.LBB31_9:                               ; %if.end
                                        ;   in Loop: Header=BB31_1 Depth=1
	jmp	.LBB31_1
.LBB31_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end31:
	.size	sqrt16, .Lfunc_end31-sqrt16

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
	jmp	.LBB32_1
.LBB32_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB32_4
	jmp	.LBB32_2
.LBB32_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB32_4
	jmp	.LBB32_3
.LBB32_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB32_4
.LBB32_4:                               ; %land.end
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB32_6
	jmp	.LBB32_5
.LBB32_5:                               ; %while.body
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB32_1
.LBB32_6:                               ; %while.end
	jmp	.LBB32_7
.LBB32_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB32_11
	jmp	.LBB32_8
.LBB32_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB32_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB32_10
	jmp	.LBB32_9
.LBB32_9:                               ; %if.then
                                        ;   in Loop: Header=BB32_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB32_10
.LBB32_10:                              ; %if.end
                                        ;   in Loop: Header=BB32_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB32_7
.LBB32_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB32_13
	jmp	.LBB32_12
.LBB32_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB32_14
.LBB32_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB32_14
.LBB32_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end32:
	.size	udivmodhi4, .Lfunc_end32-udivmodhi4

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
	jge	.LBB33_2
	jmp	.LBB33_1
.LBB33_1:                               ; %if.then
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
	jmp	.LBB33_2
.LBB33_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB33_4
	jmp	.LBB33_3
.LBB33_3:                               ; %if.then.2
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
	jmp	.LBB33_4
.LBB33_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB33_6
	jmp	.LBB33_5
.LBB33_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB33_6
.LBB33_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	__divhi3, .Lfunc_end33-__divhi3

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
	jge	.LBB34_2
	jmp	.LBB34_1
.LBB34_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
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
	jmp	.LBB34_4
.LBB34_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB34_6
	jmp	.LBB34_5
.LBB34_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB34_6
.LBB34_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end34:
	.size	__modhi3, .Lfunc_end34-__modhi3

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
.Lfunc_end35:
	.size	__udivhi3, .Lfunc_end35-__udivhi3

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
.Lfunc_end36:
	.size	__umodhi3, .Lfunc_end36-__umodhi3

	.globl	task_prologue
	.align	2
	.type	task_prologue,@function
task_prologue:                          ; @task_prologue
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&_numBoots, r12
	cmp.w	#-1, r12
	jne	.LBB37_2
	jmp	.LBB37_1
.LBB37_1:                               ; %if.then
	call	#clear_isDirty
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	jmp	.LBB37_2
.LBB37_2:                               ; %if.end
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	mov.w	&curctx, r12
	mov.b	2(r12), r13
	cmp.b	#0, r13
	jeq	.LBB37_7
	jmp	.LBB37_3
.LBB37_3:                               ; %if.then.2
	jmp	.LBB37_4
.LBB37_4:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB37_6
	jmp	.LBB37_5
.LBB37_5:                               ; %while.body
                                        ;   in Loop: Header=BB37_4 Depth=1
	;DEBUG_VALUE: w_data_dest <- [FP+-2]
	mov.w	&data_dest_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -2(r4)
	;DEBUG_VALUE: w_data_src <- [FP+-4]
	mov.w	&data_src_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: w_data_size <- [FP+-6]
	mov.w	&data_size_base, r12
	mov.w	&gv_index, r13
	rla.w	r13
	add.w	r13, r12
	mov.w	0(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	r12, r13
	call	#memcpy
	mov.w	&gv_index, r12
	add.w	#1, r12
	mov.w	r12, &gv_index
	jmp	.LBB37_4
.LBB37_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.b	#0, 2(r12)
	jmp	.LBB37_8
.LBB37_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB37_8
.LBB37_8:                               ; %if.end.8
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end37:
	.size	task_prologue, .Lfunc_end37-task_prologue

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
	mov.w	#context_1, r14
	cmp.w	r13, r15
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB38_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB38_2:                               ; %entry
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -4(r4)
	mov.w	-2(r4), r13
	mov.w	r13, 0(r12)
	mov.w	-4(r4), r12
	mov.b	#1, 2(r12)
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
.Lfunc_end38:
	.size	transition_to, .Lfunc_end38-transition_to

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
.Lfunc_end39:
	.size	write_to_gbuf, .Lfunc_end39-write_to_gbuf

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
.Lfunc_end40:
	.size	main, .Lfunc_end40-main

	.type	timer,@object           ; @timer
	.section	.data.rel,"aw",@progbits
	.globl	timer
	.align	1
timer:
	.short	0x03C0
	.size	timer, 2

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
	.short	1                       ; 0x1
	.size	_task_task_init, 4

	.type	_task_task_generate_key,@object ; @_task_task_generate_key
	.globl	_task_task_generate_key
	.align	1
_task_task_generate_key:
	.short	task_generate_key
	.short	2                       ; 0x2
	.size	_task_task_generate_key, 4

	.type	_task_task_insert,@object ; @_task_task_insert
	.globl	_task_task_insert
	.align	1
_task_task_insert:
	.short	task_insert
	.short	3                       ; 0x3
	.size	_task_task_insert, 4

	.type	_task_task_calc_indexes,@object ; @_task_task_calc_indexes
	.globl	_task_task_calc_indexes
	.align	1
_task_task_calc_indexes:
	.short	task_calc_indexes
	.short	4                       ; 0x4
	.size	_task_task_calc_indexes, 4

	.type	_task_task_calc_indexes_index_1,@object ; @_task_task_calc_indexes_index_1
	.globl	_task_task_calc_indexes_index_1
	.align	1
_task_task_calc_indexes_index_1:
	.short	task_calc_indexes_index_1
	.short	5                       ; 0x5
	.size	_task_task_calc_indexes_index_1, 4

	.type	_task_task_calc_indexes_index_2,@object ; @_task_task_calc_indexes_index_2
	.globl	_task_task_calc_indexes_index_2
	.align	1
_task_task_calc_indexes_index_2:
	.short	task_calc_indexes_index_2
	.short	6                       ; 0x6
	.size	_task_task_calc_indexes_index_2, 4

	.type	_task_task_add,@object  ; @_task_task_add
	.globl	_task_task_add
	.align	1
_task_task_add:
	.short	task_add
	.short	7                       ; 0x7
	.size	_task_task_add, 4

	.type	_task_task_relocate,@object ; @_task_task_relocate
	.globl	_task_task_relocate
	.align	1
_task_task_relocate:
	.short	task_relocate
	.short	8                       ; 0x8
	.size	_task_task_relocate, 4

	.type	_task_task_insert_done,@object ; @_task_task_insert_done
	.globl	_task_task_insert_done
	.align	1
_task_task_insert_done:
	.short	task_insert_done
	.short	9                       ; 0x9
	.size	_task_task_insert_done, 4

	.type	_task_task_lookup,@object ; @_task_task_lookup
	.globl	_task_task_lookup
	.align	1
_task_task_lookup:
	.short	task_lookup
	.short	10                      ; 0xa
	.size	_task_task_lookup, 4

	.type	_task_task_lookup_search,@object ; @_task_task_lookup_search
	.globl	_task_task_lookup_search
	.align	1
_task_task_lookup_search:
	.short	task_lookup_search
	.short	11                      ; 0xb
	.size	_task_task_lookup_search, 4

	.type	_task_task_lookup_done,@object ; @_task_task_lookup_done
	.globl	_task_task_lookup_done
	.align	1
_task_task_lookup_done:
	.short	task_lookup_done
	.short	12                      ; 0xc
	.size	_task_task_lookup_done, 4

	.type	_task_task_print_stats,@object ; @_task_task_print_stats
	.globl	_task_task_print_stats
	.align	1
_task_task_print_stats:
	.short	task_print_stats
	.short	13                      ; 0xd
	.size	_task_task_print_stats, 4

	.type	_task_task_done,@object ; @_task_task_done
	.globl	_task_task_done
	.align	1
_task_task_done:
	.short	task_done
	.short	14                      ; 0xe
	.size	_task_task_done, 4

	.type	_task_task_init_array,@object ; @_task_task_init_array
	.globl	_task_task_init_array
	.align	1
_task_task_init_array:
	.short	task_init_array
	.short	15                      ; 0xf
	.size	_task_task_init_array, 4

	.type	_global_filter_bak,@object ; @_global_filter_bak
	.globl	_global_filter_bak
	.align	1
_global_filter_bak:
	.zero	256
	.size	_global_filter_bak, 256

	.type	_global_filter_isDirty,@object ; @_global_filter_isDirty
	.globl	_global_filter_isDirty
	.align	1
_global_filter_isDirty:
	.zero	256
	.size	_global_filter_isDirty, 256

	.type	_global_filter,@object  ; @_global_filter
	.globl	_global_filter
	.align	1
_global_filter:
	.zero	256
	.size	_global_filter, 256

	.type	_global_insert_count_bak,@object ; @_global_insert_count_bak
	.globl	_global_insert_count_bak
	.align	1
_global_insert_count_bak:
	.short	0                       ; 0x0
	.size	_global_insert_count_bak, 2

	.type	_global_insert_count,@object ; @_global_insert_count
	.globl	_global_insert_count
	.align	1
_global_insert_count:
	.short	0                       ; 0x0
	.size	_global_insert_count, 2

	.type	_global_lookup_count_bak,@object ; @_global_lookup_count_bak
	.globl	_global_lookup_count_bak
	.align	1
_global_lookup_count_bak:
	.short	0                       ; 0x0
	.size	_global_lookup_count_bak, 2

	.type	_global_lookup_count,@object ; @_global_lookup_count
	.globl	_global_lookup_count
	.align	1
_global_lookup_count:
	.short	0                       ; 0x0
	.size	_global_lookup_count, 2

	.type	_global_inserted_count_bak,@object ; @_global_inserted_count_bak
	.globl	_global_inserted_count_bak
	.align	1
_global_inserted_count_bak:
	.short	0                       ; 0x0
	.size	_global_inserted_count_bak, 2

	.type	_global_inserted_count,@object ; @_global_inserted_count
	.globl	_global_inserted_count
	.align	1
_global_inserted_count:
	.short	0                       ; 0x0
	.size	_global_inserted_count, 2

	.type	_global_member_count_bak,@object ; @_global_member_count_bak
	.globl	_global_member_count_bak
	.align	1
_global_member_count_bak:
	.short	0                       ; 0x0
	.size	_global_member_count_bak, 2

	.type	_global_member_count,@object ; @_global_member_count
	.globl	_global_member_count
	.align	1
_global_member_count:
	.short	0                       ; 0x0
	.size	_global_member_count, 2

	.type	_global_key_bak,@object ; @_global_key_bak
	.globl	_global_key_bak
	.align	1
_global_key_bak:
	.short	0                       ; 0x0
	.size	_global_key_bak, 2

	.type	_global_key,@object     ; @_global_key
	.globl	_global_key
	.align	1
_global_key:
	.short	0                       ; 0x0
	.size	_global_key, 2

	.type	_global_next_task,@object ; @_global_next_task
	.globl	_global_next_task
	.align	1
_global_next_task:
	.short	0
	.size	_global_next_task, 2

	.type	_global_index_bak,@object ; @_global_index_bak
	.globl	_global_index_bak
	.align	1
_global_index_bak:
	.short	0                       ; 0x0
	.size	_global_index_bak, 2

	.type	_global_index,@object   ; @_global_index
	.globl	_global_index
	.align	1
_global_index:
	.short	0                       ; 0x0
	.size	_global_index, 2

	.type	_global_fingerprint_bak,@object ; @_global_fingerprint_bak
	.globl	_global_fingerprint_bak
	.align	1
_global_fingerprint_bak:
	.short	0                       ; 0x0
	.size	_global_fingerprint_bak, 2

	.type	_global_fingerprint,@object ; @_global_fingerprint
	.globl	_global_fingerprint
	.align	1
_global_fingerprint:
	.short	0                       ; 0x0
	.size	_global_fingerprint, 2

	.type	_global_index1_bak,@object ; @_global_index1_bak
	.globl	_global_index1_bak
	.align	1
_global_index1_bak:
	.short	0                       ; 0x0
	.size	_global_index1_bak, 2

	.type	_global_index1,@object  ; @_global_index1
	.globl	_global_index1
	.align	1
_global_index1:
	.short	0                       ; 0x0
	.size	_global_index1, 2

	.type	_global_index2,@object  ; @_global_index2
	.globl	_global_index2
	.align	1
_global_index2:
	.short	0                       ; 0x0
	.size	_global_index2, 2

	.type	_global_success,@object ; @_global_success
	.globl	_global_success
_global_success:
	.byte	0                       ; 0x0
	.size	_global_success, 1

	.type	_global_relocation_count_bak,@object ; @_global_relocation_count_bak
	.globl	_global_relocation_count_bak
	.align	1
_global_relocation_count_bak:
	.short	0                       ; 0x0
	.size	_global_relocation_count_bak, 2

	.type	_global_relocation_count,@object ; @_global_relocation_count
	.globl	_global_relocation_count
	.align	1
_global_relocation_count:
	.short	0                       ; 0x0
	.size	_global_relocation_count, 2

	.type	_global_member,@object  ; @_global_member
	.globl	_global_member
_global_member:
	.byte	0                       ; 0x0
	.size	_global_member, 1

	.type	_task__entry_task,@object ; @_task__entry_task
	.globl	_task__entry_task
	.align	1
_task__entry_task:
	.short	_entry_task
	.short	0                       ; 0x0
	.size	_task__entry_task, 4

	.type	data_src,@object        ; @data_src
	.globl	data_src
	.align	1
data_src:
	.zero	262
	.size	data_src, 262

	.type	data_dest,@object       ; @data_dest
	.globl	data_dest
	.align	1
data_dest:
	.zero	262
	.size	data_dest, 262

	.type	data_size,@object       ; @data_size
	.globl	data_size
	.align	1
data_size:
	.zero	262
	.size	data_size, 262

	.type	init_key,@object        ; @init_key
	.data
	.align	1
init_key:
	.short	1                       ; 0x1
	.size	init_key, 2

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"relocate: max relocs reached: %u\r\n"
	.size	.L.str, 35

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"lookup: key %04x not member\r\n"
	.size	.L.str.1, 30

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"REAL TIME end is 65536*%u+%u\r\n"
	.size	.L.str.2, 31

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"filter:\r\n"
	.size	.L.str.3, 10

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"%04x "
	.size	.L.str.4, 6

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"\r\n"
	.size	.L.str.5, 3

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	"stats: inserts %u members %u total %u\r\n"
	.size	.L.str.6, 40

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	".%u.\r\n"
	.size	.L.str.7, 7

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

	.type	context_1,@object       ; @context_1
	.globl	context_1
	.align	1
context_1:
	.zero	4
	.size	context_1, 4

	.type	context_0,@object       ; @context_0
	.globl	context_0
	.align	1
context_0:
	.short	_task__entry_task
	.byte	0                       ; 0x0
	.zero	1
	.size	context_0, 4

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
