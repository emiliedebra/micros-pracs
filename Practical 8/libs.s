	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"libs.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	RCC_AHBENR_IOPBEN
	.data
	.align	2
	.type	RCC_AHBENR_IOPBEN, %object
	.size	RCC_AHBENR_IOPBEN, 4
RCC_AHBENR_IOPBEN:
	.word	393216
	.global	GPIOB_MODER_OUTPUT
	.align	2
	.type	GPIOB_MODER_OUTPUT, %object
	.size	GPIOB_MODER_OUTPUT, 4
GPIOB_MODER_OUTPUT:
	.word	21845
	.global	PORTA_PUPDR
	.align	2
	.type	PORTA_PUPDR, %object
	.size	PORTA_PUPDR, 4
PORTA_PUPDR:
	.word	85
	.global	PORTA_MODERIN
	.align	2
	.type	PORTA_MODERIN, %object
	.size	PORTA_MODERIN, 4
PORTA_MODERIN:
	.word	671088640
	.text
	.align	2
	.global	initialise
	.code	16
	.thumb_func
	.type	initialise, %function
initialise:
.LFB0:
	.file 1 "libs.c"
	.loc 1 11 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 13 0
	ldr	r2, .L2
	ldr	r3, .L2
	ldr	r1, [r3, #20]
	ldr	r3, .L2+4
	ldr	r3, [r3]
	orr	r3, r1
	str	r3, [r2, #20]
	.loc 1 15 0
	ldr	r2, .L2+8
	ldr	r3, .L2+8
	ldr	r1, [r3]
	ldr	r3, .L2+12
	ldr	r3, [r3]
	orr	r3, r1
	str	r3, [r2]
	.loc 1 17 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r1, [r2, #12]
	ldr	r2, .L2+16
	ldr	r2, [r2]
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 18 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r1, [r2]
	ldr	r2, .L2+20
	ldr	r2, [r2]
	orr	r2, r1
	str	r2, [r3]
	.loc 1 19 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	RCC_AHBENR_IOPBEN
	.word	1207960576
	.word	GPIOB_MODER_OUTPUT
	.word	PORTA_PUPDR
	.word	PORTA_MODERIN
	.cfi_endproc
.LFE0:
	.size	initialise, .-initialise
	.align	2
	.global	initialise_timer
	.code	16
	.thumb_func
	.type	initialise_timer, %function
initialise_timer:
.LFB1:
	.loc 1 21 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
	add	r3, r7, #4
	add	r2, r1, #0
	strh	r2, [r3]
	.loc 1 22 0
	ldr	r3, .L5
	ldr	r2, .L5
	ldr	r2, [r2, #28]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 23 0
	ldr	r3, .L5+4
	add	r2, r7, #6
	ldrh	r2, [r2]
	str	r2, [r3, #44]
	.loc 1 24 0
	ldr	r2, .L5+4
	add	r3, r7, #4
	ldrh	r3, [r3]
	strh	r3, [r2, #40]
	.loc 1 25 0
	ldr	r2, .L5+4
	ldr	r3, .L5+4
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	mov	r1, #1
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #12]
	.loc 1 26 0
	ldr	r3, .L5+8
	ldr	r2, .L5+8
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3]
	.loc 1 27 0
	ldr	r2, .L5+4
	ldr	r3, .L5+4
	ldrh	r3, [r3]
	uxth	r3, r3
	mov	r1, #128
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 28 0
	ldr	r2, .L5+4
	ldr	r3, .L5+4
	ldrh	r3, [r3]
	uxth	r3, r3
	mov	r1, #1
	orr	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 29 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1073876992
	.word	1073745920
	.word	-536813312
	.cfi_endproc
.LFE1:
	.size	initialise_timer, .-initialise_timer
	.align	2
	.global	reset_timer
	.code	16
	.thumb_func
	.type	reset_timer, %function
reset_timer:
.LFB2:
	.loc 1 31 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 32 0
	ldr	r2, .L8
	ldr	r3, .L8
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	mov	r1, #1
	bic	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #16]
	.loc 1 34 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	1073745920
	.cfi_endproc
.LFE2:
	.size	reset_timer, .-reset_timer
	.align	2
	.global	setPSC
	.code	16
	.thumb_func
	.type	setPSC, %function
setPSC:
.LFB3:
	.loc 1 36 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #6
	strh	r2, [r3]
	.loc 1 37 0
	ldr	r2, .L11
	add	r3, r7, #6
	ldrh	r3, [r3]
	strh	r3, [r2, #40]
	.loc 1 38 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073745920
	.cfi_endproc
.LFE3:
	.size	setPSC, .-setPSC
	.align	2
	.global	initialise_ADC
	.code	16
	.thumb_func
	.type	initialise_ADC, %function
initialise_ADC:
.LFB4:
	.loc 1 40 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 41 0
	ldr	r3, .L15
	ldr	r2, .L15
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 42 0
	ldr	r3, .L15
	ldr	r2, .L15
	ldr	r2, [r2, #24]
	mov	r1, #128
	lsl	r1, r1, #2
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 43 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #240
	lsl	r1, r1, #6
	orr	r2, r1
	str	r2, [r3]
	.loc 1 44 0
	ldr	r3, .L15+4
	ldr	r2, .L15+4
	ldr	r2, [r2, #12]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 45 0
	ldr	r3, .L15+4
	ldr	r2, .L15+4
	ldr	r2, [r2, #8]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 46 0
	mov	r8, r8
.L14:
	.loc 1 46 0 is_stmt 0 discriminator 3
	ldr	r3, .L15+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L14
	.loc 1 48 0 is_stmt 1
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L16:
	.align	2
.L15:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE4:
	.size	initialise_ADC, .-initialise_ADC
	.align	2
	.global	getPOT
	.code	16
	.thumb_func
	.type	getPOT, %function
getPOT:
.LFB5:
	.loc 1 50 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r2, r0
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 51 0
	mov	r3, #15
	add	r3, r7, r3
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 52 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #8]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #8]
	.loc 1 53 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L18
	.loc 1 54 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #40]
	mov	r1, #64
	bic	r2, r1
	str	r2, [r3, #40]
	.loc 1 55 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #40]
	mov	r1, #32
	orr	r2, r1
	str	r2, [r3, #40]
	b	.L19
.L18:
	.loc 1 57 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L19
	.loc 1 58 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #40]
	mov	r1, #32
	bic	r2, r1
	str	r2, [r3, #40]
	.loc 1 59 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #40]
	mov	r1, #64
	orr	r2, r1
	str	r2, [r3, #40]
.L19:
	.loc 1 62 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #8]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 63 0
	mov	r8, r8
.L20:
	.loc 1 63 0 is_stmt 0 discriminator 3
	ldr	r3, .L23
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L20
	.loc 1 64 0 is_stmt 1
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r2, [r2, #8]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 65 0
	mov	r8, r8
.L21:
	.loc 1 65 0 is_stmt 0 discriminator 2
	ldr	r3, .L23
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L21
	.loc 1 66 0 is_stmt 1
	ldr	r3, .L23
	ldr	r2, [r3, #64]
	mov	r3, #15
	add	r3, r7, r3
	strb	r2, [r3]
	.loc 1 68 0
	mov	r3, #15
	add	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 69 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	1073816576
	.cfi_endproc
.LFE5:
	.size	getPOT, .-getPOT
	.align	2
	.global	display
	.code	16
	.thumb_func
	.type	display, %function
display:
.LFB6:
	.loc 1 71 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 72 0
	ldr	r3, .L26
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #20]
	.loc 1 73 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L27:
	.align	2
.L26:
	.word	1207960576
	.cfi_endproc
.LFE6:
	.size	display, .-display
	.align	2
	.global	switch_function
	.code	16
	.thumb_func
	.type	switch_function, %function
switch_function:
.LFB7:
	.loc 1 75 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 76 0
	mov	r3, #23
	add	r3, r7, r3
	mov	r2, #1
	strb	r2, [r3]
	.loc 1 77 0
	mov	r3, #15
	add	r3, r7, r3
	mov	r2, #0
	strb	r2, [r3]
.L32:
.LBB2:
	.loc 1 80 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	str	r3, [r7, #8]
	.loc 1 81 0
	ldr	r3, [r7, #8]
	uxtb	r2, r3
	mov	r3, #15
	add	r3, r7, r3
	mov	r1, #1
	and	r2, r1
	strb	r2, [r3]
	.loc 1 83 0
	mov	r3, #15
	add	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L29
	.loc 1 83 0 is_stmt 0 discriminator 1
	mov	r3, #23
	add	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L29
	.loc 1 84 0 is_stmt 1
	ldr	r3, .L33
	ldrh	r3, [r3, #16]
	uxth	r2, r3
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 85 0
	add	r3, r7, #7
	ldrb	r2, [r3]
	add	r3, r7, #7
	add	r2, r2, #1
	strb	r2, [r3]
	.loc 1 86 0
	ldr	r2, .L33
	add	r3, r7, #7
	ldrb	r3, [r3]
	uxth	r3, r3
	strh	r3, [r2, #20]
.L29:
	.loc 1 88 0
	mov	r3, #23
	add	r3, r7, r3
	mov	r2, #15
	add	r2, r7, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 90 0
	mov	r3, #0
	str	r3, [r7, #16]
	.loc 1 91 0
	mov	r3, #0
	str	r3, [r7, #16]
	b	.L30
.L31:
	.loc 1 91 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #16]
	add	r3, r3, #1
	str	r3, [r7, #16]
.L30:
	.loc 1 91 0 discriminator 1
	ldr	r3, [r7, #16]
	ldr	r2, .L33+4
	cmp	r3, r2
	ble	.L31
.LBE2:
	.loc 1 93 0 is_stmt 1
	b	.L32
.L34:
	.align	2
.L33:
	.word	1207960576
	.word	14545
	.cfi_endproc
.LFE7:
	.size	switch_function, .-switch_function
	.align	2
	.global	find_min_max
	.code	16
	.thumb_func
	.type	find_min_max, %function
find_min_max:
.LFB8:
	.loc 1 96 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 98 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 99 0
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 101 0
	mov	r3, #0
	str	r3, [r7, #20]
	.loc 1 102 0
	b	.L36
.L38:
	.loc 1 103 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldrb	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r1, [r7, #12]
	add	r3, r1, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	bcs	.L37
	.loc 1 104 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L37:
	.loc 1 106 0
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L36:
	.loc 1 102 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	.L38
	.loc 1 110 0
	mov	r3, #0
	str	r3, [r7, #20]
	.loc 1 111 0
	b	.L39
.L41:
	.loc 1 112 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldrb	r2, [r3]
	ldr	r3, [r7, #20]
	ldr	r1, [r7, #12]
	add	r3, r1, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	bls	.L40
	.loc 1 113 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	add	r2, r2, r3
	ldr	r3, [r7]
	str	r2, [r3]
.L40:
	.loc 1 115 0
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L39:
	.loc 1 111 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	.L41
	.loc 1 117 0
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE8:
	.size	find_min_max, .-find_min_max
	.align	2
	.global	get_switch
	.code	16
	.thumb_func
	.type	get_switch, %function
get_switch:
.LFB9:
	.loc 1 120 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 122 0
	add	r3, r7, #7
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 123 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r2, r3
	add	r3, r7, #7
	mov	r1, #1
	and	r2, r1
	strb	r2, [r3]
	.loc 1 124 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	.loc 1 125 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE9:
	.size	get_switch, .-get_switch
.Letext0:
	.file 2 "/usr/include/newlib/machine/_default_types.h"
	.file 3 "/usr/include/newlib/sys/_stdint.h"
	.file 4 "stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x74a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x1
	.4byte	.LASF93
	.4byte	.LASF94
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1b
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1d
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x5b
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x2
	.byte	0x41
	.4byte	0x74
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x13
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x14
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x3
	.byte	0x1a
	.4byte	0x50
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x3
	.byte	0x20
	.4byte	0x69
	.uleb128 0x5
	.byte	0x44
	.byte	0x4
	.2byte	0x1f7
	.4byte	0x173
	.uleb128 0x6
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x1f9
	.4byte	0x173
	.byte	0
	.uleb128 0x6
	.ascii	"IER\000"
	.byte	0x4
	.2byte	0x1fa
	.4byte	0x173
	.byte	0x4
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1fb
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1fc
	.4byte	0x173
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1fd
	.4byte	0x173
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1fe
	.4byte	0x173
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1ff
	.4byte	0xb8
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x200
	.4byte	0xb8
	.byte	0x1c
	.uleb128 0x6
	.ascii	"TR\000"
	.byte	0x4
	.2byte	0x201
	.4byte	0x173
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x202
	.4byte	0xb8
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x203
	.4byte	0x173
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x204
	.4byte	0x178
	.byte	0x2c
	.uleb128 0x6
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x205
	.4byte	0x173
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.4byte	0xb8
	.uleb128 0x9
	.4byte	0xb8
	.4byte	0x188
	.uleb128 0xa
	.4byte	0x188
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF25
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x206
	.4byte	0xc3
	.uleb128 0x8
	.4byte	0xad
	.uleb128 0x5
	.byte	0x2c
	.byte	0x4
	.2byte	0x2e6
	.4byte	0x260
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2e8
	.4byte	0x173
	.byte	0
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x2e9
	.4byte	0x19b
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2ea
	.4byte	0xad
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x2eb
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2ec
	.4byte	0x173
	.byte	0xc
	.uleb128 0x6
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x2ed
	.4byte	0x19b
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x2ee
	.4byte	0xad
	.byte	0x12
	.uleb128 0x6
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x2ef
	.4byte	0x19b
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x2f0
	.4byte	0xad
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2f1
	.4byte	0x173
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2f2
	.4byte	0x173
	.byte	0x1c
	.uleb128 0x6
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x2f3
	.4byte	0x270
	.byte	0x20
	.uleb128 0x6
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x2f4
	.4byte	0x19b
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x2f5
	.4byte	0xad
	.byte	0x2a
	.byte	0
	.uleb128 0x9
	.4byte	0xb8
	.4byte	0x270
	.uleb128 0xa
	.4byte	0x188
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	0x260
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2f6
	.4byte	0x1a0
	.uleb128 0x5
	.byte	0x38
	.byte	0x4
	.2byte	0x335
	.4byte	0x340
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x337
	.4byte	0x173
	.byte	0
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x338
	.4byte	0x173
	.byte	0x4
	.uleb128 0x6
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x339
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x33a
	.4byte	0x173
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x33b
	.4byte	0x173
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x33c
	.4byte	0x173
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x33d
	.4byte	0x173
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x33e
	.4byte	0x173
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x33f
	.4byte	0x173
	.byte	0x20
	.uleb128 0x6
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x340
	.4byte	0x173
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x341
	.4byte	0x173
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x342
	.4byte	0x173
	.byte	0x2c
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x343
	.4byte	0x173
	.byte	0x30
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x344
	.4byte	0x173
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x345
	.4byte	0x281
	.uleb128 0x5
	.byte	0x54
	.byte	0x4
	.2byte	0x389
	.4byte	0x528
	.uleb128 0x6
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x38b
	.4byte	0x19b
	.byte	0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x38c
	.4byte	0xad
	.byte	0x2
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x38d
	.4byte	0x19b
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x38e
	.4byte	0xad
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x38f
	.4byte	0x19b
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x390
	.4byte	0xad
	.byte	0xa
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x391
	.4byte	0x19b
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x392
	.4byte	0xad
	.byte	0xe
	.uleb128 0x6
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x393
	.4byte	0x19b
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x394
	.4byte	0xad
	.byte	0x12
	.uleb128 0x6
	.ascii	"EGR\000"
	.byte	0x4
	.2byte	0x395
	.4byte	0x19b
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x396
	.4byte	0xad
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x397
	.4byte	0x19b
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x398
	.4byte	0xad
	.byte	0x1a
	.uleb128 0x7
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x399
	.4byte	0x19b
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x39a
	.4byte	0xad
	.byte	0x1e
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x39b
	.4byte	0x19b
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x39c
	.4byte	0xad
	.byte	0x22
	.uleb128 0x6
	.ascii	"CNT\000"
	.byte	0x4
	.2byte	0x39d
	.4byte	0x173
	.byte	0x24
	.uleb128 0x6
	.ascii	"PSC\000"
	.byte	0x4
	.2byte	0x39e
	.4byte	0x19b
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x39f
	.4byte	0xad
	.byte	0x2a
	.uleb128 0x6
	.ascii	"ARR\000"
	.byte	0x4
	.2byte	0x3a0
	.4byte	0x173
	.byte	0x2c
	.uleb128 0x6
	.ascii	"RCR\000"
	.byte	0x4
	.2byte	0x3a1
	.4byte	0x19b
	.byte	0x30
	.uleb128 0x7
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x3a2
	.4byte	0xad
	.byte	0x32
	.uleb128 0x7
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x3a3
	.4byte	0x173
	.byte	0x34
	.uleb128 0x7
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x3a4
	.4byte	0x173
	.byte	0x38
	.uleb128 0x7
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x3a5
	.4byte	0x173
	.byte	0x3c
	.uleb128 0x7
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x3a6
	.4byte	0x173
	.byte	0x40
	.uleb128 0x7
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x3a7
	.4byte	0x19b
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x3a8
	.4byte	0xad
	.byte	0x46
	.uleb128 0x6
	.ascii	"DCR\000"
	.byte	0x4
	.2byte	0x3a9
	.4byte	0x19b
	.byte	0x48
	.uleb128 0x7
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x3aa
	.4byte	0xad
	.byte	0x4a
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x3ab
	.4byte	0x19b
	.byte	0x4c
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x3ac
	.4byte	0xad
	.byte	0x4e
	.uleb128 0x6
	.ascii	"OR\000"
	.byte	0x4
	.2byte	0x3ad
	.4byte	0x19b
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x3ae
	.4byte	0xad
	.byte	0x52
	.byte	0
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x3af
	.4byte	0x34c
	.uleb128 0xc
	.4byte	.LASF69
	.byte	0x1
	.byte	0xb
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF71
	.byte	0x1
	.byte	0x15
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x577
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x1
	.byte	0x15
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0xe
	.4byte	.LASF68
	.byte	0x1
	.byte	0x15
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF70
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF72
	.byte	0x1
	.byte	0x24
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ac
	.uleb128 0xe
	.4byte	.LASF73
	.byte	0x1
	.byte	0x24
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xc
	.4byte	.LASF74
	.byte	0x1
	.byte	0x28
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF86
	.byte	0x1
	.byte	0x32
	.4byte	0xa2
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f3
	.uleb128 0x10
	.ascii	"POT\000"
	.byte	0x1
	.byte	0x32
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0x33
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xd
	.4byte	.LASF75
	.byte	0x1
	.byte	0x47
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x617
	.uleb128 0xe
	.4byte	.LASF76
	.byte	0x1
	.byte	0x47
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF77
	.byte	0x1
	.byte	0x4b
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67b
	.uleb128 0x11
	.4byte	.LASF79
	.byte	0x1
	.byte	0x4c
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x11
	.4byte	.LASF80
	.byte	0x1
	.byte	0x4d
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x12
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.4byte	.LASF81
	.byte	0x1
	.byte	0x4f
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x11
	.4byte	.LASF82
	.byte	0x1
	.byte	0x50
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"k\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF83
	.byte	0x1
	.byte	0x60
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d5
	.uleb128 0xe
	.4byte	.LASF84
	.byte	0x1
	.byte	0x60
	.4byte	0x6d5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.4byte	.LASF85
	.byte	0x1
	.byte	0x60
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.ascii	"max\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x6db
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.ascii	"min\000"
	.byte	0x1
	.byte	0x60
	.4byte	0x6db
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.ascii	"i\000"
	.byte	0x1
	.byte	0x65
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0xa2
	.uleb128 0x14
	.byte	0x4
	.4byte	0x6d5
	.uleb128 0xf
	.4byte	.LASF87
	.byte	0x1
	.byte	0x78
	.4byte	0x97
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x709
	.uleb128 0x11
	.4byte	.LASF78
	.byte	0x1
	.byte	0x7a
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.byte	0x6
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_AHBENR_IOPBEN
	.uleb128 0x15
	.4byte	.LASF89
	.byte	0x1
	.byte	0x7
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_MODER_OUTPUT
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.byte	0x8
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x3
	.4byte	PORTA_PUPDR
	.uleb128 0x15
	.4byte	.LASF91
	.byte	0x1
	.byte	0x9
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x3
	.4byte	PORTA_MODERIN
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF31:
	.ascii	"PUPDR\000"
.LASF33:
	.ascii	"LCKR\000"
.LASF46:
	.ascii	"DIER\000"
.LASF28:
	.ascii	"OTYPER\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF83:
	.ascii	"find_min_max\000"
.LASF66:
	.ascii	"TIM_TypeDef\000"
.LASF27:
	.ascii	"MODER\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF19:
	.ascii	"SMPR\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF60:
	.ascii	"BDTR\000"
.LASF74:
	.ascii	"initialise_ADC\000"
.LASF86:
	.ascii	"getPOT\000"
.LASF48:
	.ascii	"CCMR1\000"
.LASF50:
	.ascii	"CCMR2\000"
.LASF10:
	.ascii	"long long int\000"
.LASF2:
	.ascii	"signed char\000"
.LASF32:
	.ascii	"BSRR\000"
.LASF54:
	.ascii	"RESERVED10\000"
.LASF88:
	.ascii	"RCC_AHBENR_IOPBEN\000"
.LASF55:
	.ascii	"RESERVED12\000"
.LASF67:
	.ascii	"userARR\000"
.LASF61:
	.ascii	"RESERVED17\000"
.LASF62:
	.ascii	"RESERVED18\000"
.LASF64:
	.ascii	"RESERVED19\000"
.LASF7:
	.ascii	"long int\000"
.LASF94:
	.ascii	"/home/emilie/Documents/UCT/Second Year/Micros/Pract"
	.ascii	"ical 8\000"
.LASF93:
	.ascii	"libs.c\000"
.LASF36:
	.ascii	"APB2RSTR\000"
.LASF52:
	.ascii	"CCER\000"
.LASF15:
	.ascii	"uint16_t\000"
.LASF26:
	.ascii	"ADC_TypeDef\000"
.LASF84:
	.ascii	"array\000"
.LASF30:
	.ascii	"OSPEEDR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF72:
	.ascii	"setPSC\000"
.LASF65:
	.ascii	"RESERVED20\000"
.LASF73:
	.ascii	"value\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF34:
	.ascii	"GPIO_TypeDef\000"
.LASF44:
	.ascii	"RCC_TypeDef\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF77:
	.ascii	"switch_function\000"
.LASF23:
	.ascii	"CHSELR\000"
.LASF76:
	.ascii	"number\000"
.LASF79:
	.ascii	"current_state\000"
.LASF87:
	.ascii	"get_switch\000"
.LASF68:
	.ascii	"userPSC\000"
.LASF25:
	.ascii	"sizetype\000"
.LASF42:
	.ascii	"AHBRSTR\000"
.LASF37:
	.ascii	"APB1RSTR\000"
.LASF63:
	.ascii	"DMAR\000"
.LASF81:
	.ascii	"current\000"
.LASF89:
	.ascii	"GPIOB_MODER_OUTPUT\000"
.LASF90:
	.ascii	"PORTA_PUPDR\000"
.LASF29:
	.ascii	"RESERVED0\000"
.LASF20:
	.ascii	"RESERVED1\000"
.LASF21:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF24:
	.ascii	"RESERVED4\000"
.LASF47:
	.ascii	"RESERVED5\000"
.LASF49:
	.ascii	"RESERVED6\000"
.LASF51:
	.ascii	"RESERVED7\000"
.LASF53:
	.ascii	"RESERVED8\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"short int\000"
.LASF39:
	.ascii	"APB2ENR\000"
.LASF71:
	.ascii	"initialise_timer\000"
.LASF82:
	.ascii	"input\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF80:
	.ascii	"previous_state\000"
.LASF85:
	.ascii	"length\000"
.LASF45:
	.ascii	"SMCR\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF70:
	.ascii	"reset_timer\000"
.LASF69:
	.ascii	"initialise\000"
.LASF40:
	.ascii	"APB1ENR\000"
.LASF13:
	.ascii	"int8_t\000"
.LASF75:
	.ascii	"display\000"
.LASF56:
	.ascii	"CCR1\000"
.LASF57:
	.ascii	"CCR2\000"
.LASF58:
	.ascii	"CCR3\000"
.LASF59:
	.ascii	"CCR4\000"
.LASF41:
	.ascii	"BDCR\000"
.LASF17:
	.ascii	"CFGR1\000"
.LASF18:
	.ascii	"CFGR2\000"
.LASF43:
	.ascii	"CFGR3\000"
.LASF14:
	.ascii	"uint8_t\000"
.LASF91:
	.ascii	"PORTA_MODERIN\000"
.LASF92:
	.ascii	"GNU C 4.9.3 20150529 (prerelease) -mthumb -mcpu=cor"
	.ascii	"tex-m0 -g\000"
.LASF35:
	.ascii	"CFGR\000"
.LASF78:
	.ascii	"result\000"
.LASF38:
	.ascii	"AHBENR\000"
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
