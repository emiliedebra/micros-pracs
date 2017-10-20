@STDNUM001 STDNUM002
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

vectors: 
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
    .word Default_Handler + 1       @ 0x08: NMI vector
    .word HardFault_Handler + 1     @ 0x0C: HardFault vector
    .word Default_Handler + 1       @ 0x10: reserved
    .word Default_Handler + 1       @ 0x14: reserved
    .word Default_Handler + 1       @ 0x18: reserved
    .word Default_Handler + 1       @ 0x1C: reserved
    .word Default_Handler + 1       @ 0x20: reserved
    .word Default_Handler + 1       @ 0x24: reserved
    .word Default_Handler + 1       @ 0x28: reserved
    .word Default_Handler + 1       @ 0x2C: SVCall vector
    .word Default_Handler + 1       @ 0x30: reserved
    .word Default_Handler + 1       @ 0x34: reserved
    .word Default_Handler + 1       @ 0x38: SysTick vector
    @ you do the rest....

HardFault_Handler:      @ should never happen, but handle it explcitly in case there's a bug in the code.
        NOP
        B HardFault_Handler

@ All other exceptions should be pointed here in order to have some sort of defined behaviour in
@ the event that they occur.
Default_Handler:        
        NOP
        B Default_Handler

_start:
    @ enable clock to ADC, Timer 6, GPIOA, GPIOB
    @ set pins to correct modes
    @ pullups for buttons
    @ enable ADC
    @ wait until ADC ready. As per Section 13.4.4: the ADC must be ready before writing to its other registers
    @ select channel and resolution/alignment 
    @ initialise timer: Set ARR, PSR, enable update interrupt
    @ start counter counting
    @ enable the interrupt for the timer in the NVIC

infinite_loop:
    NOP
    B infinite_loop

@ The following block of code is called an Interrupt Service Routine (ISR).
@ It should be executed whenever the TIM6 IRQ occurs. 
TIM6_DAC_IRQHandler:
    @ acknowledge interrupt

    @ ==== Part 2 suggested algoritim ====
    @ Read GPIOB_ODR (remember, we're only interested in the LSB!)
    @ if SW3 is held down: subtract 1 from it
    @ else: add 1 to it.
    @ write it back

    @ ==== Part 3 suggested algorithm ====
    @ if SW2 is held down:
        @ kick off an ADC conversion from POT0
        @ modify timer duration using result of conversion
    @ else:
        @ set the IRQ frequency to the default state

    @ return from interrupt here


