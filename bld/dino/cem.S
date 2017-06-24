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

	.globl	print_log
	.align	2
	.type	print_log,@function
print_log:                              ; @print_log
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	;DEBUG_VALUE: print_log:log <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	&overflow, r15
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r15, 2(r14)
	mov.w	#.L.str, 0(r14)
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	-2(r4), r12
	mov.w	130(r12), r13
	mov.w	128(r12), r12
	mov.w	r1, r14
	mov.w	r12, 4(r14)
	mov.w	r13, 2(r14)
	mov.w	#.L.str.1, 0(r14)
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#printf
	mov.w	r1, r12
	mov.w	#.L.str.2, 0(r12)
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	#0, -4(r4)
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB1_1
.LBB1_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	128(r13), r13
	cmp.w	r13, r12
	jhs	.LBB1_7
	jmp	.LBB1_2
.LBB1_2:                                ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.3, 0(r13)
	call	#printf
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	jeq	.LBB1_5
	jmp	.LBB1_3
.LBB1_3:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	bit.w	#7, r12
	jne	.LBB1_5
	jmp	.LBB1_4
.LBB1_4:                                ; %if.then
                                        ;   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_5
.LBB1_5:                                ; %if.end
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r15, -16(r4)            ; 2-byte Folded Spill
	jmp	.LBB1_6
.LBB1_6:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB1_1
.LBB1_7:                                ; %for.end
	mov.w	-2(r4), r12
	mov.b	128(r12), r13
	bit.b	#7, r13
	jeq	.LBB1_9
	jmp	.LBB1_8
.LBB1_8:                                ; %if.then.11
	jmp	.LBB1_9
.LBB1_9:                                ; %if.end.12
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	print_log, .Lfunc_end1-print_log

	.globl	init_dict
	.align	2
	.type	init_dict,@function
init_dict:                              ; @init_dict
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	;DEBUG_VALUE: init_dict:dict <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, 3072(r15)
	mov.w	#0, -4(r4)
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#256, r12
	jhs	.LBB2_6
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	;DEBUG_VALUE: DINO_MANUAL_VERSION_dict_node_count <- [FP+-6]
	mov.w	-2(r4), r12
	mov.w	3072(r12), r12
	mov.w	r12, -6(r4)
	call	#__mementos_checkpoint
	mov.w	#1, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB2_4
	jmp	.LBB2_3
.LBB2_3:                                ; %if.then
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 3072(r13)
	call	#__dino_unset_recovery_bit
	jmp	.LBB2_4
.LBB2_4:                                ; %if.end
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, &curtask
	;DEBUG_VALUE: node <- [FP+-8]
	mov.w	-4(r4), r15
	mov.w	-2(r4), r12
	mov.w	#6, r14
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -8(r4)
	mov.w	-4(r4), r14
	mov.w	r14, 0(r12)
	mov.w	-8(r4), r12
	mov.w	#0, 2(r12)
	mov.w	-8(r4), r12
	mov.w	#0, 4(r12)
	mov.w	-2(r4), r12
	mov.w	3072(r12), r14
	add.w	#1, r14
	mov.w	r14, 3072(r12)
	jmp	.LBB2_5
.LBB2_5:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB2_1
.LBB2_6:                                ; %for.end
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	init_dict, .Lfunc_end2-init_dict

	.globl	find_child
	.align	2
	.type	find_child,@function
find_child:                             ; @find_child
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#24, r1
	;DEBUG_VALUE: find_child:letter <- undef
	;DEBUG_VALUE: find_child:parent <- undef
	;DEBUG_VALUE: find_child:dict <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -8(r4)
	mov.w	r14, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r11, -22(r4)            ; 2-byte Folded Spill
	mov.w	r10, -24(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	;DEBUG_VALUE: find_child:parent_node <- [FP+-10]
	mov.w	-10(r4), r15
	mov.w	-12(r4), r12
	mov.w	#6, r14
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -14(r4)
	mov.w	4(r12), r12
	cmp.w	#0, r12
	jne	.LBB3_4
	jmp	.LBB3_3
.LBB3_3:                                ; %if.then.1
	mov.w	#0, -6(r4)
	jmp	.LBB3_13
.LBB3_4:                                ; %if.end.2
	;DEBUG_VALUE: find_child:sibling <- [FP+-12]
	mov.w	-14(r4), r12
	mov.w	4(r12), r12
	mov.w	r12, -16(r4)
	jmp	.LBB3_5
.LBB3_5:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-16(r4), r12
	cmp.w	#0, r12
	jeq	.LBB3_12
	jmp	.LBB3_6
.LBB3_6:                                ; %while.body
                                        ;   in Loop: Header=BB3_5 Depth=1
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB3_8
	jmp	.LBB3_7
.LBB3_7:                                ; %if.then.7
                                        ;   in Loop: Header=BB3_5 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB3_8
.LBB3_8:                                ; %if.end.8
                                        ;   in Loop: Header=BB3_5 Depth=1
	;DEBUG_VALUE: sibling_node <- [FP+-14]
	mov.w	-16(r4), r15
	mov.w	-12(r4), r12
	mov.w	#6, r14
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -18(r4)
	mov.w	0(r12), r12
	mov.w	-8(r4), r14
	cmp.w	r14, r12
	jne	.LBB3_10
	jmp	.LBB3_9
.LBB3_9:                                ; %if.then.13
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB3_13
.LBB3_10:                               ; %if.else
                                        ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-18(r4), r12
	mov.w	2(r12), r12
	mov.w	r12, -16(r4)
	jmp	.LBB3_11
.LBB3_11:                               ; %if.end.15
                                        ;   in Loop: Header=BB3_5 Depth=1
	jmp	.LBB3_5
.LBB3_12:                               ; %while.end
	mov.w	#0, -6(r4)
	jmp	.LBB3_13
.LBB3_13:                               ; %return
	mov.w	-6(r4), r15
	add.w	#24, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end3:
	.size	find_child, .Lfunc_end3-find_child

	.globl	add_node
	.align	2
	.type	add_node,@function
add_node:                               ; @add_node
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#46, r1
	;DEBUG_VALUE: add_node:letter <- undef
	;DEBUG_VALUE: add_node:parent <- undef
	;DEBUG_VALUE: add_node:dict <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	r13, -10(r4)
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	mov.w	r10, -28(r4)            ; 2-byte Folded Spill
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
	mov.w	-10(r4), r12
	mov.w	3072(r12), r12
	cmp.w	#512, r12
	jne	.LBB4_5
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then.1
	mov.w	r1, r12
	mov.w	#.L.str.5, 0(r12)
	call	#printf
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_4
.LBB4_4:                                ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB4_4
.LBB4_5:                                ; %if.end.3
	;DEBUG_VALUE: add_node:DINO_MANUAL_VERSION_dict_node_count <- [FP+-8]
	mov.w	-10(r4), r12
	mov.w	3072(r12), r12
	mov.w	r12, -12(r4)
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_7
	jmp	.LBB4_6
.LBB4_6:                                ; %if.then.7
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	r12, 3072(r13)
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_7
.LBB4_7:                                ; %if.end.9
	;DEBUG_VALUE: add_node:node <- [FP+-10]
	mov.w	-10(r4), r12
	mov.w	3072(r12), r15
	mov.w	#6, r13
	mov.w	r13, r14
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	mov.w	r13, -34(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -14(r4)
	mov.w	-6(r4), r13
	mov.w	r13, 0(r12)
	mov.w	-14(r4), r12
	mov.w	#0, 2(r12)
	mov.w	-14(r4), r12
	mov.w	#0, 4(r12)
	;DEBUG_VALUE: add_node:node_index <- [FP+-12]
	mov.w	-10(r4), r12
	mov.w	3072(r12), r13
	mov.w	r13, r14
	add.w	#1, r14
	mov.w	r14, 3072(r12)
	mov.w	r13, -16(r4)
	;DEBUG_VALUE: add_node:child <- [FP+-14]
	mov.w	-8(r4), r15
	mov.w	-10(r4), r12
	mov.w	-34(r4), r14            ; 2-byte Folded Reload
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	4(r12), r12
	mov.w	r12, -18(r4)
	cmp.w	#0, r12
	jeq	.LBB4_16
	jmp	.LBB4_8
.LBB4_8:                                ; %if.then.18
	;DEBUG_VALUE: sibling <- [FP+-16]
	mov.w	-18(r4), r12
	mov.w	r12, -20(r4)
	;DEBUG_VALUE: sibling_node <- [FP+-18]
	mov.w	-10(r4), r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -38(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -22(r4)
	jmp	.LBB4_9
.LBB4_9:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-22(r4), r12
	mov.w	2(r12), r12
	cmp.w	#0, r12
	jeq	.LBB4_13
	jmp	.LBB4_10
.LBB4_10:                               ; %while.body.24
                                        ;   in Loop: Header=BB4_9 Depth=1
	call	#__mementos_checkpoint
	mov.w	#8, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_12
	jmp	.LBB4_11
.LBB4_11:                               ; %if.then.27
                                        ;   in Loop: Header=BB4_9 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_12
.LBB4_12:                               ; %if.end.28
                                        ;   in Loop: Header=BB4_9 Depth=1
	mov.w	-22(r4), r12
	mov.w	2(r12), r12
	mov.w	r12, -20(r4)
	mov.w	-10(r4), r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -40(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -22(r4)
	jmp	.LBB4_9
.LBB4_13:                               ; %while.end
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_15
	jmp	.LBB4_14
.LBB4_14:                               ; %if.then.34
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_15
.LBB4_15:                               ; %if.end.35
	mov.w	-16(r4), r12
	mov.w	-20(r4), r15
	mov.w	-10(r4), r13
	mov.w	#6, r14
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	mov.w	r13, -44(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	-42(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	jmp	.LBB4_19
.LBB4_16:                               ; %if.else
	call	#__mementos_checkpoint
	mov.w	#10, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB4_18
	jmp	.LBB4_17
.LBB4_17:                               ; %if.then.41
	call	#__dino_unset_recovery_bit
	jmp	.LBB4_18
.LBB4_18:                               ; %if.end.42
	mov.w	-16(r4), r12
	mov.w	-8(r4), r15
	mov.w	-10(r4), r13
	mov.w	#6, r14
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
	mov.w	r13, -48(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	-46(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 4(r12)
	jmp	.LBB4_19
.LBB4_19:                               ; %if.end.46
	add.w	#46, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end4:
	.size	add_node, .Lfunc_end4-add_node

	.globl	append_compressed
	.align	2
	.type	append_compressed,@function
append_compressed:                      ; @append_compressed
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: append_compressed:parent <- undef
	;DEBUG_VALUE: append_compressed:log <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	128(r14), r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#11, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov.w	-6(r4), r12
	mov.w	-4(r4), r13
	mov.w	r12, 128(r13)
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	mov.w	-2(r4), r12
	mov.w	-4(r4), r13
	mov.w	128(r13), r14
	mov.w	r14, r15
	add.w	#1, r15
	mov.w	r15, 128(r13)
	mov.w	-4(r4), r13
	rla.w	r14
	add.w	r14, r13
	mov.w	r12, 0(r13)
	add.w	#10, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	append_compressed, .Lfunc_end5-append_compressed

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
	mov.w	#.L.str.6, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	init, .Lfunc_end6-init

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#34, r1
	mov.w	#0, -2(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -4(r4)
	cmp.w	#-1, r15
	jeq	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	mov.w	-4(r4), r15
	call	#__mementos_restore
	jmp	.LBB7_2
.LBB7_2:                                ; %if.end
	call	#__mementos_checkpoint
	mov.w	#0, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:                                ; %if.then.2
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_4
.LBB7_4:                                ; %if.end.3
	mov.w	#main.dict, r15
	call	#init_dict
	;DEBUG_VALUE: main:letter <- [FP+-6]
	mov.w	#0, -6(r4)
	;DEBUG_VALUE: main:letter_idx <- [FP+-8]
	mov.w	#0, -8(r4)
	;DEBUG_VALUE: main:parent <- [FP+-10]
	;DEBUG_VALUE: main:child <- [FP+-12]
	;DEBUG_VALUE: main:sample <- [FP+-14]
	;DEBUG_VALUE: main:prev_sample <- [FP+-16]
	mov.w	#0, -16(r4)
	mov.w	#1, &main.log+130
	mov.w	#0, &main.log+128
	jmp	.LBB7_5
.LBB7_5:                                ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_12 Depth 2
                                        ;       Child Loop BB7_18 Depth 3
                                        ;       Child Loop BB7_20 Depth 3
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_7
	jmp	.LBB7_6
.LBB7_6:                                ; %if.then.6
                                        ;   in Loop: Header=BB7_5 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_7
.LBB7_7:                                ; %if.end.7
                                        ;   in Loop: Header=BB7_5 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, -12(r4)
	mov.w	-8(r4), r12
	cmp.w	#0, r12
	jne	.LBB7_9
	jmp	.LBB7_8
.LBB7_8:                                ; %if.then.9
                                        ;   in Loop: Header=BB7_5 Depth=1
	mov.w	-16(r4), r15
	call	#acquire_sample
	mov.w	r15, -14(r4)
	mov.w	r15, -16(r4)
	jmp	.LBB7_9
.LBB7_9:                                ; %if.end.11
                                        ;   in Loop: Header=BB7_5 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	cmp.w	#2, r12
	jne	.LBB7_11
	jmp	.LBB7_10
.LBB7_10:                               ; %if.then.13
                                        ;   in Loop: Header=BB7_5 Depth=1
	mov.w	#0, -8(r4)
	jmp	.LBB7_11
.LBB7_11:                               ; %if.end.14
                                        ;   in Loop: Header=BB7_5 Depth=1
	jmp	.LBB7_12
.LBB7_12:                               ; %do.body
                                        ;   Parent Loop BB7_5 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_18 Depth 3
                                        ;       Child Loop BB7_20 Depth 3
	;DEBUG_VALUE: DINO_MANUAL_VERSION_log_sample_count <- [FP+-18]
	mov.w	&main.log+130, r12
	mov.w	r12, -18(r4)
	call	#__mementos_checkpoint
	mov.w	#0, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_14
	jmp	.LBB7_13
.LBB7_13:                               ; %if.then.17
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	-18(r4), r12
	mov.w	r12, &main.log+130
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_14
.LBB7_14:                               ; %if.end.18
                                        ;   in Loop: Header=BB7_12 Depth=2
	;DEBUG_VALUE: letter_idx_tmp <- [FP+-20]
	mov.w	-8(r4), r12
	cmp.w	#0, r12
	jne	.LBB7_16
	jmp	.LBB7_15
.LBB7_15:                               ; %cond.true
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	#2, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_17
.LBB7_16:                               ; %cond.false
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	-8(r4), r12
	add.w	#-1, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_17
.LBB7_17:                               ; %cond.end
                                        ;   in Loop: Header=BB7_12 Depth=2
	;DEBUG_VALUE: letter_shift <- [FP+-22]
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -20(r4)
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -22(r4)
	mov.w	-14(r4), r12
	mov.b	-22(r4), r13
	mov.w	#255, r14
	cmp.b	#0, r13
	mov.b	r13, r15
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	mov.b	r13, -27(r4)            ; 1-byte Folded Spill
	mov.w	r14, -30(r4)            ; 2-byte Folded Spill
	mov.b	r15, -31(r4)            ; 1-byte Folded Spill
	jeq	.LBB7_19
.LBB7_18:                               ; %cond.end
                                        ;   Parent Loop BB7_5 Depth=1
                                        ;     Parent Loop BB7_12 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov.b	-31(r4), r12            ; 1-byte Folded Reload
	mov.w	-30(r4), r13            ; 2-byte Folded Reload
	rla.w	r13
	sub.b	#1, r12
	mov.w	r13, -30(r4)            ; 2-byte Folded Spill
	mov.b	r12, -31(r4)            ; 1-byte Folded Spill
	jne	.LBB7_18
.LBB7_19:                               ; %cond.end
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	and.w	r12, r13
	mov.b	-27(r4), r14            ; 1-byte Folded Reload
	cmp.b	#0, r14
	mov.b	r14, -32(r4)            ; 1-byte Folded Spill
	mov.w	r13, -34(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_21
.LBB7_20:                               ; %cond.end
                                        ;   Parent Loop BB7_5 Depth=1
                                        ;     Parent Loop BB7_12 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov.b	-32(r4), r12            ; 1-byte Folded Reload
	mov.w	-34(r4), r13            ; 2-byte Folded Reload
	clrc
	rrc.w	r13
	sub.b	#1, r12
	mov.w	r13, -34(r4)            ; 2-byte Folded Spill
	mov.b	r12, -32(r4)            ; 1-byte Folded Spill
	jne	.LBB7_20
.LBB7_21:                               ; %cond.end
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -6(r4)
	mov.w	&main.log+130, r12
	add.w	#1, r12
	mov.w	r12, &main.log+130
	mov.w	-12(r4), r12
	mov.w	r12, -10(r4)
	mov.w	-6(r4), r15
	mov.w	#main.dict, r13
	mov.w	r12, r14
	call	#find_child
	mov.w	r15, -12(r4)
	jmp	.LBB7_22
.LBB7_22:                               ; %do.cond
                                        ;   in Loop: Header=BB7_12 Depth=2
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jne	.LBB7_12
	jmp	.LBB7_23
.LBB7_23:                               ; %do.end
                                        ;   in Loop: Header=BB7_5 Depth=1
	mov.w	-10(r4), r15
	mov.w	#main.log, r14
	call	#append_compressed
	mov.w	-6(r4), r15
	mov.w	-10(r4), r14
	mov.w	#main.dict, r13
	call	#add_node
	mov.w	&main.log+128, r13
	cmp.w	#64, r13
	jne	.LBB7_27
	jmp	.LBB7_24
.LBB7_24:                               ; %if.then.24
	call	#__mementos_checkpoint
	mov.w	#12, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_26
	jmp	.LBB7_25
.LBB7_25:                               ; %if.then.27
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_26
.LBB7_26:                               ; %if.end.28
	mov.w	#main.log, r15
	call	#print_log
	mov.w	#0, &main.log+128
	mov.w	#0, &main.log+130
	mov.w	#0, r15
	call	#exit
.LBB7_27:                               ; %if.end.29
                                        ;   in Loop: Header=BB7_5 Depth=1
	jmp	.LBB7_5
.Lfunc_end7:
	.size	main, .Lfunc_end7-main

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
.Lfunc_end8:
	.size	init_hw, .Lfunc_end8-init_hw

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
.Lfunc_end9:
	.size	acquire_sample, .Lfunc_end9-acquire_sample

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
.Lfunc_end10:
	.size	msp_watchdog_enable, .Lfunc_end10-msp_watchdog_enable

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
.Lfunc_end11:
	.size	msp_watchdog_disable, .Lfunc_end11-msp_watchdog_disable

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
.Lfunc_end12:
	.size	msp_watchdog_kick, .Lfunc_end12-msp_watchdog_kick

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
	jeq	.LBB13_4
	jmp	.LBB13_1
.LBB13_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB13_2
.LBB13_2:                               ; %while.body
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
	jne	.LBB13_2
	jmp	.LBB13_3
.LBB13_3:                               ; %while.end.loopexit
	jmp	.LBB13_4
.LBB13_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end13:
	.size	memcpy, .Lfunc_end13-memcpy

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
.Lfunc_end14:
	.size	my_memset, .Lfunc_end14-my_memset

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
.Lfunc_end15:
	.size	msp_clock_setup, .Lfunc_end15-msp_clock_setup

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
.Lfunc_end16:
	.size	mult16, .Lfunc_end16-mult16

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
	jmp	.LBB17_1
.LBB17_1:                               ; %while.cond
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
	jeq	.LBB17_3
	jmp	.LBB17_2
.LBB17_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB17_3
.LBB17_3:                               ; %land.end
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB17_10
	jmp	.LBB17_4
.LBB17_4:                               ; %while.body
                                        ;   in Loop: Header=BB17_1 Depth=1
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
	jeq	.LBB17_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB17_6:                               ; %while.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB17_8
	jmp	.LBB17_7
.LBB17_7:                               ; %if.then
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB17_9
.LBB17_8:                               ; %if.else
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB17_9
.LBB17_9:                               ; %if.end
                                        ;   in Loop: Header=BB17_1 Depth=1
	jmp	.LBB17_1
.LBB17_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end17:
	.size	sqrt16, .Lfunc_end17-sqrt16

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
	jmp	.LBB18_1
.LBB18_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB18_4
	jmp	.LBB18_2
.LBB18_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB18_4
	jmp	.LBB18_3
.LBB18_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB18_4
.LBB18_4:                               ; %land.end
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB18_6
	jmp	.LBB18_5
.LBB18_5:                               ; %while.body
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB18_1
.LBB18_6:                               ; %while.end
	jmp	.LBB18_7
.LBB18_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB18_11
	jmp	.LBB18_8
.LBB18_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB18_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB18_10
	jmp	.LBB18_9
.LBB18_9:                               ; %if.then
                                        ;   in Loop: Header=BB18_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB18_10
.LBB18_10:                              ; %if.end
                                        ;   in Loop: Header=BB18_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB18_7
.LBB18_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB18_13
	jmp	.LBB18_12
.LBB18_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB18_14
.LBB18_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB18_14
.LBB18_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end18:
	.size	udivmodhi4, .Lfunc_end18-udivmodhi4

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
	jge	.LBB19_2
	jmp	.LBB19_1
.LBB19_1:                               ; %if.then
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
	jmp	.LBB19_2
.LBB19_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB19_4
	jmp	.LBB19_3
.LBB19_3:                               ; %if.then.2
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
	jmp	.LBB19_4
.LBB19_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB19_6
	jmp	.LBB19_5
.LBB19_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB19_6
.LBB19_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end19:
	.size	__divhi3, .Lfunc_end19-__divhi3

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
	jge	.LBB20_2
	jmp	.LBB20_1
.LBB20_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB20_2
.LBB20_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB20_4
	jmp	.LBB20_3
.LBB20_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB20_4
.LBB20_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB20_6
	jmp	.LBB20_5
.LBB20_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB20_6
.LBB20_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end20:
	.size	__modhi3, .Lfunc_end20-__modhi3

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
.Lfunc_end21:
	.size	__udivhi3, .Lfunc_end21-__udivhi3

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
.Lfunc_end22:
	.size	__umodhi3, .Lfunc_end22-__umodhi3

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
.Lfunc_end23:
	.size	__dino_task_boundary, .Lfunc_end23-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB24_2
	jmp	.LBB24_1
.LBB24_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB24_2
.LBB24_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end24:
	.size	__dino_empty_versioning, .Lfunc_end24-__dino_empty_versioning

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
.Lfunc_end25:
	.size	__dino_unset_recovery_bit, .Lfunc_end25-__dino_unset_recovery_bit

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
.Lfunc_end26:
	.size	__dino_recovery_bit_set, .Lfunc_end26-__dino_recovery_bit_set

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
	jne	.LBB27_2
	jmp	.LBB27_1
.LBB27_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB27_5
.LBB27_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB27_4
	jmp	.LBB27_3
.LBB27_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB27_5
.LBB27_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB27_5
.LBB27_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	__dino_find_next_recovery, .Lfunc_end27-__dino_find_next_recovery

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
	jne	.LBB28_2
	jmp	.LBB28_1
.LBB28_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB28_5
.LBB28_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB28_4
	jmp	.LBB28_3
.LBB28_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB28_5
.LBB28_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB28_5
.LBB28_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__dino_find_active_recovery, .Lfunc_end28-__dino_find_active_recovery

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
.Lfunc_end29:
	.size	__dino_recovery_get, .Lfunc_end29-__dino_recovery_get

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
.Lfunc_end30:
	.size	__dino_recovery_set, .Lfunc_end30-__dino_recovery_set

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
.Lfunc_end31:
	.size	__dino_set_next_recovery, .Lfunc_end31-__dino_set_next_recovery

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
	jmp	.LBB32_1
.LBB32_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB32_4
	jmp	.LBB32_2
.LBB32_2:                               ; %for.body
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jmp	.LBB32_3
.LBB32_3:                               ; %for.inc
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB32_1
.LBB32_4:                               ; %for.end
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
.Lfunc_end32:
	.size	__mementos_restore, .Lfunc_end32-__mementos_restore

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
	jmp	.LBB33_1
.LBB33_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB33_2
.LBB33_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end33:
	.size	__mementos_setup_timer, .Lfunc_end33-__mementos_setup_timer

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
.Lfunc_end34:
	.size	TIMER0_A0_ISR, .Lfunc_end34-TIMER0_A0_ISR

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
	jmp	.LBB35_1
.LBB35_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB35_4
	jmp	.LBB35_2
.LBB35_2:                               ; %for.body
                                        ;   in Loop: Header=BB35_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB35_3
.LBB35_3:                               ; %for.inc
                                        ;   in Loop: Header=BB35_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB35_1
.LBB35_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB35_5
.LBB35_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB35_8
	jmp	.LBB35_6
.LBB35_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB35_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB35_7
.LBB35_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB35_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB35_5
.LBB35_8:                               ; %for.end.16
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
.Lfunc_end35:
	.size	__mementos_checkpoint, .Lfunc_end35-__mementos_checkpoint

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
	jeq	.LBB36_2
	jmp	.LBB36_1
.LBB36_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB36_3
	jmp	.LBB36_4
.LBB36_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB36_5
.LBB36_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB36_4
.LBB36_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB36_5
.LBB36_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end36:
	.size	__mementos_locate_next_bundle, .Lfunc_end36-__mementos_locate_next_bundle

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
	jeq	.LBB37_2
	jmp	.LBB37_1
.LBB37_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB37_3
.LBB37_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB37_3
.LBB37_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end37:
	.size	__mementos_find_active_bundle, .Lfunc_end37-__mementos_find_active_bundle

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
	jlo	.LBB38_2
	jmp	.LBB38_1
.LBB38_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB38_2
.LBB38_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end38:
	.size	__mementos_bundle_in_range, .Lfunc_end38-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end39:
	.size	__mementos_atboot_cleanup, .Lfunc_end39-__mementos_atboot_cleanup

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
.Lfunc_end40:
	.size	__mementos_inactive_cleanup, .Lfunc_end40-__mementos_inactive_cleanup

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
.Lfunc_end41:
	.size	__mementos_force_free, .Lfunc_end41-__mementos_force_free

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
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str, 26

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"rate: samples/block: %u/%u\r\n"
	.size	.L.str.1, 29

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"compressed block:\r\n"
	.size	.L.str.2, 20

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"%04x "
	.size	.L.str.3, 6

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

	.type	.L.str.5,@object        ; @.str.5
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.5:
	.asciz	"add node: table full\r\n"
	.size	.L.str.5, 23

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	".%u.\r\n"
	.size	.L.str.6, 7

	.type	main.dict,@object       ; @main.dict
	.section	.nv_vars,"aw",@progbits
	.align	1
main.dict:
	.zero	3074
	.size	main.dict, 3074

	.type	main.log,@object        ; @main.log
	.align	1
main.log:
	.zero	132
	.size	main.log, 132

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
