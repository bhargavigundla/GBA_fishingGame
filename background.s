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
	.file	"background.c"
	.text
	.align	2
	.global	drawWave
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWave, %function
drawWave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r1
	mov	r6, r0
	mov	r7, #0
	ldr	fp, .L11
	ldr	r10, .L11+4
	add	r8, r1, #10
.L2:
	mov	r5, r9
	mov	r3, #0
	b	.L4
.L3:
	add	r5, r5, #1
	cmp	r8, r5
	beq	.L10
.L4:
	rsb	r1, r3, r3, lsl #4
	cmp	r6, #239
	add	r1, r1, r7
	bgt	.L3
	ldr	r1, [fp, r1, lsl #2]
	add	r4, r3, #1
	cmp	r1, r10
	movne	r3, r4
	bne	.L3
	mov	r1, r5
	ldr	r3, .L11+8
	mov	r2, r10
	mov	r0, r6
	add	r5, r5, #1
	mov	lr, pc
	bx	r3
	cmp	r8, r5
	mov	r3, r4
	bne	.L4
.L10:
	add	r7, r7, #1
	cmp	r7, #15
	add	r6, r6, #1
	bne	.L2
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	29330
	.word	setPixel
	.size	drawWave, .-drawWave
	.align	2
	.global	drawBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBackground, %function
drawBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	ldr	r2, [r3]
	mov	r3, r2
	push	{r4, lr}
	ldr	r0, .L21+4
	add	r1, r2, #8640
.L14:
	strh	r0, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L14
	ldr	r1, .L21+8
	add	r2, r2, #76800
.L15:
	strh	r1, [r3], #2	@ movhi
	cmp	r2, r3
	bne	.L15
	mov	r4, #0
.L16:
	mov	r0, r4
	mov	r1, #13
	add	r4, r4, #15
	bl	drawWave
	cmp	r4, #240
	bne	.L16
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	videoBuffer
	.word	32731
	.word	29522
	.size	drawBackground, .-drawBackground
	.align	2
	.global	resetBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetBackground, %function
resetBackground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L35
	smull	r2, r3, r0, r3
	asr	r7, r0, #31
	add	r3, r3, r0
	rsb	r7, r7, r3, asr #3
	rsb	r7, r7, r7, lsl #4
	subs	r6, r1, #0
	sub	r7, r0, r7
	ble	.L23
	mov	r1, #0
	ldr	r2, .L35+4
	mov	fp, r0
	mov	r5, r1
	mov	r9, r2
	ldr	r8, .L35+8
	ldr	r10, .L35+12
	b	.L24
.L26:
	cmp	r4, #22
	movgt	r2, r10
	bgt	.L25
	ldr	r2, .L35+16
	rsb	r3, r5, r5, lsl #4
	add	r3, r3, r7
	ldr	r3, [r2, r3, lsl #2]
	cmp	r3, #0
	ldr	r2, .L35+20
	moveq	r2, r10
	add	r5, r5, #1
.L25:
	mov	r1, r4
.L24:
	add	r4, r1, #1
	mov	r0, fp
	mov	lr, pc
	bx	r8
	cmp	r6, r4
	beq	.L23
	cmp	r4, #12
	movle	r2, r9
	ble	.L25
	cmp	r4, #17
	bgt	.L26
	ldr	r2, .L35+16
	rsb	r3, r5, r5, lsl #4
	add	r3, r3, r7
	ldr	r3, [r2, r3, lsl #2]
	cmp	r3, #0
	ldr	r2, .L35+20
	add	r5, r5, #1
	moveq	r2, r9
	b	.L25
.L23:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	-2004318071
	.word	32731
	.word	setPixel
	.word	29522
	.word	.LANCHOR0
	.word	29330
	.size	resetBackground, .-resetBackground
	.global	wave
	.comm	NOTES,2,2
	.comm	maxWait,4,4
	.comm	wait,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	wave, %object
	.size	wave, 600
wave:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	29330
	.word	29330
	.word	29330
	.word	29330
	.ident	"GCC: (devkitARM release 53) 9.1.0"
