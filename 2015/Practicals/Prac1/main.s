@ GWNJAM001
@ Practical 1 Solution

	.syntax unified
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1
_start:
	LDR R0, RCC_BASE  	@ Enable clock for GPIOB by setting bit 18 in RCC_AHBENR
	LDR R1, AHBENR_GPIOB
	STR R1, [R0, #0x14]
	LDR R0, GPIOB_BASE	@ Set lower 8 pins of GPIOB to outputs
	LDR R1, MODER_OUTPUT
	STR R1, [R0, #0]
	MOVS R1, #10      	@ Display 10 on LEDs by writing to GPIOB_ODR
	STR R1, [R0, #0x14]

main_loop:
	CMP R1, #20       	@ Are we currently showing 20 on the LEDS?
	BNE no_wrap       	@ If not, skip the wrapping instruction
	MOVS R1, #9       	@ If so, wrap to 9 (it will be inc'd to 10 momentarily)
no_wrap:
	ADDS R1, #1       	@ Increment value and write back
	STR R1, [R0, #0x14]
	B main_loop
    

	.align
RCC_BASE: 	.word 0x40021000
AHBENR_GPIOB: .word 0b1000000000000000000
GPIOB_BASE:   .word 0x48000400
MODER_OUTPUT: .word 0x5555


