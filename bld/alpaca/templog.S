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
	mov.b	&0x0204, r12
	bis.w	#2, r12
	mov.b	r12, r13
	mov.b	r13, &0x0204
	mov.b	&0x0204, r12
	bis.w	#4, r12
	mov.b	r12, r13
	mov.b	r13, &0x0204
	mov.b	&0x0204, r12
	bis.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &0x0204
	call	#mspconsole_init
	;APP
	eint { nop
	;NO_APP
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
	mov.w	#0, &_global_parent_next
	mov.w	#0, &_global_out_len
	mov.w	#0, &_global_letter
	mov.w	#0, &_global_prev_sample
	mov.w	#0, &_global_letter_idx
	mov.w	#1, &_global_sample_count
	mov.w	#_task_task_init_dict, r15
	call	#transition_to
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
	sub.w	#10, r1
	mov.w	&_global_letter, r12
	mov.w	r12, -2(r4)
	mov.w	r12, -8(r4)
	mov.w	#0, -6(r4)
	mov.w	#0, -4(r4)
	mov.w	-2(r4), r12
	mov.w	r12, -10(r4)
	mov.w	#6, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	-4(r4), r12
	mov.w	r12, _global_dict+4(r15)
	mov.w	-6(r4), r12
	mov.w	r12, _global_dict+2(r15)
	mov.w	-8(r4), r12
	mov.w	r12, _global_dict(r15)
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	cmp.w	#256, r12
	jhs	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	mov.w	#_global_letter, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_init_dict, r15
	call	#transition_to
	jmp	.LBB3_3
.LBB3_2:                                ; %if.else
	mov.w	#256, &_global_node_count
	mov.w	#_global_letter, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB3_3
.LBB3_3:                                ; %if.end
	add.w	#10, r1
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
	sub.w	#4, r1
	mov.w	&_global_letter_idx, r12
	mov.w	r12, -2(r4)
	add.w	#1, r12
	mov.w	r12, -4(r4)
	cmp.w	#2, r12
	jne	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.w	#0, -4(r4)
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	jne	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	mov.w	#_global_letter_idx, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_measure_temp, r15
	call	#transition_to
	jmp	.LBB4_5
.LBB4_4:                                ; %if.else
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	mov.w	#_global_letter_idx, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	jmp	.LBB4_5
.LBB4_5:                                ; %if.end.3
	add.w	#4, r1
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
	sub.w	#8, r1
	mov.w	#_global_prev_sample, r14
	mov.w	&_global_prev_sample, r12
	mov.w	r12, -2(r4)
	mov.w	r12, -4(r4)
	mov.w	r12, r15
	mov.w	r14, -8(r4)             ; 2-byte Folded Spill
	call	#acquire_sample
	mov.w	r15, -6(r4)
	mov.w	r15, -4(r4)
	mov.w	r15, -2(r4)
	mov.w	-6(r4), r12
	mov.w	r12, &_global_sample
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	mov.w	-8(r4), r14             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	add.w	#8, r1
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
	sub.w	#16, r1
	mov.w	&_global_letter_idx, r12
	mov.w	r12, -2(r4)
	cmp.w	#0, r12
	jne	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	#2, -2(r4)
	jmp	.LBB6_3
.LBB6_2:                                ; %if.else
	mov.w	-2(r4), r12
	add.w	#-1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	;DEBUG_VALUE: task_letterize:letter_shift <- [FP+-4]
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: task_letterize:letter <- [FP+-6]
	mov.w	&_global_sample, r12
	mov.b	-4(r4), r13
	mov.w	#255, r14
	cmp.b	#0, r13
	mov.b	r13, r15
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	mov.b	r13, -9(r4)             ; 1-byte Folded Spill
	mov.w	r14, -12(r4)            ; 2-byte Folded Spill
	mov.b	r15, -13(r4)            ; 1-byte Folded Spill
	jeq	.LBB6_5
.LBB6_4:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	mov.b	-13(r4), r12            ; 1-byte Folded Reload
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	rla.w	r13
	sub.b	#1, r12
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	mov.b	r12, -13(r4)            ; 1-byte Folded Spill
	jne	.LBB6_4
.LBB6_5:                                ; %if.end
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	and.w	r12, r13
	mov.b	-9(r4), r14             ; 1-byte Folded Reload
	cmp.b	#0, r14
	mov.b	r14, -14(r4)            ; 1-byte Folded Spill
	mov.w	r13, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_7
.LBB6_6:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	mov.b	-14(r4), r12            ; 1-byte Folded Reload
	mov.w	-16(r4), r13            ; 2-byte Folded Reload
	clrc
	rrc.w	r13
	sub.b	#1, r12
	mov.w	r13, -16(r4)            ; 2-byte Folded Spill
	mov.b	r12, -14(r4)            ; 1-byte Folded Spill
	jne	.LBB6_6
.LBB6_7:                                ; %if.end
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -6(r4)
	mov.w	r12, &_global_letter
	mov.w	#_task_task_compress, r15
	call	#transition_to
	add.w	#16, r1
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
	sub.w	#12, r1
	mov.w	#_global_sample_count, r14
	mov.w	&_global_sample_count, r12
	mov.w	r12, -2(r4)
	mov.w	&_global_parent_next, r12
	mov.w	r12, -10(r4)
	mov.w	#6, r13
	mov.w	r12, r15
	mov.w	r14, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, r14
	call	#__mulhi3hw_noint
	mov.w	_global_dict+4(r15), r12
	mov.w	r12, -4(r4)
	mov.w	_global_dict+2(r15), r12
	mov.w	r12, -6(r4)
	mov.w	_global_dict(r15), r12
	mov.w	r12, -8(r4)
	mov.w	-4(r4), r12
	mov.w	r12, &_global_sibling
	mov.w	-4(r4), r12
	mov.w	r12, &_global_parent_node+4
	mov.w	-6(r4), r12
	mov.w	r12, &_global_parent_node+2
	mov.w	-8(r4), r12
	mov.w	r12, &_global_parent_node
	mov.w	-10(r4), r12
	mov.w	r12, &_global_parent
	mov.w	-4(r4), r12
	mov.w	r12, &_global_child
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	mov.w	-12(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_find_sibling, r15
	call	#transition_to
	add.w	#12, r1
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
	sub.w	#8, r1
	mov.w	&_global_sibling, r12
	mov.w	r12, -2(r4)
	cmp.w	#0, r12
	jeq	.LBB8_7
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	;DEBUG_VALUE: i <- [FP+-6]
	mov.w	-2(r4), r12
	mov.w	r12, -6(r4)
	mov.w	#6, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#_global_dict, r12
	mov.w	r12, -4(r4)
	mov.w	_global_dict(r15), r12
	mov.w	&_global_letter, r14
	cmp.w	r14, r12
	jne	.LBB8_3
	jmp	.LBB8_2
.LBB8_2:                                ; %if.then.2
	mov.w	-2(r4), r12
	mov.w	r12, &_global_parent_next
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_letterize, r15
	call	#transition_to
	jmp	.LBB8_6
.LBB8_3:                                ; %if.else
	mov.w	-4(r4), r12
	mov.w	2(r12), r12
	cmp.w	#0, r12
	jeq	.LBB8_5
	jmp	.LBB8_4
.LBB8_4:                                ; %if.then.4
	mov.w	-4(r4), r12
	mov.w	2(r12), r12
	mov.w	r12, -2(r4)
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_find_sibling, r15
	call	#transition_to
	jmp	.LBB8_5
.LBB8_5:                                ; %if.end
	jmp	.LBB8_6
.LBB8_6:                                ; %if.end.6
	jmp	.LBB8_7
.LBB8_7:                                ; %if.end.7
	;DEBUG_VALUE: task_find_sibling:starting_node_idx <- [FP+-8]
	mov.w	&_global_letter, r12
	mov.w	r12, -8(r4)
	mov.w	r12, &_global_parent_next
	mov.w	&_global_child, r12
	cmp.w	#0, r12
	jne	.LBB8_9
	jmp	.LBB8_8
.LBB8_8:                                ; %if.then.9
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_add_insert, r15
	call	#transition_to
	jmp	.LBB8_10
.LBB8_9:                                ; %if.else.10
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_add_node, r15
	call	#transition_to
	jmp	.LBB8_10
.LBB8_10:                               ; %if.end.11
	add.w	#8, r1
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
	sub.w	#14, r1
	mov.w	&_global_sibling, r12
	mov.w	r12, -2(r4)
	mov.w	r12, -6(r4)
	mov.w	#6, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#_global_dict, r12
	mov.w	r12, -4(r4)
	mov.w	_global_dict+2(r15), r12
	cmp.w	#0, r12
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	;DEBUG_VALUE: next_sibling <- [FP+-8]
	mov.w	-4(r4), r12
	mov.w	2(r12), r12
	mov.w	r12, -8(r4)
	mov.w	r12, -2(r4)
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_add_node, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_2:                                ; %if.else
	;DEBUG_VALUE: sibling_node_obj <- [FP+-14]
	mov.w	-4(r4), r12
	mov.w	4(r12), r13
	mov.w	r13, -10(r4)
	mov.w	2(r12), r13
	mov.w	r13, -12(r4)
	mov.w	0(r12), r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	mov.w	r12, &_global_sibling_node+4
	mov.w	-12(r4), r12
	mov.w	r12, &_global_sibling_node+2
	mov.w	-14(r4), r12
	mov.w	r12, &_global_sibling_node
	mov.w	#_global_sibling, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_add_insert, r15
	call	#transition_to
	jmp	.LBB9_3
.LBB9_3:                                ; %if.end
	add.w	#14, r1
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
	sub.w	#26, r1
	mov.w	&_global_node_count, r12
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
	;DEBUG_VALUE: task_add_insert:child <- [FP+-4]
	mov.w	-2(r4), r12
	mov.w	r12, -4(r4)
	;DEBUG_VALUE: task_add_insert:child_node <- [FP+-10]
	mov.w	&_global_letter, r12
	mov.w	r12, -10(r4)
	mov.w	#0, -8(r4)
	mov.w	#0, -6(r4)
	mov.w	&_global_parent_node+4, r12
	cmp.w	#0, r12
	jne	.LBB10_5
	jmp	.LBB10_4
.LBB10_4:                               ; %if.then.3
	;DEBUG_VALUE: parent_node_obj <- [FP+-16]
	mov.w	&_global_parent_node+4, r12
	mov.w	r12, -12(r4)
	mov.w	&_global_parent_node+2, r12
	mov.w	r12, -14(r4)
	mov.w	&_global_parent_node, r12
	mov.w	r12, -16(r4)
	mov.w	-4(r4), r12
	mov.w	r12, -12(r4)
	;DEBUG_VALUE: i <- [FP+-18]
	mov.w	&_global_parent, r12
	mov.w	r12, -18(r4)
	mov.w	#6, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	-12(r4), r12
	mov.w	r12, _global_dict+4(r15)
	mov.w	-14(r4), r12
	mov.w	r12, _global_dict+2(r15)
	mov.w	-16(r4), r12
	mov.w	r12, _global_dict(r15)
	jmp	.LBB10_6
.LBB10_5:                               ; %if.else
	;DEBUG_VALUE: last_sibling <- [FP+-20]
	mov.w	&_global_sibling, r12
	mov.w	r12, -20(r4)
	;DEBUG_VALUE: last_sibling_node <- [FP+-26]
	mov.w	&_global_sibling_node+4, r12
	mov.w	r12, -22(r4)
	mov.w	&_global_sibling_node+2, r12
	mov.w	r12, -24(r4)
	mov.w	&_global_sibling_node, r12
	mov.w	r12, -26(r4)
	mov.w	-4(r4), r12
	mov.w	r12, -24(r4)
	mov.w	-20(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	-22(r4), r12
	mov.w	r12, _global_dict+4(r15)
	mov.w	-24(r4), r12
	mov.w	r12, _global_dict+2(r15)
	mov.w	-26(r4), r12
	mov.w	r12, _global_dict(r15)
	jmp	.LBB10_6
.LBB10_6:                               ; %if.end.7
	mov.w	-4(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	-6(r4), r14
	mov.w	r14, _global_dict+4(r15)
	mov.w	-8(r4), r14
	mov.w	r14, _global_dict+2(r15)
	mov.w	-10(r4), r14
	mov.w	r14, _global_dict(r15)
	mov.w	&_global_parent, r14
	mov.w	r14, &_global_symbol
	mov.w	-2(r4), r14
	add.w	#1, r14
	mov.w	r14, -2(r4)
	mov.w	#_global_node_count, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_append_compressed, r15
	call	#transition_to
	add.w	#26, r1
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
	sub.w	#6, r1
	mov.w	&_global_out_len, r12
	mov.w	r12, -2(r4)
	mov.w	r12, -4(r4)
	mov.w	&_global_symbol, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -6(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, _global_compressed_data(r15)
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	cmp.w	#64, r12
	jne	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov.w	#_global_out_len, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_print, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_2:                               ; %if.else
	mov.w	#_global_out_len, r14
	mov.w	r4, r15
	sub.w	#2, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_3:                               ; %if.end
	add.w	#6, r1
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
	sub.w	#2, r1
	mov.w	#_task_task_done, r15
	call	#transition_to
	add.w	#2, r1
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
	sub.w	#54, r1
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str, 0(r14)
	call	#printf
	mov.w	#0, -2(r4)
	mov.w	r1, r12
	mov.w	#42, 4(r12)
	mov.w	#1, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#504, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#1, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#2, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#3, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#5, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#3072, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#3072, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#7, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#8, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#9, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#11, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#12, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#13, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#6, 4(r12)
	mov.w	#14, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#6, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#384, 4(r12)
	mov.w	#15, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#384, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#6, 4(r12)
	mov.w	#16, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#6, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#2, 4(r12)
	mov.w	#17, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -38(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#2, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#66, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#66, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#66, 2(r12)
	mov.w	#.L.str.4, 0(r12)
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#66, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	#66, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	mov.w	r15, -44(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	add.w	#66, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.6, 0(r13)
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	r15, -48(r4)            ; 2-byte Folded Spill
	add.w	#54, r1
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
	sub.w	#2, r1
	;DEBUG_VALUE: msp_watchdog_enable:bits <- undef
	mov.b	r15, r12
	mov.b	r12, -1(r4)
	mov.b	-1(r4), r15
	bis.w	#23048, r15
	mov.w	r15, &0x015C
	mov.b	-1(r4), r12
	mov.b	r12, &watchdog_bits
	add.w	#2, r1
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
	push.w	r11
	push.w	r10
	sub.w	#14, r1
	;DEBUG_VALUE: memcpy:dest <- undef
	;DEBUG_VALUE: memcpy:src <- undef
	;DEBUG_VALUE: memcpy:n <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	mov.w	r11, -16(r4)            ; 2-byte Folded Spill
	mov.w	r10, -18(r4)            ; 2-byte Folded Spill
	jmp	.LBB21_1
.LBB21_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jhs	.LBB21_3
	jmp	.LBB21_2
.LBB21_2:                               ; %while.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-8(r4), r12
	mov.w	-12(r4), r13
	add.w	r13, r12
	mov.b	0(r12), r14
	mov.w	-6(r4), r12
	add.w	r13, r12
	mov.b	r14, 0(r12)
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB21_1
.LBB21_3:                               ; %while.end
	mov.w	-6(r4), r15
	add.w	#14, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end21:
	.size	memcpy, .Lfunc_end21-memcpy

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
.Lfunc_end22:
	.size	msp_clock_setup, .Lfunc_end22-msp_clock_setup

	.globl	printf
	.align	2
	.type	printf,@function
printf:                                 ; @printf
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#32, r1
	;DEBUG_VALUE: printf:format <- undef
	mov.w	4(r4), r12
	mov.w	r12, -4(r4)
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -18(r4)
	jmp	.LBB23_1
.LBB23_1:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB23_4 Depth 2
	mov.w	-4(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -4(r4)
	mov.b	0(r12), r14
	mov.b	r14, -5(r4)
	cmp.b	#0, r14
	jne	4
	br	#.LBB23_40
	jmp	.LBB23_2
.LBB23_2:                               ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.b	-5(r4), r12
	cmp.b	#37, r12
	jeq	4
	br	#.LBB23_37
	jmp	.LBB23_3
.LBB23_3:                               ; %if.then
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	#0, -14(r4)
	jmp	.LBB23_4
.LBB23_4:                               ; %parse_fmt_char
                                        ;   Parent Loop BB23_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-4(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -4(r4)
	mov.b	0(r12), r12
	sxt	r12
	mov.b	r12, r14
	mov.b	r14, -5(r4)
	cmp.w	#0, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jne	4
	br	#.LBB23_34
	jmp	.LBB23_5
.LBB23_5:                               ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_4 Depth=2
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#48, r12
	jne	4
	br	#.LBB23_33
	jmp	.LBB23_6
.LBB23_6:                               ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#99, r12
	jeq	.LBB23_14
	jmp	.LBB23_7
.LBB23_7:                               ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#105, r12
	jeq	.LBB23_15
	jmp	.LBB23_8
.LBB23_8:                               ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#108, r12
	jeq	.LBB23_19
	jmp	.LBB23_9
.LBB23_9:                               ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#110, r12
	jeq	.LBB23_19
	jmp	.LBB23_10
.LBB23_10:                              ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#115, r12
	jeq	.LBB23_13
	jmp	.LBB23_11
.LBB23_11:                              ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#117, r12
	jeq	.LBB23_15
	jmp	.LBB23_12
.LBB23_12:                              ; %parse_fmt_char
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#120, r12
	jeq	.LBB23_23
	br	#.LBB23_35
.LBB23_13:                              ; %sw.bb
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	0(r12), r15
	call	#io_puts_no_newline
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	br	#.LBB23_36
.LBB23_14:                              ; %sw.bb.5
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	0(r12), r15
	call	#io_putchar
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB23_36
.LBB23_15:                              ; %sw.bb.7
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	0(r12), r12
	mov.w	r12, -8(r4)
	mov.b	-5(r4), r14
	cmp.b	#105, r14
	jne	.LBB23_18
	jmp	.LBB23_16
.LBB23_16:                              ; %land.lhs.true
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r12
	cmp.w	#0, r12
	jge	.LBB23_18
	jmp	.LBB23_17
.LBB23_17:                              ; %if.then.13
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	#45, r15
	call	#io_putchar
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB23_18
.LBB23_18:                              ; %if.end
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r14
	mov.w	#20, r12
	add.w	#dv, r12
	mov.w	#0, r15
	mov.w	r12, r13
	call	#xtoa
	jmp	.LBB23_36
.LBB23_19:                              ; %sw.bb.16
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	0(r12), r12
	mov.w	-18(r4), r13
	mov.w	r13, r14
	add.w	#2, r14
	mov.w	r14, -18(r4)
	mov.w	0(r13), r13
	mov.w	r13, -10(r4)
	mov.w	r12, -12(r4)
	mov.b	-5(r4), r15
	cmp.b	#108, r15
	jne	.LBB23_22
	jmp	.LBB23_20
.LBB23_20:                              ; %land.lhs.true.20
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-10(r4), r12
	cmp.w	#0, r12
	jge	.LBB23_22
	jmp	.LBB23_21
.LBB23_21:                              ; %if.then.23
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	#0, r14
	mov.w	r14, r15
	sub.w	r12, r15
	subc.w	r13, r14
	mov.w	r14, -10(r4)
	mov.w	r15, -12(r4)
	mov.w	#45, r15
	call	#io_putchar
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB23_22
.LBB23_22:                              ; %if.end.26
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-10(r4), r15
	mov.w	-12(r4), r14
	mov.w	#dv, r13
	call	#xtoa
	jmp	.LBB23_36
.LBB23_23:                              ; %sw.bb.27
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	and.w	#-2, r12
	mov.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	0(r12), r12
	mov.w	r12, -8(r4)
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
	mov.w	r12, -16(r4)
	cmp.w	#0, r12
	jne	.LBB23_25
	jmp	.LBB23_24
.LBB23_24:                              ; %lor.lhs.false
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	cmp.w	#4, r12
	jl	.LBB23_26
	jmp	.LBB23_25
.LBB23_25:                              ; %if.then.32
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-16(r4), r15
	call	#puth
	jmp	.LBB23_26
.LBB23_26:                              ; %if.end.33
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.w	r12, -16(r4)
	cmp.w	#0, r12
	jne	.LBB23_28
	jmp	.LBB23_27
.LBB23_27:                              ; %lor.lhs.false.37
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	cmp.w	#3, r12
	jl	.LBB23_29
	jmp	.LBB23_28
.LBB23_28:                              ; %if.then.40
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-16(r4), r15
	call	#puth
	jmp	.LBB23_29
.LBB23_29:                              ; %if.end.41
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	rra.w	r12
	mov.w	r12, -16(r4)
	cmp.w	#0, r12
	jne	.LBB23_31
	jmp	.LBB23_30
.LBB23_30:                              ; %lor.lhs.false.45
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	cmp.w	#2, r12
	jl	.LBB23_32
	jmp	.LBB23_31
.LBB23_31:                              ; %if.then.48
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-16(r4), r15
	call	#puth
	jmp	.LBB23_32
.LBB23_32:                              ; %if.end.49
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-8(r4), r15
	call	#puth
	jmp	.LBB23_36
.LBB23_33:                              ; %sw.bb.50
                                        ;   in Loop: Header=BB23_4 Depth=2
	mov.w	-4(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -4(r4)
	mov.b	0(r12), r14
	mov.b	r14, -5(r4)
	mov.b	-5(r4), r12
	sxt	r12
	add.w	#-48, r12
	mov.w	r12, -14(r4)
	br	#.LBB23_4
.LBB23_34:                              ; %sw.bb.54
	mov.w	#0, -2(r4)
	jmp	.LBB23_41
.LBB23_35:                              ; %sw.default
                                        ;   in Loop: Header=BB23_1 Depth=1
	jmp	.LBB23_38
.LBB23_36:                              ; %sw.epilog
                                        ;   in Loop: Header=BB23_1 Depth=1
	jmp	.LBB23_39
.LBB23_37:                              ; %if.else
                                        ;   in Loop: Header=BB23_1 Depth=1
	jmp	.LBB23_38
.LBB23_38:                              ; %bad_fmt
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.b	-5(r4), r12
	sxt	r12
	mov.w	r12, r15
	call	#io_putchar
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	jmp	.LBB23_39
.LBB23_39:                              ; %if.end.57
                                        ;   in Loop: Header=BB23_1 Depth=1
	br	#.LBB23_1
.LBB23_40:                              ; %while.end
	mov.w	#0, -2(r4)
	jmp	.LBB23_41
.LBB23_41:                              ; %return
	mov.w	-2(r4), r15
	add.w	#32, r1
	pop.w	r4
	ret
.Lfunc_end23:
	.size	printf, .Lfunc_end23-printf

	.align	2
	.type	xtoa,@function
xtoa:                                   ; @xtoa
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	sub.w	#34, r1
	;DEBUG_VALUE: xtoa:x <- undef
	;DEBUG_VALUE: xtoa:dp <- undef
	mov.w	r15, r12
	mov.w	r14, r11
	mov.w	r13, r10
	mov.w	r15, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	r13, -14(r4)
	mov.w	-10(r4), r13
	mov.w	-12(r4), r14
	bis.w	r13, r14
	cmp.w	#0, r14
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	mov.w	r10, -24(r4)            ; 2-byte Folded Spill
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	jeq	.LBB24_15
	jmp	.LBB24_1
.LBB24_1:                               ; %if.then
	jmp	.LBB24_2
.LBB24_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	-14(r4), r14
	mov.w	0(r14), r15
	mov.w	2(r14), r14
	cmp.w	r14, r13
	mov.w	r2, r11
	and.w	#1, r11
	cmp.w	r15, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	r14, r13
	mov.w	r11, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	jeq	.LBB24_4
; BB#3:                                 ; %while.cond
                                        ;   in Loop: Header=BB24_2 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB24_4:                               ; %while.cond
                                        ;   in Loop: Header=BB24_2 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB24_6
	jmp	.LBB24_5
.LBB24_5:                               ; %while.body
                                        ;   in Loop: Header=BB24_2 Depth=1
	mov.w	-14(r4), r12
	add.w	#4, r12
	mov.w	r12, -14(r4)
	jmp	.LBB24_2
.LBB24_6:                               ; %while.end
	jmp	.LBB24_7
.LBB24_7:                               ; %do.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB24_8 Depth 2
	mov.w	-14(r4), r12
	mov.w	r12, r13
	add.w	#4, r13
	mov.w	r13, -14(r4)
	mov.w	0(r12), r13
	mov.w	2(r12), r12
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.b	#48, -15(r4)
	jmp	.LBB24_8
.LBB24_8:                               ; %while.cond.2
                                        ;   Parent Loop BB24_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	cmp.w	r15, r13
	mov.w	r2, r11
	mov.w	#1, r10
	mov.w	r10, r9
	bic.w	r11, r9
	cmp.w	r14, r12
	mov.w	r2, r12
	bic.w	r12, r10
	cmp.w	r15, r13
	mov.w	r9, -32(r4)             ; 2-byte Folded Spill
	mov.w	r10, -34(r4)            ; 2-byte Folded Spill
	jeq	.LBB24_10
; BB#9:                                 ; %while.cond.2
                                        ;   in Loop: Header=BB24_8 Depth=2
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
.LBB24_10:                              ; %while.cond.2
                                        ;   in Loop: Header=BB24_8 Depth=2
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB24_12
	jmp	.LBB24_11
.LBB24_11:                              ; %while.body.4
                                        ;   in Loop: Header=BB24_8 Depth=2
	mov.b	-15(r4), r12
	add.b	#1, r12
	mov.b	r12, -15(r4)
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	-12(r4), r15
	mov.w	-10(r4), r11
	sub.w	r13, r15
	subc.w	r14, r11
	mov.w	r11, -10(r4)
	mov.w	r15, -12(r4)
	jmp	.LBB24_8
.LBB24_12:                              ; %while.end.5
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.b	-15(r4), r12
	sxt	r12
	mov.w	r12, r15
	call	#io_putchar
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	jmp	.LBB24_13
.LBB24_13:                              ; %do.cond
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.b	-20(r4), r12
	bit.b	#1, r12
	jeq	.LBB24_7
	jmp	.LBB24_14
.LBB24_14:                              ; %do.end
	jmp	.LBB24_16
.LBB24_15:                              ; %if.else
	mov.w	#48, r15
	call	#io_putchar
	mov.w	r15, -38(r4)            ; 2-byte Folded Spill
	jmp	.LBB24_16
.LBB24_16:                              ; %if.end
	add.w	#34, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end24:
	.size	xtoa, .Lfunc_end24-xtoa

	.align	2
	.type	puth,@function
puth:                                   ; @puth
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	;DEBUG_VALUE: puth:n <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	and.w	#15, r15
	mov.b	puth.hex(r15), r13
	mov.b	r13, -3(r4)
	mov.w	-2(r4), r15
	and.w	#15, r15
	mov.b	puth.hex(r15), r15
	sxt	r15
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#io_putchar
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end25:
	.size	puth, .Lfunc_end25-puth

	.globl	task_prologue
	.align	2
	.type	task_prologue,@function
task_prologue:                          ; @task_prologue
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	&curctx, r12
	mov.w	4(r12), r12
	mov.w	0(r12), r12
	mov.w	r12, -2(r4)
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	8(r13), r13
	cmp.w	r13, r12
	jeq	.LBB26_7
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
	jmp	.LBB26_2
.LBB26_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB26_6
	jmp	.LBB26_3
.LBB26_3:                               ; %while.body
                                        ;   in Loop: Header=BB26_2 Depth=1
	;DEBUG_VALUE: w_data_dest <- [FP+-4]
	mov.w	&gv_index, r12
	rla.w	r12
	mov.w	data_dest(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#0, r12
	jeq	.LBB26_5
	jmp	.LBB26_4
.LBB26_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB26_2 Depth=1
	;DEBUG_VALUE: w_data_size <- [FP+-6]
	mov.w	&gv_index, r12
	rla.w	r12
	mov.w	data_size(r12), r12
	mov.w	r12, -6(r4)
	mov.w	-4(r4), r15
	mov.w	&gv_index, r12
	rla.w	r12
	add.w	#data, r12
	mov.w	-6(r4), r13
	mov.w	r12, r14
	call	#memcpy
	jmp	.LBB26_5
.LBB26_5:                               ; %if.end
                                        ;   in Loop: Header=BB26_2 Depth=1
	mov.w	&gv_index, r12
	add.w	#1, r12
	mov.w	r12, &gv_index
	jmp	.LBB26_2
.LBB26_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 8(r13)
	jmp	.LBB26_8
.LBB26_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB26_8
.LBB26_8:                               ; %if.end.8
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	task_prologue, .Lfunc_end26-task_prologue

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
	jeq	.LBB27_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB27_2:                               ; %entry
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
.Lfunc_end27:
	.size	transition_to, .Lfunc_end27-transition_to

	.globl	chan_in
	.align	2
	.type	chan_in,@function
chan_in:                                ; @chan_in
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#24, r1
	;DEBUG_VALUE: chan_in:var_size <- undef
	;DEBUG_VALUE: chan_in:chan <- undef
	;DEBUG_VALUE: chan_in:field_offset <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	#0, -14(r4)
	mov.w	-8(r4), r13
	add.w	#2, r13
	mov.w	r13, -18(r4)
	mov.w	-8(r4), r13
	mov.w	r13, -20(r4)
	mov.w	-18(r4), r13
	mov.w	-10(r4), r14
	add.w	r14, r13
	mov.w	r13, -22(r4)
	mov.w	r13, -16(r4)
	mov.w	r13, r15
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	mov.w	r10, -28(r4)            ; 2-byte Folded Spill
	add.w	#24, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end28:
	.size	chan_in, .Lfunc_end28-chan_in

	.globl	chan_out
	.align	2
	.type	chan_out,@function
chan_out:                               ; @chan_out
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	;DEBUG_VALUE: chan_out:value <- undef
	;DEBUG_VALUE: chan_out:var_size <- undef
	;DEBUG_VALUE: chan_out:chan <- undef
	;DEBUG_VALUE: chan_out:field_offset <- undef
	mov.w	10(r4), r12
	mov.w	8(r4), r13
	mov.w	6(r4), r14
	mov.w	4(r4), r15
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r13, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	-6(r4), r12
	add.w	#2, r12
	mov.w	r12, -16(r4)
	mov.w	-6(r4), r12
	mov.w	r12, -18(r4)
	mov.w	-16(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	r12, -20(r4)
	mov.w	r12, -14(r4)
	mov.w	-2(r4), r14
	mov.w	-4(r4), r13
	mov.w	r12, r15
	call	#memcpy
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	chan_out, .Lfunc_end29-chan_out

	.globl	write_to_gbuf
	.align	2
	.type	write_to_gbuf,@function
write_to_gbuf:                          ; @write_to_gbuf
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#18, r1
	;DEBUG_VALUE: write_to_gbuf:value <- undef
	;DEBUG_VALUE: write_to_gbuf:data_addr <- undef
	;DEBUG_VALUE: write_to_gbuf:var_size <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	&num_dirty_gv, r13
	rla.w	r13
	add.w	#data, r13
	mov.w	-6(r4), r14
	mov.w	-10(r4), r15
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-16(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	mov.w	r11, -20(r4)            ; 2-byte Folded Spill
	mov.w	r10, -22(r4)            ; 2-byte Folded Spill
	call	#memcpy
	mov.w	-10(r4), r12
	mov.w	&num_dirty_gv, r13
	rla.w	r13
	mov.w	r12, data_size(r13)
	mov.w	-8(r4), r12
	mov.w	&num_dirty_gv, r13
	rla.w	r13
	mov.w	r12, data_dest(r13)
	mov.w	-10(r4), r12
	cmp.w	#3, r12
	jlo	.LBB30_6
	jmp	.LBB30_1
.LBB30_1:                               ; %if.then
	;DEBUG_VALUE: quotient <- [FP+-8]
	mov.w	-10(r4), r12
	add.w	#-1, r12
	clrc
	rrc.w	r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	;DEBUG_VALUE: i <- [FP+-10]
	mov.w	#1, -14(r4)
	jmp	.LBB30_2
.LBB30_2:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	mov.w	-12(r4), r13
	cmp.w	r13, r12
	jhs	.LBB30_5
	jmp	.LBB30_3
.LBB30_3:                               ; %for.body
                                        ;   in Loop: Header=BB30_2 Depth=1
	mov.w	&num_dirty_gv, r12
	mov.w	-14(r4), r13
	add.w	r13, r12
	rla.w	r12
	mov.w	#0, data_dest(r12)
	jmp	.LBB30_4
.LBB30_4:                               ; %for.inc
                                        ;   in Loop: Header=BB30_2 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB30_2
.LBB30_5:                               ; %for.end
	mov.w	-12(r4), r12
	mov.w	&num_dirty_gv, r13
	add.w	r12, r13
	mov.w	r13, &num_dirty_gv
	jmp	.LBB30_7
.LBB30_6:                               ; %if.else
	mov.w	&num_dirty_gv, r12
	add.w	#1, r12
	mov.w	r12, &num_dirty_gv
	jmp	.LBB30_7
.LBB30_7:                               ; %if.end
	add.w	#18, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end30:
	.size	write_to_gbuf, .Lfunc_end30-write_to_gbuf

	.globl	chan_out_gbuf
	.align	2
	.type	chan_out_gbuf,@function
chan_out_gbuf:                          ; @chan_out_gbuf
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	;DEBUG_VALUE: chan_out_gbuf:value <- undef
	;DEBUG_VALUE: chan_out_gbuf:var_size <- undef
	;DEBUG_VALUE: chan_out_gbuf:chan <- undef
	;DEBUG_VALUE: chan_out_gbuf:field_offset <- undef
	mov.w	10(r4), r12
	mov.w	8(r4), r13
	mov.w	6(r4), r14
	mov.w	4(r4), r15
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r13, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	-6(r4), r12
	add.w	#2, r12
	mov.w	r12, -16(r4)
	mov.w	-6(r4), r12
	mov.w	r12, -18(r4)
	mov.w	-16(r4), r12
	mov.w	-8(r4), r13
	add.w	r13, r12
	mov.w	r12, -20(r4)
	mov.w	&num_dirty_gv, r12
	rla.w	r12
	add.w	#data, r12
	mov.w	-2(r4), r14
	mov.w	-4(r4), r13
	mov.w	r12, r15
	call	#memcpy
	mov.w	-4(r4), r12
	mov.w	&num_dirty_gv, r13
	rla.w	r13
	mov.w	r12, data_size(r13)
	mov.w	-20(r4), r12
	mov.w	r12, -14(r4)
	mov.w	&num_dirty_gv, r13
	rla.w	r13
	mov.w	r12, data_dest(r13)
	mov.w	-4(r4), r12
	cmp.w	#3, r12
	jlo	.LBB31_6
	jmp	.LBB31_1
.LBB31_1:                               ; %if.then
	;DEBUG_VALUE: quotient <- [FP+-22]
	mov.w	-4(r4), r12
	add.w	#-1, r12
	clrc
	rrc.w	r12
	add.w	#1, r12
	mov.w	r12, -22(r4)
	;DEBUG_VALUE: i <- [FP+-24]
	mov.w	#1, -24(r4)
	jmp	.LBB31_2
.LBB31_2:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	cmp.w	r13, r12
	jhs	.LBB31_5
	jmp	.LBB31_3
.LBB31_3:                               ; %for.body
                                        ;   in Loop: Header=BB31_2 Depth=1
	mov.w	&num_dirty_gv, r12
	mov.w	-24(r4), r13
	add.w	r13, r12
	rla.w	r12
	mov.w	#0, data_dest(r12)
	jmp	.LBB31_4
.LBB31_4:                               ; %for.inc
                                        ;   in Loop: Header=BB31_2 Depth=1
	mov.w	-24(r4), r12
	add.w	#1, r12
	mov.w	r12, -24(r4)
	jmp	.LBB31_2
.LBB31_5:                               ; %for.end
	mov.w	-22(r4), r12
	mov.w	&num_dirty_gv, r13
	add.w	r12, r13
	mov.w	r13, &num_dirty_gv
	jmp	.LBB31_7
.LBB31_6:                               ; %if.else
	mov.w	&num_dirty_gv, r12
	add.w	#1, r12
	mov.w	r12, &num_dirty_gv
	jmp	.LBB31_7
.LBB31_7:                               ; %if.end
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	chan_out_gbuf, .Lfunc_end31-chan_out_gbuf

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
.Lfunc_end32:
	.size	main, .Lfunc_end32-main

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

	.type	_task_task_init_dict,@object ; @_task_task_init_dict
	.globl	_task_task_init_dict
	.align	1
_task_task_init_dict:
	.short	task_init_dict
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.short	0                       ; 0x0
	.asciz	"task_init_dict\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init_dict, 42

	.type	_task_task_sample,@object ; @_task_task_sample
	.globl	_task_task_sample
	.align	1
_task_task_sample:
	.short	task_sample
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.short	0                       ; 0x0
	.asciz	"task_sample\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_sample, 42

	.type	_task_task_measure_temp,@object ; @_task_task_measure_temp
	.globl	_task_task_measure_temp
	.align	1
_task_task_measure_temp:
	.short	task_measure_temp
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.short	0                       ; 0x0
	.asciz	"task_measure_temp\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_measure_temp, 42

	.type	_task_task_letterize,@object ; @_task_task_letterize
	.globl	_task_task_letterize
	.align	1
_task_task_letterize:
	.short	task_letterize
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.short	0                       ; 0x0
	.asciz	"task_letterize\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_letterize, 42

	.type	_task_task_compress,@object ; @_task_task_compress
	.globl	_task_task_compress
	.align	1
_task_task_compress:
	.short	task_compress
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.short	0                       ; 0x0
	.asciz	"task_compress\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_compress, 42

	.type	_task_task_find_sibling,@object ; @_task_task_find_sibling
	.globl	_task_task_find_sibling
	.align	1
_task_task_find_sibling:
	.short	task_find_sibling
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.short	0                       ; 0x0
	.asciz	"task_find_sibling\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_find_sibling, 42

	.type	_task_task_add_node,@object ; @_task_task_add_node
	.globl	_task_task_add_node
	.align	1
_task_task_add_node:
	.short	task_add_node
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.short	0                       ; 0x0
	.asciz	"task_add_node\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_add_node, 42

	.type	_task_task_add_insert,@object ; @_task_task_add_insert
	.globl	_task_task_add_insert
	.align	1
_task_task_add_insert:
	.short	task_add_insert
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.short	0                       ; 0x0
	.asciz	"task_add_insert\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_add_insert, 42

	.type	_task_task_append_compressed,@object ; @_task_task_append_compressed
	.globl	_task_task_append_compressed
	.align	1
_task_task_append_compressed:
	.short	task_append_compressed
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.short	0                       ; 0x0
	.asciz	"task_append_compressed\000\000\000\000\000\000\000\000\000"
	.size	_task_task_append_compressed, 42

	.type	_task_task_print,@object ; @_task_task_print
	.globl	_task_task_print
	.align	1
_task_task_print:
	.short	task_print
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.short	0                       ; 0x0
	.asciz	"task_print\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_print, 42

	.type	_task_task_done,@object ; @_task_task_done
	.globl	_task_task_done
	.align	1
_task_task_done:
	.short	task_done
	.long	4096                    ; 0x1000
	.short	12                      ; 0xc
	.short	0                       ; 0x0
	.asciz	"task_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_done, 42

	.type	_global_parent_next,@object ; @_global_parent_next
	.globl	_global_parent_next
	.align	1
_global_parent_next:
	.short	0                       ; 0x0
	.size	_global_parent_next, 2

	.type	_global_out_len,@object ; @_global_out_len
	.globl	_global_out_len
	.align	1
_global_out_len:
	.short	0                       ; 0x0
	.size	_global_out_len, 2

	.type	_global_letter,@object  ; @_global_letter
	.globl	_global_letter
	.align	1
_global_letter:
	.short	0                       ; 0x0
	.size	_global_letter, 2

	.type	_global_prev_sample,@object ; @_global_prev_sample
	.globl	_global_prev_sample
	.align	1
_global_prev_sample:
	.short	0                       ; 0x0
	.size	_global_prev_sample, 2

	.type	_global_letter_idx,@object ; @_global_letter_idx
	.globl	_global_letter_idx
	.align	1
_global_letter_idx:
	.short	0                       ; 0x0
	.size	_global_letter_idx, 2

	.type	_global_sample_count,@object ; @_global_sample_count
	.globl	_global_sample_count
	.align	1
_global_sample_count:
	.short	0                       ; 0x0
	.size	_global_sample_count, 2

	.type	_global_dict,@object    ; @_global_dict
	.globl	_global_dict
	.align	1
_global_dict:
	.zero	3072
	.size	_global_dict, 3072

	.type	_global_node_count,@object ; @_global_node_count
	.globl	_global_node_count
	.align	1
_global_node_count:
	.short	0                       ; 0x0
	.size	_global_node_count, 2

	.type	_global_sample,@object  ; @_global_sample
	.globl	_global_sample
	.align	1
_global_sample:
	.short	0                       ; 0x0
	.size	_global_sample, 2

	.type	_global_sibling,@object ; @_global_sibling
	.globl	_global_sibling
	.align	1
_global_sibling:
	.short	0                       ; 0x0
	.size	_global_sibling, 2

	.type	_global_parent_node,@object ; @_global_parent_node
	.globl	_global_parent_node
	.align	1
_global_parent_node:
	.zero	6
	.size	_global_parent_node, 6

	.type	_global_parent,@object  ; @_global_parent
	.globl	_global_parent
	.align	1
_global_parent:
	.short	0                       ; 0x0
	.size	_global_parent, 2

	.type	_global_child,@object   ; @_global_child
	.globl	_global_child
	.align	1
_global_child:
	.short	0                       ; 0x0
	.size	_global_child, 2

	.type	_global_sibling_node,@object ; @_global_sibling_node
	.globl	_global_sibling_node
	.align	1
_global_sibling_node:
	.zero	6
	.size	_global_sibling_node, 6

	.type	_global_symbol,@object  ; @_global_symbol
	.globl	_global_symbol
	.align	1
_global_symbol:
	.short	0                       ; 0x0
	.size	_global_symbol, 2

	.type	_global_compressed_data,@object ; @_global_compressed_data
	.globl	_global_compressed_data
	.align	1
_global_compressed_data:
	.zero	384
	.size	_global_compressed_data, 384

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

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str, 26

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"Size of task %u: %u\r\n"
	.size	.L.str.1, 22

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"Size of channel %u: %u\r\n"
	.size	.L.str.2, 25

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"Size of data[i]: %u\r\n"
	.size	.L.str.3, 22

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"Size of data_dest[i]: %u\r\n"
	.size	.L.str.4, 27

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"Size of data_size[i]: %u\r\n"
	.size	.L.str.5, 27

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	"Total: %u\r\n"
	.size	.L.str.6, 12

	.type	watchdog_bits,@object   ; @watchdog_bits
	.local	watchdog_bits
	.comm	watchdog_bits,1,1
	.type	dv,@object              ; @dv
	.section	.rodata,"a",@progbits
	.align	1
dv:
	.long	1000000000              ; 0x3b9aca00
	.long	100000000               ; 0x5f5e100
	.long	10000000                ; 0x989680
	.long	1000000                 ; 0xf4240
	.long	100000                  ; 0x186a0
	.long	10000                   ; 0x2710
	.long	1000                    ; 0x3e8
	.long	100                     ; 0x64
	.long	10                      ; 0xa
	.long	1                       ; 0x1
	.size	dv, 40

	.type	puth.hex,@object        ; @puth.hex
puth.hex:
	.ascii	"0123456789ABCDEF"
	.size	puth.hex, 16

	.type	gv_index,@object        ; @gv_index
	.section	.nv_vars,"aw",@progbits
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

	.type	rcount,@object          ; @rcount
	.section	.bss,"aw",@nobits
	.globl	rcount
	.align	1
rcount:
	.short	0                       ; 0x0
	.size	rcount, 2

	.type	wcount,@object          ; @wcount
	.globl	wcount
	.align	1
wcount:
	.short	0                       ; 0x0
	.size	wcount, 2

	.type	tcount,@object          ; @tcount
	.globl	tcount
	.align	1
tcount:
	.short	0                       ; 0x0
	.size	tcount, 2

	.type	max_num_dirty_gv,@object ; @max_num_dirty_gv
	.globl	max_num_dirty_gv
	.align	1
max_num_dirty_gv:
	.short	0                       ; 0x0
	.size	max_num_dirty_gv, 2

	.type	curtime,@object         ; @curtime
	.section	.nv_vars,"aw",@progbits
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

	.type	data_dest,@object       ; @data_dest
	.globl	data_dest
	.align	1
data_dest:
	.zero	66
	.size	data_dest, 66

	.type	data_size,@object       ; @data_size
	.globl	data_size
	.align	1
data_size:
	.zero	66
	.size	data_size, 66

	.type	data,@object            ; @data
	.globl	data
	.align	1
data:
	.zero	66
	.size	data, 66


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
	.section	".note.GNU-stack","",@progbits
