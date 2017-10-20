@WDXDMI001 RCHCHA006
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ Initialisations block
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

	@configure relevant pins to be inputs
	LDR R0, =0x48000000									@ load GPIOA base address
	LDR R1, [R0, 0x0C]									@ load the PUPDR for GPIOA
	LDR R2, =0b01010101									@ pull relevant resistors up
	ORRS R1, R1, R2
	STR R1, [R0, 0x0C]									@ load it back into PUPDR

	LDR R3, =0b0												@ set start count to 0
	LDR R5, =0b1												@ set increment to 1


main_loop:
	@ Main block
	LDR R0, =0x48000400
	LDR R1, [R0, 0x14]									@ load GPIOB_0DR
	STR R3, [R0, 0x14]
	LDR R4, =0x186A12
	B check_switch_3

loop:
	SUBS R4, R4, #1
	CMP R4, #0
	BNE loop
	BEQ main_loop

check_switch_3:
	LDR R0, =0x48000000									@ load GPIOA base address
	LDR R1, [R0, 0x10]									@ load GPIOA_IDR
	LDR R2, =0b1000											@ check switch 1
	ANDS R2, R2, R1											@ get result
	BEQ check_switch_3
	BNE check_switch_2

check_switch_1:
	LDR R2, =0b10												@ check switch 0
	ANDS R2, R2, R1											@ get result
	BNE check_switch_0									@ if switch 0 is not pressed
	BEQ switch_1												@ if switch 0 is pressed

check_switch_2:
	LDR R0, =0x48000000									@ load GPIOA base address
	LDR R1, [R0, 0x10]									@ load GPIOA_IDR
	LDR R2, =0b100											@ check switch 1
	ANDS R2, R2, R1											@ get result
	BNE check_switch_1									@ if switch 1 is not pressed
	BEQ switch_2												@ if switch 1 is pressed

check_switch_0:
	LDR R2, =0b1												@ check switch 2
	ANDS R2, R2, R1											@ get result
	BNE no_switch_0											@ if switch 2 is not pressed
	BEQ switch_0												@ if switch 2 is pressed

switch_1:
	LDR R4, =0x9C415
	B check_switch_0

switch_2:
	LDR R4, =0x75302
	LDR R5, =0b1
	SUBS R3, R5
	B loop

switch_0:
	LDR R5, =0b10
	ADDS R3, R5
	B loop

no_switch_0:
	LDR R5, =0b1
	ADDS R3, R5
	B loop
