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
	.type	drawSwordfish.part.0, %function
drawSwordfish.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L14
	ldr	r2, .L14+4
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #20]
	ldr	r2, [r2]
	add	r1, r3, r1
	cmp	r1, r2
	push	{r4, lr}
	ble	.L12
	add	r1, r2, #159
	cmp	r3, r1
	ble	.L10
.L12:
	ldr	r2, .L14+8
	ldr	r1, .L14+12
.L2:
	ldr	ip, .L14+16
	ldr	r3, [r1]
	ldrh	lr, [ip]
	ldr	r1, [r0]
	ldr	ip, .L14+20
	ldr	r4, [r0, #24]
	sub	r1, r1, lr
	cmp	r4, #1
	and	r1, r1, ip
	mvnne	r1, r1, lsl #18
	mvnne	r1, r1, lsr #18
	sub	r3, r3, lr
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orreq	r1, r1, #53248
	andeq	r3, r3, ip
	strheq	r1, [r2, #162]	@ movhi
	strhne	r1, [r2, #162]	@ movhi
	ldr	r1, [r0, #56]
	orreq	r3, r3, #4096
	andne	r3, r3, ip
	strheq	r3, [r2, #170]	@ movhi
	strhne	r3, [r2, #170]	@ movhi
	cmp	r1, #0
	moveq	r1, #69
	ldr	r3, [r0, #36]
	lsl	r3, r3, #23
	add	r3, r3, #458752
	lsr	r3, r3, #16
	lslne	r3, r3, #22
	lsrne	r3, r3, #22
	lsleq	r3, r3, #22
	ldrne	r1, .L14+24
	orrne	r3, r3, #4096
	lsreq	r3, r3, #22
	strh	r3, [r2, #164]	@ movhi
	strh	r1, [r2, #172]	@ movhi
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	r1, .L14+12
	lsl	r2, r2, #16
	ldr	ip, [r1, #4]
	lsr	r2, r2, #16
	sub	r3, r3, r2
	sub	ip, ip, r2
	and	r3, r3, #255
	ldr	r2, .L14+8
	and	ip, ip, #255
	orr	r3, r3, #16384
	orr	ip, ip, #16384
	strh	r3, [r2, #160]	@ movhi
	strh	ip, [r2, #168]	@ movhi
	b	.L2
.L15:
	.align	2
.L14:
	.word	swordfishBoss
	.word	vOff
	.word	shadowOAM
	.word	sword
	.word	hOff
	.word	511
	.word	4165
	.size	drawSwordfish.part.0, .-drawSwordfish.part.0
	.align	2
	.global	initJellyfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	initJellyfish, %function
initJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L20
	push	{r4, lr}
	mov	r1, #16
	mov	r3, r2
	mov	r4, #3
	mov	lr, #15
	mov	ip, #0
	add	r0, r2, #84
.L17:
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r4, [r3, #24]
	str	lr, [r3, #16]
	str	ip, [r3, #20]
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L17
	mov	lr, #130
	mov	r3, #420
	mov	ip, #190
	mov	r0, #250
	mov	r1, #180
	str	lr, [r2]
	str	ip, [r2, #4]
	str	r3, [r2, #28]
	str	r3, [r2, #60]
	str	r0, [r2, #32]
	str	r1, [r2, #56]
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	jelly
	.size	initJellyfish, .-initJellyfish
	.global	__aeabi_idivmod
	.align	2
	.global	updateJellyfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateJellyfish, %function
updateJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #60
	mov	r10, #15
	ldr	r4, .L33
	ldr	r5, .L33+4
	ldr	r8, .L33+8
	ldr	r6, .L33+12
	ldr	r9, .L33+16
	sub	sp, sp, #20
	add	r7, r4, #84
.L26:
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #16]
	cmp	r0, #0
	strne	fp, [r6]
	subs	r3, r3, #1
	strne	r3, [r4, #16]
	bne	.L25
	ldr	r0, [r4, #20]
	str	r10, [r4, #16]
	ldr	r1, [r4, #24]
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	str	r1, [r4, #20]
.L25:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L26
	ldr	r3, [r6]
	cmp	r3, #0
	subgt	r3, r3, #1
	strgt	r3, [r6]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	jelly
	.word	player
	.word	collision
	.word	reverseTimer
	.word	__aeabi_idivmod
	.size	updateJellyfish, .-updateJellyfish
	.align	2
	.global	drawJellyfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawJellyfish, %function
drawJellyfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L40
	ldr	r3, .L40+4
	ldr	ip, [r2]
	ldr	r1, .L40+8
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r0, .L40+12
	lsl	r7, ip, #16
	ldrh	r6, [r3]
	ldr	r5, .L40+16
	ldr	r4, .L40+20
	lsr	r7, r7, #16
	add	r8, ip, #159
	add	lr, r1, #84
.L37:
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #12]
	add	r3, r2, r3
	cmp	r3, ip
	ble	.L36
	cmp	r2, r8
	suble	r2, r2, r7
	andle	r2, r2, #255
	strhle	r2, [r0]	@ movhi
.L36:
	ldr	r2, [r1]
	ldr	r3, [r1, #20]
	sub	r2, r2, r6
	lsl	r3, r3, #6
	and	r2, r2, r5
	add	r3, r3, #23
	add	r1, r1, #28
	orr	r2, r2, #16384
	and	r3, r3, r4
	cmp	lr, r1
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	add	r0, r0, #8
	bne	.L37
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	vOff
	.word	hOff
	.word	jelly
	.word	shadowOAM+480
	.word	511
	.word	1023
	.size	drawJellyfish, .-drawJellyfish
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #50
	mov	lr, #24
	mov	r2, #0
	mov	ip, #16
	mov	r0, #2
	ldr	r3, .L44
	str	lr, [r3, #16]
	str	r1, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #40]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L112
	ldrh	r3, [r3]
	ldr	r5, .L112+4
	tst	r3, #512
	ldrh	r2, [r5]
	sub	sp, sp, #16
	beq	.L47
	tst	r2, #512
	beq	.L104
.L47:
	ldr	r4, .L112+8
	lsr	r3, r2, #6
	ldr	r1, [r4, #4]
	eor	r3, r3, #1
	cmp	r1, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	ldr	r0, [r4]
	bne	.L105
.L49:
	tst	r2, #128
	ldr	r3, [r4, #20]
	bne	.L54
	rsb	ip, r3, #512
	cmp	ip, r1
	bge	.L106
.L54:
	tst	r2, #32
	ldr	r6, [r4, #8]
	bne	.L59
	cmp	r0, #0
	blt	.L59
	ldr	r2, .L112+12
	ldr	lr, [r2]
	cmp	lr, #0
	movne	lr, #1
	ldr	ip, .L112+16
	ldr	r2, [ip]
	addne	r2, r2, lr
	subeq	r2, r2, #1
	str	r2, [ip]
	ldr	r2, .L112+20
	subeq	r0, r0, #2
	addne	r0, r0, #2
	ldr	r2, [r2]
	str	lr, [r4, #24]
	str	r0, [r4]
	sub	ip, r0, r6
	add	lr, r2, r1, lsl #9
	ldrb	lr, [lr, ip]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L103
	add	lr, r3, r1
	sub	lr, lr, #1
	add	r2, r2, lr, lsl #9
	ldrb	r2, [r2, ip]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L63
.L103:
	ldrh	r2, [r5]
.L59:
	ands	ip, r2, #16
	ldr	r2, [r4, #16]
	bne	.L64
	rsb	lr, r2, #512
	cmp	lr, r0
	bge	.L107
.L64:
	ldr	r5, [r4, #12]
	rsb	lr, r2, #240
	add	r0, r0, r6
	rsb	ip, r3, #160
	add	lr, lr, lr, lsr #31
	add	r1, r1, r5
	sub	lr, r0, lr, asr #1
	ldr	r5, .L112+24
	ldr	r6, .L112+28
	add	ip, ip, ip, lsr #31
	sub	ip, r1, ip, asr #1
	cmp	lr, #0
	stm	r4, {r0, r1}
	str	ip, [r5]
	str	lr, [r6]
	blt	.L108
	cmp	ip, #0
	blt	.L109
	cmp	lr, #272
	movgt	lr, #272
	strgt	lr, [r6]
.L68:
	cmp	ip, #352
	movgt	ip, #352
	strgt	ip, [r5]
.L71:
	ldr	r5, .L112+32
	ldr	ip, [r5, #44]
	cmp	ip, #0
	bne	.L110
.L46:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	ldr	lr, .L112+12
	ldr	lr, [lr]
	cmp	lr, #0
	moveq	ip, #1
	ldr	r5, .L112+16
	ldr	lr, [r5]
	str	ip, [r4, #24]
	addeq	lr, lr, ip
	ldr	ip, .L112+20
	addeq	r0, r0, #2
	subne	r0, r0, #2
	subne	lr, lr, #1
	str	lr, [r5]
	ldr	r5, [ip]
	add	lr, r3, r1
	add	ip, r2, r0
	str	r0, [r4]
	sub	lr, lr, #1
	sub	ip, ip, #1
	add	lr, r5, lr, lsl #9
	add	ip, ip, r6
	ldrb	lr, [lr, ip]	@ zero_extendqisi2
	cmp	lr, #0
	beq	.L64
	add	r5, r5, r1, lsl #9
	ldrb	ip, [r5, ip]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L64
	ldr	r2, .L112+36
	ldr	r3, [r2]
	ldr	r1, .L112+40
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	add	r2, r4, #16
	ldm	r4, {r0, r1, r6}
	ldm	r2, {r2, r3}
	b	.L64
.L104:
	tst	r3, #256
	beq	.L47
	ands	r3, r2, #256
	bne	.L48
	ldr	r1, .L112+44
	ldr	r0, [r1]
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r1]
	beq	.L47
.L48:
	cmp	r3, #0
	bne	.L47
	ldr	r1, .L112+44
	ldr	r0, [r1]
	cmp	r0, #0
	strne	r3, [r1]
	b	.L47
.L106:
	ldr	r2, .L112+12
	ldr	ip, .L112+48
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	r2, [ip]
	addeq	r2, r2, #1
	subne	r2, r2, #1
	str	r2, [ip]
	addeq	r1, r1, #2
	subne	r1, r1, #2
	ldr	ip, .L112+20
	ldr	lr, [r4, #12]
	add	r2, r3, r1
	ldr	ip, [ip]
	sub	r2, r2, #1
	str	r1, [r4, #4]
	add	r2, r2, lr
	add	r2, ip, r2, lsl #9
	ldrb	ip, [r2, r0]	@ zero_extendqisi2
	cmp	ip, #0
	add	r2, r2, r0
	beq	.L102
	ldr	ip, [r4, #16]
	add	r2, r2, ip
	ldrb	r2, [r2, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L58
.L102:
	ldrh	r2, [r5]
	b	.L54
.L109:
	mov	ip, #0
	cmp	lr, #272
	str	ip, [r5]
	ble	.L71
	mov	ip, #272
	ldr	r5, .L112+32
	str	ip, [r6]
	ldr	ip, [r5, #44]
	cmp	ip, #0
	beq	.L46
.L110:
	add	ip, r5, #16
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5, #4]
	str	ip, [sp, #8]
	ldr	ip, [r5]
	ldr	r6, .L112+52
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L111
.L74:
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L46
	ldr	r3, .L112+56
	ldr	r0, [r3, #20]
	ldr	r1, [r3, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L46
	ldr	r3, .L112+40
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	mov	lr, #0
	cmp	ip, lr
	str	lr, [r6]
	strlt	lr, [r5]
	bge	.L68
	b	.L71
.L105:
	ldr	r3, .L112+12
	ldr	r2, .L112+48
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r3, [r2]
	subeq	r3, r3, #1
	addne	r3, r3, #1
	str	r3, [r2]
	ldr	r3, .L112+20
	ldr	r2, [r4, #12]
	subeq	r1, r1, #2
	addne	r1, r1, #2
	ldr	r3, [r3]
	sub	r2, r1, r2
	str	r1, [r4, #4]
	add	r3, r3, r2, lsl #9
	ldrb	r2, [r3, r0]	@ zero_extendqisi2
	cmp	r2, #0
	add	r3, r3, r0
	beq	.L101
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	ldrb	r3, [r3, #-1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L53
.L101:
	ldrh	r2, [r5]
	b	.L49
.L111:
	ldr	r3, .L112+40
	mov	lr, pc
	bx	r3
	b	.L74
.L53:
	ldr	r2, .L112+36
	ldr	r3, [r2]
	ldr	r1, .L112+40
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r2, [r5]
	ldm	r4, {r0, r1}
	b	.L49
.L63:
	ldr	r2, .L112+36
	ldr	r3, [r2]
	ldr	r1, .L112+40
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r2, [r5]
	ldm	r4, {r0, r1, r6}
	ldr	r3, [r4, #20]
	b	.L59
.L58:
	ldr	r2, .L112+36
	ldr	r3, [r2]
	ldr	r1, .L112+40
	sub	r3, r3, #1
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldrh	r2, [r5]
	ldm	r4, {r0, r1}
	ldr	r3, [r4, #20]
	b	.L54
.L113:
	.align	2
.L112:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	reverseTimer
	.word	hOff1
	.word	collisionMap
	.word	vOff
	.word	hOff
	.word	swordfishBoss
	.word	playerHealth
	.word	goToLose
	.word	cheatEnabled
	.word	vOff1
	.word	collision
	.word	sword
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L117
	ldr	r3, .L117+4
	ldr	r2, [r1, #4]
	ldr	r0, [r3]
	sub	r2, r2, r0
	ldr	r3, [r1]
	ldr	r0, [r1, #24]
	and	r2, r2, #255
	ldr	r1, .L117+8
	orr	r2, r2, #16384
	strh	r2, [r1]	@ movhi
	mov	r2, #0
	ldr	ip, .L117+12
	ldr	ip, [ip]
	sub	r3, r3, ip
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmp	r0, #0
	orreq	r3, r3, #36864
	orrne	r3, r3, #32768
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	bx	lr
.L118:
	.align	2
.L117:
	.word	player
	.word	vOff
	.word	shadowOAM
	.word	hOff
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initSwordfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSwordfish, %function
initSwordfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #90
	mov	r1, #0
	mov	r0, #1
	mov	r8, #80
	mov	r6, #32
	mov	r5, #4
	mov	r2, #5
	mov	r4, #16
	mov	lr, #8
	mov	ip, #154
	ldr	r3, .L121
	str	r7, [r3]
	add	r7, r7, #280
	str	r8, [r3, #16]
	str	r7, [r3, #4]
	str	r6, [r3, #20]
	str	r5, [r3, #40]
	str	r2, [r3, #32]
	strb	r1, [r3, #60]
	ldr	r2, .L121+4
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #36]
	str	r1, [r3, #52]
	str	r0, [r3, #44]
	str	r0, [r3, #24]
	ldr	r3, .L121+8
	str	r4, [r2, #16]
	str	lr, [r2, #20]
	str	r0, [r2, #24]
	str	ip, [r2]
	str	r3, [r2, #4]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L122:
	.align	2
.L121:
	.word	swordfishBoss
	.word	sword
	.word	386
	.size	initSwordfish, .-initSwordfish
	.align	2
	.global	updateSwordfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSwordfish, %function
updateSwordfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L163
	ldr	r3, [r4, #56]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #56]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	sub	sp, sp, #20
	beq	.L157
	ldr	r5, .L163+4
	ldr	r3, [r5, #44]
	cmp	r3, #0
	bne	.L160
.L157:
	ldr	r3, .L163+8
	ldr	r3, [r3]
.L126:
	cmp	r3, #0
	ble	.L130
.L134:
	ldrb	r3, [r4, #60]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L135
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ldrne	r2, [r4, #16]
	ldr	r3, [r4]
	addne	r3, r3, r2
	ldr	r2, .L163+12
	ldr	ip, [r4, #4]
	ldr	r2, [r2, #4]
	cmp	ip, r2
	ldr	r2, .L163+16
	sub	r3, r3, #16
	mov	r0, #0
	str	r3, [r2]
	moveq	r3, #1
	ldr	r1, .L163+20
	strbeq	r3, [r4, #60]
	str	r0, [r1]
.L123:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L135:
	cmp	r3, #1
	beq	.L161
	cmp	r3, #2
	bne	.L123
	ldr	r3, [r4, #32]
	subs	r3, r3, #1
	strne	r3, [r4, #32]
	bne	.L148
	mov	r2, #5
	ldr	r0, [r4, #36]
	ldr	r3, .L163+24
	ldr	r1, [r4, #40]
	str	r2, [r4, #32]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L148:
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L162
	cmp	r3, #0
	bne	.L123
	ldr	r2, [r4]
	cmp	r2, #109
	ble	.L123
	sub	r1, r2, #4
	cmp	r1, #109
	str	r1, [r4]
	movle	r1, #1
	ldr	r0, .L163+16
	sub	r2, r2, #20
	str	r2, [r0]
	ldrle	r2, .L163+20
	strble	r3, [r4, #60]
	strle	r1, [r4, #24]
	strle	r3, [r2]
	b	.L123
.L160:
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	ldr	r2, [r5, #4]
	ldr	r3, [r5]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r6, .L163+28
	mov	lr, pc
	bx	r6
	subs	r7, r0, #0
	beq	.L128
	mov	r3, #0
	ldr	r2, .L163+32
	ldr	r2, [r2]
	cmp	r2, r3
	str	r3, [r5, #44]
	beq	.L129
	ldr	r2, .L163+8
	str	r3, [r2]
.L130:
	mov	r3, #0
	ldr	r1, .L163+16
	ldr	r2, .L163+36
	str	r3, [r4, #44]
	str	r3, [r1, #44]
	mov	lr, pc
	bx	r2
	b	.L134
.L161:
	ldr	r2, .L163+20
	ldr	r3, [r4, #32]
	ldr	r5, [r2]
	subs	r3, r3, #1
	add	r5, r5, #1
	str	r5, [r2]
	strne	r3, [r4, #32]
	bne	.L142
	mov	r2, #10
	ldr	r0, [r4, #36]
	ldr	r3, .L163+24
	ldr	r1, [r4, #40]
	str	r2, [r4, #32]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L142:
	ldr	r2, .L163+12
	ldr	r3, [r4, #4]
	ldr	r2, [r2, #4]
	ldr	r1, .L163+16
	cmp	r3, r2
	ldr	r2, [r1, #4]
	bge	.L143
	add	r3, r3, #1
	add	r2, r2, #1
	str	r3, [r4, #4]
	str	r2, [r1, #4]
.L144:
	cmp	r5, #10
	movgt	r3, #2
	strbgt	r3, [r4, #60]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L143:
	ldr	r0, [r4, #24]
	sub	r2, r2, #1
	sub	r3, r3, #1
	cmp	r0, #0
	str	r3, [r4, #4]
	str	r2, [r1, #4]
	ldr	r3, [r4]
	ldrne	r2, [r4, #16]
	addne	r3, r3, r2
	sub	r3, r3, #16
	str	r3, [r1]
	b	.L144
.L128:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L157
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L157
	ldr	ip, .L163+16
	add	r8, r5, #16
	ldm	r8, {r8, r9}
	add	r2, ip, #16
	ldm	ip, {r0, r1}
	ldr	lr, [r5, #4]
	ldm	r2, {r2, r3}
	str	r9, [sp, #12]
	str	r8, [sp, #8]
	ldr	ip, [r5]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L157
	ldr	r2, .L163+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r7, [r5, #44]
	str	r3, [r2]
	b	.L126
.L129:
	mov	r1, #1
	ldr	r2, .L163+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #56]
	b	.L126
.L162:
	ldr	r3, [r4]
	cmp	r3, #300
	bgt	.L123
	ldr	r2, [r4, #16]
	add	r3, r3, #4
	ldr	r1, .L163+16
	add	r2, r3, r2
	sub	r2, r2, #16
	cmp	r3, #300
	str	r3, [r4]
	str	r2, [r1]
	ble	.L123
	mov	r3, #0
	ldr	r2, .L163+20
	strb	r3, [r4, #60]
	str	r3, [r4, #24]
	str	r3, [r2]
	b	.L123
.L164:
	.align	2
.L163:
	.word	swordfishBoss
	.word	torpedo
	.word	swordfishHealth
	.word	player
	.word	sword
	.word	stageTimer
	.word	__aeabi_idivmod
	.word	collision
	.word	cheatEnabled
	.word	goToWin
	.size	updateSwordfish, .-updateSwordfish
	.align	2
	.global	drawSwordfish
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSwordfish, %function
drawSwordfish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L167
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	drawSwordfish.part.0
.L166:
	mov	r2, #512
	ldr	r3, .L167+4
	strh	r2, [r3, #160]	@ movhi
	strh	r2, [r3, #168]	@ movhi
	bx	lr
.L168:
	.align	2
.L167:
	.word	swordfishBoss
	.word	shadowOAM
	.size	drawSwordfish, .-drawSwordfish
	.align	2
	.global	initTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTorpedo, %function
initTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #6
	mov	r0, #5
	mov	r1, #0
	ldr	r3, .L170
	str	r0, [r3, #8]
	str	r1, [r3, #44]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L171:
	.align	2
.L170:
	.word	torpedo
	.size	initTorpedo, .-initTorpedo
	.align	2
	.global	spawnTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnTorpedo, %function
spawnTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L179
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #16
	movne	r0, #8
	movne	r1, #32
	ldrne	r3, .L179+4
	ldreq	r3, .L179+4
	strne	r2, [r3, #20]
	ldr	r2, [r3, #44]
	strne	r0, [r3, #8]
	strne	r1, [r3, #16]
	cmp	r2, #0
	bxne	lr
	ldr	r2, .L179+8
	ldr	ip, [r2, #24]
	mov	r0, #1
	cmp	ip, #0
	mvneq	ip, #0
	ldr	r1, [r2, #4]
	sub	r1, r1, #8
	ldr	r2, [r2]
	str	r1, [r3, #4]
	ldr	r1, [r3, #16]
	str	r0, [r3, #44]
	ldrne	ip, .L179+12
	ldreq	r0, .L179+12
	str	r2, [r3]
	subeq	r2, r2, r1
	addne	r2, r2, r1
	streq	r2, [r3]
	streq	ip, [r0]
	strne	r2, [r3]
	strne	r0, [ip]
	bx	lr
.L180:
	.align	2
.L179:
	.word	cheatEnabled
	.word	torpedo
	.word	player
	.word	torpedoFacing
	.size	spawnTorpedo, .-spawnTorpedo
	.align	2
	.global	updateTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTorpedo, %function
updateTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L196
	ldrh	r3, [r3]
	push	{r4, r5, r6, lr}
	ldr	r4, .L196+4
	tst	r3, #1
	ldr	r5, [r4, #44]
	beq	.L182
	ldr	r3, .L196+8
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L182
	cmp	r5, #0
	beq	.L183
.L186:
	ldr	r3, .L196+12
	ldr	r3, [r3]
	ldr	r2, [r4]
	add	r3, r3, r3, lsl #2
	add	r3, r3, r2
	cmp	r3, #512
	movle	r1, #0
	movgt	r1, #1
	ldr	r2, [r4, #16]
	add	r2, r3, r2
	orrs	r2, r1, r2, lsr #31
	str	r3, [r4]
	beq	.L195
.L184:
	mov	r3, #0
	str	r3, [r4, #44]
.L181:
	pop	{r4, r5, r6, lr}
	bx	lr
.L183:
	bl	spawnTorpedo
	ldr	r3, .L196+16
	ldr	r1, [r3]
	mov	r2, r5
	ldr	r0, .L196+20
	ldr	r3, .L196+24
	sub	r1, r1, #100
	mov	lr, pc
	bx	r3
	ldr	r5, [r4, #44]
.L182:
	cmp	r5, #0
	bne	.L186
	pop	{r4, r5, r6, lr}
	bx	lr
.L195:
	ldr	r2, .L196+28
	ldr	r2, [r2]
	sub	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	cmp	r3, #120
	ble	.L181
	b	.L184
.L197:
	.align	2
.L196:
	.word	oldButtons
	.word	torpedo
	.word	buttons
	.word	torpedoFacing
	.word	shot_length
	.word	shot_data
	.word	playSoundB
	.word	player
	.size	updateTorpedo, .-updateTorpedo
	.align	2
	.global	drawTorpedo
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTorpedo, %function
drawTorpedo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L204
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L199
	ldr	r2, .L204+4
	ldr	r0, .L204+8
	ldr	r1, .L204+12
	ldr	ip, [r2]
	ldr	r0, [r0]
	ldr	r2, [r3, #4]
	ldr	r3, [r3]
	ldr	r1, [r1]
	sub	r2, r2, ip
	sub	r3, r3, r0
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	cmp	r1, #0
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	bne	.L200
	mov	r0, #256
	ldr	r1, .L204+16
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	and	r2, r2, #255
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	bx	lr
.L199:
	mov	r2, #512
	ldr	r3, .L204+16
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L200:
	ldr	r1, .L204+20
	and	r2, r2, #255
	ldr	r0, [r1]
	ldr	r1, .L204+16
	orr	r2, r2, #16384
	strh	r2, [r1, #8]	@ movhi
	mov	r2, #288
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	cmn	r0, #1
	orreq	r3, r3, #36864
	orrne	r3, r3, #32768
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #12]	@ movhi
	bx	lr
.L205:
	.align	2
.L204:
	.word	torpedo
	.word	vOff
	.word	hOff
	.word	cheatEnabled
	.word	shadowOAM
	.word	torpedoFacing
	.size	drawTorpedo, .-drawTorpedo
	.align	2
	.global	initShark
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShark, %function
initShark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, r2
	mov	fp, r2
	mov	r7, r2
	mov	r0, #3
	mov	r6, #64
	mov	r5, #32
	mov	r4, #1
	mov	lr, #10
	ldr	r8, .L223
	ldr	r9, [r8, #64]
	mov	r10, r9
	ldr	r9, [r8, #68]
	sub	sp, sp, #12
	mov	ip, r8
	mov	r3, r8
	str	r9, [sp, #4]
	ldr	r9, [r8]
	ldr	r8, [r8, #4]
.L209:
	cmp	r2, #0
	str	r0, [r3, #52]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r4, [r3, #44]
	str	r1, [r3, #24]
	str	r1, [r3, #56]
	str	lr, [r3, #32]
	str	r0, [r3, #40]
	str	r1, [r3, #36]
	beq	.L213
	cmp	r2, #1
	beq	.L214
	cmp	r2, #2
	bne	.L212
	cmp	r7, #0
	strne	r9, [ip]
	strne	r8, [ip, #4]
	cmp	fp, #0
	movne	r3, r10
	mov	r2, #260
	strne	r3, [ip, #64]
	ldrne	r3, [sp, #4]
	strne	r3, [ip, #68]
	ldr	r3, .L223+4
	str	r2, [ip, #132]
	str	r3, [ip, #128]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L213:
	mov	r8, #50
	mov	r7, #1
	ldr	r9, .L223+8
.L212:
	add	r2, r2, #1
	add	r3, r3, #64
	b	.L209
.L214:
	mov	fp, #80
	mov	r10, #90
	str	fp, [sp, #4]
	add	r3, r3, #64
	mov	fp, r2
	add	r2, r2, #1
	b	.L209
.L224:
	.align	2
.L223:
	.word	sharks
	.word	350
	.word	270
	.size	initShark, .-initShark
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	ip, .L229
	ldr	lr, .L229+4
	ldr	r4, .L229+8
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L229+12
	ldr	r1, .L229+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L229+20
	ldr	r1, .L229+24
	mov	lr, pc
	bx	r4
	mov	r2, #50
	mov	r4, #0
	mov	r0, #2
	mov	ip, #24
	mov	r5, #16
	mov	r6, #3
	mov	r7, #5
	ldr	r3, .L229+28
	str	r2, [r3]
	ldr	r3, .L229+32
	str	r2, [r3]
	ldr	r3, .L229+36
	ldr	r1, .L229+40
	str	r2, [r3]
	str	r2, [r3, #4]
	ldr	r2, .L229+44
	str	r4, [r1]
	str	r4, [r2]
	str	r0, [r3, #40]
	ldr	r1, .L229+48
	ldr	r0, .L229+52
	ldr	r2, .L229+56
	str	r4, [r0]
	str	r4, [r1]
	ldr	r0, .L229+60
	ldr	r1, .L229+64
	str	r4, [r2]
	ldr	r2, .L229+68
	str	ip, [r3, #16]
	str	r4, [r0]
	str	r6, [r1]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r5, [r3, #20]
	str	r7, [r2]
	bl	initSwordfish
	mov	r2, #6
	ldr	r3, .L229+72
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r7, [r3, #8]
	str	r4, [r3, #44]
	bl	initShark
	ldr	r1, .L229+76
	mov	r2, r5
	mov	r0, r6
	mov	r3, r1
	mov	lr, #15
	add	ip, r1, #84
.L226:
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r0, [r3, #24]
	str	lr, [r3, #16]
	str	r4, [r3, #20]
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L226
	mov	lr, #130
	mov	r3, #420
	mov	ip, #190
	mov	r0, #250
	mov	r2, #180
	str	lr, [r1]
	str	ip, [r1, #4]
	str	r3, [r1, #28]
	str	r3, [r1, #60]
	str	r0, [r1, #32]
	str	r2, [r1, #56]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L230:
	.align	2
.L229:
	.word	collisionMap
	.word	reefCollisionMapBitmap
	.word	DMANow
	.word	83886592
	.word	subSpritesPal
	.word	100728832
	.word	subSpritesTiles
	.word	hOff
	.word	vOff
	.word	player
	.word	hOff1
	.word	vOff1
	.word	stageTimer
	.word	cheatEnabled
	.word	reverseTimer
	.word	shadowOAMIndex
	.word	playerHealth
	.word	swordfishHealth
	.word	torpedo
	.word	jelly
	.size	initGame, .-initGame
	.align	2
	.global	updateShark
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateShark, %function
updateShark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L288
	ldr	r5, .L288+4
	ldr	r8, .L288+8
	ldr	r6, .L288+12
	ldr	fp, .L288+16
	ldr	r10, .L288+20
	ldr	r9, .L288+24
	sub	sp, sp, #28
	add	r7, r4, #192
.L249:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	movne	r3, #0
	strne	r3, [r4, #60]
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L233
.L281:
	ldr	r3, [r4, #52]
.L234:
	cmp	r3, #0
	ble	.L238
.L239:
	ldr	r2, [r4, #56]
	cmp	r2, #50
	ldr	r3, [r4, #24]
	bgt	.L240
	cmp	r3, #1
	beq	.L283
	cmp	r3, #0
	bne	.L245
	ldr	r1, [r4]
	ldr	r3, [r4, #32]
	add	r2, r2, #1
	sub	r1, r1, #2
	subs	r3, r3, #1
	str	r2, [r4, #56]
	str	r1, [r4]
	strne	r3, [r4, #32]
	bne	.L247
	mov	r3, #10
	ldr	r0, [r4, #36]
	str	r3, [r4, #32]
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	str	r2, [sp, #20]
	mov	lr, pc
	bx	r9
	ldr	r2, [sp, #20]
	str	r1, [r4, #36]
.L247:
	cmp	r2, #51
	beq	.L250
.L245:
	add	r4, r4, #64
	cmp	r4, r7
	bne	.L249
.L285:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L240:
	cmp	r3, #0
	bne	.L284
.L250:
	mov	r3, #0
	mov	r1, #1
	mov	r2, #10
	str	r1, [r4, #24]
	str	r3, [r4, #56]
	str	r3, [r4, #36]
	str	r2, [r4, #32]
	add	r4, r4, #64
	cmp	r4, r7
	bne	.L249
	b	.L285
.L233:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L286
.L235:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L281
	ldr	r3, [r6, #44]
	cmp	r3, #0
	beq	.L281
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L281
	mov	r3, #0
	ldr	r2, [fp]
	cmp	r2, r3
	str	r3, [r6, #44]
	strne	r3, [r4, #52]
	beq	.L287
.L238:
	mov	r3, #0
	str	r3, [r4, #44]
	b	.L239
.L284:
	cmp	r3, #1
	bne	.L245
.L252:
	mov	r3, #0
	mov	r2, #10
	str	r3, [r4, #24]
	str	r3, [r4, #56]
	str	r3, [r4, #36]
	str	r2, [r4, #32]
	add	r4, r4, #64
	cmp	r4, r7
	bne	.L249
	b	.L285
.L283:
	ldr	r1, [r4]
	ldr	r3, [r4, #32]
	add	r2, r2, #1
	add	r1, r1, #2
	subs	r3, r3, #1
	str	r2, [r4, #56]
	str	r1, [r4]
	strne	r3, [r4, #32]
	bne	.L243
	mov	r3, #10
	ldr	r0, [r4, #36]
	str	r3, [r4, #32]
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	str	r2, [sp, #20]
	mov	lr, pc
	bx	r9
	ldr	r2, [sp, #20]
	str	r1, [r4, #36]
.L243:
	cmp	r2, #51
	beq	.L252
	add	r4, r4, #64
	cmp	r4, r7
	bne	.L249
	b	.L285
.L286:
	mov	lr, pc
	bx	r10
	b	.L235
.L287:
	mov	r2, #1
	ldr	r3, [r4, #52]
	sub	r3, r3, #1
	str	r3, [r4, #52]
	str	r2, [r4, #60]
	b	.L234
.L289:
	.align	2
.L288:
	.word	sharks
	.word	player
	.word	collision
	.word	torpedo
	.word	cheatEnabled
	.word	goToLose
	.word	__aeabi_idivmod
	.size	updateShark, .-updateShark
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
	push	{r4, lr}
	bl	updatePlayer
	bl	updateSwordfish
	bl	updateTorpedo
	bl	updateShark
	bl	updateJellyfish
	mov	r3, #67108864
	ldr	r2, .L292
	ldrh	r1, [r2]
	ldr	r2, .L292+4
	strh	r1, [r3, #16]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L292+8
	strh	r1, [r3, #18]	@ movhi
	ldrh	r1, [r2]
	ldr	r2, .L292+12
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L293:
	.align	2
.L292:
	.word	hOff
	.word	vOff
	.word	hOff1
	.word	vOff1
	.size	updateGame, .-updateGame
	.align	2
	.global	drawShark
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawShark, %function
drawShark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #2
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #512
	ldr	r3, .L303
	ldr	r2, .L303+4
	ldr	r0, [r3]
	ldr	r1, .L303+8
	ldr	r3, .L303+12
	ldrh	r9, [r2]
	lsl	lr, r0, #16
	ldr	r2, .L303+16
	ldr	r8, .L303+20
	ldr	r7, .L303+24
	ldr	r6, .L303+28
	str	ip, [r1]
	lsr	lr, lr, #16
	add	r5, r0, #159
	add	ip, r3, #192
.L299:
	ldr	r1, [r3, #44]
	cmp	r1, #1
	strhne	r4, [r2, #16]	@ movhi
	beq	.L302
.L296:
	add	r3, r3, #64
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L299
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L302:
	ldr	r10, [r3, #4]
	ldr	r1, [r3, #20]
	add	r1, r10, r1
	cmp	r1, r0
	ble	.L296
	sub	r1, r10, lr
	and	r1, r1, #255
	cmp	r10, r5
	orr	r1, r1, #16384
	bgt	.L296
	ldr	r10, [r3]
	ldr	fp, [r3, #24]
	strh	r1, [r2, #16]	@ movhi
	sub	r10, r10, r9
	ldr	r1, [r3, #36]
	and	r10, r10, r8
	cmp	fp, #1
	lsl	r1, r1, #23
	orr	fp, r10, r7
	orreq	r10, r10, #53248
	strh	fp, [r2, #18]	@ movhi
	add	r1, r1, #983040
	strheq	r10, [r2, #18]	@ movhi
	ldr	r10, [r3, #60]
	lsr	r1, r1, #16
	cmp	r10, #0
	and	r10, r1, r6
	orr	r10, r10, #4096
	and	r1, r1, r6
	strhne	r10, [r2, #20]	@ movhi
	strheq	r1, [r2, #20]	@ movhi
	b	.L296
.L304:
	.align	2
.L303:
	.word	vOff
	.word	hOff
	.word	shadowOAMIndex
	.word	sharks
	.word	shadowOAM
	.word	511
	.word	-16384
	.word	1023
	.size	drawShark, .-drawShark
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
	ldr	r3, .L314
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	push	{r4, lr}
	bl	drawPlayer
	ldr	r3, .L314+4
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L313
	mov	r2, #512
	ldr	r3, .L314+8
	strh	r2, [r3, #160]	@ movhi
	strh	r2, [r3, #168]	@ movhi
.L308:
	bl	drawTorpedo
	bl	drawShark
	bl	drawJellyfish
	mov	r3, #67108864
	mov	r2, #56320
	pop	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L313:
	bl	drawSwordfish.part.0
	b	.L308
.L315:
	.align	2
.L314:
	.word	state
	.word	swordfishBoss
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	collisionMap,4,4
	.comm	reverseTimer,4,4
	.comm	cheatEnabled,4,4
	.comm	torpedoFacing,4,4
	.comm	shadowOAMIndex,4,4
	.comm	stageTimer,4,4
	.comm	swordfishHealth,4,4
	.comm	playerHealth,4,4
	.comm	vOff1,4,4
	.comm	hOff1,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	jelly,84,4
	.comm	sharks,192,4
	.comm	torpedo,52,4
	.comm	sword,64,4
	.comm	swordfishBoss,64,4
	.comm	player,52,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
