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
	.file	"text.c"
	.text
	.align	2
	.global	drawChar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	mov	fp, r3
	mov	r6, #0
	ldr	r9, .L13
	sub	sp, sp, #12
	add	r2, r2, r2, lsl #1
	str	r0, [sp, #4]
	ldr	r8, .L13+4
	add	r9, r9, r2, lsl #4
.L2:
	mov	r4, #6
	ldr	r3, [sp, #4]
	add	r5, r9, r6
	add	r7, r3, r4
	b	.L4
.L3:
	subs	r4, r4, #1
	beq	.L12
.L4:
	ldrb	ip, [r5], #1	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L3
	sub	r0, r7, r4
	mov	r2, fp
	mov	r1, r10
	mov	lr, pc
	bx	r8
	subs	r4, r4, #1
	bne	.L4
.L12:
	add	r6, r6, #6
	cmp	r6, #48
	add	r10, r10, #1
	bne	.L2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	drawString
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L15
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L17:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	bl	drawChar
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L17
.L15:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawString, .-drawString
	.align	2
	.global	drawCharWithBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCharWithBackground, %function
drawCharWithBackground:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	mov	r7, #0
	ldr	fp, .L31
	add	r2, r2, r2, lsl #1
	sub	sp, sp, #12
	mov	r8, r3
	add	r3, fp, r2, lsl #4
	str	r0, [sp]
	str	r3, [sp, #4]
	ldrh	r9, [sp, #48]
	ldr	r6, .L31+4
	add	r5, r0, #6
.L24:
	ldr	r3, [sp, #4]
	ldr	r4, [sp]
	add	fp, r3, r7
.L27:
	ldrb	r3, [fp], #1	@ zero_extendqisi2
	cmp	r3, #0
	movne	r2, r8
	moveq	r2, r9
	mov	r0, r4
	mov	r1, r10
	add	r4, r4, #1
	mov	lr, pc
	bx	r6
	cmp	r5, r4
	bne	.L27
	add	r7, r7, #6
	cmp	r7, #48
	add	r10, r10, #1
	bne	.L24
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawCharWithBackground, .-drawCharWithBackground
	.align	2
	.global	drawStringWithBackground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStringWithBackground, %function
drawStringWithBackground:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	sp, sp, #8
	cmp	r2, #0
	ldrh	r8, [sp, #32]
	beq	.L33
	mov	r4, r0
	mov	r7, r1
	mov	r6, r3
.L35:
	mov	r0, r4
	mov	r3, r6
	mov	r1, r7
	str	r8, [sp]
	bl	drawCharWithBackground
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L35
.L33:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
	.size	drawStringWithBackground, .-drawStringWithBackground
	.ident	"GCC: (devkitARM release 53) 9.1.0"
