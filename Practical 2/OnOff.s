@STDNUM001 STDNUM002
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ Initialisations block
	LDR R0, =0x40021000 										@ load RCC base address
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

	@configure relevant pins to be inputs
	LDR R0, =0x48000000									@ load GPIOA base address
	LDR R1, [R0, 0x0C]									@ load the PUPDR for GPIOA
	LDR R2, =0b01010101									@ pull relevant resistors up
	ORRS R1, R1, R2
	STR R1, [R0, 0x0C]									@ load it back into PUPDR

	LDR R7, =0b0

main_loop:
	@ Main block
	LDR R0, =0x48000400
	LDR R1, [R0, 0x14]									@ load GPIOB_0DR
	LDR R2, =0xFF												@ load number for high bits (on LEDs)
	ORRS R1, R2, R1
	STR R1, [R0, 0x14]
	B check_count

secondary_loop:
	LDR R0, =0x48000400									@ load GPIOB base address
	LDR R1, [R0, 0x14]
	LDR R2, =0xFFFFFF00
 	ANDS R1, R2, R1
	STR R1, [R0, 0x14]
	B check_count_2

check_switch_two:
	LDR R3, =0x48000000									@ load GPIOA base address
	LDR R4, [R3, 0x10]									@ load GPIOA_IDR
	LDR R5, =0b100											@ check switch 2
	ANDS R5, R5, R4											@ get result
	BNE main_loop												@ if switch 2 is not pressed
	BEQ secondary_loop									@ if switch 2 is pressed

check_count:
	ADDS R6, R6, #1
	CMP R6, R7
	BNE resetter
	BEQ main_loop

check_count_2:
	ADDS R6, R6, #1
	CMP R6, R7
	BNE resetter2
	BEQ secondary_loop

resetter:
	LDR R7, =0b0
	B secondary_loop

resetter2:
	LDR R7, =0b0
	B main_loop

end: B main_loop
