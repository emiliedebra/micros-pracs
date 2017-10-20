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
  LDR R0, =0x40021000 								@ load RCC base address
  LDR R1, [R0, #0x14]									@ load clock for Port B and Port B (RCC_AHBENR)
  LDR R2, =0b1100000000000000000 			@ load a high 18th and 17th bit into R2
  ORRS R1, R1, R2											@ set high 18th and 17th bits
  STR R1, [R0, 0x14] 								   @ store it back in clock for port B and A

  @ enable ADC
  LDR R1, [R0, 0x18]                  @ load clock from RCC_APB2ENR
  LDR R2, =0b1000000000              @ load a high 9th bit for the ADC_EN
  ORRS R1, R1, R2
  STR R1, [R0, 0x18]


  @ enable ADEN
  LDR R0, =0x40012400
  MOVS R1, #1                         @ bit to set ADEN
  STR R1, [R0, 0x08]                  @ set ADEN in ADC_CR

wait_for_adry_loop:
  LDR R1, [R0]                       @ load ADC_ISR
  MOVS R2, #1
  ANDS R1, R1, R2
  CMP R1, #0
  BEQ wait_for_adry_loop

  @ enable channel selector
  LDR R2, =0b1000000
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
  LDR R2, =0b11000000000000           @ set pin 6 to analogue mode
  ORRS R1, R1, R2
  STR R1, [R0]                        @ store back in GPIOA_MODER

  @initialise DATA count
  LDR R0, DATA_ADDR                   @ load beginning of data
  LDR R2, DATA_END_ADDR               @ load end of data
  LDR R7, =0xAA
  LDR R5, =0xDD

to_stack_loop:
  LDRB R1, [R0]                       @ load a byte from the data
  PUSH {R1}                           @ push to stack
  ADDS R0, #1                         @ increment byte
  CMP R0, R2                          @ compare data offset to data end
  BNE to_stack_loop                   @ loop
  BEQ stack_push_done
    @ from the DATA block, read each BYTE and push it to the stack

@ CRITICAL! When the program hits this label, the automarker will stop execution,
@ verify the contents of the stack and then modify the contents of the stack.

stack_push_done:
  MOVS R4, #32
  B first_byte


@ R7 is the min value
@ R5 is the max value

load_and_cmp_min:
  SUBS R4, #1                         @ remove one from countdown
  CMP R4, #0                          @ compare countdown
  BEQ check_no_switch
  LDR R0, [SP]                        @ load address of the stack pointer
  POP {R0}                            @ pop value
  MOVS R1, R0                         @ move to R1
  PUSH {R0}                           @ push back to stack
  CMP R1, R7                          @ compare to min value
  BGT cmp_max                         @ branch if bigger
  BLT set_min                         @ branch if smaller
  BEQ equal

first_byte:
  LDR R0, [SP]                        @ load address of the stack pointer
  POP {R0}                            @ pop value
  MOVS R1, R0                         @ copy value to R1
  MOVS R5, R1                         @ set as max
  MOVS R7, R1                         @ set as min
  B load_and_cmp_min

equal:
  POP {R0}                            @ remove from stack
  B load_and_cmp_min

cmp_max:
  CMP R1, R5                          @ compare to max value
  BGT set_max                         @ branch if bigger
  POP {R0}
  B load_and_cmp_min                  @ branch if smaller

set_max:
  POP {R5}                            @ get value and store in max
  B load_and_cmp_min                  @ branch to check next value

set_min:
  POP {R7}                            @ get value and store in min
  B load_and_cmp_min                  @ branch to check next value

@ R7 is now min, R5 is max
main_loop:
  LDR R0, =0x48000400                 @ load GPIOB base address
  LDR R1, [R0, 0x14]									@ load GPIOB_0DR
  CMP R1, R7                          @ check what is currently flashing
  BEQ flash_max                       @ branch if min
  BNE flash_min                       @ branch if max

flash_min:
  STR R7, [R0, 0x14]                  @ load min value to LEDS
  LDR R3, =0xEA5FB                    @ should be roughly 0.6s // CHANGE
  B loop                              @ delay

loop:
  SUBS R3, #1
  CMP R3, #0
  BNE loop
  BEQ check_no_switch                 @ back to main_loop after delay

flash_max:
  STR R5, [R0, 0x14]                  @ load max value to LEDS
  LDR R3, =0xEA5FB                    @ should be roughly 0.6s // CHANGE
  B second_loop                       @ delay

second_loop:
  SUBS R3, #1
  CMP R3, #0
  BNE second_loop
  BEQ check_no_switch                 @ back to first_check after delay

check_no_switch:
  LDR R0, =0x48000000                 @ load GPIOA base address
  LDR R1, [R0, 0x10]									@ load GPIOA_IDR
  LDR R2, =0b1
  ANDS R2, R2, R1                     @ check for 0 switch
  BEQ check_switch_0
  LDR R2, =0b10
  ANDS R2, R2, R1                     @ check for 1 switch
  BEQ check_switch_0
  LDR R2, =0b100
  ANDS R2, R2, R1                     @ check for 2 switch
  BEQ check_switch_0
  LDR R2, =0b1000
  ANDS R2, R2, R1                     @ check for 3 switch
  BEQ check_switch_0
  B main_loop                         @ branch if no switches are held

check_switch_0:
  LDR R0, =0x48000000									@ load GPIOA base address
  LDR R1, [R0, 0x10]									@ load GPIOA_IDR
  LDR R2, =0b1												@ check switch 0
  ANDS R2, R2, R1											@ get result
  BNE check_switch_1									@ if switch 0 is not pressed
  BEQ switch_0												@ if switch 0 is pressed

check_switch_1:
  LDR R0, =0x48000000									@ load GPIOA base address
  LDR R1, [R0, 0x10]									@ load GPIOA_IDR
  LDR R2, =0b10												@ check switch 1
  ANDS R2, R2, R1											@ get result
  BNE check_switch_2									@ if switch 1 is not pressed
  BEQ switch_1												@ if switch 1 is pressed

check_switch_2:
  LDR R0, =0x48000000									@ load GPIOA base address
  LDR R1, [R0, 0x10]									@ load GPIOA_IDR
  LDR R2, =0b100											@ check switch 2
  ANDS R2, R2, R1											@ get result
  BNE check_no_switch									@ if switch 2 is not pressed
  BEQ switch_2												@ if switch 2 is pressed


@ If SW0 is held, display A-B constantly on the LEDs.
switch_0:
  SUBS R4, R5, R7                     @ subtract max from min
  LDR R0, =0x48000400                 @ load GPIOB base address
  LDR R1, [R0, 0x14]									@ load GPIOB_0DR
  STR R4, [R0, 0x14]                  @ store value to LEDS
  B check_switch_1                    @ continue button check

@ If SW1 is held, display A+B constantly on the LEDs.
switch_1:
  ADDS R4, R5, R7                     @ add min and max
  LDR R0, =0x48000400                 @ load GPIOB base address
  LDR R1, [R0, 0x14]									@ load GPIOB_0DR
  STR R4, [R0, 0x14]                  @ store value in LEDS
  B check_switch_2                    @ continue button check

@ If SW2 is held vary delay between A and B proportianal to POT0.
switch_2:
  LDR R0, =0x40012400                 @ load the ADC_BASE
  MOVS R1, #0b100                     @ pattern to SET ADSTART
  STR R1, [R0, #0x08]                 @ set bit pattern of ADC_CR
  B wait_for_eoc_loop                 @ branch to wait for EOC to become high before continuing

wait_for_eoc_loop:
  LDR R1, [R0]                        @ R1 = ADC_ISR
  MOVS R2, #0b100                     @ pattern to select EOC flag
  ANDS R1, R1, R2
  CMP R1, #0                          @ if not high - loop
  BEQ wait_for_eoc_loop
  B set_data                          @ reaches this once the EOC becomes high and is ready to continue

set_data:

  @ read from POT1
  LDR R1, [R0, #0x40]                 @ load the ADC_DR
  MOVS R3, R1                         @ read value into R3

  @ display on LEDS
  LDR R0, =0x48000400                 @ load GPIOB base address
  STR R3, [R0, 0x14]                  @ display pattern
  B check_no_switch

    .align
@ you can define more literals here.
  DATA_ADDR: .word DATA
  DATA_END_ADDR: .word DATA_END

@ don't modify the following.
DATA:
  .word 0x45ac6a90
	.word 0x484721b4
	.word 0x5607039f
	.word 0x0e0253c4
	.word 0x0e1bc715
	.word 0xbe2f74b2
	.word 0x9f781e7f
	.word 0xc198339b
DATA_END:
