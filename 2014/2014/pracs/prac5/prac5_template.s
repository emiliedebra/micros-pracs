@STDNUM001 STDNUM002
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

vectors: 
    .word 0x20002000        @ defines the reset value of the stack pointer
    .word _start + 1        @ defines the reset vector, thereby specifying the first instruction.

HardFault_Handler:          @ critical! The PC must jump here in the event that a HardFault exception occurs.
                            @ display 0xAA on the LEDs so that we know a fault happened.
        NOP
        B HardFault_Handler

@ All other exceptions *should* be pointed here in order to have some sort of defined behaviour in
@ the event that they occur. However, this isn't necessary as they probably won't occur.
Default_Handler:        
        NOP
        B Default_Handler

_start:
        @ initialise pins connected to LEDs
        @ initialise the first two Fibonacci numbers by pushing two 1's to the stack
        @ you're welcome to move some data to 0x2000 0000 for testing purposes now.

initialisations_complete:       @ critical! The word at 0x2000 0000 will be overwritten by the automarker now.

        @ in a loop 45 times, calculate the next Fibonacci number and push it to the stack

fib_calc_complete:              @ critical! Here, the automarker will verify the contents of the stack

        @ read in the data contained in the first word of RAM and store the highest Fibonacci number at this address.
        @ Remeber: there is a risk that the data there is invalid. In this event, the hardfault should be handled. 


cycle_patterns:
        @ display all of the following, with a 0.5 seconds interval inbetween:
        @ 0x00 ; 0x81 ; 0xC3 ; 0xE7 ; 0xFF ; 0x7E ; 0x3C ; 0x18
        @ the delay 

        B cycle_patterns

delay_routine:
        @ do delay here, and then return in the correct way.

