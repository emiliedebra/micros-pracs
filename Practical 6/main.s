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
	.section	.rodata
	.align	2
.LC0:
	.word	170
	.word	255
	.word	85
	.word	0
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 18 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 20 0
	ldr	r2, .L3
	ldr	r3, .L3
	ldr	r1, [r3]
	ldr	r3, .L3+4
	ldr	r3, [r3]
	orr	r3, r1
	str	r3, [r2]
	.loc 1 22 0
	ldr	r2, .L3+8
	ldr	r3, .L3+8
	ldr	r1, [r3]
	ldr	r3, .L3+12
	ldr	r3, [r3]
	orr	r3, r1
	str	r3, [r2]
	.loc 1 24 0
	ldr	r2, .L3+16
	ldr	r3, .L3+16
	ldr	r1, [r3]
	ldr	r3, .L3+20
	ldr	r3, [r3]
	orr	r3, r1
	str	r3, [r2]
	.loc 1 25 0
	mov	r3, #144
	lsl	r3, r3, #23
	ldr	r2, .L3+24
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 27 0
	ldr	r3, .L3+28
	mov	r2, #170
	str	r2, [r3]
	.loc 1 28 0
	mov	r3, r7
	ldr	r2, .L3+32
	ldmia	r2!, {r0, r1, r4}
	stmia	r3!, {r0, r1, r4}
	ldr	r2, [r2]
	str	r2, [r3]
.L2:
	.loc 1 33 0 discriminator 1
	ldr	r2, .L3+28
	mov	r3, r7
	ldr	r3, [r3]
	str	r3, [r2]
	.loc 1 34 0 discriminator 1
	bl	freeze
	.loc 1 35 0 discriminator 1
	mov	r3, #250
	lsl	r3, r3, #2
	mov	r0, r3
	bl	delay
	.loc 1 36 0 discriminator 1
	ldr	r2, .L3+28
	mov	r3, r7
	ldr	r3, [r3, #4]
	str	r3, [r2]
	.loc 1 37 0 discriminator 1
	bl	freeze
	.loc 1 38 0 discriminator 1
	mov	r3, #250
	lsl	r3, r3, #2
	mov	r0, r3
	bl	delay
	.loc 1 39 0 discriminator 1
	ldr	r2, .L3+28
	mov	r3, r7
	ldr	r3, [r3, #8]
	str	r3, [r2]
	.loc 1 40 0 discriminator 1
	bl	freeze
	.loc 1 41 0 discriminator 1
	mov	r3, #250
	lsl	r3, r3, #2
	mov	r0, r3
	bl	delay
	.loc 1 42 0 discriminator 1
	ldr	r2, .L3+28
	mov	r3, r7
	ldr	r3, [r3, #12]
	str	r3, [r2]
	.loc 1 43 0 discriminator 1
	bl	freeze
	.loc 1 44 0 discriminator 1
	mov	r3, #250
	lsl	r3, r3, #2
	mov	r0, r3
	bl	delay
	.loc 1 45 0 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	1073877012
	.word	RCC_AHBENR_IOPBEN
	.word	1207960576
	.word	GPIOB_MODER_OUTPUT
	.word	1207959564
	.word	PORTA_PUPDR
	.word	PORTA_MODERIN
	.word	1207960596
	.word	.LC0
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	delay
	.code	16
	.thumb_func
	.type	delay, %function
delay:
.LFB1:
	.loc 1 49 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 51 0
	ldr	r2, [r7, #4]
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #3
	str	r3, [r7, #4]
	.loc 1 53 0
	mov	r3, #0
	str	r3, [r7, #12]
	b	.L6
.L7:
	.loc 1 54 0
	bl	freeze
	.loc 1 55 0
	ldr	r3, [r7, #12]
	add	r3, r3, #1
	str	r3, [r7, #12]
.L6:
	.loc 1 53 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bls	.L7
	.loc 1 57 0
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	delay, .-delay
	.align	2
	.global	freeze
	.code	16
	.thumb_func
	.type	freeze, %function
freeze:
.LFB2:
	.loc 1 59 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 61 0
	mov	r8, r8
.L9:
	.loc 1 61 0 is_stmt 0 discriminator 1
	bl	get_switch
	sub	r3, r0, #0
	beq	.L9
	.loc 1 63 0 is_stmt 1
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	freeze, .-freeze
	.align	2
	.global	get_switch
	.code	16
	.thumb_func
	.type	get_switch, %function
get_switch:
.LFB3:
	.loc 1 65 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 67 0
	add	r3, r7, #7
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 68 0
	ldr	r3, .L12
	ldr	r3, [r3]
	uxtb	r2, r3
	add	r3, r7, #7
	mov	r1, #2
	and	r2, r1
	strb	r2, [r3]
	.loc 1 69 0
	add	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	.loc 1 70 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	1207959568
	.cfi_endproc
.LFE3:
	.size	get_switch, .-get_switch
.Letext0:
	.file 2 "/usr/include/newlib/machine/_default_types.h"
	.file 3 "/usr/include/newlib/sys/_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x196
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x1
	.4byte	.LASF25
	.4byte	.LASF26
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
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x41
	.4byte	0x69
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x13
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x14
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x20
	.4byte	0x5e
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.byte	0x12
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd5
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1c
	.4byte	0xd5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x7
	.4byte	0xa2
	.4byte	0xe5
	.uleb128 0x8
	.4byte	0xe5
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0x31
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11c
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1
	.byte	0x31
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0x32
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x1
	.byte	0x3b
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF18
	.byte	0x1
	.byte	0x41
	.4byte	0x8c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x155
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x43
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x1
	.byte	0x8
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x3
	.4byte	RCC_AHBENR_IOPBEN
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0x9
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x3
	.4byte	GPIOB_MODER_OUTPUT
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0xa
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x3
	.4byte	PORTA_PUPDR
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0xb
	.4byte	0xa2
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x2116
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
	.uleb128 0xe
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
.LASF0:
	.ascii	"__int8_t\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF21:
	.ascii	"GPIOB_MODER_OUTPUT\000"
.LASF22:
	.ascii	"PORTA_PUPDR\000"
.LASF12:
	.ascii	"int8_t\000"
.LASF2:
	.ascii	"signed char\000"
.LASF27:
	.ascii	"delay\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF16:
	.ascii	"array\000"
.LASF29:
	.ascii	"freeze\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF26:
	.ascii	"/home/emilie/Documents/UCT/Second Year/Second Semes"
	.ascii	"ter/Micros/Practical 6\000"
.LASF17:
	.ascii	"main\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF19:
	.ascii	"result\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF18:
	.ascii	"get_switch\000"
.LASF9:
	.ascii	"long long int\000"
.LASF25:
	.ascii	"main.c\000"
.LASF23:
	.ascii	"PORTA_MODERIN\000"
.LASF4:
	.ascii	"short int\000"
.LASF20:
	.ascii	"RCC_AHBENR_IOPBEN\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF24:
	.ascii	"GNU C 4.9.3 20150529 (prerelease) -mthumb -mcpu=cor"
	.ascii	"tex-m0 -g\000"
.LASF28:
	.ascii	"length\000"
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
