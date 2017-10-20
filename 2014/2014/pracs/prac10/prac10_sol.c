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
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	idx
	.bss
	.type	idx, %object
	.size	idx, 1
idx:
	.space	1
	.global	arr
	.data
	.align	2
	.type	arr, %object
	.size	arr, 4
arr:
	.word	4309
	.global	arr_actual
	.align	2
	.type	arr_actual, %object
	.size	arr_actual, 4
arr_actual:
	.word	4309
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB33:
	.file 1 "main.c"
	.loc 1 11 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 18 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #11
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 19 0
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	str	r2, [r3]
	.loc 1 21 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #20]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 22 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #85
	str	r2, [r3, #12]
	.loc 1 24 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #28]
	mov	r1, #16
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 25 0
	ldr	r3, .L16+12
	ldr	r2, .L16+16
	strh	r2, [r3, #40]
	.loc 1 26 0
	ldr	r3, .L16+12
	ldr	r2, .L16+20
	ldr	r2, [r2]
	str	r2, [r3, #44]
	.loc 1 27 0
	ldr	r3, .L16+12
	ldr	r2, .L16+12
	ldrh	r2, [r2, #12]
	uxth	r2, r2
	mov	r1, #1
	orr	r2, r1
	uxth	r2, r2
	strh	r2, [r3, #12]
	.loc 1 28 0
	ldr	r3, .L16+12
	ldr	r2, .L16+12
	ldrh	r2, [r2]
	uxth	r2, r2
	mov	r1, #1
	orr	r2, r1
	uxth	r2, r2
	strh	r2, [r3]
	.loc 1 30 0
	ldr	r3, .L16+24
	ldr	r2, .L16+24
	ldr	r2, [r2]
	mov	r1, #128
	lsl	r1, r1, #10
	orr	r2, r1
	str	r2, [r3]
	.loc 1 32 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #192
	lsl	r1, r1, #4
	orr	r2, r1
	str	r2, [r3]
	.loc 1 33 0
	mov	r3, #144
	lsl	r3, r3, #23
	mov	r2, #144
	lsl	r2, r2, #23
	ldr	r2, [r2]
	mov	r1, #192
	lsl	r1, r1, #6
	orr	r2, r1
	str	r2, [r3]
	.loc 1 34 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #24]
	mov	r1, #128
	lsl	r1, r1, #2
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 35 0
	ldr	r3, .L16+28
	ldr	r2, .L16+28
	ldr	r2, [r2, #8]
	mov	r1, #128
	lsl	r1, r1, #24
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 36 0
	mov	r8, r8
.L2:
	.loc 1 36 0 is_stmt 0 discriminator 1
	ldr	r3, .L16+28
	ldr	r3, [r3, #8]
	cmp	r3, #0
	blt	.L2
	.loc 1 37 0 is_stmt 1
	ldr	r3, .L16+28
	ldr	r2, .L16+28
	ldr	r2, [r2, #8]
	mov	r1, #1
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 38 0
	mov	r8, r8
.L3:
	.loc 1 38 0 is_stmt 0 discriminator 1
	ldr	r3, .L16+28
	ldr	r2, [r3]
	mov	r3, #1
	and	r3, r2
	beq	.L3
	.loc 1 41 0 is_stmt 1
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r1, r3
	mov	r3, r7
	add	r3, r3, #19
	mov	r2, #1
	and	r2, r1
	strb	r2, [r3]
	.loc 1 42 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r1, r3
	mov	r3, r7
	add	r3, r3, #18
	mov	r2, #2
	and	r2, r1
	strb	r2, [r3]
.L15:
	.loc 1 45 0
	mov	r3, #0
	str	r3, [r7, #20]
	b	.L4
.L5:
	.loc 1 45 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #20]
	add	r3, r3, #1
	str	r3, [r7, #20]
.L4:
	.loc 1 45 0 discriminator 1
	ldr	r2, [r7, #20]
	ldr	r3, .L16+32
	cmp	r2, r3
	bls	.L5
	.loc 1 47 0 is_stmt 1
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r1, r3
	mov	r3, r7
	add	r3, r3, #13
	mov	r2, #1
	and	r2, r1
	strb	r2, [r3]
	.loc 1 48 0
	mov	r3, r7
	add	r3, r3, #19
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L6
	.loc 1 48 0 is_stmt 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #13
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L6
	.loc 1 49 0 is_stmt 1
	ldr	r3, .L16+12
	ldr	r2, .L16+12
	ldrh	r2, [r2, #20]
	uxth	r2, r2
	mov	r1, #1
	orr	r2, r1
	uxth	r2, r2
	strh	r2, [r3, #20]
	.loc 1 50 0
	ldr	r3, .L16+36
	mov	r2, #0
	strb	r2, [r3]
.L6:
	.loc 1 52 0
	mov	r3, r7
	add	r3, r3, #19
	mov	r2, r7
	add	r2, r2, #13
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 54 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r1, r3
	mov	r3, r7
	add	r3, r3, #12
	mov	r2, #2
	and	r2, r1
	strb	r2, [r3]
	.loc 1 55 0
	mov	r3, r7
	add	r3, r3, #18
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L7
	.loc 1 55 0 is_stmt 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #12
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L7
	.loc 1 56 0 is_stmt 1
	ldr	r3, .L16+20
	ldr	r2, .L16+40
	str	r2, [r3]
.L7:
	.loc 1 58 0
	mov	r3, r7
	add	r3, r3, #18
	mov	r2, r7
	add	r2, r2, #12
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 60 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	uxtb	r1, r3
	mov	r3, r7
	add	r3, r3, #11
	mov	r2, #4
	and	r2, r1
	strb	r2, [r3]
	.loc 1 61 0
	mov	r3, r7
	add	r3, r3, #17
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L8
	.loc 1 61 0 is_stmt 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #11
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L8
	.loc 1 62 0 is_stmt 1
	ldr	r3, .L16+20
	ldr	r2, .L16+44
	str	r2, [r3]
.L8:
	.loc 1 64 0
	mov	r3, r7
	add	r3, r3, #17
	mov	r2, r7
	add	r2, r2, #11
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 66 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	mov	r2, r3
	mov	r3, #8
	and	r3, r2
	bne	.L9
	.loc 1 67 0
	ldr	r3, .L16+28
	mov	r2, #32
	str	r2, [r3, #40]
	.loc 1 68 0
	ldr	r3, .L16+28
	ldr	r2, .L16+28
	ldr	r2, [r2, #8]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 69 0
	mov	r8, r8
.L10:
	.loc 1 69 0 is_stmt 0 discriminator 1
	ldr	r3, .L16+28
	ldr	r2, [r3]
	mov	r3, #4
	and	r3, r2
	beq	.L10
	.loc 1 70 0 is_stmt 1
	ldr	r3, .L16+28
	ldr	r2, [r3, #64]
	mov	r3, r7
	add	r3, r3, #8
	strh	r2, [r3]
	.loc 1 71 0
	ldr	r3, .L16+28
	mov	r2, #64
	str	r2, [r3, #40]
	.loc 1 72 0
	ldr	r3, .L16+28
	ldr	r2, .L16+28
	ldr	r2, [r2, #8]
	mov	r1, #4
	orr	r2, r1
	str	r2, [r3, #8]
	.loc 1 73 0
	mov	r8, r8
.L11:
	.loc 1 73 0 is_stmt 0 discriminator 1
	ldr	r3, .L16+28
	ldr	r2, [r3]
	mov	r3, #4
	and	r3, r2
	beq	.L11
	.loc 1 74 0 is_stmt 1
	ldr	r3, .L16+28
	ldr	r2, [r3, #64]
	add	r3, r7, #6
	strh	r2, [r3]
	.loc 1 75 0
	mov	r2, r7
	add	r2, r2, #8
	add	r3, r7, #6
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	cmp	r2, r3
	bls	.L12
	.loc 1 76 0
	mov	r3, r7
	add	r3, r3, #14
	mov	r2, r7
	add	r2, r2, #8
	ldrh	r2, [r2]
	strh	r2, [r3]
	b	.L13
.L12:
	.loc 1 78 0
	mov	r3, r7
	add	r3, r3, #14
	add	r2, r7, #6
	ldrh	r2, [r2]
	strh	r2, [r3]
.L13:
	.loc 1 80 0 discriminator 1
	mov	r3, r7
	add	r3, r3, #14
	ldrh	r3, [r3]
	ldr	r2, .L16+48
	sub	r3, r2, r3
	mov	r2, r3
	ldr	r3, .L16+52
	str	r2, [r3]
	.loc 1 86 0 discriminator 1
	b	.L15
.L9:
	.loc 1 82 0
	ldr	r3, .L16+20
	ldr	r2, [r3]
	ldr	r3, .L16+52
	str	r2, [r3]
	.loc 1 86 0
	b	.L15
.L17:
	.align	2
.L16:
	.word	1073876992
	.word	1207960576
	.word	21845
	.word	1073745920
	.word	1855
	.word	arr
	.word	-536813312
	.word	1073816576
	.word	12299
	.word	idx
	.word	2155
	.word	862
	.word	4309
	.word	arr_actual
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	-120
	.byte	72
	.byte	40
	.byte	24
	.text
	.align	2
	.global	TIM6_DAC_IRQHandler
	.code	16
	.thumb_func
	.type	TIM6_DAC_IRQHandler, %function
TIM6_DAC_IRQHandler:
.LFB34:
	.loc 1 89 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 90 0
	ldr	r3, .L20
	ldr	r2, .L20
	ldrh	r2, [r2, #16]
	uxth	r2, r2
	mov	r1, #1
	bic	r2, r1
	uxth	r2, r2
	strh	r2, [r3, #16]
	.loc 1 91 0
	mov	r2, r7
	ldr	r3, .L20+4
	mov	r1, r2
	mov	r2, r3
	mov	r3, #8
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	memcpy
	.loc 1 92 0
	ldr	r3, .L20+8
	ldr	r2, .L20+12
	ldrb	r2, [r2]
	mov	r1, r7
	ldrb	r2, [r1, r2]
	strh	r2, [r3, #20]
	.loc 1 93 0
	ldr	r3, .L20+12
	ldrb	r3, [r3]
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L20+12
	strb	r2, [r3]
	.loc 1 95 0
	ldr	r3, .L20+12
	ldrb	r3, [r3]
	cmp	r3, #7
	bls	.L19
	.loc 1 96 0
	ldr	r3, .L20+12
	mov	r2, #0
	strb	r2, [r3]
.L19:
	.loc 1 98 0
	ldr	r3, .L20
	ldr	r2, .L20+16
	ldr	r2, [r2]
	str	r2, [r3, #44]
	.loc 1 99 0
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	1073745920
	.word	.LC0
	.word	1207960576
	.word	idx
	.word	arr_actual
	.cfi_endproc
.LFE34:
	.size	TIM6_DAC_IRQHandler, .-TIM6_DAC_IRQHandler
.Letext0:
	.file 2 "/usr/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/usr/arm-none-eabi/include/stdint.h"
	.file 4 "./Libraries/core_cm0.h"
	.file 5 "./Libraries/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x71f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x1
	.4byte	.LASF84
	.4byte	.LASF85
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1c
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x26
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x38
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x2a
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x36
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x42
	.4byte	0x5e
	.uleb128 0x5
	.2byte	0x320
	.byte	0x4
	.2byte	0x118
	.4byte	0x13f
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x11a
	.4byte	0x156
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x11b
	.4byte	0x15b
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x11c
	.4byte	0x16b
	.byte	0x80
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x11d
	.4byte	0x15b
	.byte	0x84
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x11e
	.4byte	0x170
	.2byte	0x100
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x11f
	.4byte	0x15b
	.2byte	0x104
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x120
	.4byte	0x175
	.2byte	0x180
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x121
	.4byte	0x15b
	.2byte	0x184
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x122
	.4byte	0x17a
	.2byte	0x200
	.uleb128 0x8
	.ascii	"IP\000"
	.byte	0x4
	.2byte	0x123
	.4byte	0x19a
	.2byte	0x300
	.byte	0
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x14f
	.uleb128 0xa
	.4byte	0x14f
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF24
	.uleb128 0xb
	.4byte	0x13f
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x16b
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x1e
	.byte	0
	.uleb128 0xb
	.4byte	0x13f
	.uleb128 0xb
	.4byte	0x13f
	.uleb128 0xb
	.4byte	0x13f
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x18a
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x3f
	.byte	0
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x19a
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.4byte	0x18a
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x124
	.4byte	0xad
	.uleb128 0xb
	.4byte	0xa2
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x1c0
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.byte	0x44
	.byte	0x5
	.2byte	0x17c
	.4byte	0x270
	.uleb128 0xe
	.ascii	"ISR\000"
	.byte	0x5
	.2byte	0x17e
	.4byte	0x1ab
	.byte	0
	.uleb128 0xe
	.ascii	"IER\000"
	.byte	0x5
	.2byte	0x17f
	.4byte	0x1ab
	.byte	0x4
	.uleb128 0xe
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x180
	.4byte	0x1ab
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x181
	.4byte	0x1ab
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x182
	.4byte	0x1ab
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x183
	.4byte	0x1ab
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x184
	.4byte	0xa2
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x185
	.4byte	0xa2
	.byte	0x1c
	.uleb128 0xe
	.ascii	"TR\000"
	.byte	0x5
	.2byte	0x186
	.4byte	0x1ab
	.byte	0x20
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x187
	.4byte	0xa2
	.byte	0x24
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x188
	.4byte	0x1ab
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x189
	.4byte	0x270
	.byte	0x2c
	.uleb128 0xe
	.ascii	"DR\000"
	.byte	0x5
	.2byte	0x18a
	.4byte	0x1ab
	.byte	0x40
	.byte	0
	.uleb128 0x9
	.4byte	0xa2
	.4byte	0x280
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x18b
	.4byte	0x1c0
	.uleb128 0xb
	.4byte	0x97
	.uleb128 0xd
	.byte	0x2c
	.byte	0x5
	.2byte	0x269
	.4byte	0x351
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x26b
	.4byte	0x1ab
	.byte	0
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x26c
	.4byte	0x28c
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x26d
	.4byte	0x97
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x26e
	.4byte	0x1ab
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x26f
	.4byte	0x1ab
	.byte	0xc
	.uleb128 0xe
	.ascii	"IDR\000"
	.byte	0x5
	.2byte	0x270
	.4byte	0x28c
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x271
	.4byte	0x97
	.byte	0x12
	.uleb128 0xe
	.ascii	"ODR\000"
	.byte	0x5
	.2byte	0x272
	.4byte	0x28c
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x273
	.4byte	0x97
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x274
	.4byte	0x1ab
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x275
	.4byte	0x1ab
	.byte	0x1c
	.uleb128 0xe
	.ascii	"AFR\000"
	.byte	0x5
	.2byte	0x276
	.4byte	0x351
	.byte	0x20
	.uleb128 0xe
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x277
	.4byte	0x28c
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x278
	.4byte	0x97
	.byte	0x2a
	.byte	0
	.uleb128 0xb
	.4byte	0x1b0
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x279
	.4byte	0x291
	.uleb128 0xd
	.byte	0x38
	.byte	0x5
	.2byte	0x2b5
	.4byte	0x421
	.uleb128 0xe
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x2b7
	.4byte	0x1ab
	.byte	0
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x2b8
	.4byte	0x1ab
	.byte	0x4
	.uleb128 0xe
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x2b9
	.4byte	0x1ab
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x2ba
	.4byte	0x1ab
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x2bb
	.4byte	0x1ab
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x2bc
	.4byte	0x1ab
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x2bd
	.4byte	0x1ab
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x2be
	.4byte	0x1ab
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x2bf
	.4byte	0x1ab
	.byte	0x20
	.uleb128 0xe
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x2c0
	.4byte	0x1ab
	.byte	0x24
	.uleb128 0x6
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x2c1
	.4byte	0x1ab
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x2c2
	.4byte	0x1ab
	.byte	0x2c
	.uleb128 0x6
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x2c3
	.4byte	0x1ab
	.byte	0x30
	.uleb128 0xe
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x2c4
	.4byte	0x1ab
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x5
	.2byte	0x2c5
	.4byte	0x362
	.uleb128 0xd
	.byte	0x54
	.byte	0x5
	.2byte	0x309
	.4byte	0x609
	.uleb128 0xe
	.ascii	"CR1\000"
	.byte	0x5
	.2byte	0x30b
	.4byte	0x28c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x30c
	.4byte	0x97
	.byte	0x2
	.uleb128 0xe
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x30d
	.4byte	0x28c
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x30e
	.4byte	0x97
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x30f
	.4byte	0x28c
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x310
	.4byte	0x97
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x311
	.4byte	0x28c
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x312
	.4byte	0x97
	.byte	0xe
	.uleb128 0xe
	.ascii	"SR\000"
	.byte	0x5
	.2byte	0x313
	.4byte	0x28c
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x314
	.4byte	0x97
	.byte	0x12
	.uleb128 0xe
	.ascii	"EGR\000"
	.byte	0x5
	.2byte	0x315
	.4byte	0x28c
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x5
	.2byte	0x316
	.4byte	0x97
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x5
	.2byte	0x317
	.4byte	0x28c
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x318
	.4byte	0x97
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x319
	.4byte	0x28c
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x31a
	.4byte	0x97
	.byte	0x1e
	.uleb128 0x6
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x31b
	.4byte	0x28c
	.byte	0x20
	.uleb128 0x6
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x31c
	.4byte	0x97
	.byte	0x22
	.uleb128 0xe
	.ascii	"CNT\000"
	.byte	0x5
	.2byte	0x31d
	.4byte	0x1ab
	.byte	0x24
	.uleb128 0xe
	.ascii	"PSC\000"
	.byte	0x5
	.2byte	0x31e
	.4byte	0x28c
	.byte	0x28
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x31f
	.4byte	0x97
	.byte	0x2a
	.uleb128 0xe
	.ascii	"ARR\000"
	.byte	0x5
	.2byte	0x320
	.4byte	0x1ab
	.byte	0x2c
	.uleb128 0xe
	.ascii	"RCR\000"
	.byte	0x5
	.2byte	0x321
	.4byte	0x28c
	.byte	0x30
	.uleb128 0x6
	.4byte	.LASF59
	.byte	0x5
	.2byte	0x322
	.4byte	0x97
	.byte	0x32
	.uleb128 0x6
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x323
	.4byte	0x1ab
	.byte	0x34
	.uleb128 0x6
	.4byte	.LASF61
	.byte	0x5
	.2byte	0x324
	.4byte	0x1ab
	.byte	0x38
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0x5
	.2byte	0x325
	.4byte	0x1ab
	.byte	0x3c
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0x5
	.2byte	0x326
	.4byte	0x1ab
	.byte	0x40
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0x5
	.2byte	0x327
	.4byte	0x28c
	.byte	0x44
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x328
	.4byte	0x97
	.byte	0x46
	.uleb128 0xe
	.ascii	"DCR\000"
	.byte	0x5
	.2byte	0x329
	.4byte	0x28c
	.byte	0x48
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x32a
	.4byte	0x97
	.byte	0x4a
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x32b
	.4byte	0x28c
	.byte	0x4c
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x32c
	.4byte	0x97
	.byte	0x4e
	.uleb128 0xe
	.ascii	"OR\000"
	.byte	0x5
	.2byte	0x32d
	.4byte	0x28c
	.byte	0x50
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x32e
	.4byte	0x97
	.byte	0x52
	.byte	0
	.uleb128 0xc
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x32f
	.4byte	0x42d
	.uleb128 0xf
	.4byte	.LASF86
	.byte	0x1
	.byte	0xb
	.4byte	0x7e
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6bb
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x1
	.byte	0xc
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF72
	.byte	0x1
	.byte	0xd
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x10
	.4byte	.LASF73
	.byte	0x1
	.byte	0xd
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0x10
	.4byte	.LASF74
	.byte	0x1
	.byte	0xe
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x1
	.byte	0xe
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0xf
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.uleb128 0x10
	.4byte	.LASF77
	.byte	0x1
	.byte	0xf
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x10
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF79
	.byte	0x1
	.byte	0x10
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x10
	.4byte	.LASF80
	.byte	0x1
	.byte	0x10
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x11
	.4byte	.LASF87
	.byte	0x1
	.byte	0x59
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6df
	.uleb128 0x10
	.4byte	.LASF81
	.byte	0x1
	.byte	0x5b
	.4byte	0x6df
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	0x8c
	.4byte	0x6ef
	.uleb128 0xa
	.4byte	0x14f
	.byte	0x7
	.byte	0
	.uleb128 0x12
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	idx
	.uleb128 0x12
	.ascii	"arr\000"
	.byte	0x1
	.byte	0x7
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x3
	.4byte	arr
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x1
	.byte	0x8
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x3
	.4byte	arr_actual
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
	.uleb128 0x3
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
	.uleb128 0x5
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x5
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x11
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
.LASF21:
	.ascii	"ICPR\000"
.LASF35:
	.ascii	"PUPDR\000"
.LASF37:
	.ascii	"LCKR\000"
.LASF85:
	.ascii	"/home/jgowans/Dropbox/UCT/prac10_sol\000"
.LASF33:
	.ascii	"OTYPER\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF70:
	.ascii	"TIM_TypeDef\000"
.LASF32:
	.ascii	"MODER\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"SMPR\000"
.LASF19:
	.ascii	"ISPR\000"
.LASF64:
	.ascii	"BDTR\000"
.LASF80:
	.ascii	"pot_to_use\000"
.LASF52:
	.ascii	"CCMR1\000"
.LASF54:
	.ascii	"CCMR2\000"
.LASF9:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF36:
	.ascii	"BSRR\000"
.LASF58:
	.ascii	"RESERVED10\000"
.LASF59:
	.ascii	"RESERVED12\000"
.LASF65:
	.ascii	"RESERVED17\000"
.LASF66:
	.ascii	"RESERVED18\000"
.LASF68:
	.ascii	"RESERVED19\000"
.LASF6:
	.ascii	"long int\000"
.LASF40:
	.ascii	"APB2RSTR\000"
.LASF56:
	.ascii	"CCER\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF31:
	.ascii	"ADC_TypeDef\000"
.LASF81:
	.ascii	"array\000"
.LASF34:
	.ascii	"OSPEEDR\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF69:
	.ascii	"RESERVED20\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF38:
	.ascii	"GPIO_TypeDef\000"
.LASF48:
	.ascii	"RCC_TypeDef\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"CHSELR\000"
.LASF84:
	.ascii	"main.c\000"
.LASF78:
	.ascii	"pot0\000"
.LASF79:
	.ascii	"pot1\000"
.LASF24:
	.ascii	"sizetype\000"
.LASF82:
	.ascii	"arr_actual\000"
.LASF71:
	.ascii	"delay_counter\000"
.LASF83:
	.ascii	"GNU C 4.8.4 20140526 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 211358] -mthumb -mcpu=cortex-m0 -g\000"
.LASF17:
	.ascii	"ICER\000"
.LASF46:
	.ascii	"AHBRSTR\000"
.LASF41:
	.ascii	"APB1RSTR\000"
.LASF67:
	.ascii	"DMAR\000"
.LASF16:
	.ascii	"RESERVED0\000"
.LASF29:
	.ascii	"RESERVED1\000"
.LASF20:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF23:
	.ascii	"RESERVED4\000"
.LASF51:
	.ascii	"RESERVED5\000"
.LASF53:
	.ascii	"RESERVED6\000"
.LASF55:
	.ascii	"RESERVED7\000"
.LASF57:
	.ascii	"RESERVED8\000"
.LASF73:
	.ascii	"sw0_current\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF72:
	.ascii	"sw0_previous\000"
.LASF74:
	.ascii	"sw1_previous\000"
.LASF76:
	.ascii	"sw2_previous\000"
.LASF2:
	.ascii	"short int\000"
.LASF15:
	.ascii	"ISER\000"
.LASF25:
	.ascii	"NVIC_Type\000"
.LASF43:
	.ascii	"APB2ENR\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF87:
	.ascii	"TIM6_DAC_IRQHandler\000"
.LASF49:
	.ascii	"SMCR\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF75:
	.ascii	"sw1_current\000"
.LASF44:
	.ascii	"APB1ENR\000"
.LASF60:
	.ascii	"CCR1\000"
.LASF61:
	.ascii	"CCR2\000"
.LASF62:
	.ascii	"CCR3\000"
.LASF63:
	.ascii	"CCR4\000"
.LASF45:
	.ascii	"BDCR\000"
.LASF26:
	.ascii	"CFGR1\000"
.LASF27:
	.ascii	"CFGR2\000"
.LASF47:
	.ascii	"CFGR3\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF18:
	.ascii	"RSERVED1\000"
.LASF77:
	.ascii	"sw2_current\000"
.LASF50:
	.ascii	"DIER\000"
.LASF39:
	.ascii	"CFGR\000"
.LASF86:
	.ascii	"main\000"
.LASF42:
	.ascii	"AHBENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.8.4 20140526 (release) [ARM/embedded-4_8-branch revision 211358]"
