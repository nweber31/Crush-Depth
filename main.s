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
	push	{r4, lr}
	mov	ip, #0
	mov	r2, #67108864
	mov	r4, #256
	mov	r0, #7936
	ldr	r3, .L4
	ldr	r1, .L4+4
	strh	ip, [r2, #16]	@ movhi
	ldr	r1, [r1]
	strh	ip, [r2, #18]	@ movhi
	strh	r4, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	str	ip, [r3]
	mov	r2, #1
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L4+16
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #3744
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	waterMusic_length
	.word	waterMusic_data
	.word	playSoundA
	.word	DMANow
	.word	startPal
	.word	startTiles
	.word	100726784
	.word	startMap
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7936
	mov	ip, #0
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L8+12
	ldr	r2, .L8+16
	ldrh	r1, [r1, #48]
	ldr	r0, .L8+20
	strh	r1, [r2]	@ movhi
	strh	ip, [r0]	@ movhi
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L8+24
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L8+32
	ldr	r1, .L8+36
	mov	r3, #8192
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	83886592
	.word	subSpritesPal
	.word	100728832
	.word	subSpritesTiles
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	mov	r3, #256
	mov	r0, #7936
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L16
	strh	r1, [r2, #16]	@ movhi
	ldr	r4, .L16+4
	strh	r1, [r2, #18]	@ movhi
	strh	r3, [r2]	@ movhi
	ldr	r1, .L16+8
	strh	r0, [r2, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #2512
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100726784
	.word	instructionsMap
	.size	goToInstructions, .-goToInstructions
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
	@ link register save eliminated.
	ldr	r3, .L23
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L24:
	.align	2
.L23:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
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
	push	{r4, lr}
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #4864
	mov	r3, #56320
	mov	lr, #2
	ldr	r1, .L27+4
	ldr	ip, .L27+8
	strh	r0, [r2]	@ movhi
	ldr	r4, .L27+12
	strh	r3, [r2, #8]	@ movhi
	mov	r0, #3
	strh	r1, [r2, #10]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L27+16
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L27+28
	ldr	r1, .L27+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L27+36
	ldr	r2, .L27+40
	ldr	r1, .L27+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L27+48
	ldr	r1, .L27+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	hideSprites
	.word	6152
	.word	state
	.word	DMANow
	.word	reefPal
	.word	22864
	.word	reefTiles
	.word	100720640
	.word	reefMap
	.word	5152
	.word	100696064
	.word	waterBackgroundTiles
	.word	100712448
	.word	waterBackgroundMap
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L41
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStart
.L39:
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
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
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r2, #0
	mov	r6, #1024
	mov	r4, #3
	ldr	ip, .L45
	ldr	r0, .L45+4
	strh	r2, [r3, #24]	@ movhi
	ldr	r1, .L45+8
	strh	r2, [r3, #26]	@ movhi
	strh	r6, [r3]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	ldr	r5, .L45+12
	str	r4, [r0]
	mov	lr, pc
	bx	r1
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L45+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #2400
	ldr	r2, .L45+20
	ldr	r1, .L45+24
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r0, r4
	ldr	r2, .L45+28
	ldr	r1, .L45+32
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	5124
	.word	state
	.word	pauseSound
	.word	DMANow
	.word	pausePal
	.word	100679680
	.word	pauseTiles
	.word	100704256
	.word	pauseMap
	.size	goToPause, .-goToPause
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
	ldr	r3, .L54
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L48
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L48:
	ldr	r3, .L54+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	bl	goToPause
	b	.L48
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.size	game, .-game
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
	push	{r4, lr}
	ldr	r4, .L68
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L57
	ldr	r2, .L68+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L66
.L57:
	tst	r3, #4
	beq	.L56
	ldr	r3, .L68+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L67
.L56:
	pop	{r4, lr}
	bx	lr
.L67:
	pop	{r4, lr}
	b	goToStart
.L66:
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L57
.L69:
	.align	2
.L68:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
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
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r4, .L90+4
	ldr	r10, .L90+8
	ldr	r9, .L90+12
	ldr	fp, .L90+16
	ldr	r7, .L90+20
	ldr	r6, .L90+24
	ldr	r8, .L90+28
	ldr	r5, .L90+32
.L79:
	ldrh	r1, [r4]
	strh	r1, [r10]	@ movhi
	ldr	r2, [r9]
	ldrh	r3, [r8, #48]
	strh	r3, [r4]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L71
.L73:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L74
	.word	.L72
.L72:
	tst	r1, #8
	ldrne	r3, .L90+36
	movne	lr, pc
	bxne	r3
.L71:
	mov	lr, pc
	bx	r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L79
.L74:
	tst	r1, #8
	beq	.L71
	ldr	r3, .L90+40
	mov	lr, pc
	bx	r3
	b	.L71
.L75:
	ldr	r3, .L90+44
	mov	lr, pc
	bx	r3
	b	.L71
.L76:
	ldr	r3, .L90+48
	mov	lr, pc
	bx	r3
	b	.L71
.L78:
	tst	r1, #8
	beq	.L71
	tst	r3, #8
	bne	.L71
	ldr	r3, .L90+52
	mov	lr, pc
	bx	r3
	b	.L71
.L77:
	mov	lr, pc
	bx	fp
	b	.L71
.L91:
	.align	2
.L90:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	instructions
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	lose.part.0
	.word	win.part.0
	.word	pause
	.word	game
	.word	goToInstructions
	.size	main, .-main
	.text
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
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r3, #0
	mov	r5, #1024
	mov	lr, #4
	ldr	r1, .L94
	ldr	ip, .L94+4
	strh	r3, [r2, #24]	@ movhi
	ldr	r4, .L94+8
	strh	r3, [r2, #26]	@ movhi
	mov	r0, #3
	strh	r5, [r2]	@ movhi
	mov	r3, #256
	strh	r1, [r2, #12]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L94+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #4864
	mov	r0, #3
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L94+24
	ldr	r1, .L94+28
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	5124
	.word	state
	.word	DMANow
	.word	winPal
	.word	100679680
	.word	winTiles
	.word	100704256
	.word	winMap
	.size	goToWin, .-goToWin
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
	ldr	r3, .L98
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L99:
	.align	2
.L98:
	.word	oldButtons
	.size	win, .-win
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
	push	{r4, r5, r6, lr}
	mov	r2, #67108864
	mov	r3, #0
	mov	r5, #1024
	mov	lr, #5
	ldr	r1, .L102
	ldr	ip, .L102+4
	strh	r3, [r2, #24]	@ movhi
	ldr	r4, .L102+8
	strh	r3, [r2, #26]	@ movhi
	mov	r0, #3
	strh	r5, [r2]	@ movhi
	mov	r3, #256
	strh	r1, [r2, #12]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L102+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L102+16
	ldr	r2, .L102+20
	ldr	r1, .L102+24
	mov	lr, pc
	bx	r4
	mov	r3, r5
	mov	r0, #3
	ldr	r2, .L102+28
	ldr	r1, .L102+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	5124
	.word	state
	.word	DMANow
	.word	losePal
	.word	6736
	.word	100679680
	.word	loseTiles
	.word	100704256
	.word	loseMap
	.size	goToLose, .-goToLose
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
	b	win
	.size	lose, .-lose
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
