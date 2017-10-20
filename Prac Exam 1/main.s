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
	.file	"part4.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	myArray
	.data
	.align	2
	.type	myArray, %object
	.size	myArray, 8
myArray:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "part4.c"
	.loc 1 13 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 15 0
	bl	init_LEDPB
.L2:
.LBB2:
	.loc 1 23 0 discriminator 1
	mov	r0, #1
	bl	get_switch
	mov	r3, r0
	mov	r2, r3
	add	r3, r7, #7
	strb	r2, [r3]
	.loc 1 24 0 discriminator 1
	mov	r0, #2
	bl	get_switch
	mov	r3, r0
	mov	r2, r3
	add	r3, r7, #6
	strb	r2, [r3]
	.loc 1 25 0 discriminator 1
	mov	r0, #4
	bl	get_switch
	mov	r3, r0
	mov	r2, r3
	add	r3, r7, #5
	strb	r2, [r3]
	.loc 1 26 0 discriminator 1
	mov	r0, #8
	bl	get_switch
	mov	r3, r0
	mov	r2, r3
	add	r3, r7, #4
	strb	r2, [r3]
	.loc 1 27 0 discriminator 1
	add	r3, r7, #7
	ldrb	r3, [r3]
	add	r2, r3, #0
	lsl	r2, r2, #4
	sub	r3, r2, r3
	uxtb	r2, r3
	add	r3, r7, #6
	ldrb	r3, [r3]
	mov	r1, #24
	mul	r3, r1
	uxtb	r3, r3
	add	r3, r2, r3
	uxtb	r1, r3
	add	r3, r7, #4
	ldrb	r3, [r3]
	add	r2, r3, #0
	lsl	r2, r2, #3
	sub	r2, r2, r3
	lsl	r2, r2, #4
	sub	r3, r2, r3
	uxtb	r2, r3
	add	r3, r7, #5
	ldrb	r3, [r3]
	mov	r0, #56
	mul	r3, r0
	uxtb	r3, r3
	add	r3, r2, r3
	uxtb	r2, r3
	add	r3, r7, #3
	add	r2, r1, r2
	strb	r2, [r3]
	.loc 1 28 0 discriminator 1
	add	r3, r7, #3
	ldrb	r3, [r3]
	mov	r0, r3
	bl	display
.LBE2:
	.loc 1 29 0 discriminator 1
	b	.L2
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	TIM6_IRQ
	.code	16
	.thumb_func
	.type	TIM6_IRQ, %function
TIM6_IRQ:
.LFB1:
	.loc 1 32 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 34 0
	bl	reset_timer
	.loc 1 35 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	TIM6_IRQ, .-TIM6_IRQ
	.align	2
	.global	TIM14_IRQ
	.code	16
	.thumb_func
	.type	TIM14_IRQ, %function
TIM14_IRQ:
.LFB2:
	.loc 1 37 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 39 0
	bl	reset_timer
	.loc 1 40 0
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE2:
	.size	TIM14_IRQ, .-TIM14_IRQ
.Letext0:
	.file 2 "/usr/include/newlib/machine/_default_types.h"
	.file 3 "/usr/include/newlib/sys/_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x132
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x1
	.4byte	.LASF16
	.4byte	.LASF17
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1d
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.byte	0xd
	.4byte	0x68
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf2
	.uleb128 0x6
	.ascii	"sw0\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x6
	.ascii	"sw1\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x6
	.ascii	"sw2\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.uleb128 0x6
	.ascii	"sw3\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1b
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x20
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x25
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	0x76
	.4byte	0x124
	.uleb128 0xb
	.4byte	0x81
	.byte	0x7
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa
	.4byte	0x114
	.uleb128 0x5
	.byte	0x3
	.4byte	myArray
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
	.uleb128 0x7
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
.LASF6:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF12:
	.ascii	"number\000"
.LASF18:
	.ascii	"main\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF9:
	.ascii	"__uint8_t\000"
.LASF10:
	.ascii	"uint8_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"/home/emilie/Documents/UCT/Second Year/Micros/Prac "
	.ascii	"Exam 1\000"
.LASF14:
	.ascii	"TIM14_IRQ\000"
.LASF4:
	.ascii	"long int\000"
.LASF13:
	.ascii	"TIM6_IRQ\000"
.LASF15:
	.ascii	"GNU C 4.9.3 20150529 (prerelease) -mthumb -mcpu=cor"
	.ascii	"tex-m0 -g\000"
.LASF0:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"part4.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF19:
	.ascii	"myArray\000"
.LASF11:
	.ascii	"sizetype\000"
	.ident	"GCC: (15:4.9.3+svn231177-1) 4.9.3 20150529 (prerelease)"
