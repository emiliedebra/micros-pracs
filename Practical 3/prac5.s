@DKKBOI002 LXXJUL005
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

vectors:
  .word 0x20002000          @ defines the reset value of the stack pointer
  .word _start + 1	       @ defines the reset vector, thereby specifying the first instruction.
	.word 0
	.word HardFault_Handler + 1

HardFault_Handler:          @ critical! The PC must jump here in the event that a HardFault exception occurs.
                            @ display 0xAA on the LEDs so that we know a fault happened.
    LDR R4, =0xAA
	LDR R5 , =0x48000400
	STR R4, [R5,#0x14]

	B HardFault_Handler

@ All other exceptions *should* be pointed here in order to have some sort of defined behaviour in
@ the event that they occur. However, this isn't necessary as they probably won't occur.
Default_Handler:
        NOP
        B Default_Handler

_start:


        @ initialise pins connected to LEDs
			@enable peripheral
			LDR R0, RCC
			LDR R1, [R0,#0x14]
			LDR R2, Enable
			ORRS R1, R2
			STR R1,[R0,#0x14]
			@configure relevant pins to be outputs
			LDR R0, GPIOB
			LDR R1, =0x55555
			STR R1, [R0,#0x0]
			/*@configurerelevantpinstobeinputs
			LDR R5, GPIOA
			LDR R1, =0x24000055
			STR R1,[R5,#0x0C]*/
        @ initialise the first two Fibonacci numbers by pushing two 1's to the stack
	MOVS R0, #0x00000001
	MOVS R1, #0x00000001
	MOVS R3, #45
	PUSH {R0}
	PUSH {R1}
        @ you're welcome to move some data to 0x2000 0000 for testing purposes now

	LDR R0, RAM_START
	LDR R1, RAM_START
	ADDS R1, #4
	STR R1, [R0]

initialisations_complete:       @ critical! The word at 0x2000 0000 will be overwritten by the automarker now.

        @ in a loop 45 times, calculate the next Fibonacci number and push it to the stack

fib_calc:
	POP {R1}
	POP {R0}
	ADDS R2, R1, R0
	PUSH {R0}
	PUSH {R1}
	PUSH {R2}
	SUBS R3,#1
	CMP R3,0
	BNE fib_calc



fib_calc_complete:              @ critical! Here, the automarker will verify the contents of the stack

        @ read in the data contained in the first word of RAM and store the highest Fibonacci number at this address.
        @ Remeber: there is a risk that the data there is invalid. In this event, the hardfault should be handled.
	LDR R1, RAM_START
	LDR R2, [R1]
	LDR R3, [R13]
	STR R3, [R2]



cycle_patterns:
        @ display all of the following, with a 0.5 seconds interval inbetween:
        @ 0x00 ; 0x81 ; 0xC3 ; 0xE7 ; 0xFF ; 0x7E ; 0x3C ; 0x18
        @ the delay
	LDR R0 ,GPIOB
	LDR R1, =0x00
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79

	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0x81
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0xC3
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0xE7
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0xFF
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine


	LDR R0 ,GPIOB
	LDR R1, =0x7E
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0x3C
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

	LDR R0 ,GPIOB
	LDR R1, =0x18
	STR R1, [R0,#0x14]
	LDR R2, =0xC7D79
	BL delay_routine

        B cycle_patterns

delay_routine:
        @ do delay here, and then return in the correct way.
	SUBS R2, #1
	CMP R2, #0
	BNE delay_routine
	BX R14


	.align


Flash: .word 0x80000000
RAM_START: .word 0x20000000
GPIOA: .word 0x48000000
GPIOB: .word 0x48000400
RCC:	.word 0x40021000
Enable: .word 0b1100000000000000000
