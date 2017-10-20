@================== Template Functions ==========================
@ NB NB when in Timers, don't use registers R0-R3 because they get popped and pushed
@========== Output Handling ===================

display_LED:
  LDR R0, PORTB_START
  STR R4, [R0, 0x14]

@=========== Input Handling ====================
read_POT_0:
  LDR R0, ADC1_START                                        @ Select ADC channel 5
  LDR R1, [R0, 0x28]
  LDR R2, ADC_CHSELR_CHSEL5
  STR R2, [R0, 0x28]                                        @== Gets the pot value

  LDR R0, ADC1_START                                        @ Starting a conversion
  LDR R1, [R0, 0x08]
  LDR R2, ADC_CR_ADSTART
  ORRS R1, R1, R2
  STR R1, [R0, 0x08]
  B pot_read_wait

pot_read_wait:                                               @== Waits for conversion to be finished
  LDR R1, [R0]
  LDR R2, ADC_ISR_EOC
  ANDS R1, R1, R2
  CMP R1, #0
  BEQ pot_read_wait
  LDR R7, [R0, 0x40]

read_POT_1:
  LDR R0, ADC1_START                                        @ Select ADC channel 6
  LDR R1, [R0, 0x28]
  LDR R2, ADC_CHSELR_CHSEL6
  STR R2, [R0, 0x28]                                        @== Gets the pot value

  LDR R0, ADC1_START                                        @ Starting a conversion
  LDR R1, [R0, 0x08]
  LDR R2, ADC_CR_ADSTART
  ORRS R1, R1, R2
  STR R1, [R0, 0x08]
  B pot_read_wait

check_switch:                                              @ AND switch number with R1 and compare to value to see if switch is pressed
  LDR R0, PORTA_START
  LDR R1, [R0, 0x10]
  LDR R2, =0b11111
  EORS R1, R1, R2
  LDR R2, =0b11111
  ANDS R1, R1, R2
  CMP R1, #number pressed

@============= Data Handling ===================

copy_to_RAM_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R2, =0                                                @ R2 holds count - incr by 4 or 1 dependent on byte or word
  LDR R5, RAM_START                                         @ increase this, do not offset

copy_to_RAM:
  CMP R2, R1
  BEQ branch_to_next_function
  LDRB R3, [R0, R2]                                         @ loads data to R3 // load as signed byte and store as word for automatic sign extending
  STRB R3, [R5]                                             @ stores it in RAM
  ADDS R2, R2, #1
  ADDS R5, R5, #1
  B copy_to_RAM

push_to_stack_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R2, =0                                                @ R2 holds count - incr by 4 or 1 dependent on byte or word

push_to_stack:
  CMP R2, R1
  BEQ branch_to_next_function
  LDRB R3, [R0, R2]                                         @ loads data to R3
  PUSH {R3}                                                 @ stores it in RAM
  ADDS R2, R2, #1
  B push_to_stack


@============ Data Sorting Functions ========================================
@ for signed values, use LDRSB for bytes, and LDR for words and LDRSH for half words
@ if using words and you dont want to treat them as signed, use BHI or BLO

compare_value: @ serious skeleton function
LDR R0, SPECIAL_VALUE
CMP R4, R0
BHI its_greater
BL0 its_lower

find_max_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R3, =0                                                @ holds offset
  LDR R0, RAM_START
  LDR R5, =0                                                @ holds max

find_max:
  CMP R3, R1
  BEQ branch_to_next_function
  LDR R4, [R0]                                             @ NB change to LDRSB for signed values and offset with register
  CMP R4, R5
  BGT set_max                                               @ change to BVC for signed values
  ADDS R3, #1
  ADDS R0, #1
  B find_max

set_max:
  MOVS R5, R4
  ADDS R3, #1
  B find_max

find_min_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R3, =0                                                @ holds offset
  LDR R0, RAM_START
  LDRSB R5, [R0]                                             @ holds initial min @ NB change to LDRSB for signed values

find_min:
  CMP R3, R1
  BEQ branch_to_next_function
  LDRSB R4, [R0]                                             @ NB change to LDRSB for signed values and use register offsets
  CMP R4, R5
  BLT set_min                                               @ change to BVS for signed values
  ADDS R3, #1
  ADDS R0, #1
  B find_min

set_min:
  MOVS R5, R4
  ADDS R3, #1
  B find_min

@===========================

count_LED_to_value:
  ADDS R4, R4, #1
  LDR R0, PORTB_START
  STR R4, [R0, 0x14]
  CMP R4, #value
  BEQ reset_value
  B count_to_value

  reset_value:
  MOVS R4, R5
  B count_to_value

@====== TIM6 Handler Functions =============


TIM6_Handler_vary:                  @ expects pot value in $R7
  LDR R0, TIM6_START
  LDR R5, TIM6_DELAY_GRAD
  MULS R7, R7, R5
  LDR R5, TIM6_DELAY_CONST
  ADDS R7, R7, R5
  STR R7, [R0, 0x2C]
  B TIM6_Handler_exit

TIM6_Handler_exit:
  LDR R0, TIM6_START
  LDR R1, =0x0
  STR R1, [R0, 0x10]
  LDR R1, =0x0
  STR R1, [R0, 0x24]
  BX LR

change_ARR:
  @ set #value
  LDR R0, TIM6_START
  LDR R1, #value
  STR R1, [R0, #0x2C]

change_PSC:
  @ set value
  LDR R0, TIM6_START
  LDR R1, #value
  STR R1, [R0, #0x28]

  @======= TO vary with POT ===========
@ put this into default handler after checking that required switch is NOT pressed
  reset_timer_values:
    LDR R0, TIM6_START                                        @ Set ARR to a default value for now
    LDR R1, TIM6_DELAY_DEF_1
    STR R1, [R0, #0x2C]

    LDR R1, TIM6_DELAY_PSC                                    @ Set the prescalar to 100 (100 times as slow)
    STR R1, [R0, #0x28]
    B Default_Handler

@ make timer handler do this after checking that switch IS pressed
  read_POT_1_delay:
    LDR R0, ADC1_START                                        @ Select ADC channel 6
    LDR R1, [R0, 0x28]
    LDR R2, ADC_CHSELR_CHSEL6
    STR R2, [R0, 0x28]                                        @== Gets the pot value

    LDR R0, ADC1_START                                        @ Starting a conversion
    LDR R1, [R0, 0x08]
    LDR R2, ADC_CR_ADSTART
    ORRS R1, R1, R2
    STR R1, [R0, 0x08]
    B pot_read_wait_delay

  pot_read_wait_delay:                                               @== Waits for conversion to be finished
    LDR R1, [R0]
    LDR R2, ADC_ISR_EOC
    ANDS R1, R1, R2
    CMP R1, #0
    BEQ pot_read_wait_delay
    LDR R7, [R0, 0x40]
    LDR R0, PORTB_START
    STR R7, [R0, 0x14]

    change_ARR:
      @ set #value
      LDR R0, TIM6_START
      LDR R1, =0x6209 @NB YOU NEED TO WORK THIS OUT
      STR R1, [R0, #0x2C]

    change_PSC:
      @ set value
      LDR R0, TIM6_START
      LDR R1, =0xFE @NB YOU NEED TO WORK THIS OUT
      ADDS R1, R1, R7
      STR R1, [R0, #0x28]
      @ branching to whatever the timer is meant to do
      B display


@ COMPARISON VALUES
@ Use BHI and BLO for unsigned numbers
@ Use BGT and BLT for signed numbers
@ BEQ for all
