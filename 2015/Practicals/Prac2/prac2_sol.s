	.syntax unified
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	LDR R0, RCC_BASE  	@ Enable clock for GPIOA and B by setting bit 17 and 18 in RCC_AHBENR
	LDR R1, [R0, #0x14]
	LDR R2, AHBENR_GPIOAB
	ORRS R1, R1, R2
	STR R1, [R0, #0x14]
	LDR R0, GPIOA_BASE
	MOVS R1, #0b01010101	@ enable pullups for push buttons
	STR R1, [R0, #0x0C]
	LDR R1, GPIOB_BASE  	@ Set pins connected to LEDs to outputs
	LDR R2, MODER_OUTPUT
	STR R2, [R1, #0]
	MOVS R2, #0         	@ R2 will be dedicated to holding the value on the LEDs

main_loop:
	LDR R3, [R0, #0x10] 	@ Is SW2 held?
	MOVS R4, #0b100
	ANDS R4, R3, R4
	BNE no_reset        	@ if not, skip the reset logic
	MOVS R2, #0xAA
	B write_leds
no_reset:
	MOVS R4, #0b1000    	@ Is SW3 held?
	ANDS R4, R4, R3
	BEQ main_loop       	@ if so, loop without doing any work
	LDR R5, LONG_DELAY_CNT  @ assume long delay
	MOVS R4, #0b10      	@ Is SW2 held?
	ANDS R4, R3, R4
	BNE delay_loop      	@ if not, skip making the delay shorter
	LDR R5, SHORT_DELAY_CNT
delay_loop:
	SUBS R5, #1
	BNE delay_loop
	LDR R3, [R0, #0x10]	@ second check, Is SW3 held? 
	MOVS R4, #0b1000
	ANDS R4, R4, R3
	BEQ main_loop       	@ if so, loop without adjusting LEDs
	ADDS R2, #1         	@ add at least one to the output value register
	MOVS R4, #0b1	@ Is SW0 held?
	ANDS R3, R3, R4
	BNE write_leds        	@ if not, don't do anymore adding
	ADDS R2, #1         	@ if so, add one more
write_leds:
	STR R2, [R1, #0x14]
	B main_loop

	.align
RCC_BASE: 	.word 0x40021000
AHBENR_GPIOAB: .word 0b1100000000000000000
GPIOA_BASE:  .word 0x48000000
GPIOB_BASE:  .word 0x48000400
MODER_OUTPUT: .word 0x5555
LONG_DELAY_CNT: .word 1400000
SHORT_DELAY_CNT: .word 600000

