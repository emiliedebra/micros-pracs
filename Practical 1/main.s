@WDXEMI001 RCHCHA006
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripherals
	LDR R0, =0x40021000 								@ load RCC base address
	LDR R1, [R0, #0x14]									@ load clock for Port B and Port B (RCC_AHBENR)
	LDR R2, =0b1100000000000000000 			@ load a high 18th and 17th bit into R2
	ORRS R1, R1, R2											@ set high 18th and 17th bits
	STR R1, [R0, #0x14] 								@ store it back in clock for port B and A

	@ configure relevant pins to be outputs
	LDR R0, =0x48000400 								@ load GPIOB base address
	LDR R1, [R0] 												@ load GPIOB_MODER
	LDR R2, =0b0101010101010101					@ set mode for GPIOB
	ORRS R1, R1, R2
	STR R1, [R0]												@ store it back GPIOB_MODER

all_off:
	@ turn all LEDs off
	LDR R1, [R0, #0x14]									@ load GPIOB_ODR
	LDR R2, =0xFFFFFF00									@ set state to all off
	ANDS R1, R1, R2
	STR R1, [R0, #0x14]									@ store it back in GPIOB_ODR

display_AA:
	@ display the pattern 0xAA on the LEDs
	LDR R2, =0xAA												@ set state to pattern
	ORRS R1, R1, R2
	STR R1, [R0, #0x14]									@ store it back in GPIOB_ODR

all_on:
	@ turn all LEDs on
	LDR R2, =0xFF												@ set pattern
	ORRS R1, R1, R2
	STR R1, [R0, #0x14]									@ store it back in GPIOB_ODR

display_55:
	@ display the pattern 0x55 on the LEDs
	LDR R2, =0x55												@ set pattern
	ANDS R1, R1, R2
	STR R1, [R0, #0x14]									@ store it back in GPIOB_ODR

bonus:
	@configure relevant pins to be inputs
	LDR R3, =0x48000000									@ load base register for GPIOA
	LDR R4, [R3, #0x0C]									@ load the PUPDR for GPIOA
	LDR R5, =0b100											@ pull the resistor high
	ORRS R4, R4, R5
	STR R4, [R3, #0x0C]									@ store it back in GPIOA

	@ listen for high switch 1
	LDR R6, [R3, #0x10]   							@ load GPIOA_IDR
	LDR R7, =0b10												@ set register 5 to comparison value
	ANDS R7, R7, R6											@ AND comparison value with GPIOA input value
	BEQ end															@ branch if no switch is pressed

	@ display pattern if not branched
	LDR R2, =0x0A												@ set pattern
	STR R2, [R0, #0x14]									@ store value back in GPIOB_ODR

end: B all_off
