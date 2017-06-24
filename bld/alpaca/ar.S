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
	sub.w	#8, r1
	;DEBUG_VALUE: ACCEL_singleSample_:result <- undef
	mov.w	r15, r12
	mov.w	r15, -4(r4)
	mov.w	&_global_seed_bak, r13
	mov.w	#17, r14
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	#85, r12
	mov.w	r12, r14
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	mov.b	r11, 0(r12)
	mov.w	&_global_seed_bak, r15
	mov.w	#289, r14
	call	#__mulhi3hw_noint
	mov.w	-10(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-4(r4), r12
	mov.b	r11, 1(r12)
	mov.w	&_global_seed_bak, r15
	mov.w	#4913, r14
	call	#__mulhi3hw_noint
	mov.w	-10(r4), r14            ; 2-byte Folded Reload
	call	#__umodhi3
	mov.b	r15, r11
	mov.w	-4(r4), r12
	mov.b	r11, 2(r12)
	mov.w	&_global_seed_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_seed_bak
	add.w	#8, r1
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
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
	call	#init_hw
	call	#edb_init
	;APP
	eint { nop
	;NO_APP
	jmp	.LBB2_1
.LBB2_1:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&curctx, r12
	mov.w	0(r12), r12
	mov.w	2(r12), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str, 0(r13)
	call	#printf
	mov.w	r15, -6(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB2_2
.LBB2_2:                                ; %do.end
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
	mov.w	#3, &_global_pinState
	mov.w	#0, &_global_count
	mov.w	#1, &_global_seed
	mov.w	#_task_task_selectMode, r15
	call	#transition_to
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
	sub.w	#24, r1
	mov.w	&_global_count, r12
	mov.w	r12, &_global_count_bak
	mov.w	&_global_pinState, r12
	mov.w	r12, &_global_pinState_bak
	mov.w	#1, -2(r4)
	mov.w	&_global_count_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_count_bak
	cmp.w	#3, r12
	jlo	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov.w	#2, -2(r4)
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov.w	&_global_count_bak, r12
	cmp.w	#5, r12
	jlo	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then.2
	mov.w	#0, -2(r4)
	jmp	.LBB4_4
.LBB4_4:                                ; %if.end.3
	mov.w	&_global_count_bak, r12
	cmp.w	#7, r12
	jlo	.LBB4_9
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then.5
	jmp	.LBB4_6
.LBB4_6:                                ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.1, 0(r14)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB4_7
.LBB4_7:                                ; %do.end
	jmp	.LBB4_8
.LBB4_8:                                ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB4_8
.LBB4_9:                                ; %if.end.6
	mov.w	-2(r4), r12
	cmp.w	#2, r12
	jeq	.LBB4_11
	jmp	.LBB4_10
.LBB4_10:                               ; %lor.lhs.false
	mov.w	-2(r4), r12
	cmp.w	#1, r12
	jne	.LBB4_13
	jmp	.LBB4_11
.LBB4_11:                               ; %land.lhs.true
	mov.w	-2(r4), r12
	mov.w	&_global_pinState_bak, r13
	cmp.w	r13, r12
	jne	.LBB4_13
	jmp	.LBB4_12
.LBB4_12:                               ; %if.then.10
	mov.w	#3, -2(r4)
	jmp	.LBB4_14
.LBB4_13:                               ; %if.else
	mov.w	-2(r4), r12
	mov.w	r12, &_global_pinState_bak
	jmp	.LBB4_14
.LBB4_14:                               ; %if.end.11
	mov.w	-2(r4), r12
	cmp.w	#0, r12
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB4_19
	jmp	.LBB4_15
.LBB4_15:                               ; %if.end.11
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jeq	.LBB4_18
	jmp	.LBB4_16
.LBB4_16:                               ; %if.end.11
	mov.w	-10(r4), r12            ; 2-byte Folded Reload
	cmp.w	#2, r12
	jne	.LBB4_20
	jmp	.LBB4_17
.LBB4_17:                               ; %sw.bb
	mov.w	#0, &_global_discardedSamplesCount
	mov.w	#2, &_global_mode
	mov.w	#0, &_global_class
	mov.w	#0, &_global_samplesInWindow
	mov.w	#_global_count, r14
	mov.w	#_global_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_pinState, r14
	mov.w	#_global_pinState_bak, r15
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB4_21
.LBB4_18:                               ; %sw.bb.12
	mov.w	#0, &_global_discardedSamplesCount
	mov.w	#1, &_global_mode
	mov.w	#1, &_global_class
	mov.w	#0, &_global_samplesInWindow
	mov.w	#_global_count, r14
	mov.w	#_global_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_pinState, r14
	mov.w	#_global_pinState_bak, r15
	mov.w	-14(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB4_21
.LBB4_19:                               ; %sw.bb.13
	mov.w	#0, &_global_mode
	mov.w	#_global_count, r14
	mov.w	#_global_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_pinState, r14
	mov.w	#_global_pinState_bak, r15
	mov.w	-16(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_resetStats, r15
	call	#transition_to
	jmp	.LBB4_21
.LBB4_20:                               ; %sw.default
	mov.w	#_global_count, r14
	mov.w	#_global_count_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_pinState, r14
	mov.w	#_global_pinState_bak, r15
	mov.w	-18(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_idle, r15
	call	#transition_to
	jmp	.LBB4_21
.LBB4_21:                               ; %sw.epilog
	add.w	#24, r1
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
	mov.w	#0, &_global_movingCount
	mov.w	#0, &_global_stationaryCount
	mov.w	#0, &_global_totalCount
	mov.w	#0, &_global_samplesInWindow
	mov.w	#_task_task_sample, r15
	call	#transition_to
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
	sub.w	#8, r1
	mov.w	&_global_samplesInWindow, r12
	mov.w	r12, &_global_samplesInWindow_bak
	mov.w	&_global_seed, r12
	mov.w	r12, &_global_seed_bak
	mov.w	r4, r15
	sub.w	#4, r15
	call	#ACCEL_singleSample_
	mov.w	&_global_samplesInWindow_bak, r12
	rla.w	r12
	rla.w	r12
	mov.b	-1(r4), r13
	mov.b	r13, _global_window+3(r12)
	mov.b	-2(r4), r13
	mov.b	r13, _global_window+2(r12)
	mov.b	-3(r4), r13
	mov.b	r13, _global_window+1(r12)
	mov.b	-4(r4), r13
	mov.b	r13, _global_window(r12)
	mov.w	&_global_samplesInWindow_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_samplesInWindow_bak
	cmp.w	#3, r12
	jhs	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	#_global_samplesInWindow, r14
	mov.w	#_global_samplesInWindow_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB6_3
.LBB6_2:                                ; %if.else
	mov.w	#0, &_global_samplesInWindow_bak
	mov.w	#_global_samplesInWindow_bak, r15
	mov.w	#_global_samplesInWindow, r14
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_transform, r15
	call	#transition_to
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	add.w	#8, r1
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
	push.w	r11
	push.w	r10
	sub.w	#56, r1
	mov.w	#0, -6(r4)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#3, r12
	jlo	4
	br	#.LBB7_41
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:                                ; %for.body.split1
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-14(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_4
.LBB7_4:                                ; %for.body.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-14(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak(r12), r12
	cmp.w	#10, r12
	jl	.LBB7_11
	jmp	.LBB7_5
.LBB7_5:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -16(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_7
	jmp	.LBB7_6
.LBB7_6:                                ; %lor.lhs.false.split2
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_7
.LBB7_7:                                ; %lor.lhs.false.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+1(r12), r12
	cmp.w	#10, r12
	jl	.LBB7_11
	jmp	.LBB7_8
.LBB7_8:                                ; %lor.lhs.false.7
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_10
	jmp	.LBB7_9
.LBB7_9:                                ; %lor.lhs.false.7.split3
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-18(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_10
.LBB7_10:                               ; %lor.lhs.false.7.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-18(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+2(r12), r12
	cmp.w	#10, r12
	jl	4
	br	#.LBB7_39
	jmp	.LBB7_11
.LBB7_11:                               ; %if.then
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_13
	jmp	.LBB7_12
.LBB7_12:                               ; %if.then.split4
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_13
.LBB7_13:                               ; %if.then.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_17
	jmp	.LBB7_14
.LBB7_14:                               ; %cond.true
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_16
	jmp	.LBB7_15
.LBB7_15:                               ; %cond.true.split5
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_16
.LBB7_16:                               ; %cond.true.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak(r12), r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_18
.LBB7_17:                               ; %cond.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_18
.LBB7_18:                               ; %cond.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	rla.w	r12
	mov.w	r12, r14
	rla.w	r14
	mov.w	r14, r15
	add.w	#_global_window, r15
	mov.w	r14, r11
	add.w	#_global_window_bak, r11
	mov.w	&_numBoots, r10
	mov.b	r13, _global_window_bak(r14)
	mov.w	r12, r14
	add.w	#_global_window_isDirty, r14
	mov.w	_global_window_isDirty(r12), r12
	cmp.w	r10, r12
	mov.w	r11, -26(r4)            ; 2-byte Folded Spill
	mov.w	r14, -28(r4)            ; 2-byte Folded Spill
	mov.w	r10, -30(r4)            ; 2-byte Folded Spill
	mov.w	r15, -32(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_20
	jmp	.LBB7_19
.LBB7_19:                               ; %cond.end.split6
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#4, r13
	mov.w	-26(r4), r15            ; 2-byte Folded Reload
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-28(r4), r13            ; 2-byte Folded Reload
	mov.w	-30(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB7_20
.LBB7_20:                               ; %cond.end.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_22
	jmp	.LBB7_21
.LBB7_21:                               ; %cond.end.split.split7
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_22
.LBB7_22:                               ; %cond.end.split.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+1(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_26
	jmp	.LBB7_23
.LBB7_23:                               ; %cond.true.28
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_25
	jmp	.LBB7_24
.LBB7_24:                               ; %cond.true.28.split8
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_25
.LBB7_25:                               ; %cond.true.28.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+1(r12), r12
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_27
.LBB7_26:                               ; %cond.false.32
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_27
.LBB7_27:                               ; %cond.end.33
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	rla.w	r12
	mov.w	r12, r14
	rla.w	r14
	mov.w	r14, r15
	add.w	#_global_window, r15
	mov.w	r14, r11
	add.w	#_global_window_bak, r11
	mov.w	&_numBoots, r10
	mov.b	r13, _global_window_bak+1(r14)
	mov.w	r12, r14
	add.w	#_global_window_isDirty, r14
	mov.w	_global_window_isDirty(r12), r12
	cmp.w	r10, r12
	mov.w	r11, -40(r4)            ; 2-byte Folded Spill
	mov.w	r14, -42(r4)            ; 2-byte Folded Spill
	mov.w	r10, -44(r4)            ; 2-byte Folded Spill
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_29
	jmp	.LBB7_28
.LBB7_28:                               ; %cond.end.33.split9
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#4, r13
	mov.w	-40(r4), r15            ; 2-byte Folded Reload
	mov.w	-46(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-42(r4), r13            ; 2-byte Folded Reload
	mov.w	-44(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB7_29
.LBB7_29:                               ; %cond.end.33.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_31
	jmp	.LBB7_30
.LBB7_30:                               ; %cond.end.33.split.split10
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_31
.LBB7_31:                               ; %cond.end.33.split.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+2(r12), r12
	cmp.w	#11, r12
	jl	.LBB7_35
	jmp	.LBB7_32
.LBB7_32:                               ; %cond.true.43
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	r12, r13
	rla.w	r13
	mov.w	_global_window_isDirty(r13), r13
	mov.w	&_numBoots, r14
	cmp.w	r14, r13
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_34
	jmp	.LBB7_33
.LBB7_33:                               ; %cond.true.43.split11
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r13
	mov.b	_global_window+1(r12), r14
	mov.b	_global_window+2(r12), r15
	mov.b	_global_window+3(r12), r11
	mov.b	r11, _global_window_bak+3(r12)
	mov.b	r15, _global_window_bak+2(r12)
	mov.b	r14, _global_window_bak+1(r12)
	mov.b	r13, _global_window_bak(r12)
	jmp	.LBB7_34
.LBB7_34:                               ; %cond.true.43.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	rla.w	r12
	rla.w	r12
	mov.b	_global_window_bak+2(r12), r12
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_36
.LBB7_35:                               ; %cond.false.47
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	jmp	.LBB7_36
.LBB7_36:                               ; %cond.end.48
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-52(r4), r12            ; 2-byte Folded Reload
	mov.b	r12, r13
	mov.w	-6(r4), r12
	rla.w	r12
	mov.w	r12, r14
	rla.w	r14
	mov.w	r14, r15
	add.w	#_global_window, r15
	mov.w	r14, r11
	add.w	#_global_window_bak, r11
	mov.w	&_numBoots, r10
	mov.b	r13, _global_window_bak+2(r14)
	mov.w	r12, r14
	add.w	#_global_window_isDirty, r14
	mov.w	_global_window_isDirty(r12), r12
	cmp.w	r10, r12
	mov.w	r11, -54(r4)            ; 2-byte Folded Spill
	mov.w	r14, -56(r4)            ; 2-byte Folded Spill
	mov.w	r10, -58(r4)            ; 2-byte Folded Spill
	mov.w	r15, -60(r4)            ; 2-byte Folded Spill
	jeq	.LBB7_38
	jmp	.LBB7_37
.LBB7_37:                               ; %cond.end.48.split12
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	#4, r13
	mov.w	-54(r4), r15            ; 2-byte Folded Reload
	mov.w	-60(r4), r14            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	-56(r4), r13            ; 2-byte Folded Reload
	mov.w	-58(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 0(r13)
	jmp	.LBB7_38
.LBB7_38:                               ; %cond.end.48.split
                                        ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_39
.LBB7_39:                               ; %if.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_40
.LBB7_40:                               ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	br	#.LBB7_1
.LBB7_41:                               ; %for.end
	mov.w	#_task_task_featurize, r15
	call	#transition_to
	add.w	#56, r1
	pop.w	r10
	pop.w	r11
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
	sub.w	#36, r1
	mov.b	#0, -2(r4)
	mov.b	#0, -3(r4)
	mov.b	#0, -4(r4)
	mov.b	#0, -6(r4)
	mov.b	#0, -7(r4)
	mov.b	#0, -8(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#3, r12
	jge	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r12
	mov.b	-4(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -4(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+1(r12), r12
	mov.b	-3(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -3(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+2(r12), r12
	mov.b	-2(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -2(r4)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov.b	-4(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -4(r4)
	mov.b	-3(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -3(r4)
	mov.b	-2(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -2(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB8_5
.LBB8_5:                                ; %for.cond.33
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#3, r12
	jge	.LBB8_17
	jmp	.LBB8_6
.LBB8_6:                                ; %for.body.36
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r12
	mov.b	-4(r4), r13
	cmp.w	r12, r13
	jge	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %cond.true
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window(r12), r12
	mov.b	-4(r4), r13
	sub.w	r13, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_9
.LBB8_8:                                ; %cond.false
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-4(r4), r12
	mov.w	-14(r4), r13
	rla.w	r13
	rla.w	r13
	mov.b	_global_window(r13), r13
	sub.w	r13, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_9
.LBB8_9:                                ; %cond.end
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.b	-8(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -8(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+1(r12), r12
	mov.b	-3(r4), r13
	cmp.w	r12, r13
	jge	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ; %cond.true.66
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+1(r12), r12
	mov.b	-3(r4), r13
	sub.w	r13, r12
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_12
.LBB8_11:                               ; %cond.false.73
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-3(r4), r12
	mov.w	-14(r4), r13
	rla.w	r13
	rla.w	r13
	mov.b	_global_window+1(r13), r13
	sub.w	r13, r12
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_12
.LBB8_12:                               ; %cond.end.80
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.b	-7(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -7(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+2(r12), r12
	mov.b	-2(r4), r13
	cmp.w	r12, r13
	jge	.LBB8_14
	jmp	.LBB8_13
.LBB8_13:                               ; %cond.true.93
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.b	_global_window+2(r12), r12
	mov.b	-2(r4), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_15
.LBB8_14:                               ; %cond.false.100
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	-2(r4), r12
	mov.w	-14(r4), r13
	rla.w	r13
	rla.w	r13
	mov.b	_global_window+2(r13), r13
	sub.w	r13, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB8_15
.LBB8_15:                               ; %cond.end.107
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.b	-6(r4), r13
	add.w	r12, r13
	mov.b	r13, r14
	mov.b	r14, -6(r4)
	jmp	.LBB8_16
.LBB8_16:                               ; %for.inc.113
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB8_5
.LBB8_17:                               ; %for.end.115
	mov.b	-8(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -8(r4)
	mov.b	-7(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -7(r4)
	mov.b	-6(r4), r12
	clrc
	rrc.w	r12
	rra.w	r12
	mov.b	r12, r13
	mov.b	r13, -6(r4)
	;DEBUG_VALUE: task_featurize:meanmag <- [FP+-16]
	mov.b	-4(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-3(r4), r12
	mov.w	r15, -26(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-2(r4), r14
	mov.w	r14, r15
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -16(r4)
	;DEBUG_VALUE: task_featurize:stddevmag <- [FP+-18]
	mov.b	-8(r4), r12
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.b	-7(r4), r12
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r12, r15
	mov.w	r12, r14
	call	#__mulhi3hw_noint
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.b	-6(r4), r14
	mov.w	r14, r15
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, -18(r4)
	mov.w	-16(r4), r14
	mov.w	#0, r12
	mov.w	r12, r15
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	call	#sqrt16
	mov.w	r15, -12(r4)
	mov.w	-18(r4), r14
	mov.w	-34(r4), r15            ; 2-byte Folded Reload
	call	#sqrt16
	mov.w	r15, -10(r4)
	mov.w	&_global_mode, r12
	cmp.w	#0, r12
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB8_20
	jmp	.LBB8_18
.LBB8_18:                               ; %for.end.115
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	add.w	#-1, r12
	cmp.w	#2, r12
	jhs	.LBB8_21
	jmp	.LBB8_19
.LBB8_19:                               ; %sw.bb
	mov.w	-10(r4), r12
	mov.w	r12, &_global_features+2
	mov.w	-12(r4), r12
	mov.w	r12, &_global_features
	mov.w	#_task_task_train, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_20:                               ; %sw.bb.166
	mov.w	-10(r4), r12
	mov.w	r12, &_global_features+2
	mov.w	-12(r4), r12
	mov.w	r12, &_global_features
	mov.w	#_task_task_classify, r15
	call	#transition_to
	jmp	.LBB8_22
.LBB8_21:                               ; %sw.default
	jmp	.LBB8_22
.LBB8_22:                               ; %sw.epilog
	add.w	#36, r1
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
	sub.w	#140, r1
	mov.w	#0, -6(r4)
	mov.w	#0, -8(r4)
	mov.w	&_global_features, r12
	mov.w	r12, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	&_global_features+2, r12
	mov.w	r12, -20(r4)
	mov.w	#0, -18(r4)
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
	;DEBUG_VALUE: stat_mean_err <- [FP+-20]
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_stationary(r12), r12
	mov.w	-16(r4), r13
	mov.w	-14(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	mov.w	r13, -40(r4)            ; 2-byte Folded Spill
	mov.w	r14, -42(r4)            ; 2-byte Folded Spill
	mov.w	r15, -44(r4)            ; 2-byte Folded Spill
	mov.w	r11, -46(r4)            ; 2-byte Folded Spill
	jge	.LBB9_4
; BB#3:                                 ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
.LBB9_4:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	-40(r4), r13            ; 2-byte Folded Reload
	mov.w	-38(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	mov.w	r13, -50(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_6
; BB#5:                                 ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
.LBB9_6:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %cond.true
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_stationary(r12), r12
	mov.w	-16(r4), r13
	mov.w	-14(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	mov.w	r15, -54(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_9
.LBB9_8:                                ; %cond.false
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	-10(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	_global_model_stationary(r14), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	mov.w	r13, -54(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_9
.LBB9_9:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	;DEBUG_VALUE: stat_sd_err <- [FP+-24]
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	mov.w	-52(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -24(r4)
	mov.w	r12, -22(r4)
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_stationary+2(r12), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
	mov.w	r13, -58(r4)            ; 2-byte Folded Spill
	mov.w	r14, -60(r4)            ; 2-byte Folded Spill
	mov.w	r15, -62(r4)            ; 2-byte Folded Spill
	mov.w	r11, -64(r4)            ; 2-byte Folded Spill
	jge	.LBB9_11
; BB#10:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-62(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
.LBB9_11:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-64(r4), r12            ; 2-byte Folded Reload
	mov.w	-58(r4), r13            ; 2-byte Folded Reload
	mov.w	-56(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-60(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -66(r4)            ; 2-byte Folded Spill
	mov.w	r13, -68(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_13
; BB#12:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-66(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -68(r4)            ; 2-byte Folded Spill
.LBB9_13:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-68(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_15
	jmp	.LBB9_14
.LBB9_14:                               ; %cond.true.19
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_stationary+2(r12), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -70(r4)            ; 2-byte Folded Spill
	mov.w	r15, -72(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_16
.LBB9_15:                               ; %cond.false.24
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-10(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	_global_model_stationary+2(r14), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -70(r4)            ; 2-byte Folded Spill
	mov.w	r13, -72(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_16
.LBB9_16:                               ; %cond.end.29
                                        ;   in Loop: Header=BB9_1 Depth=1
	;DEBUG_VALUE: move_mean_err <- [FP+-28]
	mov.w	-72(r4), r12            ; 2-byte Folded Reload
	mov.w	-70(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -28(r4)
	mov.w	r12, -26(r4)
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_moving(r12), r12
	mov.w	-16(r4), r13
	mov.w	-14(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -74(r4)            ; 2-byte Folded Spill
	mov.w	r13, -76(r4)            ; 2-byte Folded Spill
	mov.w	r14, -78(r4)            ; 2-byte Folded Spill
	mov.w	r15, -80(r4)            ; 2-byte Folded Spill
	mov.w	r11, -82(r4)            ; 2-byte Folded Spill
	jge	.LBB9_18
; BB#17:                                ; %cond.end.29
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -82(r4)            ; 2-byte Folded Spill
.LBB9_18:                               ; %cond.end.29
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-82(r4), r12            ; 2-byte Folded Reload
	mov.w	-76(r4), r13            ; 2-byte Folded Reload
	mov.w	-74(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-78(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -84(r4)            ; 2-byte Folded Spill
	mov.w	r13, -86(r4)            ; 2-byte Folded Spill
	jeq	.LBB9_20
; BB#19:                                ; %cond.end.29
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-84(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -86(r4)            ; 2-byte Folded Spill
.LBB9_20:                               ; %cond.end.29
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-86(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_22
	jmp	.LBB9_21
.LBB9_21:                               ; %cond.true.36
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_moving(r12), r12
	mov.w	-16(r4), r13
	mov.w	-14(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -88(r4)            ; 2-byte Folded Spill
	mov.w	r15, -90(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_23
.LBB9_22:                               ; %cond.false.41
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	-10(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	_global_model_moving(r14), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -88(r4)            ; 2-byte Folded Spill
	mov.w	r13, -90(r4)            ; 2-byte Folded Spill
	jmp	.LBB9_23
.LBB9_23:                               ; %cond.end.46
                                        ;   in Loop: Header=BB9_1 Depth=1
	;DEBUG_VALUE: move_sd_err <- [FP+-32]
	mov.w	-90(r4), r12            ; 2-byte Folded Reload
	mov.w	-88(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, -32(r4)
	mov.w	r12, -30(r4)
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_moving+2(r12), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	mov.w	#1, r11
	cmp.w	#0, r14
	mov.w	r12, -92(r4)            ; 2-byte Folded Spill
	mov.w	r13, -94(r4)            ; 2-byte Folded Spill
	mov.w	r14, -96(r4)            ; 2-byte Folded Spill
	mov.w	r15, -98(r4)            ; 2-byte Folded Spill
	mov.w	r11, -100(r4)           ; 2-byte Folded Spill
	jge	.LBB9_25
; BB#24:                                ; %cond.end.46
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-98(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -100(r4)           ; 2-byte Folded Spill
.LBB9_25:                               ; %cond.end.46
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-100(r4), r12           ; 2-byte Folded Reload
	mov.w	-94(r4), r13            ; 2-byte Folded Reload
	mov.w	-92(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-96(r4), r14            ; 2-byte Folded Reload
	cmp.w	#0, r14
	mov.w	r12, -102(r4)           ; 2-byte Folded Spill
	mov.w	r13, -104(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_27
; BB#26:                                ; %cond.end.46
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-102(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -104(r4)           ; 2-byte Folded Spill
.LBB9_27:                               ; %cond.end.46
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-104(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_29
	jmp	.LBB9_28
.LBB9_28:                               ; %cond.true.53
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	_global_model_moving+2(r12), r12
	mov.w	-20(r4), r13
	mov.w	-18(r4), r14
	mov.w	#0, r15
	sub.w	r13, r12
	subc.w	r14, r15
	mov.w	r12, -106(r4)           ; 2-byte Folded Spill
	mov.w	r15, -108(r4)           ; 2-byte Folded Spill
	jmp	.LBB9_30
.LBB9_29:                               ; %cond.false.58
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	mov.w	-10(r4), r14
	rla.w	r14
	rla.w	r14
	mov.w	_global_model_moving+2(r14), r14
	sub.w	r14, r12
	subc.w	#0, r13
	mov.w	r12, -106(r4)           ; 2-byte Folded Spill
	mov.w	r13, -108(r4)           ; 2-byte Folded Spill
	jmp	.LBB9_30
.LBB9_30:                               ; %cond.end.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-108(r4), r12           ; 2-byte Folded Reload
	mov.w	-106(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, -36(r4)
	mov.w	r12, -34(r4)
	mov.w	-32(r4), r12
	mov.w	-30(r4), r13
	mov.w	-24(r4), r14
	mov.w	-22(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -110(r4)           ; 2-byte Folded Spill
	mov.w	r13, -112(r4)           ; 2-byte Folded Spill
	mov.w	r14, -114(r4)           ; 2-byte Folded Spill
	mov.w	r15, -116(r4)           ; 2-byte Folded Spill
	mov.w	r11, -118(r4)           ; 2-byte Folded Spill
	mov.w	r10, -120(r4)           ; 2-byte Folded Spill
	jge	.LBB9_32
; BB#31:                                ; %cond.end.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-118(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -120(r4)           ; 2-byte Folded Spill
.LBB9_32:                               ; %cond.end.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-120(r4), r12           ; 2-byte Folded Reload
	mov.w	-110(r4), r13           ; 2-byte Folded Reload
	mov.w	-114(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-112(r4), r14           ; 2-byte Folded Reload
	mov.w	-116(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -122(r4)           ; 2-byte Folded Spill
	mov.w	r13, -124(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_34
; BB#33:                                ; %cond.end.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-122(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -124(r4)           ; 2-byte Folded Spill
.LBB9_34:                               ; %cond.end.63
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-124(r4), r12           ; 2-byte Folded Reload
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
	mov.w	-36(r4), r12
	mov.w	-34(r4), r13
	mov.w	-28(r4), r14
	mov.w	-26(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -126(r4)           ; 2-byte Folded Spill
	mov.w	r13, -128(r4)           ; 2-byte Folded Spill
	mov.w	r14, -130(r4)           ; 2-byte Folded Spill
	mov.w	r15, -132(r4)           ; 2-byte Folded Spill
	mov.w	r11, -134(r4)           ; 2-byte Folded Spill
	mov.w	r10, -136(r4)           ; 2-byte Folded Spill
	jge	.LBB9_39
; BB#38:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-134(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -136(r4)           ; 2-byte Folded Spill
.LBB9_39:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-136(r4), r12           ; 2-byte Folded Reload
	mov.w	-126(r4), r13           ; 2-byte Folded Reload
	mov.w	-130(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-128(r4), r14           ; 2-byte Folded Reload
	mov.w	-132(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -138(r4)           ; 2-byte Folded Spill
	mov.w	r13, -140(r4)           ; 2-byte Folded Spill
	jeq	.LBB9_41
; BB#40:                                ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-138(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -140(r4)           ; 2-byte Folded Spill
.LBB9_41:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-140(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB9_43
	jmp	.LBB9_42
.LBB9_42:                               ; %if.then.70
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB9_44
.LBB9_43:                               ; %if.else.72
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB9_44
.LBB9_44:                               ; %if.end.74
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
	mov.w	r14, -142(r4)           ; 2-byte Folded Spill
	mov.w	r15, -144(r4)           ; 2-byte Folded Spill
	jl	.LBB9_48
; BB#47:                                ; %for.end
	mov.w	-142(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -144(r4)           ; 2-byte Folded Spill
.LBB9_48:                               ; %for.end
	mov.w	-144(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, &_global_class
	mov.w	#_task_task_stats, r15
	call	#transition_to
	add.w	#140, r1
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
	sub.w	#52, r1
	mov.w	&_global_movingCount, r12
	mov.w	r12, &_global_movingCount_bak
	mov.w	&_global_stationaryCount, r12
	mov.w	r12, &_global_stationaryCount_bak
	mov.w	&_global_totalCount, r12
	mov.w	r12, &_global_totalCount_bak
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
	mov.w	&_global_totalCount_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_totalCount_bak
	mov.w	&_global_class, r12
	cmp.w	#0, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jeq	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %entry
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	cmp.w	#1, r12
	jne	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %sw.bb
	mov.w	&_global_movingCount_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_movingCount_bak
	jmp	.LBB10_4
.LBB10_3:                               ; %sw.bb.2
	mov.w	&_global_stationaryCount_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_stationaryCount_bak
	jmp	.LBB10_4
.LBB10_4:                               ; %sw.epilog
	mov.w	&_global_totalCount_bak, r12
	cmp.w	#128, r12
	jne	.LBB10_10
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then
	;DEBUG_VALUE: resultStationaryPct <- [FP+-6]
	mov.w	&_global_stationaryCount_bak, r15
	mov.w	#100, r12
	mov.w	r12, r14
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	&_global_totalCount_bak, r14
	call	#__udivhi3
	mov.w	r15, -14(r4)
	;DEBUG_VALUE: resultMovingPct <- [FP+-8]
	mov.w	&_global_movingCount_bak, r15
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	&_global_totalCount_bak, r14
	call	#__udivhi3
	mov.w	r15, -16(r4)
	;DEBUG_VALUE: sum <- [FP+-10]
	mov.w	&_global_stationaryCount_bak, r12
	mov.w	&_global_movingCount_bak, r14
	add.w	r14, r12
	mov.w	r12, -18(r4)
	jmp	.LBB10_6
.LBB10_6:                               ; %do.body
	call	#request_non_interactive_debug_mode
	mov.w	&_global_stationaryCount_bak, r12
	mov.w	-14(r4), r13
	mov.w	&_global_movingCount_bak, r14
	mov.w	-16(r4), r15
	mov.w	&_global_totalCount_bak, r11
	mov.w	-18(r4), r10
	mov.w	#88, r9
	mov.w	#86, r8
	cmp.w	r11, r10
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	mov.w	r13, -26(r4)            ; 2-byte Folded Spill
	mov.w	r14, -28(r4)            ; 2-byte Folded Spill
	mov.w	r15, -30(r4)            ; 2-byte Folded Spill
	mov.w	r11, -32(r4)            ; 2-byte Folded Spill
	mov.w	r10, -34(r4)            ; 2-byte Folded Spill
	mov.w	r9, -36(r4)             ; 2-byte Folded Spill
	mov.w	r8, -38(r4)             ; 2-byte Folded Spill
	jeq	.LBB10_8
; BB#7:                                 ; %do.body
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
.LBB10_8:                               ; %do.body
	mov.w	-38(r4), r12            ; 2-byte Folded Reload
	mov.w	r1, r13
	mov.w	r12, 14(r13)
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 12(r13)
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	mov.w	r14, 10(r13)
	mov.w	-30(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 8(r13)
	mov.w	-28(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 6(r13)
	mov.w	-26(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 4(r13)
	mov.w	-24(r4), r15            ; 2-byte Folded Reload
	mov.w	r15, 2(r13)
	mov.w	#.L.str.2, 0(r13)
	call	#printf
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	call	#resume_application
	jmp	.LBB10_9
.LBB10_9:                               ; %do.end
	mov.w	#_global_movingCount, r14
	mov.w	#_global_movingCount_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_stationaryCount, r14
	mov.w	#_global_stationaryCount_bak, r15
	mov.w	-42(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_totalCount, r14
	mov.w	#_global_totalCount_bak, r15
	mov.w	-42(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_idle, r15
	call	#transition_to
	jmp	.LBB10_11
.LBB10_10:                              ; %if.else
	mov.w	#_global_movingCount, r14
	mov.w	#_global_movingCount_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_stationaryCount, r14
	mov.w	#_global_stationaryCount_bak, r15
	mov.w	-44(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_global_totalCount, r14
	mov.w	#_global_totalCount_bak, r15
	mov.w	-44(r4), r13            ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB10_11
.LBB10_11:                              ; %if.end
	add.w	#52, r1
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
	sub.w	#8, r1
	mov.w	&_global_discardedSamplesCount, r12
	mov.w	r12, &_global_discardedSamplesCount_bak
	mov.w	&_global_seed, r12
	mov.w	r12, &_global_seed_bak
	mov.w	&_global_discardedSamplesCount_bak, r12
	cmp.w	#3, r12
	jhs	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov.w	r4, r15
	sub.w	#4, r15
	call	#ACCEL_singleSample_
	mov.w	#_global_discardedSamplesCount_bak, r15
	mov.w	&_global_discardedSamplesCount_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_discardedSamplesCount_bak
	mov.w	#_global_discardedSamplesCount, r14
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_warmup, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_2:                               ; %if.else
	mov.w	#0, &_global_trainingSetSize
	mov.w	#_global_discardedSamplesCount, r14
	mov.w	#_global_discardedSamplesCount_bak, r15
	mov.w	#2, r12
	mov.w	r12, r13
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#write_to_gbuf
	mov.w	#_global_seed, r14
	mov.w	#_global_seed_bak, r15
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB11_3
.LBB11_3:                               ; %if.end
	add.w	#8, r1
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
	sub.w	#6, r1
	mov.w	&_global_trainingSetSize, r12
	mov.w	r12, &_global_trainingSetSize_bak
	mov.w	&_global_class, r12
	cmp.w	#0, r12
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	jeq	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %entry
	mov.w	-6(r4), r12             ; 2-byte Folded Reload
	cmp.w	#1, r12
	jeq	.LBB12_3
	jmp	.LBB12_4
.LBB12_2:                               ; %sw.bb
	mov.w	&_global_trainingSetSize_bak, r12
	rla.w	r12
	rla.w	r12
	mov.w	&_global_features+2, r13
	mov.w	r13, _global_model_stationary+2(r12)
	mov.w	&_global_features, r13
	mov.w	r13, _global_model_stationary(r12)
	jmp	.LBB12_4
.LBB12_3:                               ; %sw.bb.1
	mov.w	&_global_trainingSetSize_bak, r12
	rla.w	r12
	rla.w	r12
	mov.w	&_global_features+2, r13
	mov.w	r13, _global_model_moving+2(r12)
	mov.w	&_global_features, r13
	mov.w	r13, _global_model_moving(r12)
	jmp	.LBB12_4
.LBB12_4:                               ; %sw.epilog
	mov.w	&_global_trainingSetSize_bak, r12
	add.w	#1, r12
	mov.w	r12, &_global_trainingSetSize_bak
	cmp.w	#16, r12
	jhs	.LBB12_6
	jmp	.LBB12_5
.LBB12_5:                               ; %if.then
	mov.w	#_global_trainingSetSize, r14
	mov.w	#_global_trainingSetSize_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_sample, r15
	call	#transition_to
	jmp	.LBB12_7
.LBB12_6:                               ; %if.else
	mov.w	#_global_trainingSetSize, r14
	mov.w	#_global_trainingSetSize_bak, r15
	mov.w	#2, r13
	call	#write_to_gbuf
	mov.w	#_task_task_idle, r15
	call	#transition_to
	jmp	.LBB12_7
.LBB12_7:                               ; %if.end
	add.w	#6, r1
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

	.globl	clear_isDirty
	.align	2
	.type	clear_isDirty,@function
clear_isDirty:                          ; @clear_isDirty
; BB#0:                                 ; %entry
	mov.w	#_global_window_isDirty, r15
	mov.w	#0, r14
	mov.w	#6, r13
	call	#my_memset
	ret
.Lfunc_end16:
	.size	clear_isDirty, .Lfunc_end16-clear_isDirty

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
.Lfunc_end17:
	.size	init_hw, .Lfunc_end17-init_hw

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
	sub.w	#6, r1
	mov.w	&_numBoots, r12
	cmp.w	#-1, r12
	jne	.LBB31_2
	jmp	.LBB31_1
.LBB31_1:                               ; %if.then
	call	#clear_isDirty
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	jmp	.LBB31_2
.LBB31_2:                               ; %if.end
	mov.w	&_numBoots, r12
	add.w	#1, r12
	mov.w	r12, &_numBoots
	mov.w	&curctx, r12
	mov.b	2(r12), r13
	cmp.b	#0, r13
	jeq	.LBB31_7
	jmp	.LBB31_3
.LBB31_3:                               ; %if.then.2
	jmp	.LBB31_4
.LBB31_4:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&gv_index, r12
	mov.w	&num_dirty_gv, r13
	cmp.w	r13, r12
	jhs	.LBB31_6
	jmp	.LBB31_5
.LBB31_5:                               ; %while.body
                                        ;   in Loop: Header=BB31_4 Depth=1
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
	jmp	.LBB31_4
.LBB31_6:                               ; %while.end
	mov.w	#0, &num_dirty_gv
	mov.w	#0, &gv_index
	mov.w	&curctx, r12
	mov.b	#0, 2(r12)
	jmp	.LBB31_8
.LBB31_7:                               ; %if.else
	mov.w	#0, &num_dirty_gv
	jmp	.LBB31_8
.LBB31_8:                               ; %if.end.8
	add.w	#6, r1
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
	jeq	.LBB32_2
; BB#1:                                 ; %entry
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
.LBB32_2:                               ; %entry
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
.Lfunc_end32:
	.size	transition_to, .Lfunc_end32-transition_to

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
.Lfunc_end33:
	.size	write_to_gbuf, .Lfunc_end33-write_to_gbuf

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
.Lfunc_end34:
	.size	main, .Lfunc_end34-main

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

	.type	_task_task_selectMode,@object ; @_task_task_selectMode
	.globl	_task_task_selectMode
	.align	1
_task_task_selectMode:
	.short	task_selectMode
	.short	2                       ; 0x2
	.size	_task_task_selectMode, 4

	.type	_task_task_resetStats,@object ; @_task_task_resetStats
	.globl	_task_task_resetStats
	.align	1
_task_task_resetStats:
	.short	task_resetStats
	.short	3                       ; 0x3
	.size	_task_task_resetStats, 4

	.type	_task_task_sample,@object ; @_task_task_sample
	.globl	_task_task_sample
	.align	1
_task_task_sample:
	.short	task_sample
	.short	4                       ; 0x4
	.size	_task_task_sample, 4

	.type	_task_task_transform,@object ; @_task_task_transform
	.globl	_task_task_transform
	.align	1
_task_task_transform:
	.short	task_transform
	.short	5                       ; 0x5
	.size	_task_task_transform, 4

	.type	_task_task_featurize,@object ; @_task_task_featurize
	.globl	_task_task_featurize
	.align	1
_task_task_featurize:
	.short	task_featurize
	.short	6                       ; 0x6
	.size	_task_task_featurize, 4

	.type	_task_task_classify,@object ; @_task_task_classify
	.globl	_task_task_classify
	.align	1
_task_task_classify:
	.short	task_classify
	.short	7                       ; 0x7
	.size	_task_task_classify, 4

	.type	_task_task_stats,@object ; @_task_task_stats
	.globl	_task_task_stats
	.align	1
_task_task_stats:
	.short	task_stats
	.short	8                       ; 0x8
	.size	_task_task_stats, 4

	.type	_task_task_warmup,@object ; @_task_task_warmup
	.globl	_task_task_warmup
	.align	1
_task_task_warmup:
	.short	task_warmup
	.short	9                       ; 0x9
	.size	_task_task_warmup, 4

	.type	_task_task_train,@object ; @_task_task_train
	.globl	_task_task_train
	.align	1
_task_task_train:
	.short	task_train
	.short	10                      ; 0xa
	.size	_task_task_train, 4

	.type	_task_task_idle,@object ; @_task_task_idle
	.globl	_task_task_idle
	.align	1
_task_task_idle:
	.short	task_idle
	.short	11                      ; 0xb
	.size	_task_task_idle, 4

	.type	_global_seed_bak,@object ; @_global_seed_bak
	.globl	_global_seed_bak
	.align	1
_global_seed_bak:
	.short	0                       ; 0x0
	.size	_global_seed_bak, 2

	.type	_global_seed,@object    ; @_global_seed
	.globl	_global_seed
	.align	1
_global_seed:
	.short	0                       ; 0x0
	.size	_global_seed, 2

	.type	_global_pinState_bak,@object ; @_global_pinState_bak
	.globl	_global_pinState_bak
	.align	1
_global_pinState_bak:
	.short	0                       ; 0x0
	.size	_global_pinState_bak, 2

	.type	_global_pinState,@object ; @_global_pinState
	.globl	_global_pinState
	.align	1
_global_pinState:
	.short	0                       ; 0x0
	.size	_global_pinState, 2

	.type	_global_count_bak,@object ; @_global_count_bak
	.globl	_global_count_bak
	.align	1
_global_count_bak:
	.short	0                       ; 0x0
	.size	_global_count_bak, 2

	.type	_global_count,@object   ; @_global_count
	.globl	_global_count
	.align	1
_global_count:
	.short	0                       ; 0x0
	.size	_global_count, 2

	.type	_global_discardedSamplesCount_bak,@object ; @_global_discardedSamplesCount_bak
	.globl	_global_discardedSamplesCount_bak
	.align	1
_global_discardedSamplesCount_bak:
	.short	0                       ; 0x0
	.size	_global_discardedSamplesCount_bak, 2

	.type	_global_discardedSamplesCount,@object ; @_global_discardedSamplesCount
	.globl	_global_discardedSamplesCount
	.align	1
_global_discardedSamplesCount:
	.short	0                       ; 0x0
	.size	_global_discardedSamplesCount, 2

	.type	_global_mode,@object    ; @_global_mode
	.globl	_global_mode
	.align	1
_global_mode:
	.short	0                       ; 0x0
	.size	_global_mode, 2

	.type	_global_class,@object   ; @_global_class
	.globl	_global_class
	.align	1
_global_class:
	.short	0                       ; 0x0
	.size	_global_class, 2

	.type	_global_samplesInWindow_bak,@object ; @_global_samplesInWindow_bak
	.globl	_global_samplesInWindow_bak
	.align	1
_global_samplesInWindow_bak:
	.short	0                       ; 0x0
	.size	_global_samplesInWindow_bak, 2

	.type	_global_samplesInWindow,@object ; @_global_samplesInWindow
	.globl	_global_samplesInWindow
	.align	1
_global_samplesInWindow:
	.short	0                       ; 0x0
	.size	_global_samplesInWindow, 2

	.type	_global_movingCount_bak,@object ; @_global_movingCount_bak
	.globl	_global_movingCount_bak
	.align	1
_global_movingCount_bak:
	.short	0                       ; 0x0
	.size	_global_movingCount_bak, 2

	.type	_global_movingCount,@object ; @_global_movingCount
	.globl	_global_movingCount
	.align	1
_global_movingCount:
	.short	0                       ; 0x0
	.size	_global_movingCount, 2

	.type	_global_stationaryCount_bak,@object ; @_global_stationaryCount_bak
	.globl	_global_stationaryCount_bak
	.align	1
_global_stationaryCount_bak:
	.short	0                       ; 0x0
	.size	_global_stationaryCount_bak, 2

	.type	_global_stationaryCount,@object ; @_global_stationaryCount
	.globl	_global_stationaryCount
	.align	1
_global_stationaryCount:
	.short	0                       ; 0x0
	.size	_global_stationaryCount, 2

	.type	_global_totalCount_bak,@object ; @_global_totalCount_bak
	.globl	_global_totalCount_bak
	.align	1
_global_totalCount_bak:
	.short	0                       ; 0x0
	.size	_global_totalCount_bak, 2

	.type	_global_totalCount,@object ; @_global_totalCount
	.globl	_global_totalCount
	.align	1
_global_totalCount:
	.short	0                       ; 0x0
	.size	_global_totalCount, 2

	.type	_global_window_bak,@object ; @_global_window_bak
	.globl	_global_window_bak
_global_window_bak:
	.zero	12
	.size	_global_window_bak, 12

	.type	_global_window_isDirty,@object ; @_global_window_isDirty
	.globl	_global_window_isDirty
_global_window_isDirty:
	.zero	6
	.size	_global_window_isDirty, 6

	.type	_global_window,@object  ; @_global_window
	.globl	_global_window
_global_window:
	.zero	12
	.size	_global_window, 12

	.type	_global_features,@object ; @_global_features
	.globl	_global_features
	.align	1
_global_features:
	.zero	4
	.size	_global_features, 4

	.type	_global_model_stationary,@object ; @_global_model_stationary
	.globl	_global_model_stationary
	.align	1
_global_model_stationary:
	.zero	64
	.size	_global_model_stationary, 64

	.type	_global_model_moving,@object ; @_global_model_moving
	.globl	_global_model_moving
	.align	1
_global_model_moving:
	.zero	64
	.size	_global_model_moving, 64

	.type	_global_trainingSetSize_bak,@object ; @_global_trainingSetSize_bak
	.globl	_global_trainingSetSize_bak
	.align	1
_global_trainingSetSize_bak:
	.short	0                       ; 0x0
	.size	_global_trainingSetSize_bak, 2

	.type	_global_trainingSetSize,@object ; @_global_trainingSetSize
	.globl	_global_trainingSetSize
	.align	1
_global_trainingSetSize:
	.short	0                       ; 0x0
	.size	_global_trainingSetSize, 2

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
	.zero	6
	.size	data_src, 6

	.type	data_dest,@object       ; @data_dest
	.globl	data_dest
	.align	1
data_dest:
	.zero	6
	.size	data_dest, 6

	.type	data_size,@object       ; @data_size
	.globl	data_size
	.align	1
data_size:
	.zero	6
	.size	data_size, 6

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	".%u.\r\n"
	.size	.L.str, 7

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.1, 26

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"stats: s %u (%u%%) m %u (%u%%) sum/tot %u/%u: %c\r\n"
	.size	.L.str.2, 51

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
