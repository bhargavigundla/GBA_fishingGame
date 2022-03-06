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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFish.part.0, %function
drawFish.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	ip, .L9
	sub	sp, sp, #12
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0, #8]
	ldr	r5, .L9+4
	ldr	r0, [r0, #12]
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L8
.L2:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L8:
	ldrh	ip, [r4, #32]
	mvn	ip, ip
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	cmp	r2, #0
	add	r0, r2, #3
	movge	r0, r2
	cmp	r3, #0
	add	r1, r3, #3
	movge	r1, r3
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	ldr	lr, [r4, #4]
	str	ip, [sp]
	ldr	ip, [r4]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	asr	r2, r2, #1
	add	r0, lr, r0, asr #2
	asr	r3, r3, #1
	add	r1, ip, r1, asr #2
	mov	lr, pc
	bx	r5
	b	.L2
.L10:
	.align	2
.L9:
	.word	29522
	.word	drawRect
	.size	drawFish.part.0, .-drawFish.part.0
	.align	2
	.global	initHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHook, %function
initHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #23
	mvn	r4, #44288
	mov	lr, #20
	mov	r0, #118
	mov	r1, #1
	mov	r2, #5
	ldr	r3, .L13
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #36]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	hook
	.size	initHook, .-initHook
	.align	2
	.global	updateHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHook, %function
updateHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L16
	ldr	r3, .L28+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	cmp	r2, r1
	subge	r2, r2, r1
	str	r2, [r3, #4]
	bx	lr
.L16:
	ldrh	r2, [r3, #48]
	tst	r2, #16
	bne	.L19
	ldr	r3, .L28+4
	ldr	r2, [r3, #4]
	ldr	r0, [r3, #16]
	ldr	r1, [r3, #28]
	rsb	ip, r0, #240
	add	r1, r2, r1
	cmp	r1, ip
	addle	r2, r2, r0
	str	r2, [r3, #4]
	bx	lr
.L19:
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L27
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L28+4
	add	r0, r3, #20
	ldr	r2, [r3]
	ldm	r0, {r0, r1}
	add	r1, r2, r1
	rsb	ip, r0, #160
	cmp	r1, ip
	addle	r2, r2, r0
	str	r2, [r3]
	bx	lr
.L27:
	ldr	r3, .L28+4
	ldr	r2, [r3]
	ldr	r1, [r3, #20]
	cmp	r2, r1
	cmpge	r2, #23
	subgt	r2, r2, r1
	str	r2, [r3]
	bx	lr
.L29:
	.align	2
.L28:
	.word	67109120
	.word	hook
	.size	updateHook, .-updateHook
	.align	2
	.global	initFishies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFishies, %function
initFishies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #0
	mov	r10, #8
	mov	r9, #1
	ldr	r4, .L36
	ldr	r7, .L36+4
	ldr	fp, .L36+8
	sub	sp, sp, #12
.L32:
	str	r10, [r4, #24]
	str	r10, [r4, #28]
	mov	lr, pc
	bx	r7
	ldr	r3, .L36+12
	smull	r2, r3, r0, r3
	asr	r2, r0, #31
	rsb	r3, r2, r3, asr #4
	rsb	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #2
	rsb	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	add	r3, r3, #23
	str	r3, [r4]
	mov	lr, pc
	bx	r7
	ands	r3, r8, #1
	moveq	r1, #1
	mvnne	r1, #0
	ldr	r2, .L36+16
	smull	ip, r2, r0, r2
	str	r3, [sp, #4]
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	ldr	r2, [r4]
	sub	r3, r0, r3, lsl #5
	str	r2, [r4, #8]
	str	r3, [r4, #4]
	str	r3, [r4, #12]
	str	r1, [r4, #16]
	str	r9, [r4, #20]
	mov	lr, pc
	bx	r7
	mov	r5, r0
	mov	lr, pc
	bx	r7
	mov	r6, r0
	mov	lr, pc
	bx	r7
	mov	lr, #0
	smull	r2, ip, fp, r0
	smull	r2, r1, fp, r6
	ldr	r2, .L36+20
	smull	r3, r2, r5, r2
	add	ip, ip, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #4
	rsb	r3, r3, r3, lsl #5
	add	r1, r1, r6
	sub	r0, r0, r3
	asr	r3, r6, #31
	add	r2, r2, r5
	rsb	r1, r3, r1, asr #4
	asr	r3, r5, #31
	rsb	r2, r3, r2, asr #4
	rsb	r1, r1, r1, lsl #5
	lsl	r0, r0, #10
	sub	r6, r6, r1
	rsb	r2, r2, r2, lsl #4
	ldr	r3, [sp, #4]
	add	r8, r8, #1
	orr	r6, r0, r6, lsl #5
	sub	r5, r5, r2, lsl #1
	orr	r5, r6, r5
	cmp	r8, #8
	str	r3, [r4, #44]
	str	r9, [r4, #36]
	strh	r5, [r4, #32]	@ movhi
	str	lr, [r4, #40]
	add	r4, r4, #48
	bne	.L32
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	fishies
	.word	rand
	.word	-2078209981
	.word	789879043
	.word	1717986919
	.word	-2004318071
	.size	initFishies, .-initFishies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #5
	mov	ip, #23
	mov	lr, #20
	mov	r0, #118
	mov	r1, #1
	mvn	r4, #44288
	ldr	r3, .L40
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	ip, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bl	initFishies
	mov	r2, #8
	ldr	r3, .L40+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	hook
	.word	fishiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFish, %function
updateFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #16
	beq	.L50
	mov	r4, r0
	ldr	r2, .L58
	ldr	r3, .L58+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	ldr	r1, [r0]
	ldr	r3, [r0, #24]
	ldr	r2, [r4, #28]
	ldr	r0, [r0, #4]
	beq	.L56
.L45:
	ldr	ip, .L58+8
	ldr	lr, [ip, #24]
	ldr	r5, [ip, #28]
	str	lr, [sp, #12]
	ldr	lr, [ip]
	ldr	ip, [ip, #4]
	str	r5, [sp, #8]
	stm	sp, {ip, lr}
	ldr	r5, .L58+12
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L57
.L50:
	mov	r5, #0
.L42:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	mov	r3, #67108864
	ldr	r5, [r4, #44]
	ldr	r1, .L58+16
	ldr	r2, .L58+20
	cmp	r5, #0
	strh	r1, [r3, #104]	@ movhi
	movne	r5, #1
	strh	r2, [r3, #108]	@ movhi
	bne	.L42
	ldr	r6, .L58+24
	mov	lr, pc
	bx	r6
	mov	r7, r0
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	lr, pc
	bx	r6
	mov	r3, r0
	ldr	r1, .L58+28
	smull	r2, r0, r1, r3
	ldr	r2, .L58+32
	smull	ip, r1, r8, r1
	smull	ip, r2, r7, r2
	add	lr, r0, r3
	asr	r0, r3, #31
	add	ip, r1, r8
	rsb	r0, r0, lr, asr #4
	asr	r1, r8, #31
	rsb	r0, r0, r0, lsl #5
	rsb	r1, r1, ip, asr #4
	add	ip, r2, r7
	asr	r2, r7, #31
	rsb	r1, r1, r1, lsl #5
	rsb	r2, r2, ip, asr #4
	sub	r3, r3, r0
	ldr	r0, .L58+36
	sub	r8, r8, r1
	rsb	r2, r2, r2, lsl #4
	lsl	r3, r3, #10
	sub	r7, r7, r2, lsl #1
	orr	r3, r3, r8, lsl #5
	ldr	r2, [r0]
	orr	r3, r3, r7
	strh	r3, [r4, #32]	@ movhi
	add	r3, r2, #1
	str	r3, [r0]
	mov	lr, pc
	bx	r6
	ldr	r3, .L58+40
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	rsb	r2, r3, r3, lsl #3
	add	r3, r3, r2, lsl #2
	rsb	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	add	r3, r3, #23
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, .L58+44
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #5
	str	r0, [r4, #4]
	b	.L42
.L56:
	cmp	r1, #23
	ldr	ip, [r4, #16]
	ble	.L46
	add	lr, r1, r3
	cmp	lr, #160
	bgt	.L46
.L47:
	cmp	r0, #0
	ldr	lr, [r4, #20]
	ble	.L48
	add	r5, r0, r2
	cmp	r5, #239
	ble	.L49
.L48:
	rsb	lr, lr, #0
	str	lr, [r4, #20]
.L49:
	add	r1, r1, ip
	add	r0, r0, lr
	str	r1, [r4]
	str	r0, [r4, #4]
	b	.L45
.L46:
	rsb	ip, ip, #0
	str	ip, [r4, #16]
	b	.L47
.L59:
	.align	2
.L58:
	.word	wait
	.word	.LANCHOR0
	.word	hook
	.word	collision
	.word	-2176
	.word	-14373
	.word	rand
	.word	-2078209981
	.word	-2004318071
	.word	score
	.word	789879043
	.word	1717986919
	.size	updateFish, .-updateFish
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L73
	ldr	r1, .L73+4
	ldr	r3, [r2]
	ldr	r1, [r1]
	cmp	r3, r1
	movne	r1, #1
	rsbeq	r1, r3, #0
	push	{r4, r5, r6, lr}
	add	r3, r3, r1
	str	r3, [r2]
	mov	r4, #0
	bl	updateHook
	ldr	r5, .L73+8
.L62:
	mov	r0, r5
	add	r4, r4, #1
	bl	updateFish
	cmp	r4, #8
	beq	.L60
	cmp	r0, #1
	add	r5, r5, #48
	bne	.L62
.L64:
	cmp	r4, #7
	add	r4, r4, #2
	beq	.L60
	cmp	r4, #8
	bne	.L64
.L60:
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	wait
	.word	.LANCHOR0
	.word	fishies
	.size	updateGame, .-updateGame
	.align	2
	.global	drawFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFish, %function
drawFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L77
	ldr	r3, .L77+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	bxne	lr
	b	drawFish.part.0
.L78:
	.align	2
.L77:
	.word	wait
	.word	.LANCHOR0
	.size	drawFish, .-drawFish
	.align	2
	.global	swapDifficulty
	.syntax unified
	.arm
	.fpu softvfp
	.type	swapDifficulty, %function
swapDifficulty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L82
	ldr	r2, [r3]
	cmp	r2, #0
	moveq	r0, #2
	movne	r0, #0
	mov	r1, #0
	ldr	r2, .L82+4
	str	r0, [r3]
	str	r1, [r2]
	bx	lr
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
	.word	wait
	.size	swapDifficulty, .-swapDifficulty
	.align	2
	.global	enableEasyMode
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableEasyMode, %function
enableEasyMode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L85
	str	r2, [r3]
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.size	enableEasyMode, .-enableEasyMode
	.align	2
	.global	enableHardMode
	.syntax unified
	.arm
	.fpu softvfp
	.type	enableHardMode, %function
enableHardMode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L88
	str	r2, [r3]
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
	.size	enableHardMode, .-enableHardMode
	.align	2
	.global	drawFishingLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFishingLine, %function
drawFishingLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L95
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, [r3, #12]
	ldr	r4, [r3]
	ldr	r5, [r3, #4]
	ldr	r1, [r3, #8]
	sub	r4, r4, #1
	ldr	r3, .L95+4
	add	r0, r0, #2
	mov	lr, pc
	bx	r3
	cmp	r4, #0
	blt	.L90
	ldr	r7, .L95+8
	ldr	r6, .L95+12
	add	r5, r5, #2
.L92:
	mov	r1, r4
	mov	r2, r6
	mov	r0, r5
	sub	r4, r4, #1
	mov	lr, pc
	bx	r7
	cmn	r4, #1
	bne	.L92
.L90:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	hook
	.word	resetBackground
	.word	setPixel
	.word	14814
	.size	drawFishingLine, .-drawFishingLine
	.align	2
	.global	drawHook
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHook, %function
drawHook:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	ip, .L103
	ldr	r7, .L103+4
	sub	sp, sp, #12
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #28]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	str	ip, [sp]
	ldr	r4, .L103+8
	mov	lr, pc
	bx	r4
	ldr	r9, .L103+12
	ldm	r7, {r3, r6}
	ldr	r8, .L103+16
.L99:
	mov	r4, r3
	mov	r5, r9
.L98:
	mov	r1, r4
	ldrh	r2, [r5], #10
	mov	r0, r6
	mov	lr, pc
	bx	r8
	ldr	r3, [r7]
	add	r4, r4, #1
	add	r2, r3, #4
	cmp	r2, r4
	bge	.L98
	ldr	r2, [r7, #4]
	add	r6, r6, #1
	add	r2, r2, #4
	cmp	r2, r6
	add	r9, r9, #2
	bge	.L99
	bl	drawFishingLine
	ldm	r7, {r2, r3}
	str	r2, [r7, #8]
	str	r3, [r7, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	29522
	.word	hook
	.word	drawRect
	.word	.LANCHOR0+4
	.word	setPixel
	.size	drawHook, .-drawHook
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L111
	bl	drawHook
	ldr	r7, .L111+4
	ldr	r6, .L111+8
	add	r5, r4, #384
	b	.L107
.L106:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L110
.L107:
	ldr	r2, [r7]
	ldr	r3, [r6]
	cmp	r2, r3
	bne	.L106
	mov	r0, r4
	add	r4, r4, #48
	bl	drawFish.part.0
	cmp	r4, r5
	bne	.L107
.L110:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	fishies
	.word	wait
	.word	.LANCHOR0
	.size	drawGame, .-drawGame
	.global	hookMap
	.comm	score,4,4
	.comm	fishiesRemaining,4,4
	.comm	fishies,384,4
	.comm	hook,40,4
	.global	maxWait
	.comm	wait,4,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	maxWait, %object
	.size	maxWait, 4
maxWait:
	.word	2
	.type	hookMap, %object
	.size	hookMap, 50
hookMap:
	.short	0
	.short	0
	.short	21247
	.short	0
	.short	0
	.short	21247
	.short	0
	.short	21247
	.short	0
	.short	21247
	.short	21247
	.short	0
	.short	21247
	.short	0
	.short	21247
	.short	21247
	.short	0
	.short	21247
	.short	0
	.short	21247
	.short	21247
	.short	21247
	.short	21247
	.short	21247
	.short	21247
	.ident	"GCC: (devkitARM release 53) 9.1.0"
