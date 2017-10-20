@STDNUM001 STDNUM002
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start


vectors: 
    .word 0x20002000        @ defines the reset value of the stack pointer
    .word _start + 1        @ defines the reset vector, thereby specifying the first instruction.

HardFault_Handler:          @ critical! The PC must jump here in the event that a HardFault exception occurs.
                            @ display 0xAA on the LEDs so that we know a fault happened.
        LDR R0, GPIOB_BASE
        MOVS R1, #0xAA
        STRB R1, [R0, #0x14]
        B HardFault_Handler

@ All other exceptions *should* be pointed here in order to have some sort of defined behaviour in
@ the event that they occur. However, this isn't necessary as they probably won't occur.
Default_Handler:        
        NOP
        B Default_Handler

_start:
        LDR R0, RCC_BASE
        LDR R1, [R0, #0x14]
        LDR R2, AHBENR_IOPABEN
        ORRS R1, R1, R2
        STR R1, [R0, #0x14]
        @ initialise pins connected to LEDs
        LDR R0, GPIOB_BASE
        LDR R1, MODER_OUTPUTS
        STRH R1, [R0]
        @ initialise the first two Fibonacci numbers by pushing two 1's to the stack
        MOVS R1, #1
        PUSH {R1}
        PUSH {R1}
        @ you're welcome to move some data to 0x2000 0000 for testing purposes now.
        LDR R1, RAM_START
        LDR R2, DESTINATION_ADDR
        STR R2, [R1]

initialisations_complete:       @ critical! The word at 0x2000 0000 will be overwritten by the automarker now.
        MOVS R0, #45
fib_loop:
        LDR R1, [SP, #0]        @ peak at last and 2nd last elements on stack
        LDR R2, [SP, #4]
        ADDS R1, R1, R2
        PUSH {R1}
        SUBS R0, R0, #1
        CMP R0, #0
        BNE fib_loop

fib_calc_complete:              @ critical! Here, the automarker will verify the contents of the stack
        @ read in the data contained in the first word of RAM and store the highest Fibonacci number at this address.
        @ Remeber: there is a risk that the data there is invalid. In this event, the hardfault should be handled. 
        LDR R0, RAM_START
        LDR R0, [R0]
        LDR R1, [SP, #0]
        STR R1, [R0]
        LDR R0, GPIOB_BASE
cycle_patterns:
        @ display all of the following, with a 0.5 seconds interval inbetween:
        @ 0x00 ; 0x81 ; 0xC3 ; 0xE7 ; 0xFF ; 0x7E ; 0x3C ; 0x18
        MOVS R1, #0
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0x81
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0xC3
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0xE7
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0xFF
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0x7E
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0x3C
        STR R1, [R0, #0x14]
        BL delay_routine
        MOVS R1, #0x18
        STR R1, [R0, #0x14]
        BL delay_routine
        B cycle_patterns

delay_routine:
        @ do delay here, and then return in the correct way.
        PUSH {R0}
        LDR R0, DELAY_LEN
delay_loop:
        SUBS R0, #1  @ 1
        CMP R0, #0   @ 1 
        BNE delay_loop @ 3
        POP {R0}
        BX LR

        .align 
RAM_START: .word 0x20000000
RAM_END: .word 0x20002000
RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0x00060000
GPIOB_BASE: .word 0x48000400
GPIOA_BASE: .word 0x48000000
MODER_OUTPUTS: .word 0b0101010101010101
DESTINATION_ADDR: .word 0x20000004
DELAY_LEN: .word 1600000
