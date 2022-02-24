	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"press START to play\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	r1, .L4+4
	ldr	r2, .L4+8
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+16
	mov	r1, #70
	mov	r0, #63
	ldr	r3, .L4+20
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	score
	.word	waitForVBlank
	.word	drawBackground
	.word	drawString
	.word	32767
	.word	.LC0
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L11
	ldr	r3, .L11+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r2, .L22+4
	ldr	r0, [r3]
	ldrh	r2, [r2]
	add	r0, r0, #1
	tst	r2, #8
	str	r0, [r3]
	bxeq	lr
	ldr	r3, .L22+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L22+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L22+16
	ldr	r3, .L22+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	seed
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.word	initGame
	.size	start, .-start
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L25
	ldr	r2, .L38+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L37
.L25:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L37:
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L38+8
	ldr	r3, .L38+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L45
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L46:
	.align	2
.L45:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L53:
	.align	2
.L52:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	drawStartString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStartString, %function
drawStartString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #70
	ldr	r4, .L56
	mov	r0, #63
	ldr	r3, .L56+4
	ldr	r2, .L56+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	drawString
	.word	32767
	.word	.LC0
	.size	drawStartString, .-drawStartString
	.align	2
	.global	calculateCenter
	.syntax unified
	.arm
	.fpu softvfp
	.type	calculateCenter, %function
calculateCenter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r0, r0, r0, lsl #2
	lsl	r0, r0, #1
	add	r0, r0, #240
	asr	r0, r0, #1
	bx	lr
	.size	calculateCenter, .-calculateCenter
	.align	2
	.global	printScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	printScore, %function
printScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L61
	ldr	r3, .L61+4
	ldr	r1, [r2]
	smull	r0, r2, r3, r1
	mov	r0, #0
	asr	ip, r1, #31
	rsb	r2, ip, r2, asr #2
	push	{r4, lr}
	smull	r4, lr, r3, r2
	ldr	r4, .L61+8
	smull	r3, r4, r1, r4
	asr	r3, r2, #31
	rsb	r3, r3, lr, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3, lsl #1
	add	r2, r2, r2, lsl #2
	ldr	lr, .L61+12
	sub	r2, r1, r2, lsl #1
	rsb	ip, ip, r4, asr #5
	ldr	r1, .L61+16
	ldr	r4, .L61+20
	sub	sp, sp, #24
	add	r3, r3, #48
	add	r2, r2, #48
	str	r1, [sp]
	strb	r3, [sp, #19]
	strb	r2, [sp, #20]
	strb	r0, [sp, #21]
	str	r4, [sp, #12]
	add	ip, ip, #48
	mov	r1, #3
	mov	r0, #93
	ldr	r3, .L61+24
	ldr	r4, .L61+28
	strh	lr, [sp, #16]	@ movhi
	add	r2, sp, #12
	strb	ip, [sp, #18]
	mov	lr, pc
	bx	r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	score
	.word	1717986919
	.word	1374389535
	.word	14917
	.word	32731
	.word	1380926291
	.word	29330
	.word	drawStringWithBackground
	.size	printScore, .-printScore
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"paused\000"
	.text
	.align	2
	.global	drawPauseString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPauseString, %function
drawPauseString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #70
	ldr	r4, .L65
	mov	r0, #102
	ldr	r3, .L65+4
	ldr	r2, .L65+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	printScore
.L66:
	.align	2
.L65:
	.word	drawString
	.word	32767
	.word	.LC1
	.size	drawPauseString, .-drawPauseString
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, lr}
	ldr	r2, .L69
	ldr	r3, .L69+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawPauseString
.L70:
	.align	2
.L69:
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"you win!\000"
	.text
	.align	2
	.global	drawWinString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWinString, %function
drawWinString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #70
	ldr	r4, .L73
	mov	r0, #96
	ldr	r3, .L73+4
	ldr	r2, .L73+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	printScore
.L74:
	.align	2
.L73:
	.word	drawString
	.word	32767
	.word	.LC2
	.size	drawWinString, .-drawWinString
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #3
	push	{r4, lr}
	ldr	r2, .L77
	ldr	r3, .L77+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawWinString
.L78:
	.align	2
.L77:
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"game over\000"
	.align	2
.LC4:
	.ascii	"press start to return to menu\000"
	.text
	.align	2
	.global	drawLoseString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLoseString, %function
drawLoseString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L81
	ldr	r4, .L81+4
	mov	r3, r5
	mov	r1, #60
	mov	r0, #93
	ldr	r2, .L81+8
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r1, #70
	mov	r0, #33
	ldr	r2, .L81+12
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	printScore
.L82:
	.align	2
.L81:
	.word	32767
	.word	drawString
	.word	.LC3
	.word	.LC4
	.size	drawLoseString, .-drawLoseString
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, lr}
	ldr	r2, .L85
	ldr	r3, .L85+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawLoseString
.L86:
	.align	2
.L85:
	.word	state
	.word	waitForVBlank
	.word	drawBackground
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	ldr	r4, .L104+4
	beq	.L100
	mov	lr, pc
	bx	r4
	ldr	r3, .L104+8
	mov	lr, pc
	bx	r3
	bl	printScore
.L90:
	ldr	r5, .L104+12
	ldrh	r3, [r5]
	tst	r3, #4
	beq	.L91
	ldr	r2, .L104+16
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L101
.L91:
	tst	r3, #1
	beq	.L87
	ldr	r3, .L104+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L102
.L87:
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	mov	lr, pc
	bx	r4
	ldr	r2, .L104+20
	ldr	r3, .L104+24
	ldr	r2, [r2]
	cmp	r2, r3
	beq	.L103
	mov	r2, #4
	ldr	r3, .L104+28
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L104+32
	mov	lr, pc
	bx	r3
	bl	drawLoseString
	b	.L90
.L102:
	ldr	r3, .L104+36
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L101:
	mov	r2, #2
	ldr	r3, .L104+28
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L104+32
	mov	lr, pc
	bx	r3
	bl	drawPauseString
	ldrh	r3, [r5]
	b	.L91
.L103:
	mov	r2, #3
	ldr	r3, .L104+28
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L104+32
	mov	lr, pc
	bx	r3
	bl	drawWinString
	b	.L90
.L105:
	.align	2
.L104:
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	score
	.word	999
	.word	state
	.word	drawBackground
	.word	swapDifficulty
	.size	game, .-game
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"Debugging Initialized\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r0, .L125+4
	ldr	r3, .L125+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L125+12
	ldr	r6, .L125+16
	ldr	fp, .L125+20
	strh	r2, [r3]	@ movhi
	ldr	r10, .L125+24
	mov	lr, pc
	bx	r10
	ldr	r5, .L125+28
	ldr	r2, [r6]
	ldrh	r1, [fp]
	ldr	r9, .L125+32
	ldr	r8, .L125+36
	ldr	r7, .L125+40
	ldr	r4, .L125+44
.L108:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L117
.L110:
	.word	.L114
	.word	.L113
	.word	.L112
	.word	.L111
	.word	.L109
.L109:
	tst	r1, #8
	beq	.L117
	tst	r3, #8
	beq	.L116
.L117:
	mov	r1, r3
	b	.L108
.L111:
	tst	r1, #4
	beq	.L117
	tst	r3, #4
	bne	.L117
.L116:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L108
.L112:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L108
.L114:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L108
.L113:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r1, [fp]
	b	.L108
.L126:
	.align	2
.L125:
	.word	mgba_open
	.word	.LC5
	.word	mgba_printf
	.word	1027
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	67109120
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	maxWait,4,4
	.comm	wait,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
