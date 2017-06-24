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

	.globl	ACCEL_singleSample_
	.align	2
	.type	ACCEL_singleSample_,@function
ACCEL_singleSample_:                    ; @ACCEL_singleSample_
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	sub.w	#12, r1
	;DEBUG_VALUE: ACCEL_singleSample_:result <- undef
	;DEBUG_VALUE: ACCEL_singleSample_:seed <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	#17, r15
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, r15
	mov.w	-8(r4), r14             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	#85, r12
	mov.w	r12, r14
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-4(r4), r12
	mov.b	r11, 0(r12)
	mov.w	-6(r4), r15
	mov.w	#289, r14
	call	#__mulhi3hw_noint
	mov.w	-14(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-4(r4), r12
	mov.b	r11, 1(r12)
	mov.w	-6(r4), r15
	mov.w	#4913, r14
	call	#__mulhi3hw_noint
	mov.w	-14(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-4(r4), r12
	mov.b	r11, 2(r12)
	add.w	#12, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end1:
	.size	ACCEL_singleSample_, .Lfunc_end1-ACCEL_singleSample_

	.globl	initializeHardware
	.align	2
	.type	initializeHardware,@function
initializeHardware:                     ; @initializeHardware
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
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
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
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
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	add.w	#10, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	initializeHardware, .Lfunc_end2-initializeHardware

	.globl	task_init
	.align	2
	.type	task_init,@function
task_init:                              ; @task_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#18, r1
	mov.b	#3, -1(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#1, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_selectMode, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#0, -4(r4)
	mov.w	#1, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_init_task_selectMode, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_warmup, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	#_task_task_selectMode, r15
	call	#transition_to
	add.w	#18, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init

	.globl	task_selectMode
	.align	2
	.type	task_selectMode,@function
task_selectMode:                        ; @task_selectMode
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#34, r1
	mov.w	#0, -2(r4)
	mov.b	#1, -3(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_init_task_init, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_init_task_selectMode, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	add.w	#1, r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_init, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	-6(r4), r12
	cmp.w	#3, r12
	jlo	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.b	#2, -3(r4)
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov.w	-6(r4), r12
	cmp.w	#5, r12
	jlo	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then.2
	mov.b	#0, -3(r4)
	jmp	.LBB4_4
.LBB4_4:                                ; %if.end.3
	mov.w	-6(r4), r12
	cmp.w	#7, r12
	jlo	.LBB4_7
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then.5
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.4, 0(r14)
	call	#printf
	mov.w	r15, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_6
.LBB4_6:                                ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB4_6
.LBB4_7:                                ; %if.end.7
	;DEBUG_VALUE: task_selectMode:mode <- [FP+-8]
	;DEBUG_VALUE: task_selectMode:class <- [FP+-10]
	;DEBUG_VALUE: task_selectMode:prev_pin_state <- [FP+-11]
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_selectMode_task_selectMode, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_selectMode, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.b	0(r15), r13
	mov.b	r13, -11(r4)
	mov.b	-3(r4), r13
	cmp.b	#2, r13
	jeq	.LBB4_9
	jmp	.LBB4_8
.LBB4_8:                                ; %lor.lhs.false
	mov.b	-3(r4), r12
	cmp.b	#1, r12
	jne	.LBB4_11
	jmp	.LBB4_9
.LBB4_9:                                ; %land.lhs.true
	mov.b	-3(r4), r12
	mov.b	-11(r4), r13
	cmp.w	r13, r12
	jne	.LBB4_11
	jmp	.LBB4_10
.LBB4_10:                               ; %if.then.18
	mov.b	#3, -3(r4)
	jmp	.LBB4_12
.LBB4_11:                               ; %if.else
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#3, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_selectMode, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	jmp	.LBB4_12
.LBB4_12:                               ; %if.end.19
	mov.b	-3(r4), r12
	mov.b	r12, r13
	cmp.b	#0, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB4_17
	jmp	.LBB4_13
.LBB4_13:                               ; %if.end.19
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jeq	.LBB4_16
	jmp	.LBB4_14
.LBB4_14:                               ; %if.end.19
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	cmp.w	#2, r12
	jne	.LBB4_18
	jmp	.LBB4_15
.LBB4_15:                               ; %sw.bb
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_warmup, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	mov.w	r13, -18(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	#2, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_featurize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#0, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_train, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-18(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB4_19
.LBB4_16:                               ; %sw.bb.21
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_warmup, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	mov.w	r13, -20(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	#1, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_featurize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#1, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_train, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB4_19
.LBB4_17:                               ; %sw.bb.22
	mov.w	#0, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_selectMode_task_featurize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	mov.w	#_task_task_resetStats, r15
	call	#transition_to
	jmp	.LBB4_19
.LBB4_18:                               ; %sw.default
	mov.w	#_task_task_idle, r15
	call	#transition_to
	jmp	.LBB4_19
.LBB4_19:                               ; %sw.epilog
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_selectMode, .Lfunc_end4-task_selectMode

	.globl	task_resetStats
	.align	2
	.type	task_resetStats,@function
task_resetStats:                        ; @task_resetStats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	#0, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#2, r13
	mov.w	r13, 2(r12)
	mov.w	#4, 10(r12)
	mov.w	#_ch_task_resetStats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.9, 0(r12)
	mov.w	r13, -4(r4)             ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#8, 10(r12)
	mov.w	#_ch_task_resetStats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_resetStats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_resetStats_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_sample, r15
	call	#transition_to
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_resetStats, .Lfunc_end5-task_resetStats

	.globl	task_sample
	.align	2
	.type	task_sample,@function
task_sample:                            ; @task_sample
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#30, r1
	mov.w	r1, r12
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_init_task_warmup, 14(r12)
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_sample_task_sample, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_warmup_task_sample, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, -12(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	call	#ACCEL_singleSample_
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_sample_task_warmup, 12(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_sample_task_sample, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_sample_task_sample, 14(r12)
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_selectMode_task_sample, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_resetStats_task_sample, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	#6, r14
	mov.w	r12, r15
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-12(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 2(r12)
	mov.w	#_ch_mc_task_sample_ch_sample_window, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	cmp.w	#3, r12
	jhs	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_sample_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB6_3
.LBB6_2:                                ; %if.else
	;DEBUG_VALUE: zero <- [FP+-10]
	mov.w	#0, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_sample_task_sample, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	mov.w	#_task_task_transform, r15
	call	#transition_to
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	add.w	#30, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_sample, .Lfunc_end6-task_sample

	.globl	task_transform
	.align	2
	.type	task_transform,@function
task_transform:                         ; @task_transform
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	#0, -2(r4)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#3, r12
	jhs	.LBB7_17
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r14
	mov.w	r15, 8(r14)
	mov.w	#_ch_mc_task_sample_ch_sample_window, 6(r14)
	mov.w	#1, 4(r14)
	mov.w	#6, 2(r14)
	mov.w	#.L.str.13, 0(r14)
	call	#chan_in
	mov.w	r15, -4(r4)
	mov.b	0(r15), r14
	cmp.w	#10, r14
	jl	.LBB7_5
	jmp	.LBB7_3
.LBB7_3:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	1(r12), r12
	cmp.w	#10, r12
	jl	.LBB7_5
	jmp	.LBB7_4
.LBB7_4:                                ; %lor.lhs.false.6
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	2(r12), r12
	cmp.w	#10, r12
	jge	.LBB7_15
	jmp	.LBB7_5
.LBB7_5:                                ; %if.then
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	0(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_7
	jmp	.LBB7_6
.LBB7_6:                                ; %cond.true
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	0(r12), r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_8
.LBB7_7:                                ; %cond.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_8
.LBB7_8:                                ; %cond.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -8(r4)
	mov.w	-4(r4), r12
	mov.b	1(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_10
	jmp	.LBB7_9
.LBB7_9:                                ; %cond.true.22
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	1(r12), r12
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_11
.LBB7_10:                               ; %cond.false.25
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_11
.LBB7_11:                               ; %cond.end.26
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -7(r4)
	mov.w	-4(r4), r12
	mov.b	2(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_13
	jmp	.LBB7_12
.LBB7_12:                               ; %cond.true.34
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-4(r4), r12
	mov.b	2(r12), r12
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_14
.LBB7_13:                               ; %cond.false.37
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_14
.LBB7_14:                               ; %cond.end.38
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-14(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.b	r13, -6(r4)
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_transform_task_featurize, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	jmp	.LBB7_15
.LBB7_15:                               ; %if.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_16
.LBB7_16:                               ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB7_1
.LBB7_17:                               ; %for.end
	mov.w	#_task_task_featurize, r15
	call	#transition_to
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_transform, .Lfunc_end7-task_transform

	.globl	task_featurize
	.align	2
	.type	task_featurize,@function
task_featurize:                         ; @task_featurize
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#54, r1
	mov.b	#0, -4(r4)
	mov.b	#0, -5(r4)
	mov.b	#0, -6(r4)
	mov.b	#0, -8(r4)
	mov.b	#0, -9(r4)
	mov.b	#0, -10(r4)
	mov.w	#0, -18(r4)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	cmp.w	#3, r12
	jge	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-18(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r14
	mov.w	r15, 12(r14)
	mov.w	r15, 8(r14)
	mov.w	#_ch_task_transform_task_featurize, 10(r14)
	mov.w	#_ch_mc_task_sample_ch_sample_window, 6(r14)
	mov.w	#2, 4(r14)
	mov.w	#6, 2(r14)
	mov.w	#.L.str.13, 0(r14)
	call	#chan_in
	mov.w	r15, -2(r4)
	mov.b	0(r15), r14
	mov.b	-6(r4), r15
	add.w	r14, r15
	mov.b	r15, r12
	mov.b	r12, -6(r4)
	mov.w	-2(r4), r14
	mov.b	1(r14), r14
	mov.b	-5(r4), r15
	add.w	r14, r15
	mov.b	r15, r12
	mov.b	r12, -5(r4)
	mov.w	-2(r4), r14
	mov.b	2(r14), r14
	mov.b	-4(r4), r15
	add.w	r14, r15
	mov.b	r15, r12
	mov.b	r12, -4(r4)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov.b	-6(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -6(r4)
	mov.b	-5(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -5(r4)
	mov.b	-4(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -4(r4)
	mov.w	#0, -18(r4)
	jmp	.LBB8_5
.LBB8_5:                                ; %for.cond.31
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-18(r4), r12
	cmp.w	#3, r12
	jge	.LBB8_17
	jmp	.LBB8_6
.LBB8_6:                                ; %for.body.34
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-18(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r14
	mov.w	r15, 12(r14)
	mov.w	r15, 8(r14)
	mov.w	#_ch_task_transform_task_featurize, 10(r14)
	mov.w	#_ch_mc_task_sample_ch_sample_window, 6(r14)
	mov.w	#2, 4(r14)
	mov.w	#6, 2(r14)
	mov.w	#.L.str.13, 0(r14)
	call	#chan_in
	mov.w	r15, -2(r4)
	mov.b	0(r15), r14
	mov.b	-6(r4), r15
	cmp.w	r14, r15
	jge	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %cond.true
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-2(r4), r12
	mov.b	0(r12), r12
	mov.b	-6(r4), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_9
.LBB8_8:                                ; %cond.false
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-6(r4), r12
	mov.w	-2(r4), r13
	mov.b	0(r13), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_9
.LBB8_9:                                ; %cond.end
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.b	-10(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -10(r4)
	mov.w	-2(r4), r12
	mov.b	1(r12), r12
	mov.b	-5(r4), r13
	cmp.w	r12, r13
	jge	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ; %cond.true.61
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-2(r4), r12
	mov.b	1(r12), r12
	mov.b	-5(r4), r13
	sub.w	r13, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_12
.LBB8_11:                               ; %cond.false.67
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-5(r4), r12
	mov.w	-2(r4), r13
	mov.b	1(r13), r13
	sub.w	r13, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_12
.LBB8_12:                               ; %cond.end.73
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	mov.b	-9(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -9(r4)
	mov.w	-2(r4), r12
	mov.b	2(r12), r12
	mov.b	-4(r4), r13
	cmp.w	r12, r13
	jge	.LBB8_14
	jmp	.LBB8_13
.LBB8_13:                               ; %cond.true.85
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-2(r4), r12
	mov.b	2(r12), r12
	mov.b	-4(r4), r13
	sub.w	r13, r12
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_15
.LBB8_14:                               ; %cond.false.91
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-4(r4), r12
	mov.w	-2(r4), r13
	mov.b	2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_15
.LBB8_15:                               ; %cond.end.97
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.b	-8(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -8(r4)
	jmp	.LBB8_16
.LBB8_16:                               ; %for.inc.103
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_5
.LBB8_17:                               ; %for.end.105
	mov.b	-10(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -10(r4)
	mov.b	-9(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -9(r4)
	mov.b	-8(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -8(r4)
	;DEBUG_VALUE: task_featurize:meanmag <- [FP+-20]
	mov.b	-6(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-5(r4), r12
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-4(r4), r14
	mov.w	r14, r15
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -20(r4)
	;DEBUG_VALUE: task_featurize:stddevmag <- [FP+-22]
	mov.b	-10(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-9(r4), r12
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-8(r4), r14
	mov.w	r14, r15
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -22(r4)
	mov.w	-20(r4), r14
	mov.w	#0, r12
	mov.w	r12, r15
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	call	#sqrt16
	mov.w	r15, -14(r4)
	mov.w	-22(r4), r14
	mov.w	-38(r4), r15            ; 2-byte Folded Reload
	call	#sqrt16
	mov.w	r15, -12(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_selectMode_task_featurize, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	cmp.w	#0, r12
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_20
	jmp	.LBB8_18
.LBB8_18:                               ; %for.end.105
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	add.w	#-1, r12
	cmp.w	#2, r12
	jhs	.LBB8_21
	jmp	.LBB8_19
.LBB8_19:                               ; %sw.bb
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#14, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_featurize_task_train, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	#_task_task_train, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_20:                               ; %sw.bb.158
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#14, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_featurize_task_classify, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	#_task_task_classify, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_21:                               ; %sw.default
	jmp	.LBB8_22
.LBB8_22:                               ; %sw.epilog
	add.w	#54, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_featurize, .Lfunc_end8-task_featurize

	.globl	task_classify
	.align	2
	.type	task_classify,@function
task_classify:                          ; @task_classify
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#160, r1
	mov.w	#0, -6(r4)
	mov.w	#0, -8(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_featurize_task_classify, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_in
	mov.w	2(r15), r12
	mov.w	r12, -14(r4)
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	mov.w	-16(r4), r12
	mov.w	r12, -20(r4)
	mov.w	#0, -18(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -24(r4)
	mov.w	#0, -22(r4)
	mov.w	#0, -10(r4)
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	cmp.w	#16, r12
	jl	4
	br	#.LBB9_46
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r14
	mov.w	r15, 8(r14)
	mov.w	#_ch_task_train_task_classify, 6(r14)
	mov.w	#1, 4(r14)
	mov.w	#6, 2(r14)
	mov.w	#.L.str.15, 0(r14)
	call	#chan_in
	mov.w	2(r15), r14
	mov.w	r14, -26(r4)
	mov.w	0(r15), r14
	mov.w	r14, -28(r4)
	;DEBUG_VALUE: stat_mean_err <- [FP+-28]
	mov.w	-28(r4), r14
	mov.w	-20(r4), r15
	mov.w	-18(r4), r12
	mov.w	#0, r13
	mov.w	#1, r11
	cmp.w	#0, r12
	mov.w	r14, -46(r4)            ; 2-byte Folded Spill
	mov.w	r15, -48(r4)            ; 2-byte Folded Spill
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
	mov.w	r13, -52(r4)            ; 2-byte Folded Spill
	mov.w	r11, -54(r4)            ; 2-byte Folded Spill
	jge	.LBB9_4
; BB#3:                                 ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-52(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -54(r4)            ; 2-byte Folded Spill
.LBB9_4:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	mov.w	-48(r4), r13            ; 2-byte Folded Reload
	mov.w	-46(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-50(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
	mov.w	r13, -58(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_6
; BB#5:                                 ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-56(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -58(r4)            ; 2-byte Folded Spill
.LBB9_6:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-58(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %cond.true
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-28(r4), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
	mov.w	r15, -62(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_9
.LBB9_8:                                ; %cond.false
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-28(r4), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
	mov.w	r13, -62(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_9
.LBB9_9:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	;DEBUG_VALUE: stat_sd_err <- [FP+-32]
	mov.w	-62(r4), r12            ; 2-byte Folded Reload
	mov.w	-60(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -32(r4)
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r12
	mov.w	-24(r4), r13
	mov.w	-22(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
	mov.w	r13, -66(r4)            ; 2-byte Folded Spill
	mov.w	r14, -68(r4)            ; 2-byte Folded Spill
	mov.w	r15, -70(r4)            ; 2-byte Folded Spill
	mov.w	r11, -72(r4)            ; 2-byte Folded Spill
	jge	.LBB9_11
; BB#10:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-70(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -72(r4)            ; 2-byte Folded Spill
.LBB9_11:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-72(r4), r12            ; 2-byte Folded Reload
	mov.w	-66(r4), r13            ; 2-byte Folded Reload
	mov.w	-64(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-68(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -74(r4)            ; 2-byte Folded Spill
	mov.w	r13, -76(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_13
; BB#12:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-74(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -76(r4)            ; 2-byte Folded Spill
.LBB9_13:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-76(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_15
	jmp	.LBB9_14
.LBB9_14:                               ; %cond.true.19
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	-24(r4), r13
	mov.w	-22(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -78(r4)            ; 2-byte Folded Spill
	mov.w	r15, -80(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_16
.LBB9_15:                               ; %cond.false.23
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-26(r4), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -78(r4)            ; 2-byte Folded Spill
	mov.w	r13, -80(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_16
.LBB9_16:                               ; %cond.end.27
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	-78(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -36(r4)
	mov.w	r12, -34(r4)
	mov.w	-10(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	add.w	#96, r15
	mov.w	r1, r12
	mov.w	r15, 8(r12)
	mov.w	#_ch_task_train_task_classify, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.16, 0(r12)
	call	#chan_in
	mov.w	2(r15), r12
	mov.w	r12, -26(r4)
	mov.w	0(r15), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: move_mean_err <- [FP+-36]
	mov.w	-28(r4), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -82(r4)            ; 2-byte Folded Spill
	mov.w	r13, -84(r4)            ; 2-byte Folded Spill
	mov.w	r14, -86(r4)            ; 2-byte Folded Spill
	mov.w	r15, -88(r4)            ; 2-byte Folded Spill
	mov.w	r11, -90(r4)            ; 2-byte Folded Spill
	jge	.LBB9_18
; BB#17:                                ; %cond.end.27
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-88(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -90(r4)            ; 2-byte Folded Spill
.LBB9_18:                               ; %cond.end.27
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-90(r4), r12            ; 2-byte Folded Reload
	mov.w	-84(r4), r13            ; 2-byte Folded Reload
	mov.w	-82(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-86(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -92(r4)            ; 2-byte Folded Spill
	mov.w	r13, -94(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_20
; BB#19:                                ; %cond.end.27
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-92(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -94(r4)            ; 2-byte Folded Spill
.LBB9_20:                               ; %cond.end.27
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-94(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_22
	jmp	.LBB9_21
.LBB9_21:                               ; %cond.true.34
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-28(r4), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -96(r4)            ; 2-byte Folded Spill
	mov.w	r15, -98(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_23
.LBB9_22:                               ; %cond.false.38
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-28(r4), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -96(r4)            ; 2-byte Folded Spill
	mov.w	r13, -98(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_23
.LBB9_23:                               ; %cond.end.42
                                        ;   in Loop: Header=BB9_1 Depth=1
	;DEBUG_VALUE: move_sd_err <- [FP+-40]
	mov.w	-98(r4), r12            ; 2-byte Folded Reload
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -40(r4)
	mov.w	r12, -38(r4)
	mov.w	-26(r4), r12
	mov.w	-24(r4), r13
	mov.w	-22(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -100(r4)           ; 2-byte Folded Spill
	mov.w	r13, -102(r4)           ; 2-byte Folded Spill
	mov.w	r14, -104(r4)           ; 2-byte Folded Spill
	mov.w	r15, -106(r4)           ; 2-byte Folded Spill
	mov.w	r11, -108(r4)           ; 2-byte Folded Spill
	jge	.LBB9_25
; BB#24:                                ; %cond.end.42
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-106(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -108(r4)           ; 2-byte Folded Spill
.LBB9_25:                               ; %cond.end.42
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-108(r4), r12           ; 2-byte Folded Reload
	mov.w	-102(r4), r13           ; 2-byte Folded Reload
	mov.w	-100(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-104(r4), r14           ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -110(r4)           ; 2-byte Folded Spill
	mov.w	r13, -112(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_27
; BB#26:                                ; %cond.end.42
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-110(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -112(r4)           ; 2-byte Folded Spill
.LBB9_27:                               ; %cond.end.42
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-112(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_29
	jmp	.LBB9_28
.LBB9_28:                               ; %cond.true.48
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	-24(r4), r13
	mov.w	-22(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -114(r4)           ; 2-byte Folded Spill
	mov.w	r15, -116(r4)           ; 2-byte Folded Spill
	jmp	.LBB9_30
.LBB9_29:                               ; %cond.false.52
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-26(r4), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -114(r4)           ; 2-byte Folded Spill
	mov.w	r13, -116(r4)           ; 2-byte Folded Spill
	jmp	.LBB9_30
.LBB9_30:                               ; %cond.end.56
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-116(r4), r12           ; 2-byte Folded Reload
	mov.w	-114(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, -44(r4)
	mov.w	r12, -42(r4)
	mov.w	-40(r4), r12
	mov.w	-38(r4), r13
	mov.w	-32(r4), r14
	mov.w	-30(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -118(r4)           ; 2-byte Folded Spill
	mov.w	r13, -120(r4)           ; 2-byte Folded Spill
	mov.w	r14, -122(r4)           ; 2-byte Folded Spill
	mov.w	r15, -124(r4)           ; 2-byte Folded Spill
	mov.w	r11, -126(r4)           ; 2-byte Folded Spill
	mov.w	r10, -128(r4)           ; 2-byte Folded Spill
	jge	.LBB9_32
; BB#31:                                ; %cond.end.56
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-126(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -128(r4)           ; 2-byte Folded Spill
.LBB9_32:                               ; %cond.end.56
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-128(r4), r12           ; 2-byte Folded Reload
	mov.w	-118(r4), r13           ; 2-byte Folded Reload
	mov.w	-122(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-120(r4), r14           ; 2-byte Folded Reload
	mov.w	-124(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -130(r4)           ; 2-byte Folded Spill
	mov.w	r13, -132(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_34
; BB#33:                                ; %cond.end.56
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-130(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -132(r4)           ; 2-byte Folded Spill
.LBB9_34:                               ; %cond.end.56
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-132(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_36
	jmp	.LBB9_35
.LBB9_35:                               ; %if.then
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB9_37
.LBB9_36:                               ; %if.else
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB9_37
.LBB9_37:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-44(r4), r12
	mov.w	-42(r4), r13
	mov.w	-36(r4), r14
	mov.w	-34(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -134(r4)           ; 2-byte Folded Spill
	mov.w	r13, -136(r4)           ; 2-byte Folded Spill
	mov.w	r14, -138(r4)           ; 2-byte Folded Spill
	mov.w	r15, -140(r4)           ; 2-byte Folded Spill
	mov.w	r11, -142(r4)           ; 2-byte Folded Spill
	mov.w	r10, -144(r4)           ; 2-byte Folded Spill
	jge	.LBB9_39
; BB#38:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-142(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -144(r4)           ; 2-byte Folded Spill
.LBB9_39:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-144(r4), r12           ; 2-byte Folded Reload
	mov.w	-134(r4), r13           ; 2-byte Folded Reload
	mov.w	-138(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-136(r4), r14           ; 2-byte Folded Reload
	mov.w	-140(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -146(r4)           ; 2-byte Folded Spill
	mov.w	r13, -148(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_41
; BB#40:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-146(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -148(r4)           ; 2-byte Folded Spill
.LBB9_41:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-148(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_43
	jmp	.LBB9_42
.LBB9_42:                               ; %if.then.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB9_44
.LBB9_43:                               ; %if.else.65
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB9_44
.LBB9_44:                               ; %if.end.67
                                        ;   in Loop: Header=BB9_1 Depth=1
	jmp	.LBB9_45
.LBB9_45:                               ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	br	#.LBB9_1
.LBB9_46:                               ; %for.end
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.w	#0, r14
	mov.w	#1, r15
	cmp.w	r12, r13
	mov.w	r14, -150(r4)           ; 2-byte Folded Spill
	mov.w	r15, -152(r4)           ; 2-byte Folded Spill
	jl	.LBB9_48
; BB#47:                                ; %for.end
	mov.w	-150(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -152(r4)           ; 2-byte Folded Spill
.LBB9_48:                               ; %for.end
	mov.w	-152(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_classify_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	mov.w	#_task_task_stats, r15
	call	#transition_to
	add.w	#160, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_classify, .Lfunc_end9-task_classify

	.globl	task_stats
	.align	2
	.type	task_stats,@function
task_stats:                             ; @task_stats
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#54, r1
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	#0, -14(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_stats_task_stats, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_resetStats_task_stats, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -10(r4)
	add.w	#1, r12
	mov.w	r12, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#10, r15
	mov.w	r15, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_stats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.11, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_classify_task_stats, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -16(r4)
	cmp.w	#0, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %entry
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jne	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %sw.bb
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_stats_task_stats, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_resetStats_task_stats, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	add.w	#1, r12
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#12, r15
	mov.w	r15, 2(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_stats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_out
	jmp	.LBB10_4
.LBB10_3:                               ; %sw.bb.4
	mov.w	r1, r12
	mov.w	#20, 12(r12)
	mov.w	#_ch_task_stats_task_stats, 10(r12)
	mov.w	#8, 8(r12)
	mov.w	#_ch_task_resetStats_task_stats, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	add.w	#1, r12
	mov.w	r12, -14(r4)
	mov.w	r1, r12
	mov.w	r4, r15
	sub.w	#14, r15
	mov.w	r15, 2(r12)
	mov.w	#20, 10(r12)
	mov.w	#_ch_task_stats_task_stats, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_out
	jmp	.LBB10_4
.LBB10_4:                               ; %sw.epilog
	mov.w	-10(r4), r12
	cmp.w	#128, r12
	jne	.LBB10_12
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then
	mov.w	-16(r4), r12
	cmp.w	#0, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jeq	.LBB10_8
	jmp	.LBB10_6
.LBB10_6:                               ; %if.then
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jne	.LBB10_9
	jmp	.LBB10_7
.LBB10_7:                               ; %sw.bb.7
	mov.w	r1, r12
	mov.w	#20, 12(r12)
	mov.w	#_ch_task_stats_task_stats, 10(r12)
	mov.w	#8, 8(r12)
	mov.w	#_ch_task_resetStats_task_stats, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -14(r4)
	jmp	.LBB10_9
.LBB10_8:                               ; %sw.bb.9
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_stats_task_stats, 10(r12)
	mov.w	#4, 8(r12)
	mov.w	#_ch_task_resetStats_task_stats, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	jmp	.LBB10_9
.LBB10_9:                               ; %sw.epilog.11
	;DEBUG_VALUE: resultStationaryPct <- [FP+-10]
	mov.w	-14(r4), r15
	mov.w	#100, r12
	mov.w	r12, r14
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-10(r4), r14
	call	#__udivhi3
	mov.w	r15, -18(r4)
	;DEBUG_VALUE: resultMovingPct <- [FP+-12]
	mov.w	-12(r4), r15
	mov.w	-28(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	-10(r4), r14
	call	#__udivhi3
	mov.w	r15, -20(r4)
	;DEBUG_VALUE: sum <- [FP+-14]
	mov.w	-14(r4), r12
	mov.w	-12(r4), r14
	add.w	r14, r12
	mov.w	r12, -22(r4)
	mov.w	-14(r4), r14
	mov.w	-18(r4), r15
	mov.w	-12(r4), r13
	mov.w	-20(r4), r11
	mov.w	-10(r4), r10
	mov.w	#88, r9
	mov.w	#86, r8
	cmp.w	r10, r12
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	mov.w	r14, -32(r4)            ; 2-byte Folded Spill
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	mov.w	r13, -36(r4)            ; 2-byte Folded Spill
	mov.w	r11, -38(r4)            ; 2-byte Folded Spill
	mov.w	r10, -40(r4)            ; 2-byte Folded Spill
	mov.w	r9, -42(r4)             ; 2-byte Folded Spill
	mov.w	r8, -44(r4)             ; 2-byte Folded Spill
	jeq	.LBB10_11
; BB#10:                                ; %sw.epilog.11
	mov.w	-42(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
.LBB10_11:                              ; %sw.epilog.11
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	r1, r13
	mov.w	r12, 14(r13)
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 12(r13)
	mov.w	-40(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 10(r13)
	mov.w	-38(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 8(r13)
	mov.w	-36(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 6(r13)
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 4(r13)
	mov.w	-32(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 2(r13)
	mov.w	#.L.str.17, 0(r13)
	call	#printf
	mov.w	#_task_task_idle, r12
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	call	#transition_to
	jmp	.LBB10_13
.LBB10_12:                              ; %if.else
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB10_13
.LBB10_13:                              ; %if.end
	add.w	#54, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_stats, .Lfunc_end10-task_stats

	.globl	task_warmup
	.align	2
	.type	task_warmup,@function
task_warmup:                            ; @task_warmup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#28, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_warmup_task_warmup, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_selectMode_task_warmup, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -2(r4)
	cmp.w	#3, r12
	jhs	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	;DEBUG_VALUE: seed <- [FP+-8]
	mov.w	r1, r12
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_sample_task_warmup, 14(r12)
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_warmup_task_warmup, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_warmup, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	r4, r15
	sub.w	#6, r15
	mov.w	r12, r14
	call	#ACCEL_singleSample_
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_warmup_task_sample, 12(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_warmup_task_warmup, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.3, 0(r12)
	call	#chan_out
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#2, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_warmup_task_warmup, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.5, 0(r12)
	call	#chan_out
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_2:                               ; %if.else
	;DEBUG_VALUE: zero <- [FP+-10]
	mov.w	#0, -10(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#10, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_warmup_task_train, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_out
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_3:                               ; %if.end
	add.w	#28, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_warmup, .Lfunc_end11-task_warmup

	.globl	task_train
	.align	2
	.type	task_train,@function
task_train:                             ; @task_train
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#24, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_featurize_task_train, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_in
	mov.w	2(r15), r12
	mov.w	r12, -2(r4)
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_train_task_train, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_warmup_task_train, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_selectMode_task_train, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -8(r4)
	cmp.w	#0, r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %entry
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jeq	.LBB12_3
	jmp	.LBB12_4
.LBB12_2:                               ; %sw.bb
	mov.w	-6(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r1, r14
	mov.w	r15, 10(r14)
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r14)
	mov.w	#_ch_task_train_task_classify, 8(r14)
	mov.w	#1, 6(r14)
	mov.w	#6, 4(r14)
	mov.w	#.L.str.19, 0(r14)
	call	#chan_out
	jmp	.LBB12_4
.LBB12_3:                               ; %sw.bb.3
	mov.w	-6(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	add.w	#96, r15
	mov.w	r1, r14
	mov.w	r15, 10(r14)
	mov.w	r4, r15
	sub.w	#4, r15
	mov.w	r15, 2(r14)
	mov.w	#_ch_task_train_task_classify, 8(r14)
	mov.w	#1, 6(r14)
	mov.w	#6, 4(r14)
	mov.w	#.L.str.20, 0(r14)
	call	#chan_out
	jmp	.LBB12_4
.LBB12_4:                               ; %sw.epilog
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_train_task_train, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_out
	mov.w	-6(r4), r12
	cmp.w	#16, r12
	jhs	.LBB12_6
	jmp	.LBB12_5
.LBB12_5:                               ; %if.then
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB12_7
.LBB12_6:                               ; %if.else
	mov.w	#_task_task_idle, r15
	call	#transition_to
	jmp	.LBB12_7
.LBB12_7:                               ; %if.end
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	task_train, .Lfunc_end12-task_train

	.globl	task_idle
	.align	2
	.type	task_idle,@function
task_idle:                              ; @task_idle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#_task_task_selectMode, r15
	call	#transition_to
	pop.w	r4
	ret
.Lfunc_end13:
	.size	task_idle, .Lfunc_end13-task_idle

	.globl	_init
	.align	2
	.type	_init,@function
_init:                                  ; @_init
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	call	#initializeHardware
	pop.w	r4
	ret
.Lfunc_end14:
	.size	_init, .Lfunc_end14-_init

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
.Lfunc_end15:
	.size	_entry_task, .Lfunc_end15-_entry_task

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
.Lfunc_end17:
	.size	msp_watchdog_enable, .Lfunc_end17-msp_watchdog_enable

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
.Lfunc_end18:
	.size	msp_watchdog_disable, .Lfunc_end18-msp_watchdog_disable

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
.Lfunc_end19:
	.size	msp_watchdog_kick, .Lfunc_end19-msp_watchdog_kick

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
	jeq	.LBB20_4
	jmp	.LBB20_1
.LBB20_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB20_2
.LBB20_2:                               ; %while.body
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
	jne	.LBB20_2
	jmp	.LBB20_3
.LBB20_3:                               ; %while.end.loopexit
	jmp	.LBB20_4
.LBB20_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end20:
	.size	memcpy, .Lfunc_end20-memcpy

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
.Lfunc_end21:
	.size	my_memset, .Lfunc_end21-my_memset

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
.Lfunc_end23:
	.size	mult16, .Lfunc_end23-mult16

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
	jmp	.LBB24_1
.LBB24_1:                               ; %while.cond
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
	jeq	.LBB24_3
	jmp	.LBB24_2
.LBB24_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB24_3
.LBB24_3:                               ; %land.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB24_10
	jmp	.LBB24_4
.LBB24_4:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
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
	jeq	.LBB24_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB24_6:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB24_8
	jmp	.LBB24_7
.LBB24_7:                               ; %if.then
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB24_9
.LBB24_8:                               ; %if.else
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB24_9
.LBB24_9:                               ; %if.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	jmp	.LBB24_1
.LBB24_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end24:
	.size	sqrt16, .Lfunc_end24-sqrt16

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
	jmp	.LBB25_1
.LBB25_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB25_4
	jmp	.LBB25_2
.LBB25_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB25_4
	jmp	.LBB25_3
.LBB25_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB25_4
.LBB25_4:                               ; %land.end
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB25_6
	jmp	.LBB25_5
.LBB25_5:                               ; %while.body
                                        ;   in Loop: Header=BB25_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB25_1
.LBB25_6:                               ; %while.end
	jmp	.LBB25_7
.LBB25_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB25_11
	jmp	.LBB25_8
.LBB25_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB25_10
	jmp	.LBB25_9
.LBB25_9:                               ; %if.then
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB25_10
.LBB25_10:                              ; %if.end
                                        ;   in Loop: Header=BB25_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB25_7
.LBB25_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB25_13
	jmp	.LBB25_12
.LBB25_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB25_14
.LBB25_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB25_14
.LBB25_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end25:
	.size	udivmodhi4, .Lfunc_end25-udivmodhi4

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
	jge	.LBB26_2
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
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
	mov.w	-6(r4), r12
	cmp.w	#0, r12
	mov.w	r2, r12
	rra.w	r12
	and.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB26_4
.LBB26_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB26_6
	jmp	.LBB26_5
.LBB26_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB26_6
.LBB26_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__divhi3, .Lfunc_end26-__divhi3

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
	jge	.LBB27_2
	jmp	.LBB27_1
.LBB27_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
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
	jmp	.LBB27_4
.LBB27_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB27_6
	jmp	.LBB27_5
.LBB27_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB27_6
.LBB27_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end27:
	.size	__modhi3, .Lfunc_end27-__modhi3

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
.Lfunc_end28:
	.size	__udivhi3, .Lfunc_end28-__udivhi3

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
.Lfunc_end29:
	.size	__umodhi3, .Lfunc_end29-__umodhi3

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
	jeq	.LBB30_7
	jmp	.LBB30_1
.LBB30_1:                               ; %if.then
	;DEBUG_VALUE: i <- [FP+-4]
	;DEBUG_VALUE: dirty_self_fields <- [FP+-6]
	mov.w	-2(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB30_2
.LBB30_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	72(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#1, r12
	jl	.LBB30_6
	jmp	.LBB30_3
.LBB30_3:                               ; %while.body
                                        ;   in Loop: Header=BB30_2 Depth=1
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
	jeq	.LBB30_5
	jmp	.LBB30_4
.LBB30_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB30_2 Depth=1
	mov.w	-8(r4), r12
	;APP
	SWPB 0(r12)

	;NO_APP
	jmp	.LBB30_5
.LBB30_5:                               ; %if.end
                                        ;   in Loop: Header=BB30_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 72(r13)
	jmp	.LBB30_2
.LBB30_6:                               ; %while.end
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 74(r13)
	jmp	.LBB30_7
.LBB30_7:                               ; %if.end.8
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end30:
	.size	task_prologue, .Lfunc_end30-task_prologue

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
.Lfunc_end31:
	.size	transition_to, .Lfunc_end31-transition_to

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
	jmp	.LBB32_1
.LBB32_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB32_12
	jmp	.LBB32_2
.LBB32_2:                               ; %for.body
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jne	.LBB32_7
	jmp	.LBB32_3
.LBB32_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB32_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-28]
	mov.w	-26(r4), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.b	0(r12), r13
	bit.b	#2, r13
	jeq	.LBB32_5
	jmp	.LBB32_4
.LBB32_4:                               ; %cond.true
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB32_6
.LBB32_5:                               ; %cond.false
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB32_6
.LBB32_6:                               ; %cond.end
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	jmp	.LBB32_8
.LBB32_7:                               ; %sw.default
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB32_8
.LBB32_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB32_10
	jmp	.LBB32_9
.LBB32_9:                               ; %if.then
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB32_10
.LBB32_10:                              ; %if.end
                                        ;   in Loop: Header=BB32_1 Depth=1
	jmp	.LBB32_11
.LBB32_11:                              ; %for.inc
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB32_1
.LBB32_12:                              ; %for.end
	;DEBUG_VALUE: chan_in:value <- [FP+-32]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	r12, r15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end32:
	.size	chan_in, .Lfunc_end32-chan_in

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
	jmp	.LBB33_1
.LBB33_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r13, r12
	jge	.LBB33_10
	jmp	.LBB33_2
.LBB33_2:                               ; %for.body
                                        ;   in Loop: Header=BB33_1 Depth=1
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
	jne	.LBB33_7
	jmp	.LBB33_3
.LBB33_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB33_1 Depth=1
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
	jeq	.LBB33_5
	jmp	.LBB33_4
.LBB33_4:                               ; %cond.true
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-6(r4), r12
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
	jmp	.LBB33_8
.LBB33_7:                               ; %sw.default
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB33_8
.LBB33_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB33_1 Depth=1
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
	jmp	.LBB33_9
.LBB33_9:                               ; %for.inc
                                        ;   in Loop: Header=BB33_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB33_1
.LBB33_10:                              ; %for.end
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end33:
	.size	chan_out, .Lfunc_end33-chan_out

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
.Lfunc_end34:
	.size	main, .Lfunc_end34-main

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

	.type	_task_task_selectMode,@object ; @_task_task_selectMode
	.globl	_task_task_selectMode
	.align	1
_task_task_selectMode:
	.short	task_selectMode
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_selectMode\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_selectMode, 108

	.type	_task_task_resetStats,@object ; @_task_task_resetStats
	.globl	_task_task_resetStats
	.align	1
_task_task_resetStats:
	.short	task_resetStats
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_resetStats\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_resetStats, 108

	.type	_task_task_sample,@object ; @_task_task_sample
	.globl	_task_task_sample
	.align	1
_task_task_sample:
	.short	task_sample
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_sample\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_sample, 108

	.type	_task_task_transform,@object ; @_task_task_transform
	.globl	_task_task_transform
	.align	1
_task_task_transform:
	.short	task_transform
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_transform\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_transform, 108

	.type	_task_task_featurize,@object ; @_task_task_featurize
	.globl	_task_task_featurize
	.align	1
_task_task_featurize:
	.short	task_featurize
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_featurize\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_featurize, 108

	.type	_task_task_classify,@object ; @_task_task_classify
	.globl	_task_task_classify
	.align	1
_task_task_classify:
	.short	task_classify
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_classify\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_classify, 108

	.type	_task_task_stats,@object ; @_task_task_stats
	.globl	_task_task_stats
	.align	1
_task_task_stats:
	.short	task_stats
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_stats\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_stats, 108

	.type	_task_task_warmup,@object ; @_task_task_warmup
	.globl	_task_task_warmup
	.align	1
_task_task_warmup:
	.short	task_warmup
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_warmup\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_warmup, 108

	.type	_task_task_train,@object ; @_task_task_train
	.globl	_task_task_train
	.align	1
_task_task_train:
	.short	task_train
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_train\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_train, 108

	.type	_task_task_idle,@object ; @_task_task_idle
	.globl	_task_task_idle
	.align	1
_task_task_idle:
	.short	task_idle
	.long	2048                    ; 0x800
	.short	11                      ; 0xb
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_idle\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_idle, 108

	.type	_ch_task_init_task_selectMode,@object ; @_ch_task_init_task_selectMode
	.globl	_ch_task_init_task_selectMode
	.align	1
_ch_task_init_task_selectMode:
	.zero	14
	.size	_ch_task_init_task_selectMode, 14

	.type	_ch_task_selectMode_task_warmup,@object ; @_ch_task_selectMode_task_warmup
	.globl	_ch_task_selectMode_task_warmup
	.align	1
_ch_task_selectMode_task_warmup:
	.zero	6
	.size	_ch_task_selectMode_task_warmup, 6

	.type	_ch_task_selectMode_task_featurize,@object ; @_ch_task_selectMode_task_featurize
	.globl	_ch_task_selectMode_task_featurize
	.align	1
_ch_task_selectMode_task_featurize:
	.zero	6
	.size	_ch_task_selectMode_task_featurize, 6

	.type	_ch_task_selectMode_task_train,@object ; @_ch_task_selectMode_task_train
	.globl	_ch_task_selectMode_task_train
	.align	1
_ch_task_selectMode_task_train:
	.zero	6
	.size	_ch_task_selectMode_task_train, 6

	.type	_ch_task_selectMode_task_sample,@object ; @_ch_task_selectMode_task_sample
	.globl	_ch_task_selectMode_task_sample
	.align	1
_ch_task_selectMode_task_sample:
	.zero	6
	.size	_ch_task_selectMode_task_sample, 6

	.type	_ch_task_selectMode_task_selectMode,@object ; @_ch_task_selectMode_task_selectMode
	.globl	_ch_task_selectMode_task_selectMode
	.align	1
_ch_task_selectMode_task_selectMode:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_selectMode_task_selectMode, 12

	.type	_ch_task_resetStats_task_stats,@object ; @_ch_task_resetStats_task_stats
	.globl	_ch_task_resetStats_task_stats
	.align	1
_ch_task_resetStats_task_stats:
	.zero	14
	.size	_ch_task_resetStats_task_stats, 14

	.type	_ch_task_resetStats_task_sample,@object ; @_ch_task_resetStats_task_sample
	.globl	_ch_task_resetStats_task_sample
	.align	1
_ch_task_resetStats_task_sample:
	.zero	6
	.size	_ch_task_resetStats_task_sample, 6

	.type	_ch_mc_task_sample_ch_sample_window,@object ; @_ch_mc_task_sample_ch_sample_window
	.globl	_ch_mc_task_sample_ch_sample_window
	.align	1
_ch_mc_task_sample_ch_sample_window:
	.short	2                       ; 0x2
	.zero	18
	.size	_ch_mc_task_sample_ch_sample_window, 20

	.type	_ch_task_sample_task_sample,@object ; @_ch_task_sample_task_sample
	.globl	_ch_task_sample_task_sample
	.align	1
_ch_task_sample_task_sample:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_sample_task_sample, 22

	.type	_ch_task_transform_task_featurize,@object ; @_ch_task_transform_task_featurize
	.globl	_ch_task_transform_task_featurize
	.align	1
_ch_task_transform_task_featurize:
	.zero	20
	.size	_ch_task_transform_task_featurize, 20

	.type	_ch_task_featurize_task_train,@object ; @_ch_task_featurize_task_train
	.globl	_ch_task_featurize_task_train
	.align	1
_ch_task_featurize_task_train:
	.zero	8
	.size	_ch_task_featurize_task_train, 8

	.type	_ch_task_featurize_task_classify,@object ; @_ch_task_featurize_task_classify
	.globl	_ch_task_featurize_task_classify
	.align	1
_ch_task_featurize_task_classify:
	.zero	8
	.size	_ch_task_featurize_task_classify, 8

	.type	_ch_task_classify_task_stats,@object ; @_ch_task_classify_task_stats
	.globl	_ch_task_classify_task_stats
	.align	1
_ch_task_classify_task_stats:
	.zero	6
	.size	_ch_task_classify_task_stats, 6

	.type	_ch_task_stats_task_stats,@object ; @_ch_task_stats_task_stats
	.globl	_ch_task_stats_task_stats
	.align	1
_ch_task_stats_task_stats:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_stats_task_stats, 32

	.type	_ch_task_warmup_task_warmup,@object ; @_ch_task_warmup_task_warmup
	.globl	_ch_task_warmup_task_warmup
	.align	1
_ch_task_warmup_task_warmup:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_warmup_task_warmup, 22

	.type	_ch_task_warmup_task_train,@object ; @_ch_task_warmup_task_train
	.globl	_ch_task_warmup_task_train
	.align	1
_ch_task_warmup_task_train:
	.zero	6
	.size	_ch_task_warmup_task_train, 6

	.type	_ch_task_train_task_train,@object ; @_ch_task_train_task_train
	.globl	_ch_task_train_task_train
	.align	1
_ch_task_train_task_train:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_train_task_train, 12

	.type	_ch_task_train_task_classify,@object ; @_ch_task_train_task_classify
	.globl	_ch_task_train_task_classify
	.align	1
_ch_task_train_task_classify:
	.zero	194
	.size	_ch_task_train_task_classify, 194

	.type	_ch_task_init_task_warmup,@object ; @_ch_task_init_task_warmup
	.globl	_ch_task_init_task_warmup
	.align	1
_ch_task_init_task_warmup:
	.zero	6
	.size	_ch_task_init_task_warmup, 6

	.type	_ch_task_init_task_init,@object ; @_ch_task_init_task_init
	.globl	_ch_task_init_task_init
	.align	1
_ch_task_init_task_init:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_init_task_init, 12

	.type	_ch_task_warmup_task_sample,@object ; @_ch_task_warmup_task_sample
	.globl	_ch_task_warmup_task_sample
	.align	1
_ch_task_warmup_task_sample:
	.zero	6
	.size	_ch_task_warmup_task_sample, 6

	.type	_ch_task_sample_task_warmup,@object ; @_ch_task_sample_task_warmup
	.globl	_ch_task_sample_task_warmup
	.align	1
_ch_task_sample_task_warmup:
	.zero	6
	.size	_ch_task_sample_task_warmup, 6

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

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"pin_state"
	.size	.L.str.1, 10

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"count"
	.size	.L.str.2, 6

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"seed"
	.size	.L.str.3, 5

	.type	.L.str.4,@object        ; @.str.4
.L.str.4:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.4, 26

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"discardedSamplesCount"
	.size	.L.str.5, 22

	.type	.L.str.6,@object        ; @.str.6
.L.str.6:
	.asciz	"mode"
	.size	.L.str.6, 5

	.type	.L.str.7,@object        ; @.str.7
.L.str.7:
	.asciz	"class"
	.size	.L.str.7, 6

	.type	.L.str.8,@object        ; @.str.8
.L.str.8:
	.asciz	"samplesInWindow"
	.size	.L.str.8, 16

	.type	.L.str.9,@object        ; @.str.9
.L.str.9:
	.asciz	"movingCount"
	.size	.L.str.9, 12

	.type	.L.str.10,@object       ; @.str.10
.L.str.10:
	.asciz	"stationaryCount"
	.size	.L.str.10, 16

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"totalCount"
	.size	.L.str.11, 11

	.type	.L.str.12,@object       ; @.str.12
.L.str.12:
	.asciz	"window[samplesInWindow]"
	.size	.L.str.12, 24

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"window[i]"
	.size	.L.str.13, 10

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"features"
	.size	.L.str.14, 9

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"model_stationary[i]"
	.size	.L.str.15, 20

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"model_moving[i]"
	.size	.L.str.16, 16

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"stats: s %u (%u%%) m %u (%u%%) sum/tot %u/%u: %c\r\n"
	.size	.L.str.17, 51

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"trainingSetSize"
	.size	.L.str.18, 16

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	"model_stationary[trainingSetSize]"
	.size	.L.str.19, 34

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"model_moving[trainingSetSize]"
	.size	.L.str.20, 30

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
