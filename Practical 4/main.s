@ WDXEMI001 RCHCHA006

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

vectors:
    .word 0x20002000
    .word _start + 1
_start:
    @ Initialisations block

    @ initiliase clock
    LDR R0, =0x40021000 								@ load RCC base address
    LDR R1, [R0, 0x14]									@ load clock for Port B and Port B (RCC_AHBENR)
    LDR R2, =0b1100000000000000000 			@ load a high 18th and 17th bit into R2
    ORRS R1, R1, R2											@ set high 18th and 17th bits
    STR R1, [R0, 0x14] 								  @ store it back in clock for port B and A

    @ enable ADC
    LDR R1, [R0, 0x18]                  @ load clock from RCC_APB2ENR
    LDR R2, =0b1000000000               @ load a high 9th bit for the ADC_EN
    ORRS R1, R1, R2
    STR R1, [R0, 0x18]

    @ enable ADEN
    LDR R0, =0x40012400                 @ load ADC_BASE
    MOVS R1, #1                         @ bit to set ADEN
    STR R1, [R0, 0x08]                  @ set ADEN in ADC_CR

    wait_for_adry_loop:
      LDR R1, [R0]                      @ load ADC_ISR
      MOVS R2, #1                       @ load comparison value
      ANDS R1, R1, R2
      CMP R1, #0
      BEQ wait_for_adry_loop            @ branch to wait until ready

    @ enable channel selector
    LDR R2, =0b1000000                  @ initialise to port 6
    STR R2, [R0, 0x28]                  @ ADC_CHSEL

    LDR R1, [R0, 0x0C]                  @ load ADC_CNFG1
    LDR R2, =0b10000                    @ configure res to 8 bits
    ORRS R2, R2, R1
    STR R2, [R0, 0x0C]

    @ configure relevant pins to be outputs
    LDR R0, =0x48000400 								@ load GPIOB base address
    LDR R1, [R0] 												@ load GPIOB_MODER
    LDR R2, =0b0101010101010101					@ set mode for GPIOB
    ORRS R1, R1, R2
    STR R1, [R0]												@ store it back GPIOB_MODER

    @ configure relevant pins to be inputs
    LDR R0, =0x48000000									@ load GPIOA base address
    LDR R1, [R0, 0x0C]									@ load the PUPDR for GPIOA
    LDR R2, =0b01010101							    @ pull relevant resistors up
    ORRS R1, R1, R2
    STR R1, [R0, 0x0C]									@ load it back into PUPDR

    @ set pin A 6 to analogue mode
    LDR R1, [R0]                        @ load GPIOA_MODER
    LDR R2, =0b11110000000000           @ set pin 6 and 5 to analogue mode
    ORRS R1, R1, R2
    STR R1, [R0]                        @ store back in GPIOA_MODER

    LDR R0, =0b0                        @ initiliase offset
    LDR R1, =DATA
    LDR R2, =DATA_END
    LDR R3, =0x20000000                 @ start of ram


to_RAM_loop_loop:
    LDR R4, [R1]                        @ load data
    STR R4, [R3, R0]                    @ store in ram
    ADDS R1, #4                         @ add to offset
    ADDS R0, #4                         @ add to offset
    CMP R1, R2                          @ compare for end of data
    BEQ copy_to_RAM_done
    BNE to_RAM_loop_loop
    @ iterate through each

@ CRITICAL! When the program hits this label, the automarker will
@ stop execution and verify the contents of RAM.
copy_to_RAM_done:
    LDR R0, =0b0                        @ push counter
    LDR R1, =0x20000000
    LDR R2, =DATA_END
    LDR R3, =DATA
    SUBS R2, R2, R3
    LDR R3, =0b0                        @ offset counter
    LDRSB R4, [R1, R3]                    @ load value from RAM
    MOVS R5, R4                         @ set first value to current min
    MOVS R6, R4                         @ set first value to previous min
    ADDS R3, #1                         @ increment for next count

loop_to_find_min:
    CMP R3, R2                          @ compare to see if you have reached the end of the data
    BEQ push_abs_min                    @ if so then push the min
    LDRSB R4, [R1, R3]                    @ load value from RAM
    ADDS R3, #1                         @ add to offset

    @ compare to current min
    CMP R4, R5
    BGT set_abs_max
    BLT loop_to_find_min

set_abs_max:
    MOVS R6, R4                         @ initialise values
    MOVS R5, R4                         @ intialise values
    MOVS R7, R4                         @ sets absolute min and doesnt change for future reference
    CMP R3, R2
    BEQ push_abs_min
    BNE loop_to_find_min


loop_to_find_next_current:
    CMP R2, R3
    BEQ reloop
    LDRSB R4, [R1, R3]                    @ load next value
    ADDS R3, #1                         @ increment offset
    CMP R4, R6                          @ compare to previous min
    BLT set_next_current
    B loop_to_find_min_second

loop_to_find_min_second:
    CMP R3, R2
    BEQ push_abs_min
    LDRSB R4, [R1, R3]                    @ load next value
    ADDS R3, #1                         @ increment offset
    CMP R4, R6                          @ compare to previous min
    BLT compare_abs_min
    B loop_to_find_min_second

compare_abs_min:
    CMP R4, R5                          @ compare to current min
    BEQ loop_to_find_min_second
    BLT loop_to_find_min_second_secondary
    MOVS R5, R4                         @ set to current min
    B loop_to_find_min_second

loop_to_find_min_second_secondary:
    CMP R5, R6
    BEQ set_next_current
    B loop_to_find_min_second

push_abs_min:
    PUSH {R5}                           @ push to stack
    MOVS R6, R5                         @ set as next previous min
    ADDS R0, #1                         @ increment length of data in stack
    B compare_stack_size

reloop:
    LDR R3, =0b0                        @ reset comparison value
    LDR R1, =0x20000000
    LDRSB R4, [R1, R3]                    @ load next value
    ADDS R3, #1                         @ increment offset
    CMP R4, R6                          @ compare to previous min
    BGT loop_to_find_next_current
    BEQ loop_to_find_next_current
    BLT set_next_current

set_next_current:
    MOVS R5, R4                         @ set current min
    B loop_to_find_min_second

    @ Multiple iterations through data at start of ram and push
	@ to the stack from smallest negative number to largest positive number

compare_stack_size:
    CMP R0, R2                          @ compare size of data pushed to stack
    BNE reloop

@ CRITICAL! The marker will verify contents of stack
@ the stack when the program hits this label.
order_to_stack_done:

main_loop:
    LDR R0, =0x48000400                 @ load GPIOB base address
    LDR R1, [R0, 0x14]									@ load GPIOB_0DR
    STR R7, [R0, 0x14]                  @ load min
    LDR R2, =0xC449D                    @ set 1.2s
    BL delay
    LDR R0, =0x48000400                 @ load GPIOB base address
    LDR R1, [R0, 0x14]									@ load GPIOB_0DR
    STR R5, [R0, 0x14]                  @ load max
    LDR R2, =0xC449D                    @ set 1.2s
    BL delay
    B main_loop

delay:
    LDR R0, =0x48000000									@ load GPIOA base address
    LDR R1, [R0, 0x10]									@ load GPIOA_IDR
    LDR R3, =0b100											@ check switch 2
    ANDS R3, R3, R1											@ get result
    BEQ switch_2_pot_1
    SUBS R2, #1
    CMP R2, #0
    BNE delay
    BX LR                               @ branch back to main loop

var_delay_routine:
    LDR R2, =0x000013EC                 @ load gradient
    MULS R4, R4, R2
    MULS R6, R6, R2                     @ multiply by x
    LDR R3, =0xEA600                    @ load function y offset
    ADDS R4, R3                         @ add offset
    ADDS R6, R3
    CMP R4, R6
    BLT set_time                        @ set shortest time
    MOVS R2, R6
    B var_delay

set_time:
    MOVS R2, R4

var_delay:
    SUBS R2, #1
    CMP R2, #0
    BNE var_delay
    BX LR                               @ branch back to loop

switch_2_pot_1:
    LDR R0, =0x40012400                 @ load the ADC_BASE
    LDR R2, =0b1000000
    STR R2, [R0, 0x28]                  @ ADC_CHSEL for POT1
    MOVS R1, #0b100                     @ pattern to SET ADSTART
    STR R1, [R0, #0x08]                 @ set bit pattern of ADC_CR
    B wait_for_eoc_loop                 @ branch to wait for EOC to become high before continuing

wait_for_eoc_loop:
    LDR R1, [R0]                        @ R1 = ADC_ISR
    MOVS R2, #0b100                     @ pattern to select EOC flag
    ANDS R1, R1, R2
    CMP R1, #0                          @ if not high - loop
    BEQ wait_for_eoc_loop
    B set_time_1

wait_for_eoc_loop_2:
    LDR R1, [R0]                        @ R1 = ADC_ISR
    MOVS R2, #0b100                     @ pattern to select EOC flag
    ANDS R1, R1, R2
    CMP R1, #0                          @ if not high - loop
    BEQ wait_for_eoc_loop_2
    B set_time_2

switch_two_pot_0:
    LDR R0, =0x40012400
    LDR R2, =0b100000
    STR R2, [R0, 0x28]                  @ ADC_CHSEL for POT0
    MOVS R1, #0b100                     @ pattern to SET ADSTART
    STR R1, [R0, #0x08]                 @ set bit pattern of ADC_CR
    B wait_for_eoc_loop_2

set_time_1:
    LDR R4, [R0, #0x40]                 @ load the ADC_DR
    B switch_two_pot_0

set_time_2:
    LDR R6, [R0, #0x40]                 @ load the ADC_DR
    B var_delay_routine

    .align
@ you can define more literals here.
  STACK_START_ADDR: .word STACK_START
  RAM_START: .word 0x20000000
  STACK_START: .word 0x20002000
  DATA_ADDR: .word DATA
  DATA_END_ADDR: .word DATA_END

@ Before compiling your code, the automarker will modify this block.
@ Be sure to avoid out-by-one errors: make sure you access ALL elements.
DATA:
    .word 0x62967109
    .word 0x0674a70b
    .word 0x902bff4f
    .word 0xe7fa8a65
    .word 0xb610c2af
    .word 0x237e8814
    .word 0xfe0573a4
    .word 0xefd6e381
    .word 0x33c8bf70
    .word 0xfbe4bc46
DATA_END:
