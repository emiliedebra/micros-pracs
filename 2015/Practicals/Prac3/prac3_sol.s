@ Prac3 solution

	.syntax unified
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable clock for GPIOA, GPIOB, ADC
	LDR R0, RCC_BASE
	LDR R1, [R0, #0x14] 	@ RCC_AHBENR
	LDR R2, AHBENR_IOPABEN
	ORRS R1, R1, R2
	STR R1, [R0, #0x14]
	LDR R1, [R0, #0x18]	@ RCC_APB2ENR
	LDR R2, APB2ENR_ADCEN
	ORRS R1, R1, R2
	STR R1, [R0, #0x18]
	@ set LEDs to outputs
	LDR R0, GPIOB_BASE
	LDR R1, LEDS_OUTPUTS
	STR R1, [R0, #0]
	@ set pullup for PA0
	LDR R0, GPIOA_BASE
	LDR R1, [R0, #0x0C]   @ GPIOA_PUPDR
	MOVS R2, #0b01
	ORRS R1, R1, R2
	STR R1, [R0, #0x0C]
	@ set PA5 to analogue
	LDR R1, [R0, #0] 	@ GPIOA_MODER
	LDR R2, MODER_5_ANALOGUE
	ORRS R1, R1, R2
	STR R1, [R0, #0]
	@ ADC resolution to 8-bit
	LDR R0, ADC_BASE
	LDR R1, [R0, #0x0C]
	MOVS R2, #0b10000
	ORRS R1, R1, R2
	STR R1, [R0, #0x0C]
	@ enable ADC
	MOVS R1, #1      	@ ADEN = bit0
	STR R1, [R0, #0x08]   @ ADC_CR
adrdy_loop:
	LDR R1, [R0, #0]	@ ADC_ISR
	MOVS R2, #1
	ANDS R1, R1, R2
	BNE adrdy_loop
	MOVS R1, #0b100000
	STR R1, [R0, #0x28]
    
	MOVS R0, #0  @ will keep track of number of bytes pushed
	LDR R1, DATA_ADDR
	LDR R2, DATA_END_ADDR
to_stack_loop:
	LDRB R3, [R1]
	PUSH {R3}
	ADDS R0, #1  @ increment counter of number of elements pushed
	ADDS R1, #1  @ increment source pointer to next byte in flash
	CMP R1, R2  @ is the source pointer now outside of the data block?
	BNE to_stack_loop  @ if not, keep looping
@ The automarker will modify the contents of the stack at this point
stack_push_done:

@ find pair with smallest difference:
	MOVS R1, #0 	@ counter for number of bytes processed from stack
	MOVS R2, #0xFF  @ smallest difference found. Initialise to maximum possible difference.
	MOVS R3, #0xFF  @ register to hold the smaller of the selected elements. Initialize to some value
	MOVS R4, #0x0   @ register to hold the larger  of the selected elements. Initialize to some value
	MOVS R5, #0 	@ register to hold the smaller of the working elements
	POP {R6}    	@ R6 will hold larger of working elements. Get starting element off stack
find_closest_loop:   
	ADDS R1, #1 	@ check if we've got all elements
	CMP R0, R1
	BEQ find_closest_pair_done  @ if we have, get out of the loop
	MOVS R5, R6 	@ shift previous larger element to smaller slot
	POP {R6}    	@ get new larger element
	SUBS R7, R6, R5 	@ what's the difference between them?
	CMP R7, R2  	@ compare to current smallest difference found
	BHI find_closest_loop  @ if the new difference is higher, we don't want to update; just keep looping
	MOV R2, R7  	@ update the difference
	MOV R3, R5  	@ update smaller element
	MOV R4, R6  	@ update larger element
	B find_closest_loop
    
find_closest_pair_done:
@ flash between displaying the two elements

main_loop:
	LDR R0, GPIOA_BASE
	LDR R1, [R0, #0x10]
	MOVS R2, #1
	ANDS R1, R1, R2
	BEQ display_adc
	LDR R0, DELAY_ITERATIONS
delay_loop:
	SUBS R0, #1
	BNE delay_loop
	LDR R0, GPIOB_BASE
	LDR R1, [R0, #0x14]
	CMP R1, R3
	BNE display_smaller
	STR R4, [R0, #0x14]
	B main_loop
display_smaller:
	STR R3, [R0, #0x14]
	B main_loop

display_adc:
	LDR R0, ADC_BASE
	MOVS R1, #0b100   @ ADSTART
	STR R1, [R0, #0x08]  @ ADC_CR
eoc_loop:
	LDR R1, [R0, #0]
	MOVS R2, #0b100
	ANDS R1, R1, R2
	BEQ eoc_loop
	LDR R1, [R0, #0x40]  @ ADC_DR
	LDR R0, GPIOB_BASE
	STR R1, [R0, #0x14]  @ GPIOB_ODR
	B main_loop

	.align
RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0b11 << 17
APB2ENR_ADCEN: .word 0b1 << 9
GPIOB_BASE: .word 0x48000400
LEDS_OUTPUTS: .word 0x5555
GPIOA_BASE: .word  0x48000000
MODER_5_ANALOGUE: .word 0b11 << 10
ADC_BASE: .word 0x40012400
DELAY_ITERATIONS: .word 2000000

DATA_ADDR:  .word DATA
DATA_END_ADDR: .word DATA_END

@ Do not modify the following
DATA:  
	.word 0xD8E7F2FE
	.word 0xA4B0BDC9
	.word 0x717B8B99
	.word 0x4A855E62
	.word 0x1E344261
DATA_END:

