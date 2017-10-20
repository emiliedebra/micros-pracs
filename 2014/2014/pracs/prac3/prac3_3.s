    .syntax unified
    .global _start
    
    
    .word 0x20002000
    .word _start + 1
    
_start:
    @ enable clock for GPIOA and GPIOB
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]
    LDR R2, AHBENR_IOPABEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]
    
    @set PB0 - PB7 to outputs
    LDR R0, GPIOB_BASE
    LDR R1, [R0]
    LDR R2, MODER_OUTPUTS                       @ pattern of bits to rasie indicating pins 0 to 7 outputs
    ORRS R1, R1, R2                             @ selectively raise the specific bits
    STR R1, [R0]                                @ write to GPIOB_MODER

    STR R2, [R0, #0x14]
    
    @ enable pull-ups for GPIOA
    LDR R1, GPIOA_BASE
    MOVS R2, #0x55                              @ pattern enables pull-ups for first 4 pins
    STR R2, [R1, #0x0C]                         @ store to GPIOA_PUPDR
    
main_loop:
    @ write 0xAA if PA0 = 1, else write 0xFF
    MOVS R4, #0xAA                              @ assume PA0 = 1: prepare to write 0xAA
    LDR R2, [R1, #0x10]                         @ get the value in GPIOA_IDR
    MOVS R3, #1                                 @ pattern to AND selects bit 0
    ANDS R2, R2, R3                             @ select bit 0
    BNE display1                                @ if not 0 (ie: previous assumption correct): display the data
    MOVS R4, #0xFF                              @ else: change data to rather be 0xFF
display1:
    STR R4, [R0, #0x14]                                @ put data to LEDs

    @ delay for 1 s if PA1 = 1, else 0.5 s
    LDR R2, LOOPS                              @ assume button PA1 = 0 : only delay for 0.5s
    LDR R3, [R1, #0x10]                         @ get the value in GPIOA_IDR
    MOVS R4, #2                                 @ pattern to AND selects bit 1
    ANDS R3, R3, R4                             @ select bit 1
    BEQ delay1                                  @ if PA1 = 0, assumption correct: start delay
    ADDS R2, R2, R2                             @ else, double R2 to increase delay to 1 s
delay1:
    SUBS R2, R2, #1
    BNE delay1
    
    @ write 0x55 if PA0 = 1, else write 0x00
    MOVS R4, #0x55                              @ assume PA0 = 1: prepare to write 0x55
    LDR R2, [R1, #0x10]                         @ get the value in GPIOA_IDR
    MOVS R3, #1                                 @ pattern to AND selects bit 0
    ANDS R2, R2, R3                             @ select bit 0
    BNE display2                                @ if not 0 (ie: previous assumption correct): display the data
    MOVS R4, #0x00                              @ else: change data to rather be 0x00
display2:
    STR R4, [R0, #0x14]                                @ put data to LEDs
    
    @ delay for 1 s if PA1 = 1, else 0.5 s
    LDR R2, LOOPS                              @ assume button PA1 = 0 : only delay for 0.5s
    LDR R3, [R1, #0x10]                         @ get the value in GPIOA_IDR
    MOVS R4, #2                                 @ pattern to AND selects bit 1
    ANDS R3, R3, R4                             @ select bit 1
    BEQ delay2                                  @ if PA1 = 0, assumption correct: start delay
    ADDS R2, R2, R2                             @ else, double R2 to increase delay to 1 s
delay2:
    SUBS R2, R2, #1
    BNE delay2
    B main_loop

    .align
RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0x00060000
GPIOB_BASE: .word  0x48000400
MODER_OUTPUTS: .word 0b0101010101010101
GPIOA_BASE: .word  0x48000000
LOOPS: .word 500000
