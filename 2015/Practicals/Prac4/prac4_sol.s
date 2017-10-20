@ STDNUM001 STDNUM002

    .syntax unified
    .global _start

    .word 0x20002000
    .word _start + 1
_start:
    
    @ enable clock for GPIOA and GPIOB
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]     @ RCC_AHBENR
    LDR R2, AHBENR_IOPABEN  @ pattern to set PA and PB bits
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]    @ write back
    @ enable clock for ADC
    LDR R1, [R0, #0x18]    @ RCC_APB2ENR
    LDR R2, APB2ENR_ADCEN  @ pattern to set ADCEN bit
    ORRS R1, R1, R2
    STR R1, [R0, #0x18]    @ RCC_APB2ENR write back
    @ set LEDs to outputs
    LDR R0, GPIOB_BASE
    LDR R1, [R0, #0]       @ GPIOB_MODER
    LDR R2, LEDS_INPUTS    @ pattern to force lower 8 pairs to 0, leaving rest unchanged
    ANDS R1, R1, R2
    LDR R2, LEDS_OUTPUTS   @ pattern setting lower 8 pairs to 01 (output) and reset to inputs
    ORRS R1, R1, R2
    STR R1, [R0, #0]       @ GPIOB_MODER write back
    @ set pullup for PA0
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0x0C]    @ GPIOA_PUPDR
    MOVS R2, #0b01
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]    @ GPIOA_PUPDR write back
    @ set PA5 and PA6 to analogue
    LDR R1, [R0, #0]       @ GPIOA_MODER
    LDR R2, MODER_5_6_ANALOGUE
    ORRS R1, R1, R2
    STR R1, [R0, #0]       @ GPIOA_MODER write back
    @ enable ADC
    LDR R0, ADC_BASE
    MOVS R1, #1            @ ADEN = bit0
    STR R1, [R0, #0x08]    @ ADC_CR
adrdy_loop:
    LDR R1, [R0, #0]       @ ADC_ISR
    MOVS R2, #1
    ANDS R1, R1, R2
    BEQ adrdy_loop

    LDR R0, DATA_ADDR        @ soure pointer
    LDR R1, DATA_END_ADDR    @ out-of-bounds pointer
    LDR R2, RAM_START        @ destination pointer
    MOVS R3, #0              @ counter for number of bytes copied
to_RAM_loop:
    CMP R0, R1               @ is the source pointer out of bounds?
    BEQ copy_to_RAM_done     @ if so, don't copy any more
    LDR R4, [R0]             @ copy from source...
    STR R4, [R2]             @ ...to destination
    ADDS R0, #4              @ interment source and destination pointers by a word
    ADDS R2, #4
    ADDS R3, #4              @ increment counter by number of bytes copied
    B to_RAM_loop

@ CRITICAL! When the program hits this label, the automarker will
@ stop execution and verify the contents of RAM.
copy_to_RAM_done:
    LDR R0, RAM_START       @ pointer to load from
    @ R1 is the counter of number of bytes processed. It's getting initialised to 1 because
    @ loading a pair actually loads the current element and the NEXT element, so there needs
    @ to be one more element available. 
    MOVS R1, #1
    MOVS R2, #0xFF          @ R1 will hold the value of the best difference found so far
    SUB SP, SP, #8          @ allocate 2 words on the stack for the best A and B so far
finding_best_pair_loop:
    CMP R1, R3              @ break if we've processed all bytes
    BEQ closest_pair_finding_done
    SUBS R1, #1             @ decrement counter to go back to last element of previous pair
    LDRSB R4, [R0, R1]      @ fetch lower element
    ADDS R1, #1             @ increment processed bytes counter / offset
    LDRSB R5, [R0, R1]      @ fetch upper element
    ADDS R1, #1             @ increment processed bytes counter / offset
    CMP R4, R5
    BGT r4_larger           @ if R4 is larger, go to that logic. 
    @ This logic is for a larger R5
    SUBS R6, R5, R4         @ get difference of this pair
    CMP R6, R2              @ if we don't have a new best difference, loop
    BHI finding_best_pair_loop
    @ else, update the stack and difference
    MOVS R2, R6
    STR R5, [SP, #0]        @ larger element on top
    STR R4, [SP, #4]
    B finding_best_pair_loop
r4_larger:
    SUBS R6, R4, R5         @ get difference of this pair
    CMP R6, R2              @ if we don't have a new best difference, loop
    BHI finding_best_pair_loop
    @ else, update the stack and difference
    MOVS R2, R6
    STR R4, [SP, #0]        @ larger element on top
    STR R5, [SP, #4]
    B finding_best_pair_loop
    
@ CRITICAL! The marker will verify that A and B have been pushed to
@ the stack when the program hits this label.
closest_pair_finding_done:
    LDR R0, GPIOB_BASE
    LDR R1, [SP, #0]        @ larger element (B) on top
    LDR R2, [SP, #4]        @ smaller (A) is located at the higher address
main_loop:
    STR R2, [R0, #0x14]    @ display smaller of pair (A)
    BL delay               @ call delay subroutine
    STR R1, [R0, #0x14]    @ display larger of pair (B)
    BL delay               @ call delay subroutine
    B main_loop            @ loopidy loop loop loop

delay:
    PUSH {R0, R1, R2, R3, R4, R5}      @ backup registers to the stack
    LDR R0, LONG_DELAY     @ assume full 1.5 second delay. Will be overridden if SW0 held.
    LDR R1, GPIOA_BASE     @ get contents of GPIOA_IDR
    LDR R2, [R1, #0x10]
    MOVS R3, #1            @ mask out all bits except bit0 == SW0
    ANDS R2, R2, R3
    BNE delay_loop         @ if the button is held, skip the ADC fetching logic and begin delay
    LDR R0, DELAY_OFFSET   @ the minimum delay. Will be added to by ADC value.
    LDR R1, ADC_BASE
    @ select channel 5 (POT0)
    MOVS R2, #0b100000
    STR R2, [R1, #0x28]
    @ run a conversion by setting ADSTART and waiting for it to go low
    MOVS R2, #0b100   @ ADSTART
    STR R2, [R1, #0x08]  @ ADC_CR
eoc_loop_0:
    LDR R3, [R1, #0]
    ANDS R3, R3, R2
    BEQ eoc_loop_0
    LDR R4, [R1, #0x40]     @ R4 will hold the value of POT0
    @ select channel 6 (POT1)
    MOVS R2, #0b1000000
    STR R2, [R1, #0x28]
    @ run a conversion by setting ADSTART and waiting for it to go low
    MOVS R2, #0b100   @ ADSTART
    STR R2, [R1, #0x08]  @ ADC_CR
eoc_loop_1:
    LDR R3, [R1, #0]
    ANDS R3, R3, R2
    BEQ eoc_loop_1
    LDR R5, [R1, #0x40]  @ R5 will hold the value of POT1
    LDR R1, DELAY_MULTIPLIER
    CMP R4, R5
    BHI pot0_larger
    MULS R1, R1, R5
    ADDS R0, R0, R1
    B delay_loop
pot0_larger:
    MULS R1, R1, R4
    ADDS R0, R0, R1
delay_loop:
    SUBS R0, #1
    BNE delay_loop
    POP {R0, R1, R2, R3, R4, R5}    @ restore backed up registers
    BX LR


    .align
@ you can define more literals here.

RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0b11 << 17
APB2ENR_ADCEN: .word 0b1 << 9
GPIOB_BASE: .word 0x48000400
LEDS_INPUTS:  .word 0xFFFF0000
LEDS_OUTPUTS: .word 0x00005555
GPIOA_BASE: .word  0x48000000
MODER_5_6_ANALOGUE: .word 0b1111 << 10
ADC_BASE: .word 0x40012400

RAM_START: .word 0x20000000
DATA_ADDR: .word DATA
DATA_END_ADDR: .word DATA_END

LONG_DELAY: .word 3000000
DELAY_OFFSET: .word 400000
DELAY_MULTIPLIER: .word 391

@ Before compiling your code, the automarker will modify this block.
@ Be sure to avoid out-by-one errors: make sure you access ALL elements.
DATA:  
    .word 0x62967109
    .word 0x0674a70b
    .word 0x902b7c4f
    .word 0xe7fa8a65
    .word 0xb610c2fe
    .word 0x237e8814
    .word 0xfe0573a4
    .word 0xefd6e381
    .word 0x33c8bf70
    .word 0xfbe4bc46
DATA_END: 
