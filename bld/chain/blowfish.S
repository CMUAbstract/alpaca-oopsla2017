	.text
	.file	"blowfish.a.bc"
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
	sub.w	#24, r1
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#6, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_init_ch_n, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str, 0(r12)
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_mc_task_init_ch_index2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_task_init_s, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.b	#0, -9(r4)
	mov.w	#0, -8(r4)
	jmp	.LBB1_1
.LBB1_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	cmp.w	#8, r12
	jhs	.LBB1_4
	jmp	.LBB1_2
.LBB1_2:                                ; %for.body
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#9, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_init_ch_iv, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.3, 0(r13)
	call	#chan_out
	jmp	.LBB1_3
.LBB1_3:                                ; %for.inc
                                        ;   in Loop: Header=BB1_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB1_1
.LBB1_4:                                ; %for.end
	mov.w	#_task_task_set_ukey, r15
	call	#transition_to
	add.w	#24, r1
	pop.w	r4
	ret
.Lfunc_end1:
	.size	task_init, .Lfunc_end1-task_init

	.globl	task_set_ukey
	.align	2
	.type	task_set_ukey,@function
task_set_ukey:                          ; @task_set_ukey
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	jmp	.LBB2_1
.LBB2_1:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#32, r12
	jhs	.LBB2_13
	jmp	.LBB2_2
.LBB2_2:                                ; %while.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#48, r12
	jl	.LBB2_5
	jmp	.LBB2_3
.LBB2_3:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#58, r12
	jge	.LBB2_5
	jmp	.LBB2_4
.LBB2_4:                                ; %if.then
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-2(r4), r13
	mov.b	cp(r13), r13
	sxt	r13
	add.w	r13, r12
	add.w	#-48, r12
	mov.w	r12, -4(r4)
	jmp	.LBB2_10
.LBB2_5:                                ; %if.else
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#65, r12
	jl	.LBB2_8
	jmp	.LBB2_6
.LBB2_6:                                ; %land.lhs.true.13
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.b	cp(r12), r12
	sxt	r12
	cmp.w	#71, r12
	jge	.LBB2_8
	jmp	.LBB2_7
.LBB2_7:                                ; %if.then.18
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-4(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	-2(r4), r13
	mov.b	cp(r13), r13
	sxt	r13
	add.w	r13, r12
	add.w	#-55, r12
	mov.w	r12, -4(r4)
	jmp	.LBB2_9
.LBB2_8:                                ; %if.else.25
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	r1, r12
	mov.w	#.L.str.4, 0(r12)
	call	#printf
	mov.w	r15, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB2_9
.LBB2_9:                                ; %if.end
                                        ;   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_10
.LBB2_10:                               ; %if.end.26
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -2(r4)
	bit.w	#1, r12
	jeq	.LBB2_12
	jmp	.LBB2_11
.LBB2_11:                               ; %if.then.27
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov.b	-4(r4), r12
	mov.w	r12, -6(r4)
	mov.w	-2(r4), r12
	rla.w	r12
	and.w	#-4, r12
	add.w	#-4, r12
	mov.w	r1, r13
	mov.w	r4, r14
	sub.w	#6, r14
	mov.w	r14, 2(r13)
	mov.w	r12, 10(r13)
	mov.w	#_ch_task_set_ukey_task_set_key, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.5, 0(r13)
	call	#chan_out
	jmp	.LBB2_12
.LBB2_12:                               ; %if.end.30
                                        ;   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_1
.LBB2_13:                               ; %while.end
	mov.w	#_task_task_init_key, r15
	call	#transition_to
	add.w	#20, r1
	pop.w	r4
	ret
.Lfunc_end2:
	.size	task_set_ukey, .Lfunc_end2-task_set_ukey

	.globl	task_init_key
	.align	2
	.type	task_init_key,@function
task_init_key:                          ; @task_init_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#16, r1
	mov.w	#0, -2(r4)
	jmp	.LBB3_1
.LBB3_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#18, r12
	jhs	.LBB3_4
	jmp	.LBB3_2
.LBB3_2:                                ; %for.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	add.w	#init_key, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -4(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_init_key_task_set_key, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	jmp	.LBB3_3
.LBB3_3:                                ; %for.inc
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_1
.LBB3_4:                                ; %for.end
	mov.w	#_task_task_init_s, r15
	call	#transition_to
	add.w	#16, r1
	pop.w	r4
	ret
.Lfunc_end3:
	.size	task_init_key, .Lfunc_end3-task_init_key

	.globl	task_init_s
	.align	2
	.type	task_init_s,@function
task_init_s:                            ; @task_init_s
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#26, r1
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_init_s_task_init_s, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_init_task_init_s, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB4_1
.LBB4_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#256, r12
	jhs	.LBB4_15
	jmp	.LBB4_2
.LBB4_2:                                ; %for.body
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jne	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	add.w	#init_s0, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -6(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-6(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_init_s_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.7, 0(r12)
	call	#chan_out
	jmp	.LBB4_13
.LBB4_4:                                ; %if.else
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	cmp.w	#1, r12
	jne	.LBB4_6
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then.3
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	add.w	#init_s1, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#1536, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_init_s_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.8, 0(r12)
	call	#chan_out
	jmp	.LBB4_12
.LBB4_6:                                ; %if.else.5
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	cmp.w	#2, r12
	jne	.LBB4_8
	jmp	.LBB4_7
.LBB4_7:                                ; %if.then.7
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	add.w	#init_s2, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#3072, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_init_s_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.9, 0(r12)
	call	#chan_out
	jmp	.LBB4_11
.LBB4_8:                                ; %if.else.9
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	cmp.w	#3, r12
	jne	.LBB4_10
	jmp	.LBB4_9
.LBB4_9:                                ; %if.then.11
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-2(r4), r12
	mov.w	r12, r13
	rla.w	r13
	rla.w	r13
	add.w	#init_s3, r13
	mov.w	#6, r14
	mov.w	r12, r15
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4608, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	-12(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_init_s_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.10, 0(r12)
	call	#chan_out
	jmp	.LBB4_10
.LBB4_10:                               ; %if.end
                                        ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_11
.LBB4_11:                               ; %if.end.13
                                        ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_12
.LBB4_12:                               ; %if.end.14
                                        ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_13
.LBB4_13:                               ; %if.end.15
                                        ;   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_14
.LBB4_14:                               ; %for.inc
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB4_1
.LBB4_15:                               ; %for.end
	mov.w	-4(r4), r12
	cmp.w	#3, r12
	jne	.LBB4_17
	jmp	.LBB4_16
.LBB4_16:                               ; %if.then.17
	mov.w	#_task_task_set_key, r15
	call	#transition_to
	jmp	.LBB4_18
.LBB4_17:                               ; %if.else.18
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_init_s_task_init_s, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.2, 0(r12)
	call	#chan_out
	mov.w	#_task_task_init_s, r15
	call	#transition_to
	jmp	.LBB4_18
.LBB4_18:                               ; %if.end.20
	add.w	#26, r1
	pop.w	r4
	ret
.Lfunc_end4:
	.size	task_init_s, .Lfunc_end4-task_init_s

	.globl	task_set_key
	.align	2
	.type	task_set_key,@function
task_set_key:                           ; @task_set_key
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#40, r1
	mov.w	#0, -18(r4)
	mov.w	#0, -2(r4)
	jmp	.LBB5_1
.LBB5_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#18, r12
	jlo	4
	br	#.LBB5_16
	jmp	.LBB5_2
.LBB5_2:                                ; %for.body
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_ukey_task_set_key, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.11, 0(r13)
	call	#chan_in
	mov.b	0(r15), r12
	mov.w	r12, -8(r4)
	mov.w	#0, -6(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB5_4
	jmp	.LBB5_3
.LBB5_3:                                ; %cond.true
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_5
.LBB5_4:                                ; %cond.false
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_5
.LBB5_5:                                ; %cond.end
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -8(r4)
	mov.w	r12, -6(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_ukey_task_set_key, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.11, 0(r13)
	call	#chan_in
	mov.b	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	#0, -10(r4)
	mov.w	-6(r4), r13
	mov.w	-8(r4), r14
	bis.w	r12, r14
	mov.w	r13, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB5_7
	jmp	.LBB5_6
.LBB5_6:                                ; %cond.true.8
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_8
.LBB5_7:                                ; %cond.false.9
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_8
.LBB5_8:                                ; %cond.end.10
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -8(r4)
	mov.w	r12, -6(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_ukey_task_set_key, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.11, 0(r13)
	call	#chan_in
	mov.b	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	#0, -10(r4)
	mov.w	-6(r4), r13
	mov.w	-8(r4), r14
	bis.w	r12, r14
	mov.w	r13, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB5_10
	jmp	.LBB5_9
.LBB5_9:                                ; %cond.true.19
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_11
.LBB5_10:                               ; %cond.false.20
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_11
.LBB5_11:                               ; %cond.end.21
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	bis.w	r14, r12
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r13, -8(r4)
	mov.w	r12, -6(r4)
	mov.w	-18(r4), r12
	mov.w	r12, r13
	add.w	#1, r13
	mov.w	r13, -18(r4)
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_ukey_task_set_key, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.11, 0(r13)
	call	#chan_in
	mov.b	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	#0, -10(r4)
	mov.w	-6(r4), r13
	mov.w	-8(r4), r14
	bis.w	r12, r14
	mov.w	r13, -6(r4)
	mov.w	r14, -8(r4)
	mov.w	-18(r4), r12
	cmp.w	#8, r12
	jlo	.LBB5_13
	jmp	.LBB5_12
.LBB5_12:                               ; %cond.true.30
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_14
.LBB5_13:                               ; %cond.false.31
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-18(r4), r12
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	jmp	.LBB5_14
.LBB5_14:                               ; %cond.end.32
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -18(r4)
	mov.w	-2(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 8(r12)
	mov.w	#_ch_task_init_key_task_set_key, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r14
	mov.w	r14, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-6(r4), r15
	mov.w	-8(r4), r13
	xor.w	r13, r12
	xor.w	r15, r14
	mov.w	r14, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-2(r4), r15
	mov.w	-28(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#_ch_task_set_key_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.6, 0(r12)
	call	#chan_out
	jmp	.LBB5_15
.LBB5_15:                               ; %for.inc
                                        ;   in Loop: Header=BB5_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	br	#.LBB5_1
.LBB5_16:                               ; %for.end
	mov.w	#_task_task_set_key2, r15
	call	#transition_to
	add.w	#40, r1
	pop.w	r4
	ret
.Lfunc_end5:
	.size	task_set_key, .Lfunc_end5-task_set_key

	.globl	task_set_key2
	.align	2
	.type	task_set_key2,@function
task_set_key2:                          ; @task_set_key2
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#68, r1
	mov.w	#0, -2(r4)
	mov.w	#0, -4(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_init_ch_index2, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -6(r4)
	mov.w	r12, -8(r4)
	bis.w	r15, r12
	cmp.w	#0, r12
	jne	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#4, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	mov.w	r13, -20(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	r1, r12
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, 2(r12)
	mov.w	#6, 10(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	add.w	#2, r12
	addc.w	#0, r13
	mov.w	r13, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: next_task <- [FP+-18]
	mov.w	#_task_task_set_key2, -18(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#18, r13
	mov.w	r13, 2(r12)
	mov.w	#12, 10(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	br	#.LBB6_32
.LBB6_2:                                ; %if.else
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#20, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_4
; BB#3:                                 ; %if.else
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
.LBB6_4:                                ; %if.else
	mov.w	-24(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_6
	jmp	.LBB6_5
.LBB6_5:                                ; %if.then.2
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#12, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.15, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r15
	mov.w	-26(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	add.w	#10, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.16, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r14
	add.w	#2, r12
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	br	#.LBB6_31
.LBB6_6:                                ; %if.else.8
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#276, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_8
; BB#7:                                 ; %if.else.8
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB6_8:                                ; %if.else.8
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_10
	jmp	.LBB6_9
.LBB6_9:                                ; %if.then.11
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#12, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.17, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r15
	mov.w	-32(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	add.w	#10, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.18, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r14
	add.w	#2, r12
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	br	#.LBB6_30
.LBB6_10:                               ; %if.else.19
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#532, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -34(r4)            ; 2-byte Folded Spill
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_12
; BB#11:                                ; %if.else.19
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
.LBB6_12:                               ; %if.else.19
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_14
	jmp	.LBB6_13
.LBB6_13:                               ; %if.then.22
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#12, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.19, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r15
	mov.w	-38(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	add.w	#10, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.20, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r14
	add.w	#2, r12
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	br	#.LBB6_29
.LBB6_14:                               ; %if.else.30
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#788, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_16
; BB#15:                                ; %if.else.30
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
.LBB6_16:                               ; %if.else.30
	mov.w	-42(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_18
	jmp	.LBB6_17
.LBB6_17:                               ; %if.then.33
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#12, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.21, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r15
	mov.w	-44(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	add.w	#10, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.22, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r14
	add.w	#2, r12
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	r1, r12
	mov.w	r4, r14
	sub.w	#8, r14
	mov.w	r14, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	jmp	.LBB6_28
.LBB6_18:                               ; %if.else.41
	mov.w	-8(r4), r12
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	mov.w	#1, r15
	bic.w	r14, r15
	cmp.w	#1044, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r13
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_20
; BB#19:                                ; %if.else.41
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
.LBB6_20:                               ; %if.else.41
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_27
	jmp	.LBB6_21
.LBB6_21:                               ; %if.then.44
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-8(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	add.w	#4, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#12, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.23, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r15
	mov.w	-50(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	add.w	#10, r15
	mov.w	r1, r12
	mov.w	r15, 10(r12)
	mov.w	r4, r14
	sub.w	#16, r14
	mov.w	r14, 2(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.24, 0(r12)
	call	#chan_out
	mov.w	-8(r4), r12
	mov.w	-6(r4), r14
	add.w	#2, r12
	addc.w	#0, r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	cmp.w	#0, r14
	mov.w	r2, r15
	rra.w	r15
	mov.w	#1, r13
	bic.w	r15, r13
	cmp.w	#1044, r12
	mov.w	r2, r12
	and.w	#1, r12
	cmp.w	#0, r14
	mov.w	r13, -52(r4)            ; 2-byte Folded Spill
	mov.w	r12, -54(r4)            ; 2-byte Folded Spill
	jeq	.LBB6_23
; BB#22:                                ; %if.then.44
	mov.w	-52(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -54(r4)            ; 2-byte Folded Spill
.LBB6_23:                               ; %if.then.44
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB6_25
	jmp	.LBB6_24
.LBB6_24:                               ; %if.then.54
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#8, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_set_key2_task_set_key2, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	jmp	.LBB6_26
.LBB6_25:                               ; %if.else.55
	mov.w	#_task_task_start_encrypt, r15
	call	#transition_to
	jmp	.LBB6_26
.LBB6_26:                               ; %if.end
	jmp	.LBB6_27
.LBB6_27:                               ; %if.end.56
	jmp	.LBB6_28
.LBB6_28:                               ; %if.end.57
	jmp	.LBB6_29
.LBB6_29:                               ; %if.end.58
	jmp	.LBB6_30
.LBB6_30:                               ; %if.end.59
	jmp	.LBB6_31
.LBB6_31:                               ; %if.end.60
	jmp	.LBB6_32
.LBB6_32:                               ; %if.end.61
	add.w	#68, r1
	pop.w	r4
	ret
.Lfunc_end6:
	.size	task_set_key2, .Lfunc_end6-task_set_key2

	.globl	task_encrypt
	.align	2
	.type	task_encrypt,@function
task_encrypt:                           ; @task_encrypt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#56, r1
	mov.w	r1, r12
	mov.w	#0, 16(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 14(r12)
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_task_encrypt_task_encrypt, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	r1, r12
	mov.w	#6, 16(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 14(r12)
	mov.w	#6, 12(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r12)
	mov.w	#14, 8(r12)
	mov.w	#_ch_task_encrypt_task_encrypt, 6(r12)
	mov.w	#3, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -10(r4)
	mov.w	r12, -12(r4)
	mov.w	#0, -38(r4)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-38(r4), r12
	cmp.w	#17, r12
	jlo	4
	br	#.LBB7_6
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-38(r4), r15
	mov.w	#6, r14
	call	#__mulhi3hw_noint
	mov.w	r15, r14
	add.w	#16, r14
	mov.w	r1, r12
	mov.w	r14, 12(r12)
	mov.w	r15, 8(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r12)
	mov.w	#_ch_task_set_key_task_encrypt, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.25, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	-38(r4), r12
	cmp.w	#0, r12
	jne	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:                                ; %if.then
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-6(r4), r12
	mov.w	-8(r4), r13
	mov.w	-14(r4), r14
	mov.w	-16(r4), r15
	xor.w	r13, r15
	xor.w	r12, r14
	mov.w	r14, -14(r4)
	mov.w	r15, -16(r4)
	mov.w	-38(r4), r12
	add.w	#1, r12
	mov.w	r12, -38(r4)
	jmp	.LBB7_4
.LBB7_4:                                ; %if.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-38(r4), r15
	mov.w	#6, r12
	mov.w	r12, r14
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#16, r12
	mov.w	r1, r14
	mov.w	r12, 12(r14)
	mov.w	r15, 8(r14)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r14)
	mov.w	#_ch_task_set_key_task_encrypt, 6(r14)
	mov.w	#2, 4(r14)
	mov.w	#6, 2(r14)
	mov.w	#.L.str.25, 0(r14)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r14
	mov.w	r14, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	-10(r4), r15
	mov.w	-12(r4), r13
	xor.w	r12, r13
	xor.w	r14, r15
	mov.w	r15, -10(r4)
	mov.w	r13, -12(r4)
	mov.b	-13(r4), r15
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#124, r12
	mov.w	r1, r13
	mov.w	r12, 12(r13)
	mov.w	r15, 8(r13)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r13)
	mov.w	#_ch_task_init_s_task_encrypt, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#6, 2(r13)
	mov.w	#.L.str.26, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r13
	mov.w	r13, -18(r4)
	mov.w	r12, -20(r4)
	mov.b	-14(r4), r15
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#1536, r12
	add.w	#1660, r15
	mov.w	r1, r13
	mov.w	r15, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r13)
	mov.w	#_ch_task_init_s_task_encrypt, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#6, 2(r13)
	mov.w	#.L.str.27, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r13
	mov.w	r13, -22(r4)
	mov.w	r12, -24(r4)
	mov.b	-15(r4), r15
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#3072, r12
	add.w	#3196, r15
	mov.w	r1, r13
	mov.w	r15, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r13)
	mov.w	#_ch_task_init_s_task_encrypt, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#6, 2(r13)
	mov.w	#.L.str.28, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r13
	mov.w	r13, -26(r4)
	mov.w	r12, -28(r4)
	mov.b	-16(r4), r15
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	call	#__mulhi3hw_noint
	mov.w	r15, r12
	add.w	#4608, r12
	add.w	#4732, r15
	mov.w	r1, r13
	mov.w	r15, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r13)
	mov.w	#_ch_task_init_s_task_encrypt, 6(r13)
	mov.w	#2, 4(r13)
	mov.w	#6, 2(r13)
	mov.w	#.L.str.29, 0(r13)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r13
	mov.w	r13, -30(r4)
	mov.w	r12, -32(r4)
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	mov.w	-24(r4), r11
	mov.w	-22(r4), r10
	add.w	r11, r14
	addc.w	r10, r15
	mov.w	-26(r4), r11
	mov.w	-28(r4), r10
	xor.w	r10, r14
	xor.w	r11, r15
	add.w	r12, r14
	addc.w	r13, r15
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	xor.w	r14, r13
	xor.w	r15, r12
	mov.w	r12, -10(r4)
	mov.w	r13, -12(r4)
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	r13, -34(r4)
	mov.w	r12, -36(r4)
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	r13, -14(r4)
	mov.w	r12, -16(r4)
	mov.w	-36(r4), r12
	mov.w	-34(r4), r13
	mov.w	r13, -10(r4)
	mov.w	r12, -12(r4)
	jmp	.LBB7_5
.LBB7_5:                                ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-38(r4), r12
	add.w	#1, r12
	mov.w	r12, -38(r4)
	br	#.LBB7_1
.LBB7_6:                                ; %for.end
	mov.w	r1, r12
	mov.w	#118, 12(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 10(r12)
	mov.w	#102, 8(r12)
	mov.w	#_ch_task_set_key_task_encrypt, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.30, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -6(r4)
	mov.w	r12, -8(r4)
	mov.w	-10(r4), r13
	mov.w	-12(r4), r14
	xor.w	r12, r14
	xor.w	r15, r13
	mov.w	r13, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#6, 14(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 12(r12)
	mov.w	#14, 10(r12)
	mov.w	#_ch_task_encrypt_task_encrypt, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_encrypt_task_encrypt, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: task_encrypt:next_task <- [FP+-36]
	mov.w	r1, r12
	mov.w	#12, 12(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 10(r12)
	mov.w	#12, 8(r12)
	mov.w	#_ch_task_set_key2_task_encrypt, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -40(r4)
	mov.w	r12, r15
	call	#transition_to
	add.w	#56, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end7:
	.size	task_encrypt, .Lfunc_end7-task_encrypt

	.globl	task_start_encrypt
	.align	2
	.type	task_start_encrypt,@function
task_start_encrypt:                     ; @task_start_encrypt
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#40, r1
	mov.w	#0, -2(r4)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#8, r12
	jhs	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-2(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 16(r13)
	mov.w	r12, 12(r13)
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_start_encrypt3_ch_iv2, 14(r13)
	mov.w	#_ch_mc_task_init_ch_iv, 10(r13)
	mov.w	#_ch_mc_task_start_encrypt2_ch_iv3, 6(r13)
	mov.w	#3, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.3, 0(r13)
	call	#chan_in
	mov.b	0(r15), r14
	mov.w	-2(r4), r12
	mov.w	r4, r13
	sub.w	#12, r13
	add.w	r12, r13
	mov.b	r14, 0(r13)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_init_ch_n, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -4(r4)
	cmp.w	#0, r12
	jne	.LBB8_6
	jmp	.LBB8_5
.LBB8_5:                                ; %if.then
	mov.b	-12(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -14(r4)
	mov.w	#0, -16(r4)
	mov.b	-11(r4), r13
	bis.w	r13, r12
	mov.w	r12, -14(r4)
	mov.w	#0, -16(r4)
	mov.b	-10(r4), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r12, -14(r4)
	mov.w	r13, -16(r4)
	mov.b	-9(r4), r14
	bis.w	r14, r13
	mov.w	r12, -14(r4)
	mov.w	r13, -16(r4)
	mov.b	-8(r4), r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	rla.w	r12
	mov.w	r12, -18(r4)
	mov.w	#0, -20(r4)
	mov.b	-7(r4), r13
	bis.w	r13, r12
	mov.w	r12, -18(r4)
	mov.w	#0, -20(r4)
	mov.b	-6(r4), r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	rla.w	r13
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.b	-5(r4), r14
	bis.w	r14, r13
	mov.w	r12, -18(r4)
	mov.w	r13, -20(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#16, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_out
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#20, r13
	mov.w	r13, 2(r12)
	mov.w	#6, 10(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_out
	;DEBUG_VALUE: next_task <- [FP+-22]
	mov.w	#_task_task_start_encrypt2, -22(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#22, r13
	mov.w	r13, 2(r12)
	mov.w	#12, 10(r12)
	mov.w	#_ch_task_start_encrypt_task_encrypt, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str.14, 0(r12)
	call	#chan_out
	mov.w	#_task_task_encrypt, r15
	call	#transition_to
	jmp	.LBB8_7
.LBB8_6:                                ; %if.else
	mov.w	#_task_task_start_encrypt3, r15
	call	#transition_to
	jmp	.LBB8_7
.LBB8_7:                                ; %if.end
	add.w	#40, r1
	pop.w	r4
	ret
.Lfunc_end8:
	.size	task_start_encrypt, .Lfunc_end8-task_start_encrypt

	.globl	task_start_encrypt2
	.align	2
	.type	task_start_encrypt2,@function
task_start_encrypt2:                    ; @task_start_encrypt2
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#28, r1
	mov.w	r1, r12
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.12, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)
	mov.b	-1(r4), r13
	mov.b	r13, -12(r4)
	mov.b	-2(r4), r13
	mov.b	r13, -11(r4)
	mov.b	-3(r4), r13
	mov.b	r13, -10(r4)
	mov.b	-4(r4), r13
	mov.b	r13, -9(r4)
	mov.w	r1, r12
	mov.w	#6, 8(r12)
	mov.w	#_ch_mc_task_encrypt_ch_return, 6(r12)
	mov.w	#1, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.13, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -2(r4)
	mov.w	r12, -4(r4)
	mov.b	-1(r4), r13
	mov.b	r13, -8(r4)
	mov.b	-2(r4), r13
	mov.b	r13, -7(r4)
	mov.b	-3(r4), r13
	mov.b	r13, -6(r4)
	mov.b	-4(r4), r13
	mov.b	r13, -5(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#8, r12
	jhs	.LBB9_4
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r4, r13
	sub.w	#12, r13
	add.w	r12, r13
	rla.w	r12
	rla.w	r12
	mov.w	r1, r14
	mov.w	r12, 10(r14)
	mov.w	r13, 2(r14)
	mov.w	#_ch_mc_task_start_encrypt2_ch_iv3, 8(r14)
	mov.w	#1, 6(r14)
	mov.w	#4, 4(r14)
	mov.w	#.L.str.3, 0(r14)
	call	#chan_out
	jmp	.LBB9_3
.LBB9_3:                                ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB9_1
.LBB9_4:                                ; %for.end
	mov.w	#_task_task_start_encrypt3, r15
	call	#transition_to
	add.w	#28, r1
	pop.w	r4
	ret
.Lfunc_end9:
	.size	task_start_encrypt2, .Lfunc_end9-task_start_encrypt2

	.globl	task_start_encrypt3
	.align	2
	.type	task_start_encrypt3,@function
task_start_encrypt3:                    ; @task_start_encrypt3
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#40, r1
	mov.w	r1, r12
	mov.w	#10, 12(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt3, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_init_ch_index2, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#6, 2(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	2(r15), r15
	mov.w	r15, -18(r4)
	mov.w	r12, -20(r4)
	mov.w	r1, r12
	mov.w	#0, 12(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt3, 10(r12)
	mov.w	#0, 8(r12)
	mov.w	#_ch_mc_task_init_ch_n, 6(r12)
	mov.w	#2, 4(r12)
	mov.w	#4, 2(r12)
	mov.w	#.L.str, 0(r12)
	call	#chan_in
	mov.w	0(r15), r12
	mov.w	r12, -12(r4)
	mov.w	#0, -14(r4)
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#8, r12
	jhs	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	-14(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 8(r13)
	mov.w	#_ch_mc_task_start_encrypt2_ch_iv3, 6(r13)
	mov.w	#1, 4(r13)
	mov.w	#4, 2(r13)
	mov.w	#.L.str.3, 0(r13)
	call	#chan_in
	mov.b	0(r15), r14
	mov.w	-14(r4), r12
	mov.w	r4, r13
	sub.w	#9, r13
	add.w	r12, r13
	mov.b	r14, 0(r13)
	jmp	.LBB10_3
.LBB10_3:                               ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov.w	-14(r4), r12
	add.w	#1, r12
	mov.w	r12, -14(r4)
	jmp	.LBB10_1
.LBB10_4:                               ; %for.end
	mov.w	-20(r4), r12
	mov.b	indata(r12), r12
	mov.w	-12(r4), r13
	mov.w	r4, r14
	sub.w	#9, r14
	add.w	r13, r14
	mov.b	0(r14), r13
	xor.w	r13, r12
	mov.b	r12, r15
	mov.b	r15, -1(r4)
	mov.w	-20(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	r4, r12
	sub.w	#1, r12
	mov.w	r12, 2(r13)
	mov.w	#_ch_task_start_encrypt3_task_done, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.31, 0(r13)
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.b	-1(r4), r12
	mov.w	r1, r13
	mov.w	r12, 2(r13)
	mov.w	#.L.str.32, 0(r13)
	call	#printf
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	r1, r13
	mov.w	r12, 10(r13)
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, 2(r13)
	mov.w	#_ch_mc_task_start_encrypt3_ch_iv2, 8(r13)
	mov.w	#1, 6(r13)
	mov.w	#4, 4(r13)
	mov.w	#.L.str.33, 0(r13)
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	call	#chan_out
	mov.w	-12(r4), r12
	add.w	#1, r12
	and.w	#7, r12
	mov.w	r12, -12(r4)
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#12, r13
	mov.w	r13, 2(r12)
	mov.w	#0, 14(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt3, 12(r12)
	mov.w	#0, 10(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt, 8(r12)
	mov.w	#2, 6(r12)
	mov.w	#4, 4(r12)
	mov.w	#.L.str, 0(r12)
	call	#chan_out
	mov.w	-20(r4), r12
	mov.w	-18(r4), r13
	add.w	#1, r12
	addc.w	#0, r13
	mov.w	r13, -18(r4)
	mov.w	r12, -20(r4)
	xor.w	#13, r12
	bis.w	r13, r12
	cmp.w	#0, r12
	jne	.LBB10_6
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then
	mov.w	#_task_task_done, r15
	call	#transition_to
	jmp	.LBB10_7
.LBB10_6:                               ; %if.else
	mov.w	r1, r12
	mov.w	r4, r13
	sub.w	#20, r13
	mov.w	r13, 2(r12)
	mov.w	#10, 10(r12)
	mov.w	#_ch_task_start_encrypt3_task_start_encrypt3, 8(r12)
	mov.w	#1, 6(r12)
	mov.w	#6, 4(r12)
	mov.w	#.L.str.1, 0(r12)
	call	#chan_out
	mov.w	#_task_task_start_encrypt, r15
	call	#transition_to
	jmp	.LBB10_7
.LBB10_7:                               ; %if.end
	add.w	#40, r1
	pop.w	r4
	ret
.Lfunc_end10:
	.size	task_start_encrypt3, .Lfunc_end10-task_start_encrypt3

	.globl	task_done
	.align	2
	.type	task_done,@function
task_done:                              ; @task_done
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	mov.w	&overflow, r12
	mov.w	&0x03D0, r13
	mov.w	r1, r14
	mov.w	r13, 4(r14)
	mov.w	r12, 2(r14)
	mov.w	#.L.str.34, 0(r14)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end11:
	.size	task_done, .Lfunc_end11-task_done

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
	mov.w	#.L.str.35, 0(r13)
	call	#printf
	mov.w	r15, -2(r4)             ; 2-byte Folded Spill
	add.w	#6, r1
	pop.w	r4
	ret
.Lfunc_end12:
	.size	init, .Lfunc_end12-init

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
.Lfunc_end13:
	.size	_entry_task, .Lfunc_end13-_entry_task

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
.Lfunc_end14:
	.size	_init, .Lfunc_end14-_init

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
.Lfunc_end15:
	.size	init_hw, .Lfunc_end15-init_hw

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
.Lfunc_end16:
	.size	msp_watchdog_enable, .Lfunc_end16-msp_watchdog_enable

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
.Lfunc_end17:
	.size	msp_watchdog_disable, .Lfunc_end17-msp_watchdog_disable

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
.Lfunc_end18:
	.size	msp_watchdog_kick, .Lfunc_end18-msp_watchdog_kick

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
	jeq	.LBB19_4
	jmp	.LBB19_1
.LBB19_1:                               ; %while.body.preheader
	mov.w	#0, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	jmp	.LBB19_2
.LBB19_2:                               ; %while.body
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
	jne	.LBB19_2
	jmp	.LBB19_3
.LBB19_3:                               ; %while.end.loopexit
	jmp	.LBB19_4
.LBB19_4:                               ; %while.end
	mov.w	-2(r4), r15             ; 2-byte Folded Reload
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end19:
	.size	memcpy, .Lfunc_end19-memcpy

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
.Lfunc_end20:
	.size	my_memset, .Lfunc_end20-my_memset

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
.Lfunc_end21:
	.size	msp_clock_setup, .Lfunc_end21-msp_clock_setup

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
.Lfunc_end22:
	.size	mult16, .Lfunc_end22-mult16

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
	jmp	.LBB23_1
.LBB23_1:                               ; %while.cond
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
	jeq	.LBB23_3
	jmp	.LBB23_2
.LBB23_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-10(r4), r12
	mov.w	-12(r4), r13
	sub.w	r13, r12
	cmp.w	#2, r12
	mov.w	r2, r12
	and.w	#1, r12
	mov.b	r12, r14
	mov.b	r14, -25(r4)            ; 1-byte Folded Spill
	jmp	.LBB23_3
.LBB23_3:                               ; %land.end
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.b	-25(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB23_10
	jmp	.LBB23_4
.LBB23_4:                               ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
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
	jeq	.LBB23_6
; BB#5:                                 ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
.LBB23_6:                               ; %while.body
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB23_8
	jmp	.LBB23_7
.LBB23_7:                               ; %if.then
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -12(r4)
	jmp	.LBB23_9
.LBB23_8:                               ; %if.else
                                        ;   in Loop: Header=BB23_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	r12, -10(r4)
	jmp	.LBB23_9
.LBB23_9:                               ; %if.end
                                        ;   in Loop: Header=BB23_1 Depth=1
	jmp	.LBB23_1
.LBB23_10:                              ; %while.end
	mov.w	-14(r4), r15
	add.w	#30, r1
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end23:
	.size	sqrt16, .Lfunc_end23-sqrt16

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
	jmp	.LBB24_1
.LBB24_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	mov.b	#0, r14
	cmp.w	r13, r12
	mov.b	r14, -23(r4)            ; 1-byte Folded Spill
	jhs	.LBB24_4
	jmp	.LBB24_2
.LBB24_2:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-14(r4), r12
	mov.b	#0, r13
	cmp.w	#0, r12
	mov.b	r13, -23(r4)            ; 1-byte Folded Spill
	jeq	.LBB24_4
	jmp	.LBB24_3
.LBB24_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-9(r4), r12
	bit.b	#-128, r12
	mov.w	r2, r13
	rra.w	r13
	and.w	#1, r13
	mov.b	r13, r12
	mov.b	r12, -23(r4)            ; 1-byte Folded Spill
	jmp	.LBB24_4
.LBB24_4:                               ; %land.end
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.b	-23(r4), r12            ; 1-byte Folded Reload
	mov.b	r12, r13
	bit.w	#1, r13
	jeq	.LBB24_6
	jmp	.LBB24_5
.LBB24_5:                               ; %while.body
                                        ;   in Loop: Header=BB24_1 Depth=1
	mov.w	-10(r4), r12
	rla.w	r12
	mov.w	r12, -10(r4)
	mov.w	-14(r4), r12
	rla.w	r12
	mov.w	r12, -14(r4)
	jmp	.LBB24_1
.LBB24_6:                               ; %while.end
	jmp	.LBB24_7
.LBB24_7:                               ; %while.cond.3
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-14(r4), r12
	cmp.w	#0, r12
	jeq	.LBB24_11
	jmp	.LBB24_8
.LBB24_8:                               ; %while.body.5
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jlo	.LBB24_10
	jmp	.LBB24_9
.LBB24_9:                               ; %if.then
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-10(r4), r12
	mov.w	-8(r4), r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	mov.w	-14(r4), r12
	mov.w	-16(r4), r13
	bis.w	r12, r13
	mov.w	r13, -16(r4)
	jmp	.LBB24_10
.LBB24_10:                              ; %if.end
                                        ;   in Loop: Header=BB24_7 Depth=1
	mov.w	-14(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -14(r4)
	mov.w	-10(r4), r12
	clrc
	rrc.w	r12
	mov.w	r12, -10(r4)
	jmp	.LBB24_7
.LBB24_11:                              ; %while.end.8
	mov.w	-12(r4), r12
	cmp.w	#0, r12
	jeq	.LBB24_13
	jmp	.LBB24_12
.LBB24_12:                              ; %if.then.10
	mov.w	-8(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB24_14
.LBB24_13:                              ; %if.end.11
	mov.w	-16(r4), r12
	mov.w	r12, -6(r4)
	jmp	.LBB24_14
.LBB24_14:                              ; %return
	mov.w	-6(r4), r15
	add.w	#20, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Lfunc_end24:
	.size	udivmodhi4, .Lfunc_end24-udivmodhi4

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
	jge	.LBB25_2
	jmp	.LBB25_1
.LBB25_1:                               ; %if.then
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
	jmp	.LBB25_2
.LBB25_2:                               ; %if.end
	mov.w	-4(r4), r12
	cmp.w	#0, r12
	jge	.LBB25_4
	jmp	.LBB25_3
.LBB25_3:                               ; %if.then.2
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
	jmp	.LBB25_4
.LBB25_4:                               ; %if.end.7
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#0, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB25_6
	jmp	.LBB25_5
.LBB25_5:                               ; %if.then.9
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB25_6
.LBB25_6:                               ; %if.end.11
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end25:
	.size	__divhi3, .Lfunc_end25-__divhi3

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
	jge	.LBB26_2
	jmp	.LBB26_1
.LBB26_1:                               ; %if.then
	mov.w	-2(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -2(r4)
	mov.w	#1, -6(r4)
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
	jmp	.LBB26_4
.LBB26_4:                               ; %if.end.4
	mov.w	-2(r4), r15
	mov.w	-4(r4), r14
	mov.w	#1, r13
	call	#udivmodhi4
	mov.w	r15, -8(r4)
	mov.w	-6(r4), r13
	cmp.w	#0, r13
	jeq	.LBB26_6
	jmp	.LBB26_5
.LBB26_5:                               ; %if.then.5
	mov.w	-8(r4), r12
	mov.w	#0, r13
	sub.w	r12, r13
	mov.w	r13, -8(r4)
	jmp	.LBB26_6
.LBB26_6:                               ; %if.end.7
	mov.w	-8(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Lfunc_end26:
	.size	__modhi3, .Lfunc_end26-__modhi3

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
.Lfunc_end27:
	.size	__udivhi3, .Lfunc_end27-__udivhi3

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
.Lfunc_end28:
	.size	__umodhi3, .Lfunc_end28-__umodhi3

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
	jeq	.LBB29_7
	jmp	.LBB29_1
.LBB29_1:                               ; %if.then
	;DEBUG_VALUE: i <- [FP+-4]
	;DEBUG_VALUE: dirty_self_fields <- [FP+-6]
	mov.w	-2(r4), r12
	add.w	#8, r12
	mov.w	r12, -6(r4)
	jmp	.LBB29_2
.LBB29_2:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	mov.w	72(r12), r12
	mov.w	r12, -4(r4)
	cmp.w	#1, r12
	jl	.LBB29_6
	jmp	.LBB29_3
.LBB29_3:                               ; %while.body
                                        ;   in Loop: Header=BB29_2 Depth=1
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
	jeq	.LBB29_5
	jmp	.LBB29_4
.LBB29_4:                               ; %if.then.3
                                        ;   in Loop: Header=BB29_2 Depth=1
	mov.w	-8(r4), r12
	;APP
	SWPB 0(r12)

	;NO_APP
	jmp	.LBB29_5
.LBB29_5:                               ; %if.end
                                        ;   in Loop: Header=BB29_2 Depth=1
	mov.w	-4(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 72(r13)
	jmp	.LBB29_2
.LBB29_6:                               ; %while.end
	mov.w	&curctx, r12
	mov.w	2(r12), r12
	mov.w	-2(r4), r13
	mov.w	r12, 74(r13)
	jmp	.LBB29_7
.LBB29_7:                               ; %if.end.8
	add.w	#8, r1
	pop.w	r4
	ret
.Lfunc_end29:
	.size	task_prologue, .Lfunc_end29-task_prologue

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
.Lfunc_end30:
	.size	transition_to, .Lfunc_end30-transition_to

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
	jmp	.LBB31_1
.LBB31_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-10(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r13, r12
	jhs	.LBB31_12
	jmp	.LBB31_2
.LBB31_2:                               ; %for.body
                                        ;   in Loop: Header=BB31_1 Depth=1
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
	jne	.LBB31_7
	jmp	.LBB31_3
.LBB31_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB31_1 Depth=1
	;DEBUG_VALUE: self_field <- [FP+-28]
	mov.w	-26(r4), r12
	mov.w	r12, -28(r4)
	;DEBUG_VALUE: var_offset <- [FP+-30]
	mov.b	0(r12), r13
	bit.b	#2, r13
	jeq	.LBB31_5
	jmp	.LBB31_4
.LBB31_4:                               ; %cond.true
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-4(r4), r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB31_6
.LBB31_5:                               ; %cond.false
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	#0, r12
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	jmp	.LBB31_6
.LBB31_6:                               ; %cond.end
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -30(r4)
	mov.w	-26(r4), r13
	add.w	r12, r13
	add.w	#2, r13
	mov.w	r13, -14(r4)
	jmp	.LBB31_8
.LBB31_7:                               ; %sw.default
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-26(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB31_8
.LBB31_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	-12(r4), r13
	cmp.w	r12, r13
	jhs	.LBB31_10
	jmp	.LBB31_9
.LBB31_9:                               ; %if.then
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-14(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, -12(r4)
	mov.w	-14(r4), r12
	mov.w	r12, -16(r4)
	jmp	.LBB31_10
.LBB31_10:                              ; %if.end
                                        ;   in Loop: Header=BB31_1 Depth=1
	jmp	.LBB31_11
.LBB31_11:                              ; %for.inc
                                        ;   in Loop: Header=BB31_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB31_1
.LBB31_12:                              ; %for.end
	;DEBUG_VALUE: chan_in:value <- [FP+-32]
	mov.w	-16(r4), r12
	add.w	#2, r12
	mov.w	r12, -32(r4)
	mov.w	r12, r15
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end31:
	.size	chan_in, .Lfunc_end31-chan_in

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
	jmp	.LBB32_1
.LBB32_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	mov.w	-8(r4), r13
	cmp.w	r13, r12
	jge	.LBB32_10
	jmp	.LBB32_2
.LBB32_2:                               ; %for.body
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jne	.LBB32_7
	jmp	.LBB32_3
.LBB32_3:                               ; %sw.bb
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jeq	.LBB32_5
	jmp	.LBB32_4
.LBB32_4:                               ; %cond.true
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-6(r4), r12
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
	jmp	.LBB32_8
.LBB32_7:                               ; %sw.default
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-24(r4), r12
	mov.w	r12, -14(r4)
	jmp	.LBB32_8
.LBB32_8:                               ; %sw.epilog
                                        ;   in Loop: Header=BB32_1 Depth=1
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
	jmp	.LBB32_9
.LBB32_9:                               ; %for.inc
                                        ;   in Loop: Header=BB32_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#1, r12
	mov.w	r12, -12(r4)
	jmp	.LBB32_1
.LBB32_10:                              ; %for.end
	add.w	#34, r1
	pop.w	r4
	ret
.Lfunc_end32:
	.size	chan_out, .Lfunc_end32-chan_out

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
.Lfunc_end33:
	.size	main, .Lfunc_end33-main

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

	.type	_task_task_set_ukey,@object ; @_task_task_set_ukey
	.globl	_task_task_set_ukey
	.align	1
_task_task_set_ukey:
	.short	task_set_ukey
	.long	4                       ; 0x4
	.short	2                       ; 0x2
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_set_ukey\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_set_ukey, 108

	.type	_task_task_done,@object ; @_task_task_done
	.globl	_task_task_done
	.align	1
_task_task_done:
	.short	task_done
	.long	8                       ; 0x8
	.short	3                       ; 0x3
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_done\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_done, 108

	.type	_task_task_init_key,@object ; @_task_task_init_key
	.globl	_task_task_init_key
	.align	1
_task_task_init_key:
	.short	task_init_key
	.long	16                      ; 0x10
	.short	4                       ; 0x4
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_init_key\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init_key, 108

	.type	_task_task_init_s,@object ; @_task_task_init_s
	.globl	_task_task_init_s
	.align	1
_task_task_init_s:
	.short	task_init_s
	.long	32                      ; 0x20
	.short	5                       ; 0x5
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_init_s\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_init_s, 108

	.type	_task_task_set_key,@object ; @_task_task_set_key
	.globl	_task_task_set_key
	.align	1
_task_task_set_key:
	.short	task_set_key
	.long	64                      ; 0x40
	.short	6                       ; 0x6
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_set_key\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_set_key, 108

	.type	_task_task_set_key2,@object ; @_task_task_set_key2
	.globl	_task_task_set_key2
	.align	1
_task_task_set_key2:
	.short	task_set_key2
	.long	128                     ; 0x80
	.short	7                       ; 0x7
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_set_key2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_set_key2, 108

	.type	_task_task_encrypt,@object ; @_task_task_encrypt
	.globl	_task_task_encrypt
	.align	1
_task_task_encrypt:
	.short	task_encrypt
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_encrypt\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_encrypt, 108

	.type	_task_task_start_encrypt,@object ; @_task_task_start_encrypt
	.globl	_task_task_start_encrypt
	.align	1
_task_task_start_encrypt:
	.short	task_start_encrypt
	.long	256                     ; 0x100
	.short	8                       ; 0x8
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_start_encrypt\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_start_encrypt, 108

	.type	_task_task_start_encrypt2,@object ; @_task_task_start_encrypt2
	.globl	_task_task_start_encrypt2
	.align	1
_task_task_start_encrypt2:
	.short	task_start_encrypt2
	.long	512                     ; 0x200
	.short	9                       ; 0x9
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_start_encrypt2\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_start_encrypt2, 108

	.type	_task_task_start_encrypt3,@object ; @_task_task_start_encrypt3
	.globl	_task_task_start_encrypt3
	.align	1
_task_task_start_encrypt3:
	.short	task_start_encrypt3
	.long	1024                    ; 0x400
	.short	10                      ; 0xa
	.zero	64
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.asciz	"task_start_encrypt3\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_task_task_start_encrypt3, 108

	.type	_ch_mc_task_init_ch_iv,@object ; @_ch_mc_task_init_ch_iv
	.globl	_ch_mc_task_init_ch_iv
	.align	1
_ch_mc_task_init_ch_iv:
	.short	2                       ; 0x2
	.zero	32
	.size	_ch_mc_task_init_ch_iv, 34

	.type	_ch_mc_task_init_ch_index2,@object ; @_ch_mc_task_init_ch_index2
	.globl	_ch_mc_task_init_ch_index2
	.align	1
_ch_mc_task_init_ch_index2:
	.short	2                       ; 0x2
	.zero	6
	.size	_ch_mc_task_init_ch_index2, 8

	.type	_ch_mc_task_init_ch_n,@object ; @_ch_mc_task_init_ch_n
	.globl	_ch_mc_task_init_ch_n
	.align	1
_ch_mc_task_init_ch_n:
	.short	2                       ; 0x2
	.zero	4
	.size	_ch_mc_task_init_ch_n, 6

	.type	_ch_task_set_ukey_task_set_key,@object ; @_ch_task_set_ukey_task_set_key
	.globl	_ch_task_set_ukey_task_set_key
	.align	1
_ch_task_set_ukey_task_set_key:
	.zero	66
	.size	_ch_task_set_ukey_task_set_key, 66

	.type	_ch_task_init_key_task_set_key,@object ; @_ch_task_init_key_task_set_key
	.globl	_ch_task_init_key_task_set_key
	.align	1
_ch_task_init_key_task_set_key:
	.zero	110
	.size	_ch_task_init_key_task_set_key, 110

	.type	_ch_task_init_s_task_encrypt,@object ; @_ch_task_init_s_task_encrypt
	.globl	_ch_task_init_s_task_encrypt
	.align	1
_ch_task_init_s_task_encrypt:
	.zero	6146
	.size	_ch_task_init_s_task_encrypt, 6146

	.type	_ch_task_set_key_task_encrypt,@object ; @_ch_task_set_key_task_encrypt
	.globl	_ch_task_set_key_task_encrypt
	.align	1
_ch_task_set_key_task_encrypt:
	.zero	110
	.size	_ch_task_set_key_task_encrypt, 110

	.type	_ch_task_set_key2_task_encrypt,@object ; @_ch_task_set_key2_task_encrypt
	.globl	_ch_task_set_key2_task_encrypt
	.align	1
_ch_task_set_key2_task_encrypt:
	.zero	6270
	.size	_ch_task_set_key2_task_encrypt, 6270

	.type	_ch_task_start_encrypt_task_encrypt,@object ; @_ch_task_start_encrypt_task_encrypt
	.globl	_ch_task_start_encrypt_task_encrypt
	.align	1
_ch_task_start_encrypt_task_encrypt:
	.zero	18
	.size	_ch_task_start_encrypt_task_encrypt, 18

	.type	_ch_task_set_key2_task_set_key2,@object ; @_ch_task_set_key2_task_set_key2
	.globl	_ch_task_set_key2_task_set_key2
	.align	1
_ch_task_set_key2_task_set_key2:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	12
	.size	_ch_task_set_key2_task_set_key2, 16

	.type	_ch_task_encrypt_task_encrypt,@object ; @_ch_task_encrypt_task_encrypt
	.globl	_ch_task_encrypt_task_encrypt
	.align	1
_ch_task_encrypt_task_encrypt:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	12
	.short	512                     ; 0x200
	.zero	12
	.size	_ch_task_encrypt_task_encrypt, 30

	.type	_ch_mc_task_encrypt_ch_return,@object ; @_ch_mc_task_encrypt_ch_return
	.globl	_ch_mc_task_encrypt_ch_return
	.align	1
_ch_mc_task_encrypt_ch_return:
	.short	2                       ; 0x2
	.zero	12
	.size	_ch_mc_task_encrypt_ch_return, 14

	.type	_ch_mc_task_start_encrypt2_ch_iv3,@object ; @_ch_mc_task_start_encrypt2_ch_iv3
	.globl	_ch_mc_task_start_encrypt2_ch_iv3
	.align	1
_ch_mc_task_start_encrypt2_ch_iv3:
	.short	2                       ; 0x2
	.zero	32
	.size	_ch_mc_task_start_encrypt2_ch_iv3, 34

	.type	_ch_mc_task_start_encrypt3_ch_iv2,@object ; @_ch_mc_task_start_encrypt3_ch_iv2
	.globl	_ch_mc_task_start_encrypt3_ch_iv2
	.align	1
_ch_mc_task_start_encrypt3_ch_iv2:
	.short	2                       ; 0x2
	.zero	32
	.size	_ch_mc_task_start_encrypt3_ch_iv2, 34

	.type	_ch_task_start_encrypt3_task_start_encrypt,@object ; @_ch_task_start_encrypt3_task_start_encrypt
	.globl	_ch_task_start_encrypt3_task_start_encrypt
	.align	1
_ch_task_start_encrypt3_task_start_encrypt:
	.zero	6
	.size	_ch_task_start_encrypt3_task_start_encrypt, 6

	.type	_ch_task_start_encrypt3_task_start_encrypt3,@object ; @_ch_task_start_encrypt3_task_start_encrypt3
	.globl	_ch_task_start_encrypt3_task_start_encrypt3
	.align	1
_ch_task_start_encrypt3_task_start_encrypt3:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.short	512                     ; 0x200
	.zero	12
	.size	_ch_task_start_encrypt3_task_start_encrypt3, 26

	.type	_ch_task_start_encrypt3_task_done,@object ; @_ch_task_start_encrypt3_task_done
	.globl	_ch_task_start_encrypt3_task_done
	.align	1
_ch_task_start_encrypt3_task_done:
	.zero	54
	.size	_ch_task_start_encrypt3_task_done, 54

	.type	_ch_task_init_task_init_s,@object ; @_ch_task_init_task_init_s
	.globl	_ch_task_init_task_init_s
	.align	1
_ch_task_init_task_init_s:
	.zero	6
	.size	_ch_task_init_task_init_s, 6

	.type	_ch_task_init_s_task_init_s,@object ; @_ch_task_init_s_task_init_s
	.globl	_ch_task_init_s_task_init_s
	.align	1
_ch_task_init_s_task_init_s:
	.short	1                       ; 0x1
	.short	512                     ; 0x200
	.zero	8
	.size	_ch_task_init_s_task_init_s, 12

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
	.asciz	"n"
	.size	.L.str, 2

	.type	.L.str.1,@object        ; @.str.1
.L.str.1:
	.asciz	"index2"
	.size	.L.str.1, 7

	.type	.L.str.2,@object        ; @.str.2
.L.str.2:
	.asciz	"index"
	.size	.L.str.2, 6

	.type	.L.str.3,@object        ; @.str.3
.L.str.3:
	.asciz	"iv[i]"
	.size	.L.str.3, 6

	.type	cp,@object              ; @cp
	.section	.ro_nv_vars,"a",@progbits
cp:
	.ascii	"1234567890ABCDEFFEDCBA0987654321"
	.size	cp, 32

	.type	.L.str.4,@object        ; @.str.4
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.4:
	.asciz	"Key must be hexadecimal!!\r\n"
	.size	.L.str.4, 28

	.type	.L.str.5,@object        ; @.str.5
.L.str.5:
	.asciz	"ukey[i/2-1]"
	.size	.L.str.5, 12

	.type	init_key,@object        ; @init_key
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_key:
	.long	608135816               ; 0x243f6a88
	.long	2242054355              ; 0x85a308d3
	.long	320440878               ; 0x13198a2e
	.long	57701188                ; 0x3707344
	.long	2752067618              ; 0xa4093822
	.long	698298832               ; 0x299f31d0
	.long	137296536               ; 0x82efa98
	.long	3964562569              ; 0xec4e6c89
	.long	1160258022              ; 0x452821e6
	.long	953160567               ; 0x38d01377
	.long	3193202383              ; 0xbe5466cf
	.long	887688300               ; 0x34e90c6c
	.long	3232508343              ; 0xc0ac29b7
	.long	3380367581              ; 0xc97c50dd
	.long	1065670069              ; 0x3f84d5b5
	.long	3041331479              ; 0xb5470917
	.long	2450970073              ; 0x9216d5d9
	.long	2306472731              ; 0x8979fb1b
	.size	init_key, 72

	.type	.L.str.6,@object        ; @.str.6
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.6:
	.asciz	"key[i]"
	.size	.L.str.6, 7

	.type	init_s0,@object         ; @init_s0
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_s0:
	.long	3509652390              ; 0xd1310ba6
	.long	2564797868              ; 0x98dfb5ac
	.long	805139163               ; 0x2ffd72db
	.long	3491422135              ; 0xd01adfb7
	.long	3101798381              ; 0xb8e1afed
	.long	1780907670              ; 0x6a267e96
	.long	3128725573              ; 0xba7c9045
	.long	4046225305              ; 0xf12c7f99
	.long	614570311               ; 0x24a19947
	.long	3012652279              ; 0xb3916cf7
	.long	134345442               ; 0x801f2e2
	.long	2240740374              ; 0x858efc16
	.long	1667834072              ; 0x636920d8
	.long	1901547113              ; 0x71574e69
	.long	2757295779              ; 0xa458fea3
	.long	4103290238              ; 0xf4933d7e
	.long	227898511               ; 0xd95748f
	.long	1921955416              ; 0x728eb658
	.long	1904987480              ; 0x718bcd58
	.long	2182433518              ; 0x82154aee
	.long	2069144605              ; 0x7b54a41d
	.long	3260701109              ; 0xc25a59b5
	.long	2620446009              ; 0x9c30d539
	.long	720527379               ; 0x2af26013
	.long	3318853667              ; 0xc5d1b023
	.long	677414384               ; 0x286085f0
	.long	3393288472              ; 0xca417918
	.long	3101374703              ; 0xb8db38ef
	.long	2390351024              ; 0x8e79dcb0
	.long	1614419982              ; 0x603a180e
	.long	1822297739              ; 0x6c9e0e8b
	.long	2954791486              ; 0xb01e8a3e
	.long	3608508353              ; 0xd71577c1
	.long	3174124327              ; 0xbd314b27
	.long	2024746970              ; 0x78af2fda
	.long	1432378464              ; 0x55605c60
	.long	3864339955              ; 0xe65525f3
	.long	2857741204              ; 0xaa55ab94
	.long	1464375394              ; 0x57489862
	.long	1676153920              ; 0x63e81440
	.long	1439316330              ; 0x55ca396a
	.long	715854006               ; 0x2aab10b6
	.long	3033291828              ; 0xb4cc5c34
	.long	289532110               ; 0x1141e8ce
	.long	2706671279              ; 0xa15486af
	.long	2087905683              ; 0x7c72e993
	.long	3018724369              ; 0xb3ee1411
	.long	1668267050              ; 0x636fbc2a
	.long	732546397               ; 0x2ba9c55d
	.long	1947742710              ; 0x741831f6
	.long	3462151702              ; 0xce5c3e16
	.long	2609353502              ; 0x9b87931e
	.long	2950085171              ; 0xafd6ba33
	.long	1814351708              ; 0x6c24cf5c
	.long	2050118529              ; 0x7a325381
	.long	680887927               ; 0x28958677
	.long	999245976               ; 0x3b8f4898
	.long	1800124847              ; 0x6b4bb9af
	.long	3300911131              ; 0xc4bfe81b
	.long	1713906067              ; 0x66282193
	.long	1641548236              ; 0x61d809cc
	.long	4213287313              ; 0xfb21a991
	.long	1216130144              ; 0x487cac60
	.long	1575780402              ; 0x5dec8032
	.long	4018429277              ; 0xef845d5d
	.long	3917837745              ; 0xe98575b1
	.long	3693486850              ; 0xdc262302
	.long	3949271944              ; 0xeb651b88
	.long	596196993               ; 0x23893e81
	.long	3549867205              ; 0xd396acc5
	.long	258830323               ; 0xf6d6ff3
	.long	2213823033              ; 0x83f44239
	.long	772490370               ; 0x2e0b4482
	.long	2760122372              ; 0xa4842004
	.long	1774776394              ; 0x69c8f04a
	.long	2652871518              ; 0x9e1f9b5e
	.long	566650946               ; 0x21c66842
	.long	4142492826              ; 0xf6e96c9a
	.long	1728879713              ; 0x670c9c61
	.long	2882767088              ; 0xabd388f0
	.long	1783734482              ; 0x6a51a0d2
	.long	3629395816              ; 0xd8542f68
	.long	2517608232              ; 0x960fa728
	.long	2874225571              ; 0xab5133a3
	.long	1861159788              ; 0x6eef0b6c
	.long	326777828               ; 0x137a3be4
	.long	3124490320              ; 0xba3bf050
	.long	2130389656              ; 0x7efb2a98
	.long	2716951837              ; 0xa1f1651d
	.long	967770486               ; 0x39af0176
	.long	1724537150              ; 0x66ca593e
	.long	2185432712              ; 0x82430e88
	.long	2364442137              ; 0x8cee8619
	.long	1164943284              ; 0x456f9fb4
	.long	2105845187              ; 0x7d84a5c3
	.long	998989502               ; 0x3b8b5ebe
	.long	3765401048              ; 0xe06f75d8
	.long	2244026483              ; 0x85c12073
	.long	1075463327              ; 0x401a449f
	.long	1455516326              ; 0x56c16aa6
	.long	1322494562              ; 0x4ed3aa62
	.long	910128902               ; 0x363f7706
	.long	469688178               ; 0x1bfedf72
	.long	1117454909              ; 0x429b023d
	.long	936433444               ; 0x37d0d724
	.long	3490320968              ; 0xd00a1248
	.long	3675253459              ; 0xdb0fead3
	.long	1240580251              ; 0x49f1c09b
	.long	122909385               ; 0x75372c9
	.long	2157517691              ; 0x80991b7b
	.long	634681816               ; 0x25d479d8
	.long	4142456567              ; 0xf6e8def7
	.long	3825094682              ; 0xe3fe501a
	.long	3061402683              ; 0xb6794c3b
	.long	2540495037              ; 0x976ce0bd
	.long	79693498                ; 0x4c006ba
	.long	3249098678              ; 0xc1a94fb6
	.long	1084186820              ; 0x409f60c4
	.long	1583128258              ; 0x5e5c9ec2
	.long	426386531               ; 0x196a2463
	.long	1761308591              ; 0x68fb6faf
	.long	1047286709              ; 0x3e6c53b5
	.long	322548459               ; 0x1339b2eb
	.long	995290223               ; 0x3b52ec6f
	.long	1845252383              ; 0x6dfc511f
	.long	2603652396              ; 0x9b30952c
	.long	3431023940              ; 0xcc814544
	.long	2942221577              ; 0xaf5ebd09
	.long	3202600964              ; 0xbee3d004
	.long	3727903485              ; 0xde334afd
	.long	1712269319              ; 0x660f2807
	.long	422464435               ; 0x192e4bb3
	.long	3234572375              ; 0xc0cba857
	.long	1170764815              ; 0x45c8740f
	.long	3523960633              ; 0xd20b5f39
	.long	3117677531              ; 0xb9d3fbdb
	.long	1434042557              ; 0x5579c0bd
	.long	442511882               ; 0x1a60320a
	.long	3600875718              ; 0xd6a100c6
	.long	1076654713              ; 0x402c7279
	.long	1738483198              ; 0x679f25fe
	.long	4213154764              ; 0xfb1fa3cc
	.long	2393238008              ; 0x8ea5e9f8
	.long	3677496056              ; 0xdb3222f8
	.long	1014306527              ; 0x3c7516df
	.long	4251020053              ; 0xfd616b15
	.long	793779912               ; 0x2f501ec8
	.long	2902807211              ; 0xad0552ab
	.long	842905082               ; 0x323db5fa
	.long	4246964064              ; 0xfd238760
	.long	1395751752              ; 0x53317b48
	.long	1040244610              ; 0x3e00df82
	.long	2656851899              ; 0x9e5c57bb
	.long	3396308128              ; 0xca6f8ca0
	.long	445077038               ; 0x1a87562e
	.long	3742853595              ; 0xdf1769db
	.long	3577915638              ; 0xd542a8f6
	.long	679411651               ; 0x287effc3
	.long	2892444358              ; 0xac6732c6
	.long	2354009459              ; 0x8c4f5573
	.long	1767581616              ; 0x695b27b0
	.long	3150600392              ; 0xbbca58c8
	.long	3791627101              ; 0xe1ffa35d
	.long	3102740896              ; 0xb8f011a0
	.long	284835224               ; 0x10fa3d98
	.long	4246832056              ; 0xfd2183b8
	.long	1258075500              ; 0x4afcb56c
	.long	768725851               ; 0x2dd1d35b
	.long	2589189241              ; 0x9a53e479
	.long	3069724005              ; 0xb6f84565
	.long	3532540348              ; 0xd28e49bc
	.long	1274779536              ; 0x4bfb9790
	.long	3789419226              ; 0xe1ddf2da
	.long	2764799539              ; 0xa4cb7e33
	.long	1660621633              ; 0x62fb1341
	.long	3471099624              ; 0xcee4c6e8
	.long	4011903706              ; 0xef20cada
	.long	913787905               ; 0x36774c01
	.long	3497959166              ; 0xd07e9efe
	.long	737222580               ; 0x2bf11fb4
	.long	2514213453              ; 0x95dbda4d
	.long	2928710040              ; 0xae909198
	.long	3937242737              ; 0xeaad8e71
	.long	1804850592              ; 0x6b93d5a0
	.long	3499020752              ; 0xd08ed1d0
	.long	2949064160              ; 0xafc725e0
	.long	2386320175              ; 0x8e3c5b2f
	.long	2390070455              ; 0x8e7594b7
	.long	2415321851              ; 0x8ff6e2fb
	.long	4061277028              ; 0xf2122b64
	.long	2290661394              ; 0x8888b812
	.long	2416832540              ; 0x900df01c
	.long	1336762016              ; 0x4fad5ea0
	.long	1754252060              ; 0x688fc31c
	.long	3520065937              ; 0xd1cff191
	.long	3014181293              ; 0xb3a8c1ad
	.long	791618072               ; 0x2f2f2218
	.long	3188594551              ; 0xbe0e1777
	.long	3933548030              ; 0xea752dfe
	.long	2332172193              ; 0x8b021fa1
	.long	3852520463              ; 0xe5a0cc0f
	.long	3043980520              ; 0xb56f74e8
	.long	413987798               ; 0x18acf3d6
	.long	3465142937              ; 0xce89e299
	.long	3030929376              ; 0xb4a84fe0
	.long	4245938359              ; 0xfd13e0b7
	.long	2093235073              ; 0x7cc43b81
	.long	3534596313              ; 0xd2ada8d9
	.long	375366246               ; 0x165fa266
	.long	2157278981              ; 0x80957705
	.long	2479649556              ; 0x93cc7314
	.long	555357303               ; 0x211a1477
	.long	3870105701              ; 0xe6ad2065
	.long	2008414854              ; 0x77b5fa86
	.long	3344188149              ; 0xc75442f5
	.long	4221384143              ; 0xfb9d35cf
	.long	3956125452              ; 0xebcdaf0c
	.long	2067696032              ; 0x7b3e89a0
	.long	3594591187              ; 0xd6411bd3
	.long	2921233993              ; 0xae1e7e49
	.long	2428461                 ; 0x250e2d
	.long	544322398               ; 0x2071b35e
	.long	577241275               ; 0x226800bb
	.long	1471733935              ; 0x57b8e0af
	.long	610547355               ; 0x2464369b
	.long	4027169054              ; 0xf009b91e
	.long	1432588573              ; 0x5563911d
	.long	1507829418              ; 0x59dfa6aa
	.long	2025931657              ; 0x78c14389
	.long	3646575487              ; 0xd95a537f
	.long	545086370               ; 0x207d5ba2
	.long	48609733                ; 0x2e5b9c5
	.long	2200306550              ; 0x83260376
	.long	1653985193              ; 0x6295cfa9
	.long	298326376               ; 0x11c81968
	.long	1316178497              ; 0x4e734a41
	.long	3007786442              ; 0xb3472dca
	.long	2064951626              ; 0x7b14a94a
	.long	458293330               ; 0x1b510052
	.long	2589141269              ; 0x9a532915
	.long	3591329599              ; 0xd60f573f
	.long	3164325604              ; 0xbc9bc6e4
	.long	727753846               ; 0x2b60a476
	.long	2179363840              ; 0x81e67400
	.long	146436021               ; 0x8ba6fb5
	.long	1461446943              ; 0x571be91f
	.long	4069977195              ; 0xf296ec6b
	.long	705550613               ; 0x2a0dd915
	.long	3059967265              ; 0xb6636521
	.long	3887724982              ; 0xe7b9f9b6
	.long	4281599278              ; 0xff34052e
	.long	3313849956              ; 0xc5855664
	.long	1404054877              ; 0x53b02d5d
	.long	2845806497              ; 0xa99f8fa1
	.long	146425753               ; 0x8ba4799
	.long	1854211946              ; 0x6e85076a
	.size	init_s0, 1024

	.type	.L.str.7,@object        ; @.str.7
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.7:
	.asciz	"s0[i]"
	.size	.L.str.7, 6

	.type	init_s1,@object         ; @init_s1
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_s1:
	.long	1266315497              ; 0x4b7a70e9
	.long	3048417604              ; 0xb5b32944
	.long	3681880366              ; 0xdb75092e
	.long	3289982499              ; 0xc4192623
	.long	2909710000              ; 0xad6ea6b0
	.long	1235738493              ; 0x49a7df7d
	.long	2632868024              ; 0x9cee60b8
	.long	2414719590              ; 0x8fedb266
	.long	3970600049              ; 0xecaa8c71
	.long	1771706367              ; 0x699a17ff
	.long	1449415276              ; 0x5664526c
	.long	3266420449              ; 0xc2b19ee1
	.long	422970021               ; 0x193602a5
	.long	1963543593              ; 0x75094c29
	.long	2690192192              ; 0xa0591340
	.long	3826793022              ; 0xe4183a3e
	.long	1062508698              ; 0x3f54989a
	.long	1531092325              ; 0x5b429d65
	.long	1804592342              ; 0x6b8fe4d6
	.long	2583117782              ; 0x99f73fd6
	.long	2714934279              ; 0xa1d29c07
	.long	4024971509              ; 0xefe830f5
	.long	1294809318              ; 0x4d2d38e6
	.long	4028980673              ; 0xf0255dc1
	.long	1289560198              ; 0x4cdd2086
	.long	2221992742              ; 0x8470eb26
	.long	1669523910              ; 0x6382e9c6
	.long	35572830                ; 0x21ecc5e
	.long	157838143               ; 0x9686b3f
	.long	1052438473              ; 0x3ebaefc9
	.long	1016535060              ; 0x3c971814
	.long	1802137761              ; 0x6b6a70a1
	.long	1753167236              ; 0x687f3584
	.long	1386275462              ; 0x52a0e286
	.long	3080475397              ; 0xb79c5305
	.long	2857371447              ; 0xaa500737
	.long	1040679964              ; 0x3e07841c
	.long	2145300060              ; 0x7fdeae5c
	.long	2390574316              ; 0x8e7d44ec
	.long	1461121720              ; 0x5716f2b8
	.long	2956646967              ; 0xb03ada37
	.long	4031777805              ; 0xf0500c0d
	.long	4028374788              ; 0xf01c1f04
	.long	33600511                ; 0x200b3ff
	.long	2920084762              ; 0xae0cf51a
	.long	1018524850              ; 0x3cb574b2
	.long	629373528               ; 0x25837a58
	.long	3691585981              ; 0xdc0921bd
	.long	3515945977              ; 0xd19113f9
	.long	2091462646              ; 0x7ca92ff6
	.long	2486323059              ; 0x94324773
	.long	586499841               ; 0x22f54701
	.long	988145025               ; 0x3ae5e581
	.long	935516892               ; 0x37c2dadc
	.long	3367335476              ; 0xc8b57634
	.long	2599673255              ; 0x9af3dda7
	.long	2839830854              ; 0xa9446146
	.long	265290510               ; 0xfd0030e
	.long	3972581182              ; 0xecc8c73e
	.long	2759138881              ; 0xa4751e41
	.long	3795373465              ; 0xe238cd99
	.long	1005194799              ; 0x3bea0e2f
	.long	847297441               ; 0x3280bba1
	.long	406762289               ; 0x183eb331
	.long	1314163512              ; 0x4e548b38
	.long	1332590856              ; 0x4f6db908
	.long	1866599683              ; 0x6f420d03
	.long	4127851711              ; 0xf60a04bf
	.long	750260880               ; 0x2cb81290
	.long	613907577               ; 0x24977c79
	.long	1450815602              ; 0x5679b072
	.long	3165620655              ; 0xbcaf89af
	.long	3734664991              ; 0xde9a771f
	.long	3650291728              ; 0xd9930810
	.long	3012275730              ; 0xb38bae12
	.long	3704569646              ; 0xdccf3f2e
	.long	1427272223              ; 0x5512721f
	.long	778793252               ; 0x2e6b7124
	.long	1343938022              ; 0x501adde6
	.long	2676280711              ; 0x9f84cd87
	.long	2052605720              ; 0x7a584718
	.long	1946737175              ; 0x7408da17
	.long	3164576444              ; 0xbc9f9abc
	.long	3914038668              ; 0xe94b7d8c
	.long	3967478842              ; 0xec7aec3a
	.long	3682934266              ; 0xdb851dfa
	.long	1661551462              ; 0x63094366
	.long	3294938066              ; 0xc464c3d2
	.long	4011595847              ; 0xef1c1847
	.long	840292616               ; 0x3215d908
	.long	3712170807              ; 0xdd433b37
	.long	616741398               ; 0x24c2ba16
	.long	312560963               ; 0x12a14d43
	.long	711312465               ; 0x2a65c451
	.long	1351876610              ; 0x50940002
	.long	322626781               ; 0x133ae4dd
	.long	1910503582              ; 0x71dff89e
	.long	271666773               ; 0x10314e55
	.long	2175563734              ; 0x81ac77d6
	.long	1594956187              ; 0x5f11199b
	.long	70604529                ; 0x43556f1
	.long	3617834859              ; 0xd7a3c76b
	.long	1007753275              ; 0x3c11183b
	.long	1495573769              ; 0x5924a509
	.long	4069517037              ; 0xf28fe6ed
	.long	2549218298              ; 0x97f1fbfa
	.long	2663038764              ; 0x9ebabf2c
	.long	504708206               ; 0x1e153c6e
	.long	2263041392              ; 0x86e34570
	.long	3941167025              ; 0xeae96fb1
	.long	2249088522              ; 0x860e5e0a
	.long	1514023603              ; 0x5a3e2ab3
	.long	1998579484              ; 0x771fe71c
	.long	1312622330              ; 0x4e3d06fa
	.long	694541497               ; 0x2965dcb9
	.long	2582060303              ; 0x99e71d0f
	.long	2151582166              ; 0x803e89d6
	.long	1382467621              ; 0x5266c825
	.long	776784248               ; 0x2e4cc978
	.long	2618340202              ; 0x9c10b36a
	.long	3323268794              ; 0xc6150eba
	.long	2497899128              ; 0x94e2ea78
	.long	2784771155              ; 0xa5fc3c53
	.long	503983604               ; 0x1e0a2df4
	.long	4076293799              ; 0xf2f74ea7
	.long	907881277               ; 0x361d2b3d
	.long	423175695               ; 0x1939260f
	.long	432175456               ; 0x19c27960
	.long	1378068232              ; 0x5223a708
	.long	4145222326              ; 0xf71312b6
	.long	3954048622              ; 0xebadfe6e
	.long	3938656102              ; 0xeac31f66
	.long	3820766613              ; 0xe3bc4595
	.long	2793130115              ; 0xa67bc883
	.long	2977904593              ; 0xb17f37d1
	.long	26017576                ; 0x18cff28
	.long	3274890735              ; 0xc332ddef
	.long	3194772133              ; 0xbe6c5aa5
	.long	1700274565              ; 0x65582185
	.long	1756076034              ; 0x68ab9802
	.long	4006520079              ; 0xeecea50f
	.long	3677328699              ; 0xdb2f953b
	.long	720338349               ; 0x2aef7dad
	.long	1533947780              ; 0x5b6e2f84
	.long	354530856               ; 0x1521b628
	.long	688349552               ; 0x29076170
	.long	3973924725              ; 0xecdd4775
	.long	1637815568              ; 0x619f1510
	.long	332179504               ; 0x13cca830
	.long	3949051286              ; 0xeb61bd96
	.long	53804574                ; 0x334fe1e
	.long	2852348879              ; 0xaa0363cf
	.long	3044236432              ; 0xb5735c90
	.long	1282449977              ; 0x4c70a239
	.long	3583942155              ; 0xd59e9e0b
	.long	3416972820              ; 0xcbaade14
	.long	4006381244              ; 0xeecc86bc
	.long	1617046695              ; 0x60622ca7
	.long	2628476075              ; 0x9cab5cab
	.long	3002303598              ; 0xb2f3846e
	.long	1686838959              ; 0x648b1eaf
	.long	431878346               ; 0x19bdf0ca
	.long	2686675385              ; 0xa02369b9
	.long	1700445008              ; 0x655abb50
	.long	1080580658              ; 0x40685a32
	.long	1009431731              ; 0x3c2ab4b3
	.long	832498133               ; 0x319ee9d5
	.long	3223435511              ; 0xc021b8f7
	.long	2605976345              ; 0x9b540b19
	.long	2271191193              ; 0x875fa099
	.long	2516031870              ; 0x95f7997e
	.long	1648197032              ; 0x623d7da8
	.long	4164389018              ; 0xf837889a
	.long	2548247927              ; 0x97e32d77
	.long	300782431               ; 0x11ed935f
	.long	375919233               ; 0x16681281
	.long	238389289               ; 0xe358829
	.long	3353747414              ; 0xc7e61fd6
	.long	2531188641              ; 0x96dedfa1
	.long	2019080857              ; 0x7858ba99
	.long	1475708069              ; 0x57f584a5
	.long	455242339               ; 0x1b227263
	.long	2609103871              ; 0x9b83c3ff
	.long	448939670               ; 0x1ac24696
	.long	3451063019              ; 0xcdb30aeb
	.long	1395535956              ; 0x532e3054
	.long	2413381860              ; 0x8fd948e4
	.long	1841049896              ; 0x6dbc3128
	.long	1491858159              ; 0x58ebf2ef
	.long	885456874               ; 0x34c6ffea
	.long	4264095073              ; 0xfe28ed61
	.long	4001119347              ; 0xee7c3c73
	.long	1565136089              ; 0x5d4a14d9
	.long	3898914787              ; 0xe864b7e3
	.long	1108368660              ; 0x42105d14
	.long	540939232               ; 0x203e13e0
	.long	1173283510              ; 0x45eee2b6
	.long	2745871338              ; 0xa3aaabea
	.long	3681308437              ; 0xdb6c4f15
	.long	4207628240              ; 0xfacb4fd0
	.long	3343053890              ; 0xc742f442
	.long	4016749493              ; 0xef6abbb5
	.long	1699691293              ; 0x654f3b1d
	.long	1103962373              ; 0x41cd2105
	.long	3625875870              ; 0xd81e799e
	.long	2256883143              ; 0x86854dc7
	.long	3830138730              ; 0xe44b476a
	.long	1031889488              ; 0x3d816250
	.long	3479347698              ; 0xcf62a1f2
	.long	1535977030              ; 0x5b8d2646
	.long	4236805024              ; 0xfc8883a0
	.long	3251091107              ; 0xc1c7b6a3
	.long	2132092099              ; 0x7f1524c3
	.long	1774941330              ; 0x69cb7492
	.long	1199868427              ; 0x47848a0b
	.long	1452454533              ; 0x5692b285
	.long	157007616               ; 0x95bbf00
	.long	2904115357              ; 0xad19489d
	.long	342012276               ; 0x1462b174
	.long	595725824               ; 0x23820e00
	.long	1480756522              ; 0x58428d2a
	.long	206960106               ; 0xc55f5ea
	.long	497939518               ; 0x1dadf43e
	.long	591360097               ; 0x233f7061
	.long	863170706               ; 0x3372f092
	.long	2375253569              ; 0x8d937e41
	.long	3596610801              ; 0xd65fecf1
	.long	1814182875              ; 0x6c223bdb
	.long	2094937945              ; 0x7cde3759
	.long	3421402208              ; 0xcbee7460
	.long	1082520231              ; 0x4085f2a7
	.long	3463918190              ; 0xce77326e
	.long	2785509508              ; 0xa6078084
	.long	435703966               ; 0x19f8509e
	.long	3908032597              ; 0xe8efd855
	.long	1641649973              ; 0x61d99735
	.long	2842273706              ; 0xa969a7aa
	.long	3305899714              ; 0xc50c06c2
	.long	1510255612              ; 0x5a04abfc
	.long	2148256476              ; 0x800bcadc
	.long	2655287854              ; 0x9e447a2e
	.long	3276092548              ; 0xc3453484
	.long	4258621189              ; 0xfdd56705
	.long	236887753               ; 0xe1e9ec9
	.long	3681803219              ; 0xdb73dbd3
	.long	274041037               ; 0x105588cd
	.long	1734335097              ; 0x675fda79
	.long	3815195456              ; 0xe3674340
	.long	3317970021              ; 0xc5c43465
	.long	1899903192              ; 0x713e38d8
	.long	1026095262              ; 0x3d28f89e
	.long	4050517792              ; 0xf16dff20
	.long	356393447               ; 0x153e21e7
	.long	2410691914              ; 0x8fb03d4a
	.long	3873677099              ; 0xe6e39f2b
	.long	3682840055              ; 0xdb83adf7
	.size	init_s1, 1024

	.type	.L.str.8,@object        ; @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"s1[i]"
	.size	.L.str.8, 6

	.type	init_s2,@object         ; @init_s2
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_s2:
	.long	3913112168              ; 0xe93d5a68
	.long	2491498743              ; 0x948140f7
	.long	4132185628              ; 0xf64c261c
	.long	2489919796              ; 0x94692934
	.long	1091903735              ; 0x411520f7
	.long	1979897079              ; 0x7602d4f7
	.long	3170134830              ; 0xbcf46b2e
	.long	3567386728              ; 0xd4a20068
	.long	3557303409              ; 0xd4082471
	.long	857797738               ; 0x3320f46a
	.long	1136121015              ; 0x43b7d4b7
	.long	1342202287              ; 0x500061af
	.long	507115054               ; 0x1e39f62e
	.long	2535736646              ; 0x97244546
	.long	337727348               ; 0x14214f74
	.long	3213592640              ; 0xbf8b8840
	.long	1301675037              ; 0x4d95fc1d
	.long	2528481711              ; 0x96b591af
	.long	1895095763              ; 0x70f4ddd3
	.long	1721773893              ; 0x66a02f45
	.long	3216771564              ; 0xbfbc09ec
	.long	62756741                ; 0x3bd9785
	.long	2142006736              ; 0x7fac6dd0
	.long	835421444               ; 0x31cb8504
	.long	2531993523              ; 0x96eb27b3
	.long	1442658625              ; 0x55fd3941
	.long	3659876326              ; 0xda2547e6
	.long	2882144922              ; 0xabca0a9a
	.long	676362277               ; 0x28507825
	.long	1392781812              ; 0x530429f4
	.long	170690266               ; 0xa2c86da
	.long	3921047035              ; 0xe9b66dfb
	.long	1759253602              ; 0x68dc1462
	.long	3611846912              ; 0xd7486900
	.long	1745797284              ; 0x680ec0a4
	.long	664899054               ; 0x27a18dee
	.long	1329594018              ; 0x4f3ffea2
	.long	3901205900              ; 0xe887ad8c
	.long	3045908486              ; 0xb58ce006
	.long	2062866102              ; 0x7af4d6b6
	.long	2865634940              ; 0xaace1e7c
	.long	3543621612              ; 0xd3375fec
	.long	3464012697              ; 0xce78a399
	.long	1080764994              ; 0x406b2a42
	.long	553557557               ; 0x20fe9e35
	.long	3656615353              ; 0xd9f385b9
	.long	3996768171              ; 0xee39d7ab
	.long	991055499               ; 0x3b124e8b
	.long	499776247               ; 0x1dc9faf7
	.long	1265440854              ; 0x4b6d1856
	.long	648242737               ; 0x26a36631
	.long	3940784050              ; 0xeae397b2
	.long	980351604               ; 0x3a6efa74
	.long	3713745714              ; 0xdd5b4332
	.long	1749149687              ; 0x6841e7f7
	.long	3396870395              ; 0xca7820fb
	.long	4211799374              ; 0xfb0af54e
	.long	3640570775              ; 0xd8feb397
	.long	1161844396              ; 0x454056ac
	.long	3125318951              ; 0xba489527
	.long	1431517754              ; 0x55533a3a
	.long	545492359               ; 0x20838d87
	.long	4268468663              ; 0xfe6ba9b7
	.long	3499529547              ; 0xd096954b
	.long	1437099964              ; 0x55a867bc
	.long	2702547544              ; 0xa1159a58
	.long	3433638243              ; 0xcca92963
	.long	2581715763              ; 0x99e1db33
	.long	2787789398              ; 0xa62a4a56
	.long	1060185593              ; 0x3f3125f9
	.long	1593081372              ; 0x5ef47e1c
	.long	2418618748              ; 0x9029317c
	.long	4260947970              ; 0xfdf8e802
	.long	69676912                ; 0x4272f70
	.long	2159744348              ; 0x80bb155c
	.long	86519011                ; 0x5282ce3
	.long	2512459080              ; 0x95c11548
	.long	3838209314              ; 0xe4c66d22
	.long	1220612927              ; 0x48c1133f
	.long	3339683548              ; 0xc70f86dc
	.long	133810670               ; 0x7f9c9ee
	.long	1090789135              ; 0x41041f0f
	.long	1078426020              ; 0x404779a4
	.long	1569222167              ; 0x5d886e17
	.long	845107691               ; 0x325f51eb
	.long	3583754449              ; 0xd59bc0d1
	.long	4072456591              ; 0xf2bcc18f
	.long	1091646820              ; 0x41113564
	.long	628848692               ; 0x257b7834
	.long	1613405280              ; 0x602a9c60
	.long	3757631651              ; 0xdff8e8a3
	.long	526609435               ; 0x1f636c1b
	.long	236106946               ; 0xe12b4c2
	.long	48312990                ; 0x2e1329e
	.long	2942717905              ; 0xaf664fd1
	.long	3402727701              ; 0xcad18115
	.long	1797494240              ; 0x6b2395e0
	.long	859738849               ; 0x333e92e1
	.long	992217954               ; 0x3b240b62
	.long	4005476642              ; 0xeebeb922
	.long	2243076622              ; 0x85b2a20e
	.long	3870952857              ; 0xe6ba0d99
	.long	3732016268              ; 0xde720c8c
	.long	765654824               ; 0x2da2f728
	.long	3490871365              ; 0xd0127845
	.long	2511836413              ; 0x95b794fd
	.long	1685915746              ; 0x647d0862
	.long	3888969200              ; 0xe7ccf5f0
	.long	1414112111              ; 0x5449a36f
	.long	2273134842              ; 0x877d48fa
	.long	3281911079              ; 0xc39dfd27
	.long	4080962846              ; 0xf33e8d1e
	.long	172450625               ; 0xa476341
	.long	2569994100              ; 0x992eff74
	.long	980381355               ; 0x3a6f6eab
	.long	4109958455              ; 0xf4f8fd37
	.long	2819808352              ; 0xa812dc60
	.long	2716589560              ; 0xa1ebddf8
	.long	2568741196              ; 0x991be14c
	.long	3681446669              ; 0xdb6e6b0d
	.long	3329971472              ; 0xc67b5510
	.long	1835478071              ; 0x6d672c37
	.long	660984891               ; 0x2765d43b
	.long	3704678404              ; 0xdcd0e804
	.long	4045999559              ; 0xf1290dc7
	.long	3422617507              ; 0xcc00ffa3
	.long	3040415634              ; 0xb5390f92
	.long	1762651403              ; 0x690fed0b
	.long	1719377915              ; 0x667b9ffb
	.long	3470491036              ; 0xcedb7d9c
	.long	2693910283              ; 0xa091cf0b
	.long	3642056355              ; 0xd9155ea3
	.long	3138596744              ; 0xbb132f88
	.long	1364962596              ; 0x515bad24
	.long	2073328063              ; 0x7b9479bf
	.long	1983633131              ; 0x763bd6eb
	.long	926494387               ; 0x37392eb3
	.long	3423689081              ; 0xcc115979
	.long	2150032023              ; 0x8026e297
	.long	4096667949              ; 0xf42e312d
	.long	1749200295              ; 0x6842ada7
	.long	3328846651              ; 0xc66a2b3b
	.long	309677260               ; 0x12754ccc
	.long	2016342300              ; 0x782ef11c
	.long	1779581495              ; 0x6a124237
	.long	3079819751              ; 0xb79251e7
	.long	111262694               ; 0x6a1bbe6
	.long	1274766160              ; 0x4bfb6350
	.long	443224088               ; 0x1a6b1018
	.long	298511866               ; 0x11caedfa
	.long	1025883608              ; 0x3d25bdd8
	.long	3806446537              ; 0xe2e1c3c9
	.long	1145181785              ; 0x44421659
	.long	168956806               ; 0xa121386
	.long	3641502830              ; 0xd90cec6e
	.long	3584813610              ; 0xd5abea2a
	.long	1689216846              ; 0x64af674e
	.long	3666258015              ; 0xda86a85f
	.long	3200248200              ; 0xbebfe988
	.long	1692713982              ; 0x64e4c3fe
	.long	2646376535              ; 0x9dbc8057
	.long	4042768518              ; 0xf0f7c086
	.long	1618508792              ; 0x60787bf8
	.long	1610833997              ; 0x6003604d
	.long	3523052358              ; 0xd1fd8346
	.long	4130873264              ; 0xf6381fb0
	.long	2001055236              ; 0x7745ae04
	.long	3610705100              ; 0xd736fccc
	.long	2202168115              ; 0x83426b33
	.long	4028541809              ; 0xf01eab71
	.long	2961195399              ; 0xb0804187
	.long	1006657119              ; 0x3c005e5f
	.long	2006996926              ; 0x77a057be
	.long	3186142756              ; 0xbde8ae24
	.long	1430667929              ; 0x55464299
	.long	3210227297              ; 0xbf582e61
	.long	1314452623              ; 0x4e58f48f
	.long	4074634658              ; 0xf2ddfda2
	.long	4101304120              ; 0xf474ef38
	.long	2273951170              ; 0x8789bdc2
	.long	1399257539              ; 0x5366f9c3
	.long	3367210612              ; 0xc8b38e74
	.long	3027628629              ; 0xb475f255
	.long	1190975929              ; 0x46fcd9b9
	.long	2062231137              ; 0x7aeb2661
	.long	2333990788              ; 0x8b1ddf84
	.long	2221543033              ; 0x846a0e79
	.long	2438960610              ; 0x915f95e2
	.long	1181637006              ; 0x466e598e
	.long	548689776               ; 0x20b45770
	.long	2362791313              ; 0x8cd55591
	.long	3372408396              ; 0xc902de4c
	.long	3104550113              ; 0xb90bace1
	.long	3145860560              ; 0xbb8205d0
	.long	296247880               ; 0x11a86248
	.long	1970579870              ; 0x7574a99e
	.long	3078560182              ; 0xb77f19b6
	.long	3769228297              ; 0xe0a9dc09
	.long	1714227617              ; 0x662d09a1
	.long	3291629107              ; 0xc4324633
	.long	3898220290              ; 0xe85a1f02
	.long	166772364               ; 0x9f0be8c
	.long	1251581989              ; 0x4a99a025
	.long	493813264               ; 0x1d6efe10
	.long	448347421               ; 0x1ab93d1d
	.long	195405023               ; 0xba5a4df
	.long	2709975567              ; 0xa186f20f
	.long	677966185               ; 0x2868f169
	.long	3703036547              ; 0xdcb7da83
	.long	1463355134              ; 0x573906fe
	.long	2715995803              ; 0xa1e2ce9b
	.long	1338867538              ; 0x4fcd7f52
	.long	1343315457              ; 0x50115e01
	.long	2802222074              ; 0xa70683fa
	.long	2684532164              ; 0xa002b5c4
	.long	233230375               ; 0xde6d027
	.long	2599980071              ; 0x9af88c27
	.long	2000651841              ; 0x773f8641
	.long	3277868038              ; 0xc3604c06
	.long	1638401717              ; 0x61a806b5
	.long	4028070440              ; 0xf0177a28
	.long	3237316320              ; 0xc0f586e0
	.long	6314154                 ; 0x6058aa
	.long	819756386               ; 0x30dc7d62
	.long	300326615               ; 0x11e69ed7
	.long	590932579               ; 0x2338ea63
	.long	1405279636              ; 0x53c2dd94
	.long	3267499572              ; 0xc2c21634
	.long	3150704214              ; 0xbbcbee56
	.long	2428286686              ; 0x90bcb6de
	.long	3959192993              ; 0xebfc7da1
	.long	3461946742              ; 0xce591d76
	.long	1862657033              ; 0x6f05e409
	.long	1266418056              ; 0x4b7c0188
	.long	963775037               ; 0x39720a3d
	.long	2089974820              ; 0x7c927c24
	.long	2263052895              ; 0x86e3725f
	.long	1917689273              ; 0x724d9db9
	.long	448879540               ; 0x1ac15bb4
	.long	3550394620              ; 0xd39eb8fc
	.long	3981727096              ; 0xed545578
	.long	150775221               ; 0x8fca5b5
	.long	3627908307              ; 0xd83d7cd3
	.long	1303187396              ; 0x4dad0fc4
	.long	508620638               ; 0x1e50ef5e
	.long	2975983352              ; 0xb161e6f8
	.long	2726630617              ; 0xa28514d9
	.long	1817252668              ; 0x6c51133c
	.long	1876281319              ; 0x6fd5c7e7
	.long	1457606340              ; 0x56e14ec4
	.long	908771278               ; 0x362abfce
	.long	3720792119              ; 0xddc6c837
	.long	3617206836              ; 0xd79a3234
	.long	2455994898              ; 0x92638212
	.long	1729034894              ; 0x670efa8e
	.long	1080033504              ; 0x406000e0
	.size	init_s2, 1024

	.type	.L.str.9,@object        ; @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"s2[i]"
	.size	.L.str.9, 6

	.type	init_s3,@object         ; @init_s3
	.section	.ro_nv_vars,"a",@progbits
	.align	1
init_s3:
	.long	976866871               ; 0x3a39ce37
	.long	3556439503              ; 0xd3faf5cf
	.long	2881648439              ; 0xabc27737
	.long	1522871579              ; 0x5ac52d1b
	.long	1555064734              ; 0x5cb0679e
	.long	1336096578              ; 0x4fa33742
	.long	3548522304              ; 0xd3822740
	.long	2579274686              ; 0x99bc9bbe
	.long	3574697629              ; 0xd5118e9d
	.long	3205460757              ; 0xbf0f7315
	.long	3593280638              ; 0xd62d1c7e
	.long	3338716283              ; 0xc700c47b
	.long	3079412587              ; 0xb78c1b6b
	.long	564236357               ; 0x21a19045
	.long	2993598910              ; 0xb26eb1be
	.long	1781952180              ; 0x6a366eb4
	.long	1464380207              ; 0x5748ab2f
	.long	3163844217              ; 0xbc946e79
	.long	3332601554              ; 0xc6a376d2
	.long	1699332808              ; 0x6549c2c8
	.long	1393555694              ; 0x530ff8ee
	.long	1183702653              ; 0x468dde7d
	.long	3581086237              ; 0xd5730a1d
	.long	1288719814              ; 0x4cd04dc6
	.long	691649499               ; 0x2939bbdb
	.long	2847557200              ; 0xa9ba4650
	.long	2895455976              ; 0xac9526e8
	.long	3193889540              ; 0xbe5ee304
	.long	2717570544              ; 0xa1fad5f0
	.long	1781354906              ; 0x6a2d519a
	.long	1676643554              ; 0x63ef8ce2
	.long	2592534050              ; 0x9a86ee22
	.long	3230253752              ; 0xc089c2b8
	.long	1126444790              ; 0x43242ef6
	.long	2770207658              ; 0xa51e03aa
	.long	2633158820              ; 0x9cf2d0a4
	.long	2210423226              ; 0x83c061ba
	.long	2615765581              ; 0x9be96a4d
	.long	2414155088              ; 0x8fe51550
	.long	3127139286              ; 0xba645bd6
	.long	673620729               ; 0x2826a2f9
	.long	2805611233              ; 0xa73a3ae1
	.long	1269405062              ; 0x4ba99586
	.long	4015350505              ; 0xef5562e9
	.long	3341807571              ; 0xc72fefd3
	.long	4149409754              ; 0xf752f7da
	.long	1057255273              ; 0x3f046f69
	.long	2012875353              ; 0x77fa0a59
	.long	2162469141              ; 0x80e4a915
	.long	2276492801              ; 0x87b08601
	.long	2601117357              ; 0x9b09e6ad
	.long	993977747               ; 0x3b3ee593
	.long	3918593370              ; 0xe990fd5a
	.long	2654263191              ; 0x9e34d797
	.long	753973209               ; 0x2cf0b7d9
	.long	36408145                ; 0x22b8b51
	.long	2530585658              ; 0x96d5ac3a
	.long	25011837                ; 0x17da67d
	.long	3520020182              ; 0xd1cf3ed6
	.long	2088578344              ; 0x7c7d2d28
	.long	530523599               ; 0x1f9f25cf
	.long	2918365339              ; 0xadf2b89b
	.long	1524020338              ; 0x5ad6b472
	.long	1518925132              ; 0x5a88f54c
	.long	3760827505              ; 0xe029ac71
	.long	3759777254              ; 0xe019a5e6
	.long	1202760957              ; 0x47b0acfd
	.long	3985898139              ; 0xed93fa9b
	.long	3906192525              ; 0xe8d3c48d
	.long	674977740               ; 0x283b57cc
	.long	4174734889              ; 0xf8d56629
	.long	2031300136              ; 0x79132e28
	.long	2019492241              ; 0x785f0191
	.long	3983892565              ; 0xed756055
	.long	4153806404              ; 0xf7960e44
	.long	3822280332              ; 0xe3d35e8c
	.long	352677332               ; 0x15056dd4
	.long	2297720250              ; 0x88f46dba
	.long	60907813                ; 0x3a16125
	.long	90501309                ; 0x564f0bd
	.long	3286998549              ; 0xc3eb9e15
	.long	1016092578              ; 0x3c9057a2
	.long	2535922412              ; 0x97271aec
	.long	2839152426              ; 0xa93a072a
	.long	457141659               ; 0x1b3f6d9b
	.long	509813237               ; 0x1e6321f5
	.long	4120667899              ; 0xf59c66fb
	.long	652014361               ; 0x26dcf319
	.long	1966332200              ; 0x7533d928
	.long	2975202805              ; 0xb155fdf5
	.long	55981186                ; 0x3563482
	.long	2327461051              ; 0x8aba3cbb
	.long	676427537               ; 0x28517711
	.long	3255491064              ; 0xc20ad9f8
	.long	2882294119              ; 0xabcc5167
	.long	3433927263              ; 0xccad925f
	.long	1307055953              ; 0x4de81751
	.long	942726286               ; 0x3830dc8e
	.long	933058658               ; 0x379d5862
	.long	2468411793              ; 0x9320f991
	.long	3933900994              ; 0xea7a90c2
	.long	4215176142              ; 0xfb3e7bce
	.long	1361170020              ; 0x5121ce64
	.long	2001714738              ; 0x774fbe32
	.long	2830558078              ; 0xa8b6e37e
	.long	3274259782              ; 0xc3293d46
	.long	1222529897              ; 0x48de5369
	.long	1679025792              ; 0x6413e680
	.long	2729314320              ; 0xa2ae0810
	.long	3714953764              ; 0xdd6db224
	.long	1770335741              ; 0x69852dfd
	.long	151462246               ; 0x9072166
	.long	3013232138              ; 0xb39a460a
	.long	1682292957              ; 0x6445c0dd
	.long	1483529935              ; 0x586cdecf
	.long	471910574               ; 0x1c20c8ae
	.long	1539241949              ; 0x5bbef7dd
	.long	458788160               ; 0x1b588d40
	.long	3436315007              ; 0xccd2017f
	.long	1807016891              ; 0x6bb4e3bb
	.long	3718408830              ; 0xdda26a7e
	.long	978976581               ; 0x3a59ff45
	.long	1043663428              ; 0x3e350a44
	.long	3165965781              ; 0xbcb4cdd5
	.long	1927990952              ; 0x72eacea8
	.long	4200891579              ; 0xfa6484bb
	.long	2372276910              ; 0x8d6612ae
	.long	3208408903              ; 0xbf3c6f47
	.long	3533431907              ; 0xd29be463
	.long	1412390302              ; 0x542f5d9e
	.long	2931980059              ; 0xaec2771b
	.long	4132332400              ; 0xf64e6370
	.long	1947078029              ; 0x740e0d8d
	.long	3881505623              ; 0xe75b1357
	.long	4168226417              ; 0xf8721671
	.long	2941484381              ; 0xaf537d5d
	.long	1077988104              ; 0x4040cb08
	.long	1320477388              ; 0x4eb4e2cc
	.long	886195818               ; 0x34d2466a
	.long	18198404                ; 0x115af84
	.long	3786409000              ; 0xe1b00428
	.long	2509781533              ; 0x95983a1d
	.long	112762804               ; 0x6b89fb4
	.long	3463356488              ; 0xce6ea048
	.long	1866414978              ; 0x6f3f3b82
	.long	891333506               ; 0x3520ab82
	.long	18488651                ; 0x11a1d4b
	.long	661792760               ; 0x277227f8
	.long	1628790961              ; 0x611560b1
	.long	3885187036              ; 0xe7933fdc
	.long	3141171499              ; 0xbb3a792b
	.long	876946877               ; 0x344525bd
	.long	2693282273              ; 0xa08839e1
	.long	1372485963              ; 0x51ce794b
	.long	791857591               ; 0x2f32c9b7
	.long	2686433993              ; 0xa01fbac9
	.long	3759982718              ; 0xe01cc87e
	.long	3167212022              ; 0xbcc7d1f6
	.long	3472953795              ; 0xcf0111c3
	.long	2716379847              ; 0xa1e8aac7
	.long	445679433               ; 0x1a908749
	.long	3561995674              ; 0xd44fbd9a
	.long	3504004811              ; 0xd0dadecb
	.long	3574258232              ; 0xd50ada38
	.long	54117162                ; 0x339c32a
	.long	3331405415              ; 0xc6913667
	.long	2381918588              ; 0x8df9317c
	.long	3769707343              ; 0xe0b12b4f
	.long	4154350007              ; 0xf79e59b7
	.long	1140177722              ; 0x43f5bb3a
	.long	4074052095              ; 0xf2d519ff
	.long	668550556               ; 0x27d9459c
	.long	3214352940              ; 0xbf97222c
	.long	367459370               ; 0x15e6fc2a
	.long	261225585               ; 0xf91fc71
	.long	2610173221              ; 0x9b941525
	.long	4209349473              ; 0xfae59361
	.long	3468074219              ; 0xceb69ceb
	.long	3265815641              ; 0xc2a86459
	.long	314222801               ; 0x12baa8d1
	.long	3066103646              ; 0xb6c1075e
	.long	3808782860              ; 0xe3056a0c
	.long	282218597               ; 0x10d25065
	.long	3406013506              ; 0xcb03a442
	.long	3773591054              ; 0xe0ec6e0e
	.long	379116347               ; 0x1698db3b
	.long	1285071038              ; 0x4c98a0be
	.long	846784868               ; 0x3278e964
	.long	2669647154              ; 0x9f1f9532
	.long	3771962079              ; 0xe0d392df
	.long	3550491691              ; 0xd3a0342b
	.long	2305946142              ; 0x8971f21e
	.long	453669953               ; 0x1b0a7441
	.long	1268987020              ; 0x4ba3348c
	.long	3317592352              ; 0xc5be7120
	.long	3279303384              ; 0xc37632d8
	.long	3744833421              ; 0xdf359f8d
	.long	2610507566              ; 0x9b992f2e
	.long	3859509063              ; 0xe60b6f47
	.long	266596637               ; 0xfe3f11d
	.long	3847019092              ; 0xe54cda54
	.long	517658769               ; 0x1edad891
	.long	3462560207              ; 0xce6279cf
	.long	3443424879              ; 0xcd3e7e6f
	.long	370717030               ; 0x1618b166
	.long	4247526661              ; 0xfd2c1d05
	.long	2224018117              ; 0x848fd2c5
	.long	4143653529              ; 0xf6fb2299
	.long	4112773975              ; 0xf523f357
	.long	2788324899              ; 0xa6327623
	.long	2477274417              ; 0x93a83531
	.long	1456262402              ; 0x56cccd02
	.long	2901442914              ; 0xacf08162
	.long	1517677493              ; 0x5a75ebb5
	.long	1846949527              ; 0x6e163697
	.long	2295493580              ; 0x88d273cc
	.long	3734397586              ; 0xde966292
	.long	2176403920              ; 0x81b949d0
	.long	1280348187              ; 0x4c50901b
	.long	1908823572              ; 0x71c65614
	.long	3871786941              ; 0xe6c6c7bd
	.long	846861322               ; 0x327a140a
	.long	1172426758              ; 0x45e1d006
	.long	3287448474              ; 0xc3f27b9a
	.long	3383383037              ; 0xc9aa53fd
	.long	1655181056              ; 0x62a80f00
	.long	3139813346              ; 0xbb25bfe2
	.long	901632758               ; 0x35bdd2f6
	.long	1897031941              ; 0x71126905
	.long	2986607138              ; 0xb2040222
	.long	3066810236              ; 0xb6cbcf7c
	.long	3447102507              ; 0xcd769c2b
	.long	1393639104              ; 0x53113ec0
	.long	373351379               ; 0x1640e3d3
	.long	950779232               ; 0x38abbd60
	.long	625454576               ; 0x2547adf0
	.long	3124240540              ; 0xba38209c
	.long	4148612726              ; 0xf746ce76
	.long	2007998917              ; 0x77afa1c5
	.long	544563296               ; 0x20756060
	.long	2244738638              ; 0x85cbfe4e
	.long	2330496472              ; 0x8ae88dd8
	.long	2058025392              ; 0x7aaaf9b0
	.long	1291430526              ; 0x4cf9aa7e
	.long	424198748               ; 0x1948c25c
	.long	50039436                ; 0x2fb8a8c
	.long	29584100                ; 0x1c36ae4
	.long	3605783033              ; 0xd6ebe1f9
	.long	2429876329              ; 0x90d4f869
	.long	2791104160              ; 0xa65cdea0
	.long	1057563949              ; 0x3f09252d
	.long	3255363231              ; 0xc208e69f
	.long	3075367218              ; 0xb74e6132
	.long	3463963227              ; 0xce77e25b
	.long	1469046755              ; 0x578fdfe3
	.long	985887462               ; 0x3ac372e6
	.size	init_s3, 1024

	.type	.L.str.10,@object       ; @.str.10
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.10:
	.asciz	"s3[i]"
	.size	.L.str.10, 6

	.type	.L.str.11,@object       ; @.str.11
.L.str.11:
	.asciz	"ukey[d++]"
	.size	.L.str.11, 10

	.type	.L.str.12,@object       ; @.str.12
.L.str.12:
	.asciz	"input[0]"
	.size	.L.str.12, 9

	.type	.L.str.13,@object       ; @.str.13
.L.str.13:
	.asciz	"input[1]"
	.size	.L.str.13, 9

	.type	.L.str.14,@object       ; @.str.14
.L.str.14:
	.asciz	"next_task"
	.size	.L.str.14, 10

	.type	.L.str.15,@object       ; @.str.15
.L.str.15:
	.asciz	"key[index2-2]"
	.size	.L.str.15, 14

	.type	.L.str.16,@object       ; @.str.16
.L.str.16:
	.asciz	"key[index2-1]"
	.size	.L.str.16, 14

	.type	.L.str.17,@object       ; @.str.17
.L.str.17:
	.asciz	"s0[index2-20]"
	.size	.L.str.17, 14

	.type	.L.str.18,@object       ; @.str.18
.L.str.18:
	.asciz	"s0[index2-19]"
	.size	.L.str.18, 14

	.type	.L.str.19,@object       ; @.str.19
.L.str.19:
	.asciz	"s1[index2-(256+20)]"
	.size	.L.str.19, 20

	.type	.L.str.20,@object       ; @.str.20
.L.str.20:
	.asciz	"s1[index2-(256+19)]"
	.size	.L.str.20, 20

	.type	.L.str.21,@object       ; @.str.21
.L.str.21:
	.asciz	"s2[index2-(256*2+20)]"
	.size	.L.str.21, 22

	.type	.L.str.22,@object       ; @.str.22
.L.str.22:
	.asciz	"s2[index2-(256*2+19)]"
	.size	.L.str.22, 22

	.type	.L.str.23,@object       ; @.str.23
.L.str.23:
	.asciz	"s3[index2-(256*3+20)]"
	.size	.L.str.23, 22

	.type	.L.str.24,@object       ; @.str.24
.L.str.24:
	.asciz	"s3[index2-(256*3+19)]"
	.size	.L.str.24, 22

	.type	.L.str.25,@object       ; @.str.25
.L.str.25:
	.asciz	"key[index]"
	.size	.L.str.25, 11

	.type	.L.str.26,@object       ; @.str.26
.L.str.26:
	.asciz	"s0[(r>>24L)]"
	.size	.L.str.26, 13

	.type	.L.str.27,@object       ; @.str.27
.L.str.27:
	.asciz	"s1[((r>>16L)&0xff)]"
	.size	.L.str.27, 20

	.type	.L.str.28,@object       ; @.str.28
.L.str.28:
	.asciz	"s2[((r>> 8L)&0xff)]"
	.size	.L.str.28, 20

	.type	.L.str.29,@object       ; @.str.29
.L.str.29:
	.asciz	"s3[((r )&0xff)]"
	.size	.L.str.29, 16

	.type	.L.str.30,@object       ; @.str.30
.L.str.30:
	.asciz	"key[17]"
	.size	.L.str.30, 8

	.type	indata,@object          ; @indata
	.section	.ro_nv_vars,"a",@progbits
indata:
	.ascii	"Hello, world!"
	.size	indata, 13

	.type	.L.str.31,@object       ; @.str.31
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.31:
	.asciz	"result[index2]"
	.size	.L.str.31, 15

	.type	.L.str.32,@object       ; @.str.32
.L.str.32:
	.asciz	"result: %x\r\n"
	.size	.L.str.32, 13

	.type	.L.str.33,@object       ; @.str.33
.L.str.33:
	.asciz	"iv[n]"
	.size	.L.str.33, 6

	.type	.L.str.34,@object       ; @.str.34
.L.str.34:
	.asciz	"TIME end is 65536*%u+%u\r\n"
	.size	.L.str.34, 26

	.type	.L.str.35,@object       ; @.str.35
.L.str.35:
	.asciz	".%u.\r\n"
	.size	.L.str.35, 7

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
