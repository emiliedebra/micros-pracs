@ STDNUM001 STDNUM002

    .syntax unified
    .global _start
	.cpu cortex-m0
	.thumb
vectors:
    .word 0x20002000
    .word _start + 1
_start:
    
    @ do initialisations here

to_stack_loop:

    @ from the DATA block, read each BYTE and push it to the stack

@ CRITICAL! When the program hits this label, the automarker will stop execution,
@ verify the contents of the stack and then modify the contents of the stack.
stack_push_done:

    @ find pair with smallest difference
    
main_loop:
    @ flash between displaying A and B.
    @ if SW0 is held, rather display a value proportional to the pot. 

    B main_loop

    .align
@ you can define more literals here.


@ don't modify the following. 
DATA:  
    .word 0xD8E7F2FE
    .word 0xA4B0BDC9
    .word 0x717B8B99
    .word 0x3A455E62
    .word 0x05142231
DATA_END: 
