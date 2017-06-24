	.text
	.file	"cuckoo.a.bc"
	.globl	print_filter
	.align	2
	.type	print_filter,@function
print_filter:                           ; @print_filter
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	;DEBUG_VALUE: print_filter:filter <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jmp	.LBB0_1
.LBB0_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#128, r12
	jhs	.LBB0_7
	jmp	.LBB0_2
.LBB0_2:                                ; %for.body
                                        ;   in Loop: Header=BB0_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	jeq	.LBB0_5
	jmp	.LBB0_3
.LBB0_3:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB0_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	bit.w	#7, r12
	jne	.LBB0_5
	jmp	.LBB0_4
.LBB0_4:                                ; %if.then
                                        ;   in Loop: Header=BB0_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.1, 0(r12)
	call	#printf
	mov.w	r15, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB0_5
.LBB0_5:                                ; %if.end
                                        ;   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_6
.LBB0_6:                                ; %for.inc
                                        ;   in Loop: Header=BB0_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB0_1
.LBB0_7:                                ; %for.end
	add.w	#14, r1
	pop.w	r4
	ret
.Lfunc_end0:
	.size	print_filter, .Lfunc_end0-print_filter

	.globl	log_filter
	.align	2
	.type	log_filter,@function
log_filter:                             ; @log_filter
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: log_filter:filter <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jmp	.LBB1_1
.LBB1_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#128, r12
	jhs	.LBB1_7
	jmp	.LBB1_2
.LBB1_2:                                ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-4(r4), r12
	cmp.w	#0, r12
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
	jmp	.LBB1_6
.LBB1_6:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB1_1
.LBB1_7:                                ; %for.end
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	log_filter, .Lfunc_end1-log_filter

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
	sub.w	#22, r1
	;DEBUG_VALUE: print_stats:inserts <- undef
	;DEBUG_VALUE: print_stats:members <- undef
	;DEBUG_VALUE: print_stats:total <- undef
	mov.w	r13, r12
	mov.w	r14, r11
	mov.w	r15, r10
	mov.w	r15, -8(r4)
	mov.w	r14, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	-8(r4), r14
	mov.w	-10(r4), r15
	mov.w	r1, r9
	mov.w	r13, 6(r9)
	mov.w	r15, 4(r9)
	mov.w	r14, 2(r9)
	mov.w	#.L.str.2, 0(r9)
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	mov.w	r11, -16(r4)            ; 2-byte Folded Spill
	mov.w	r10, -18(r4)            ; 2-byte Folded Spill
	call	#printf
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	add.w	#22, r1
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end2:
	.size	print_stats, .Lfunc_end2-print_stats

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
	jeq	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
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
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	pop.w	r12
	pop.w	r4
	reti
.Lfunc_end3:
	.size	TimerB1_ISR, .Lfunc_end3-TimerB1_ISR

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
	mov.w	#.L.str.3, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	init, .Lfunc_end4-init

	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#30, r1
	mov.w	#0, -2(r4)
	call	#init
	call	#__mementos_find_active_bundle
	mov.w	r15, -8(r4)
	cmp.w	#-1, r15
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov.w	-8(r4), r15
	call	#__mementos_restore
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	jmp	.LBB5_3
.LBB5_3:                                ; %while.body
	mov.w	#0, -4(r4)
	jmp	.LBB5_4
.LBB5_4:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#128, r12
	jhs	.LBB5_7
	jmp	.LBB5_5
.LBB5_5:                                ; %for.body
                                        ;   in Loop: Header=BB5_4 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	mov.w	#0, main.filter(r12)
	jmp	.LBB5_6
.LBB5_6:                                ; %for.inc
                                        ;   in Loop: Header=BB5_4 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB5_4
.LBB5_7:                                ; %for.end
	call	#__mementos_checkpoint
	mov.w	#1, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_9
	jmp	.LBB5_8
.LBB5_8:                                ; %if.then.3
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_9
.LBB5_9:                                ; %if.end.4
	mov.w	#1, -6(r4)
	;DEBUG_VALUE: inserts <- [FP+-10]
	mov.w	#0, -10(r4)
	mov.w	#0, -4(r4)
	jmp	.LBB5_10
.LBB5_10:                               ; %for.cond.5
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#32, r12
	jhs	.LBB5_15
	jmp	.LBB5_11
.LBB5_11:                               ; %for.body.7
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov.w	-6(r4), r15
	call	#generate_key
	mov.w	r15, -6(r4)
	;DEBUG_VALUE: success <- [FP+-11]
	mov.w	#main.filter, r12
	mov.w	r15, -20(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	-20(r4), r14            ; 2-byte Folded Reload
	call	#insert
	mov.b	r15, r12
	mov.b	r15, -11(r4)
	cmp.w	#0, r12
	jne	.LBB5_13
	jmp	.LBB5_12
.LBB5_12:                               ; %if.then.11
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov.w	#main.filter, r15
	call	#log_filter
	jmp	.LBB5_13
.LBB5_13:                               ; %if.end.12
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov.b	-11(r4), r12
	and.w	#1, r12
	mov.w	-10(r4), r13
	add.w	r12, r13
	mov.w	r13, -10(r4)
	jmp	.LBB5_14
.LBB5_14:                               ; %for.inc.14
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB5_10
.LBB5_15:                               ; %for.end.16
	mov.w	#1, -6(r4)
	;DEBUG_VALUE: members <- [FP+-14]
	mov.w	#0, -14(r4)
	mov.w	#0, -4(r4)
	jmp	.LBB5_16
.LBB5_16:                               ; %for.cond.17
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-4(r4), r12
	cmp.w	#32, r12
	jhs	.LBB5_21
	jmp	.LBB5_17
.LBB5_17:                               ; %for.body.20
                                        ;   in Loop: Header=BB5_16 Depth=1
	mov.w	-6(r4), r15
	call	#generate_key
	mov.w	r15, -6(r4)
	;DEBUG_VALUE: member <- [FP+-15]
	mov.w	#main.filter, r12
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	call	#lookup
	mov.b	r15, r12
	mov.b	r15, -15(r4)
	cmp.w	#0, r12
	jne	.LBB5_19
	jmp	.LBB5_18
.LBB5_18:                               ; %if.then.25
                                        ;   in Loop: Header=BB5_16 Depth=1
	;DEBUG_VALUE: fp <- [FP+-18]
	mov.w	-6(r4), r15
	call	#hash_to_fingerprint
	mov.w	r15, -18(r4)
	jmp	.LBB5_19
.LBB5_19:                               ; %if.end.27
                                        ;   in Loop: Header=BB5_16 Depth=1
	mov.b	-15(r4), r12
	and.w	#1, r12
	mov.w	-14(r4), r13
	add.w	r12, r13
	mov.w	r13, -14(r4)
	jmp	.LBB5_20
.LBB5_20:                               ; %for.inc.31
                                        ;   in Loop: Header=BB5_16 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB5_16
.LBB5_21:                               ; %for.end.33
	call	#__mementos_checkpoint
	mov.w	#13, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB5_23
	jmp	.LBB5_22
.LBB5_22:                               ; %if.then.36
	call	#__dino_unset_recovery_bit
	jmp	.LBB5_23
.LBB5_23:                               ; %if.end.37
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.4, 0(r14)
	call	#printf
	mov.w	#main.filter, r12
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#print_filter
	mov.w	-10(r4), r15
	mov.w	-14(r4), r14
	mov.w	#32, r13
	call	#print_stats
	mov.w	#0, r15
	call	#exit
.Lfunc_end5:
	.size	main, .Lfunc_end5-main

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
.Lfunc_end6:
	.size	init_hw, .Lfunc_end6-init_hw

	.align	2
	.type	generate_key,@function
generate_key:                           ; @generate_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	;DEBUG_VALUE: generate_key:prev_key <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#2, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB7_2
.LBB7_2:                                ; %if.end
	mov.w	-2(r4), r15
	mov.w	#17, r14
	call	#__mulhi3hw_noint
	add.w	#17, r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	generate_key, .Lfunc_end7-generate_key

	.align	2
	.type	insert,@function
insert:                                 ; @insert
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#40, r1
	;DEBUG_VALUE: insert:filter <- undef
	;DEBUG_VALUE: insert:key <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	#0, -20(r4)
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	mov.w	r13, -38(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#3, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_2
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_2
.LBB8_2:                                ; %if.end
	;DEBUG_VALUE: insert:fp <- [FP+-22]
	mov.w	-6(r4), r15
	call	#hash_to_fingerprint
	mov.w	r15, -22(r4)
	call	#__mementos_checkpoint
	mov.w	#4, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_4
	jmp	.LBB8_3
.LBB8_3:                                ; %if.then.4
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_4
.LBB8_4:                                ; %if.end.5
	;DEBUG_VALUE: insert:index1 <- [FP+-24]
	mov.w	-6(r4), r15
	call	#hash_key_to_index
	mov.w	r15, -24(r4)
	call	#__mementos_checkpoint
	mov.w	#5, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_6
	jmp	.LBB8_5
.LBB8_5:                                ; %if.then.9
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_6
.LBB8_6:                                ; %if.end.10
	;DEBUG_VALUE: insert:fp_hash <- [FP+-26]
	mov.w	-22(r4), r15
	call	#hash_fp_to_index
	mov.w	r15, -26(r4)
	;DEBUG_VALUE: insert:index2 <- [FP+-28]
	mov.w	-24(r4), r12
	xor.w	r15, r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: insert:DINO_MANUAL_VERSION_filter_index1 <- [FP+-30]
	mov.w	-24(r4), r12
	mov.w	-4(r4), r15
	rla.w	r12
	add.w	r12, r15
	mov.w	0(r15), r12
	mov.w	r12, -30(r4)
	;DEBUG_VALUE: insert:DINO_MANUAL_VERSION_filter_index2 <- [FP+-32]
	mov.w	-28(r4), r12
	mov.w	-4(r4), r15
	rla.w	r12
	add.w	r12, r15
	mov.w	0(r15), r12
	mov.w	r12, -32(r4)
	call	#__mementos_checkpoint
	mov.w	#6, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %if.then.15
	mov.w	-30(r4), r12
	mov.w	-24(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	mov.w	-32(r4), r12
	mov.w	-28(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_8
.LBB8_8:                                ; %if.end.18
	mov.w	-24(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -8(r4)
	cmp.w	#0, r12
	jne	.LBB8_10
	jmp	.LBB8_9
.LBB8_9:                                ; %if.then.21
	mov.w	-22(r4), r12
	mov.w	-24(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB8_28
.LBB8_10:                               ; %if.else
	mov.w	-28(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -10(r4)
	cmp.w	#0, r12
	jne	.LBB8_12
	jmp	.LBB8_11
.LBB8_11:                               ; %if.then.25
	mov.w	-22(r4), r12
	mov.w	-28(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB8_27
.LBB8_12:                               ; %if.else.27
	call	#rand
	bit.w	#128, r15
	jeq	.LBB8_14
	jmp	.LBB8_13
.LBB8_13:                               ; %if.then.30
	mov.w	-24(r4), r12
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB8_15
.LBB8_14:                               ; %if.else.31
	mov.w	-28(r4), r12
	mov.w	r12, -16(r4)
	mov.w	-10(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB8_15
.LBB8_15:                               ; %if.end.32
	mov.w	-22(r4), r12
	mov.w	-16(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	jmp	.LBB8_16
.LBB8_16:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	call	#__mementos_checkpoint
	mov.w	#7, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_18
	jmp	.LBB8_17
.LBB8_17:                               ; %if.then.36
                                        ;   in Loop: Header=BB8_16 Depth=1
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_18
.LBB8_18:                               ; %if.end.37
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.w	-12(r4), r15
	call	#hash_fp_to_index
	mov.w	r15, -18(r4)
	mov.w	-16(r4), r12
	xor.w	r15, r12
	mov.w	r12, -16(r4)
	;DEBUG_VALUE: DINO_MANUAL_VERSION_filter_victim <- [FP+-34]
	mov.w	-4(r4), r15
	rla.w	r12
	add.w	r12, r15
	mov.w	0(r15), r12
	mov.w	r12, -34(r4)
	call	#__mementos_checkpoint
	mov.w	#8, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB8_20
	jmp	.LBB8_19
.LBB8_19:                               ; %if.then.43
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.w	-34(r4), r12
	mov.w	-16(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	call	#__dino_unset_recovery_bit
	jmp	.LBB8_20
.LBB8_20:                               ; %if.end.45
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.w	-16(r4), r12
	mov.w	-4(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	r12, -14(r4)
	mov.w	-12(r4), r12
	mov.w	-16(r4), r13
	mov.w	-4(r4), r14
	rla.w	r13
	add.w	r13, r14
	mov.w	r12, 0(r14)
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB8_21
.LBB8_21:                               ; %do.cond
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.w	-12(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -39(r4)            ; 1-byte Folded Spill
	jeq	.LBB8_23
	jmp	.LBB8_22
.LBB8_22:                               ; %land.rhs
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.w	-20(r4), r12
	add.w	#1, r12
	mov.w	r12, -20(r4)
	cmp.w	#8, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -39(r4)            ; 1-byte Folded Spill
	jmp	.LBB8_23
.LBB8_23:                               ; %land.end
                                        ;   in Loop: Header=BB8_16 Depth=1
	mov.b	-39(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jne	.LBB8_16
	jmp	.LBB8_24
.LBB8_24:                               ; %do.end
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB8_26
	jmp	.LBB8_25
.LBB8_25:                               ; %if.then.50
	mov.b	#0, -1(r4)
	jmp	.LBB8_29
.LBB8_26:                               ; %if.end.51
	jmp	.LBB8_27
.LBB8_27:                               ; %if.end.52
	jmp	.LBB8_28
.LBB8_28:                               ; %if.end.53
	mov.b	#1, -1(r4)
	jmp	.LBB8_29
.LBB8_29:                               ; %return
	mov.b	-1(r4), r15
	add.w	#40, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	insert, .Lfunc_end8-insert

	.align	2
	.type	lookup,@function
lookup:                                 ; @lookup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	;DEBUG_VALUE: lookup:filter <- undef
	;DEBUG_VALUE: lookup:key <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	mov.w	r13, -16(r4)            ; 2-byte Folded Spill
	call	#__mementos_checkpoint
	mov.w	#9, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_2
.LBB9_2:                                ; %if.end
	;DEBUG_VALUE: lookup:fp <- [FP+-6]
	mov.w	-4(r4), r15
	call	#hash_to_fingerprint
	mov.w	r15, -6(r4)
	call	#__mementos_checkpoint
	mov.w	#10, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then.4
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_4
.LBB9_4:                                ; %if.end.5
	;DEBUG_VALUE: lookup:index1 <- [FP+-8]
	mov.w	-4(r4), r15
	call	#hash_key_to_index
	mov.w	r15, -8(r4)
	call	#__mementos_checkpoint
	mov.w	#11, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_6
	jmp	.LBB9_5
.LBB9_5:                                ; %if.then.9
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_6
.LBB9_6:                                ; %if.end.10
	;DEBUG_VALUE: lookup:fp_hash <- [FP+-10]
	mov.w	-6(r4), r15
	call	#hash_fp_to_index
	mov.w	r15, -10(r4)
	;DEBUG_VALUE: lookup:index2 <- [FP+-12]
	mov.w	-8(r4), r12
	xor.w	r15, r12
	mov.w	r12, -12(r4)
	call	#__mementos_checkpoint
	mov.w	#12, &curtask
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %if.then.14
	call	#__dino_unset_recovery_bit
	jmp	.LBB9_8
.LBB9_8:                                ; %if.end.15
	mov.w	-8(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	-6(r4), r13
	mov.b	#1, r14
	cmp.w	r13, r12
	mov.b	r14, -17(r4)            ; 1-byte Folded Spill
	jeq	.LBB9_10
	jmp	.LBB9_9
.LBB9_9:                                ; %lor.rhs
	mov.w	-12(r4), r12
	mov.w	-2(r4), r13
	rla.w	r12
	add.w	r12, r13
	mov.w	0(r13), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -17(r4)            ; 1-byte Folded Spill
	jmp	.LBB9_10
.LBB9_10:                               ; %lor.end
	mov.b	-17(r4), r12            ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	lookup, .Lfunc_end9-lookup

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
.Lfunc_end10:
	.size	hash_to_fingerprint, .Lfunc_end10-hash_to_fingerprint

	.align	2
	.type	hash_fp_to_index,@function
hash_fp_to_index:                       ; @hash_fp_to_index
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: hash_fp_to_index:fp <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r4, r15
	sub.w	#2, r15
	;DEBUG_VALUE: hash_fp_to_index:fp <- [R15+0]
	mov.w	#2, r14
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#djb_hash
	mov.w	r15, -4(r4)
	and.w	#127, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	hash_fp_to_index, .Lfunc_end11-hash_fp_to_index

	.align	2
	.type	djb_hash,@function
djb_hash:                               ; @djb_hash
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:len <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	#5381, -8(r4)
	mov.w	#0, -10(r4)
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB12_1
.LBB12_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-4(r4), r13
	cmp.w	r13, r12
	jhs	.LBB12_4
	jmp	.LBB12_2
.LBB12_2:                               ; %for.body
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	mov.w	r13, r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	mov.w	r12, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	bis.w	r15, r14
	mov.w	r12, r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	add.w	r12, r15
	addc.w	r13, r14
	mov.w	-2(r4), r12
	mov.b	0(r12), r12
	add.w	r12, r15
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r15, -8(r4)
	jmp	.LBB12_3
.LBB12_3:                               ; %for.inc
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB12_1
.LBB12_4:                               ; %for.end
	mov.w	-8(r4), r15
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	djb_hash, .Lfunc_end12-djb_hash

	.align	2
	.type	hash_key_to_index,@function
hash_key_to_index:                      ; @hash_key_to_index
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	;DEBUG_VALUE: hash_key_to_index:fp <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r4, r15
	sub.w	#2, r15
	;DEBUG_VALUE: hash_key_to_index:fp <- [R15+0]
	mov.w	#2, r14
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#djb_hash
	mov.w	r15, -4(r4)
	and.w	#127, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end13:
	.size	hash_key_to_index, .Lfunc_end13-hash_key_to_index

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
.Lfunc_end14:
	.size	msp_watchdog_enable, .Lfunc_end14-msp_watchdog_enable

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
.Lfunc_end15:
	.size	msp_watchdog_disable, .Lfunc_end15-msp_watchdog_disable

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
.Lfunc_end16:
	.size	msp_watchdog_kick, .Lfunc_end16-msp_watchdog_kick

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
	jeq	.LBB17_4
	jmp	.LBB17_1
.LBB17_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB17_2
.LBB17_2:                               ; %while.body
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
	jne	.LBB17_2
	jmp	.LBB17_3
.LBB17_3:                               ; %while.end.loopexit
	jmp	.LBB17_4
.LBB17_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end17:
	.size	memcpy, .Lfunc_end17-memcpy

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
.Lfunc_end18:
	.size	my_memset, .Lfunc_end18-my_memset

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
.Lfunc_end19:
	.size	msp_clock_setup, .Lfunc_end19-msp_clock_setup

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
.Lfunc_end20:
	.size	mult16, .Lfunc_end20-mult16

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
	jmp	.LBB21_1
.LBB21_1:                               ; %while.cond
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
	jeq	.LBB21_3
	jmp	.LBB21_2
.LBB21_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB21_3
.LBB21_3:                               ; %land.end
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB21_10
	jmp	.LBB21_4
.LBB21_4:                               ; %while.body
                                        ;   in Loop: Header=BB21_1 Depth=1
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
	jeq	.LBB21_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB21_6:                               ; %while.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB21_8
	jmp	.LBB21_7
.LBB21_7:                               ; %if.then
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB21_9
.LBB21_8:                               ; %if.else
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB21_9
.LBB21_9:                               ; %if.end
                                        ;   in Loop: Header=BB21_1 Depth=1
	jmp	.LBB21_1
.LBB21_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end21:
	.size	sqrt16, .Lfunc_end21-sqrt16

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
	jmp	.LBB22_1
.LBB22_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB22_4
	jmp	.LBB22_2
.LBB22_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB22_4
	jmp	.LBB22_3
.LBB22_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB22_4
.LBB22_4:                               ; %land.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB22_6
	jmp	.LBB22_5
.LBB22_5:                               ; %while.body
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB22_1
.LBB22_6:                               ; %while.end
	jmp	.LBB22_7
.LBB22_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB22_11
	jmp	.LBB22_8
.LBB22_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB22_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB22_10
	jmp	.LBB22_9
.LBB22_9:                               ; %if.then
                                        ;   in Loop: Header=BB22_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB22_10
.LBB22_10:                              ; %if.end
                                        ;   in Loop: Header=BB22_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB22_7
.LBB22_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB22_13
	jmp	.LBB22_12
.LBB22_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB22_14
.LBB22_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB22_14
.LBB22_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end22:
	.size	udivmodhi4, .Lfunc_end22-udivmodhi4

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
	jge	.LBB23_2
	jmp	.LBB23_1
.LBB23_1:                               ; %if.then
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
	jmp	.LBB23_2
.LBB23_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB23_4
	jmp	.LBB23_3
.LBB23_3:                               ; %if.then.2
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
	jmp	.LBB23_4
.LBB23_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB23_6
	jmp	.LBB23_5
.LBB23_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB23_6
.LBB23_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end23:
	.size	__divhi3, .Lfunc_end23-__divhi3

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
	jge	.LBB24_2
	jmp	.LBB24_1
.LBB24_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
	jmp	.LBB24_2
.LBB24_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB24_4
	jmp	.LBB24_3
.LBB24_3:                               ; %if.then.2
	mov.w	-4(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -4(r4)
	jmp	.LBB24_4
.LBB24_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB24_6
	jmp	.LBB24_5
.LBB24_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB24_6
.LBB24_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end24:
	.size	__modhi3, .Lfunc_end24-__modhi3

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
.Lfunc_end25:
	.size	__udivhi3, .Lfunc_end25-__udivhi3

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
.Lfunc_end26:
	.size	__umodhi3, .Lfunc_end26-__umodhi3

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
.Lfunc_end27:
	.size	__dino_task_boundary, .Lfunc_end27-__dino_task_boundary

	.globl	__dino_empty_versioning
	.align	2
	.type	__dino_empty_versioning,@function
__dino_empty_versioning:                ; @__dino_empty_versioning
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#__dino_recovery_bit_set
	cmp.w	#0, r15
	jeq	.LBB28_2
	jmp	.LBB28_1
.LBB28_1:                               ; %if.then
	call	#__dino_unset_recovery_bit
	jmp	.LBB28_2
.LBB28_2:                               ; %if.end
	pop.w	r4
	ret
.Lfunc_end28:
	.size	__dino_empty_versioning, .Lfunc_end28-__dino_empty_versioning

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
.Lfunc_end29:
	.size	__dino_unset_recovery_bit, .Lfunc_end29-__dino_unset_recovery_bit

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
.Lfunc_end30:
	.size	__dino_recovery_bit_set, .Lfunc_end30-__dino_recovery_bit_set

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
	jne	.LBB31_2
	jmp	.LBB31_1
.LBB31_1:                               ; %if.then
	mov.w	#-4232, -2(r4)
	jmp	.LBB31_5
.LBB31_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB31_4
	jmp	.LBB31_3
.LBB31_3:                               ; %if.then.2
	mov.w	#-4230, -2(r4)
	jmp	.LBB31_5
.LBB31_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB31_5
.LBB31_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	__dino_find_next_recovery, .Lfunc_end31-__dino_find_next_recovery

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
	jne	.LBB32_2
	jmp	.LBB32_1
.LBB32_1:                               ; %if.then
	mov.w	#-4230, -2(r4)
	jmp	.LBB32_5
.LBB32_2:                               ; %if.else
	mov.w	-4(r4), r12
	cmp.w	#-2178, r12
	jne	.LBB32_4
	jmp	.LBB32_3
.LBB32_3:                               ; %if.then.2
	mov.w	#-4232, -2(r4)
	jmp	.LBB32_5
.LBB32_4:                               ; %if.else.3
	mov.w	#0, &-4228
	mov.w	#-16657, &-4230
	mov.w	#0, &-4230
	mov.w	#-16657, &-4232
	mov.w	#-4230, -2(r4)
	jmp	.LBB32_5
.LBB32_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end32:
	.size	__dino_find_active_recovery, .Lfunc_end32-__dino_find_active_recovery

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
.Lfunc_end33:
	.size	__dino_recovery_get, .Lfunc_end33-__dino_recovery_get

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
.Lfunc_end34:
	.size	__dino_recovery_set, .Lfunc_end34-__dino_recovery_set

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
.Lfunc_end35:
	.size	__dino_set_next_recovery, .Lfunc_end35-__dino_set_next_recovery

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
	jmp	.LBB36_1
.LBB36_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&tmpsize, r13
	cmp.w	r13, r12
	jhs	.LBB36_4
	jmp	.LBB36_2
.LBB36_2:                               ; %for.body
                                        ;   in Loop: Header=BB36_1 Depth=1
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
	jmp	.LBB36_3
.LBB36_3:                               ; %for.inc
                                        ;   in Loop: Header=BB36_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB36_1
.LBB36_4:                               ; %for.end
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
.Lfunc_end36:
	.size	__mementos_restore, .Lfunc_end36-__mementos_restore

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
	jmp	.LBB37_1
.LBB37_1:                               ; %do.body
	;APP
	BIS #8, R2
	;NO_APP
	jmp	.LBB37_2
.LBB37_2:                               ; %do.end
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Lfunc_end37:
	.size	__mementos_setup_timer, .Lfunc_end37-__mementos_setup_timer

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
.Lfunc_end38:
	.size	TIMER0_A0_ISR, .Lfunc_end38-TIMER0_A0_ISR

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
	jmp	.LBB39_1
.LBB39_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	#9216, r12
	jhs	.LBB39_4
	jmp	.LBB39_2
.LBB39_2:                               ; %for.body
                                        ;   in Loop: Header=BB39_1 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	mov.w	&j, r15
	sub.w	r15, r12
	add.w	r12, r14
	mov.w	r13, 0(r14)
	jmp	.LBB39_3
.LBB39_3:                               ; %for.inc
                                        ;   in Loop: Header=BB39_1 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB39_1
.LBB39_4:                               ; %for.end
	mov.w	&i, r12
	mov.w	&j, r13
	sub.w	r13, r12
	mov.w	&k, r13
	add.w	r12, r13
	mov.w	r13, &k
	mov.w	#7168, &i
	jmp	.LBB39_5
.LBB39_5:                               ; %for.cond.7
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	mov.w	&GlobalAllocSize, r13
	add.w	#1, r13
	and.w	#-2, r13
	add.w	#7168, r13
	cmp.w	r13, r12
	jhs	.LBB39_8
	jmp	.LBB39_6
.LBB39_6:                               ; %for.body.11
                                        ;   in Loop: Header=BB39_5 Depth=1
	mov.w	&i, r12
	mov.w	0(r12), r13
	mov.w	&k, r14
	add.w	r14, r12
	mov.w	r13, -7168(r12)
	jmp	.LBB39_7
.LBB39_7:                               ; %for.inc.14
                                        ;   in Loop: Header=BB39_5 Depth=1
	mov.w	&i, r12
	add.w	#2, r12
	mov.w	r12, &i
	jmp	.LBB39_5
.LBB39_8:                               ; %for.end.16
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
.Lfunc_end39:
	.size	__mementos_checkpoint, .Lfunc_end39-__mementos_checkpoint

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
	jeq	.LBB40_2
	jmp	.LBB40_1
.LBB40_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#-2178, r12
	jeq	.LBB40_3
	jmp	.LBB40_4
.LBB40_2:                               ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB40_5
.LBB40_3:                               ; %sw.bb.1
	mov.w	#-4226, -4(r4)
	jmp	.LBB40_4
.LBB40_4:                               ; %sw.default
	mov.w	#-4226, -4(r4)
	jmp	.LBB40_5
.LBB40_5:                               ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end40:
	.size	__mementos_locate_next_bundle, .Lfunc_end40-__mementos_locate_next_bundle

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
	jeq	.LBB41_2
	jmp	.LBB41_1
.LBB41_1:                               ; %if.then
	mov.w	-4(r4), r12
	mov.w	r12, -2(r4)
	jmp	.LBB41_3
.LBB41_2:                               ; %if.end
	mov.w	#-1, -2(r4)
	jmp	.LBB41_3
.LBB41_3:                               ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Lfunc_end41:
	.size	__mementos_find_active_bundle, .Lfunc_end41-__mementos_find_active_bundle

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
	jlo	.LBB42_2
	jmp	.LBB42_1
.LBB42_1:                               ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#-129, r12
	mov.w	r2, r12
	mov.w	#1, r13
	bic.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -5(r4)             ; 1-byte Folded Spill
	jmp	.LBB42_2
.LBB42_2:                               ; %land.end
	mov.b	-5(r4), r12             ; 1-byte Folded Reload
	and.b	#1, r12
	mov.b	r12, r15
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end42:
	.size	__mementos_bundle_in_range, .Lfunc_end42-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Lfunc_end43:
	.size	__mementos_atboot_cleanup, .Lfunc_end43-__mementos_atboot_cleanup

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
.Lfunc_end44:
	.size	__mementos_inactive_cleanup, .Lfunc_end44-__mementos_inactive_cleanup

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
.Lfunc_end45:
	.size	__mementos_force_free, .Lfunc_end45-__mementos_force_free

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
	.asciz	"%04x "
	.size	.L.str, 6

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"\r\n"
	.size	.L.str.1, 3

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"stats: inserts %u members %u total %u\r\n"
	.size	.L.str.2, 40

	.type	curtask,@object         ; @curtask
	.section	.nv_vars,"aw",@progbits
	.align	1
curtask:
	.short	0                       ; 0x0
	.size	curtask, 2

	.type	.L.str.3,@object        ; @.str.3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.3:
	.asciz	".%u.\r\n"
	.size	.L.str.3, 7

	.type	main.filter,@object     ; @main.filter
	.section	.nv_vars,"aw",@progbits
	.align	1
main.filter:
	.zero	256
	.size	main.filter, 256

	.type	.L.str.4,@object        ; @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"REAL TIME end is 65536*%u+%u\r\n"
	.size	.L.str.4, 31

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
