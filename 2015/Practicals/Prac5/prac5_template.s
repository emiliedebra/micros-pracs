@ STDNUM001 STDNUM002

    .syntax unified
    .global _start

    @ The suggestion is to define specific blocks for the HardFault exception and
    @ the exception associated with the timer we're using, leaving the rest of the
    @ vectors pointing to a Default_Handler.
vectors:
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
    @ define the rest of the vectors here

    @ If an exception happens which we don't expect to happen, hang in an infinite loop
Default_Handler:
    NOP
    B Default_Handler

HardFault_Handler:
    NOP
    B HardFault_Handler

TIM6_Handler:
    @ Acknowledge interrupt

    @ If SW0 held:
    @ - set the ARR such that the IRQ will be triggered every 2 seconds
    @ Else if SW0 not held:
    @ - set the ARR such that the IRQ will be triggered every 1 second

    @ If SW1 held:
    @ - fetch offset from some location in memory
    @ - increment offset, wrapping to 0 if necessary
    @ - write updated offset back to memory
    @ - fetch pattern from address of PATTERNS + offset
    @ - write pattern to LEDs
    @ Else, if SW0 not held:
    @ - fetch current value on LEDs
    @ - increment by 1
    @ - write back

    @ return from interrupt

@ ------- END OF INTERRUPT SERVICE ROUTINE --------

_start:
    @ enable GPIOA, GPIOB, TIM7
    
    @ set push-buttons pins to inputs with pull-up resistors
    @ set pot pins to analogue mode
  
    @ set LEDs to outputs
   
    @ Configure TIM7: PSC, ARR, UIE, CEN

    @ Enable TIM7 IRQ in NVIC

    @ Pick some fixed memory location (first word of RAM seems good!) to hold
    @ the offset of the pattern being displayed. Initialise this offset to 0.
    
    @ DO NOT MODIFY THE MAIN LOOP. Your program must sit in an infinite main loop doing nothing.
    @ failure to comply with this will result in you receiving 0 marks.
main_loop:
    NOP
    B main_loop
    
    .align
@ Define your literals here
RCC_BASE: .word 0x40021000
GPIOA_BASE: .word 0x48000000
GPIOB_BASE: .word 0x48000400

@ This is the sequence of patterns (each byte is a pattern) which the LEDs must cycle through. 
@ The values of the following words will be modified at compile time by the marker, but the number 
@ of values will not change. Hence, you can hard-code your bounds checking condition if you wish.
PATTERNS:
    .word 0xBBAA5500
    .word 0xFFEEDDCC
