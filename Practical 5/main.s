    @ WDXEMI001 RCHCHA006

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb

    @ The suggestion is to define specific blocks for the HardFault exception and
    @ the exception associated with the timer were using, leaving the rest of the
    @ vectors pointing to a Default_Handler.
vectors:
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
    @ define the rest of the vectors here
    .word Default_Handler + 1                                 @ 0x08: NMI handler - just redirecting to default handler for now
    .word HardFault_Handler + 1                               @ 0x0C: Hardfault handler vector
    .word Default_Handler + 1                                 @ 0x10: reserved
    .word Default_Handler + 1                                 @ 0x14: reserved
    .word Default_Handler + 1                                 @ 0x18: reserved
    .word Default_Handler + 1                                 @ 0x1C: reserved
    .word Default_Handler + 1                                 @ 0x20: reserved
    .word Default_Handler + 1                                 @ 0x24: reserved
    .word Default_Handler + 1                                 @ 0x28: reserved
    .word Default_Handler + 1                                 @ 0x2C: SVCall vector
    .word Default_Handler + 1                                 @ 0x30: reserved
    .word Default_Handler + 1                                 @ 0x34: reserved
    .word Default_Handler + 1                                 @ 0x38: reserved
    .word Default_Handler + 1                                 @ 0x3C: SysTick vector
    .word Default_Handler + 1                                 @ 0x40: reserved
    .word Default_Handler + 1                                 @ 0x44: reserved
    .word Default_Handler + 1                                 @ 0x48: reserved
    .word Default_Handler + 1                                 @ 0x4C: reserved
    .word Default_Handler + 1                                 @ 0x50: reserved
    .word Default_Handler + 1                                 @ 0x54: reserved
    .word Default_Handler + 1                                 @ 0x58: reserved
    .word Default_Handler + 1                                 @ 0x5C: reserved
    .word Default_Handler + 1                                 @ 0x60: reserved
    .word Default_Handler + 1                                 @ 0x64: reserved
    .word Default_Handler + 1                                 @ 0x68: reserved
    .word Default_Handler + 1                                 @ 0x6C: reserved
    .word Default_Handler + 1                                 @ 0x70: reserved
    .word Default_Handler + 1                                 @ 0x74: reserved
    .word Default_Handler + 1                                 @ 0x78: reserved
    .word Default_Handler + 1                                 @ 0x7C: reserved
    .word Default_Handler + 1                                 @ 0x80: reserved
    .word TIM6_ADC_IRQHandler_init + 1                             @ 0x84: TIM6 ISR vector
    .word Default_Handler + 1                                 @ 0x88: reserved
    .word Default_Handler + 1                                 @ 0x8C: reserved
    @ If an exception happens which we dont expect to happen, hang in an infinite loop
Default_Handler:
    NOP
    B Default_Handler

HardFault_Handler:
    NOP
    B HardFault_Handler

TIM6_ADC_IRQHandler_init:
    @ Acknowledge interrupt
    @ By default the interrupt handler should decrement
	@ the value displayed on the LEDs by 1. Start counting from FF.

	  @ If SW0 held:
    @ No logic here should affect the LEDs
    LDR R0, PORTA_START
    LDR R1, [R0, 0x10]
    LDR R2, =0b11111
    EORS R1, R1, R2
    LDR R2, =0b0001
    ANDS R1, R1, R2
    CMP R1, #1
    BEQ TIM6_ADC_IRQHandler_C

    @ If SW1 held:
    @ Save the value on the leds
	  @ Cycle throught the pattens
    LDR R0, PORTA_START
    LDR R1, [R0, 0x10]
    LDR R2, =0b11111
    EORS R1, R1, R2
    LDR R2, =0b0010
    ANDS R1, R1, R2
    CMP R1, #2
    BEQ TIM6_ADC_IRQHandler_E

    LDR R0, PORTB_START
    SUBS R4, #1
    STR R4, [R0, 0x14]
    @ If SW2 held:
    @ Vary the delay depending on value from POT1
    LDR R0, PORTA_START
    LDR R1, [R0, 0x10]
    LDR R2, =0b11111
    EORS R1, R1, R2
    LDR R2, =0b0100
    ANDS R1, R1, R2
    CMP R1, #4
    BEQ pot_get_2

    LDR R0, TIM6_START
    LDR R1, TIM6_DELAY_DEF
    STR R1, [R0, 0x2C]
    B TIM6_ADC_IRQHandler_C
    @ return from interrupt

TIM6_ADC_IRQHandler_C:
  LDR R0, TIM6_START
  LDR R1, =0x0
  STR R1, [R0, 0x10]
  BX LR

TIM6_ADC_IRQHandler_E:
  CMP R6, #8
  BEQ TIM6_ADC_IRQHandler_E_init
  LDR R0, PORTB_START
  LDR R3, PATTERN_ADDR
  LDRB R1, [R3, R6]
  STR R1, [R0, 0x14]
  ADDS R6, #1
  B TIM6_ADC_IRQHandler_C

TIM6_ADC_IRQHandler_E_init:
  MOVS R6, #0
  B TIM6_ADC_IRQHandler_E

TIM6_ADC_IRQHandler_B:
  LDR R0, PORTA_START
  LDR R1, [R0, 0x10]
  LDR R2, =0b11111
  EORS R1, R1, R2
  LDR R2, =0b0001
  ANDS R1, R1, R2
  CMP R1, #1
  BEQ TIM6_ADC_IRQHandler_D
  LDR R0, TIM6_START
  LDR R5, TIM6_DELAY_GRAD
  MULS R7, R7, R5
  LDR R5, TIM6_DELAY_CONST
  ADDS R7, R7, R5
  STR R7, [R0, 0x2C]
  B TIM6_ADC_IRQHandler_C

TIM6_ADC_IRQHandler_D:
  LDR R0, PORTB_START
  STR R7, [R0, 0x14]
  B TIM6_ADC_IRQHandler_C

@ ------- END OF INTERRUPT SERVICE ROUTINE --------

pot_get:
  LDR R0, ADC1_START                                        @ Select ADC channel 5
  LDR R1, [R0, 0x28]
  LDR R2, ADC_CHSELR_CHSEL5
  STR R2, [R0, 0x28]                                                    @== Gets the pot value

  LDR R0, ADC1_START                                        @ Starting a conversion
  LDR R1, [R0, 0x08]
  LDR R2, ADC_CR_ADSTART
  ORRS R1, R1, R2
  STR R1, [R0, 0x08]
  B pot_get_wait

pot_get_0:
  LDR R0, ADC1_START                                        @ Select ADC channel 5
  LDR R1, [R0, 0x28]
  LDR R2, ADC_CHSELR_CHSEL5
  STR R2, [R0, 0x28]                                                    @== Gets the pot value

  LDR R0, ADC1_START                                        @ Starting a conversion
  LDR R1, [R0, 0x08]
  LDR R2, ADC_CR_ADSTART
  ORRS R1, R1, R2
  STR R1, [R0, 0x08]
  B pot_get_wait_0

pot_get_2:
  LDR R0, ADC1_START                                        @ Select ADC channel 5
  LDR R1, [R0, 0x28]
  LDR R2, ADC_CHSELR_CHSEL6
  STR R2, [R0, 0x28]                                        @== Gets the pot value

  LDR R0, ADC1_START                                        @ Starting a conversion
  LDR R1, [R0, 0x08]
  LDR R2, ADC_CR_ADSTART
  ORRS R1, R1, R2
  STR R1, [R0, 0x08]
  B pot_get_wait

pot_get_wait:                                               @== Waits for conversion to be finished
  LDR R1, [R0]
  LDR R2, ADC_ISR_EOC
  ANDS R1, R1, R2
  CMP R1, #0
  BEQ pot_get_wait
  LDR R7, [R0, 0x40]
  B TIM6_ADC_IRQHandler_B

pot_get_wait_0:                                               @== Waits for conversion to be finished
  LDR R1, [R0]
  LDR R2, ADC_ISR_EOC
  ANDS R1, R1, R2
  CMP R1, #0
  BEQ pot_get_wait_0
  LDR R7, [R0, 0x40]
  B pot_set

pot_set:
  LDR R0, PORTB_START
  STR R7, [R0, 0x14]
  B main_loop

_start:
    BL LEDInit                                                @ Enable the LEDs
    BL pot_init
    BL TIM6_init
    @ enable GPIOA, GPIOB, TIM6

    @ enable clock for A and B


    @ enable clock for timer 6


    @ set push-buttons pins to inputs with pull-up resistors


    @ set pot pins to analogue mode
    @ set pin A 5 and 6 to analogue mode


    @ Configure TIM6: PSC, ARR, UIE, CEN

    @ set PSC and ARR


    @ enable interrupt request

    @ start counter counting


    @ Enable TIM6 IRQ in NVIC
    main_loop:
        NOP
    	@ Check for SW0 here
      LDR R0, PORTA_START
      LDR R1, [R0, 0x10]
      LDR R2, =0b11111
      EORS R1, R1, R2
      LDR R2, =0b0001
      ANDS R1, R1, R2
      CMP R1, #1
      BEQ pot_get_0
    	B main_loop
@============ Initialisations ==================
LEDInit:
    LDR R0, RCC_START                                         @ Enable GPIOA and GPIOB RCC Clock
    LDR R2, [R0, 0x14]
    LDR R3, RCC_AHBENR_GPIO_ABEN
    ORRS R2, R2, R3
    STR R2, [R0, 0x14]
    LDR R0, PORTB_START
    LDR R2, PORTB_MODEROUT                                    @ Set Port B Mode to OUTPUT
    STR R2, [R0]
    LDR R0, PORTA_START
    LDR R1, PORTA_PUPDR
    LDR R2, [R0, 0x0C]
    ORRS R1, R1, R2
    STR R1, [R0, 0x0C]
    LDR R1, PORTA_MODERIN
    STR R1, [R0]
    LDR R4, =0xFF
    LDR R0, PORTB_START
    STR R4, [R0, 0x14]
    BX LR

TIM6_init:                                                  @== Initialise TIMER 6
    LDR R0, RCC_START
    LDR R1, RCC_APB1ENR_TIM6_EN                               @ Enable RCC for Timer 6
    LDR R2, [R0, 0x1C]
    ORRS R1, R1, R2
    STR R1, [R0, 0x1C]

    LDR R0, TIM6_START                                        @ Set ARR to a default value for now
    LDR R1, TIM6_DELAY_DEF
    STR R1, [R0, 0x2C]

    LDR R1, TIM6_DELAY_PSC                                              @ Set the prescalar to 100 (100 times as slow)
    STR R1, [R0, 0x28]

    LDR R1, TIM6_DIER_IEN                                     @ Enable the interupt for TIM6
    LDR R2, [R0, 0x0C]
    ORRS R1, R1, R2
    STR R1, [R0, 0x0C]

    LDR R1, =0x0                                              @ Clear any possible interrupt
    STR R1, [R0, 0x10]

    LDR R1, TIM6_CR1_CEN                                      @ Start the clock!
    LDR R2, [R0]
    ORRS R1, R1, R2
    STR R1, [R0]

    LDR R0, ISER_ADDR                                         @ Enable TIM 6 interrupt in the NVIC
    LDR R1, ISER_TIM6_EN
    LDR R2, [R0]
    ORRS R1, R1, R2
    STR R1, [R0]

    MOVS R6, #0

    BX LR

pot_init:
    LDR R0, RCC_START
    LDR R1, [R0, 0x18]                                        @ Enable RCC for ADC
    LDR R2, RCC_APB2ENR_ADC_EN
    ORRS R1, R1, R2
    STR R1, [R0, 0x18]

    LDR R0, PORTA_START                                       @ Set PA5 to ANALOG
    LDR R1, [R0]
    LDR R2, GPIOA_MODER_MODER5
    ORRS R1, R1, R2
    STR R1, [R0]

    LDR R0, ADC1_START                                        @ Select ADC channel 5
    LDR R1, [R0, 0x28]
    LDR R2, ADC_CHSELR_CHSEL5
    ORRS R1, R1, R2
    STR R1, [R0, 0x28]

    LDR R1, [R0, 0x0C]                                        @ Set resolution to 8 bits
    LDR R2, ADC_CFGR1_RES_1
    ORRS R1, R1, R2
    STR R1, [R0, 0x0C]

    LDR R1, [R0, 0x08]                                        @ Set ADEN = 1
    LDR R2, ADC_CR_ADEN
    ORRS R1, R1, R2
    STR R1, [R0, 0x08]

    B pot_init_wait

pot_init_wait:
    LDR R0, ADC1_START
    LDR R1, [R0]
    LDR R2, ADC_ISR_ADRDY
    ANDS R1, R1, R2
    CMP R1, #0
    BEQ pot_init_wait
    BX LR


@ ================ END OF INITIALISATIONS ===================


    .align
@ Define your literals here
RCC_START:              .word 0x40021000
RCC_AHBENR_GPIO_ABEN:   .word 0x00060000
PORTA_START:            .word 0x48000000
PORTA_MODERIN:          .word 0x28000000
PORTA_PUPDR:            .word 0x55
PORTB_START:            .word 0x48000400
PORTB_MODEROUT:         .word 0x00005555
STACK_1_START:          .word 0x20002000
DELAY_1:                .word 0x000C3500 @ 0.5 secs
VARDELAY_GRAD:          .word 0x00000C65 @ Gradient for the linear pot/delay relationship
RAM_START:              .word 0x20000000
TIM6_START:             .word 0x40001000

RCC_APB2ENR_ADC_EN:     .word 0x00000200 @ ADC enable bit
GPIOA_MODER_MODER5:     .word 0x00000C00 @ Port A5 analog mode
GPIOA_MODER_MODER6:     .word 0x00003000 @ Port A6 analog mode
ADC1_START:             .word 0x40012400 @ Start of ADC registers
ADC_CHSELR_CHSEL5:      .word 0x00000020 @ Channel 5 select bit
ADC_CHSELR_CHSEL6:      .word 0x00000040 @ Channel 6 select bit
ADC_CFGR1_RES_1:        .word 0x00000010 @ 8 bit resolution bit
ADC_CR_ADEN:            .word 0x00000001 @ ADEN = 1
ADC_ISR_ADRDY:          .word 0x00000001 @ ADC ready bit
ADC_CR_ADSTART:         .word 0x00000004 @ ADC conversion start bit
ADC_ISR_EOC:            .word 0x00000004 @ ADC conversion complete bit

RCC_APB1ENR_TIM6_EN:    .word 0x00000010 @ TIM6 enable bit
TIM6_DELAY_DEF:         .word 0x00006900 @ Default Timer 6 delay (2Hz)
TIM6_DELAY_GRAD:        .word 0x00000067 @ Gradient for pot relationship
TIM6_DELAY_CONST:       .word 0x00006900 @ Constant for pot relationship
TIM6_DELAY_PSC:         .word 0x00000096 @ PSC for varying pot relationship
TIM6_CR1_CEN:           .word 0x00000001 @ TIM 6 counter enable bit
TIM6_DIER_IEN:          .word 0x00000001 @ Update interrupt enable bit
ISER_ADDR:              .word 0xE000E100 @ NVIC interrupt set-enable register
ISER_TIM6_EN:           .word 0x00020000 @ TIM 6 NVIC interrupt enable bit

@ This is the sequence of patterns (each byte is a pattern) which the LEDs must cycle through.
@ The values of the following words will be modified at compile time by the marker, but the number
@ of values will not change. Hence, you can hard-code your bounds checking condition if you wish.
PATTERN_ADDR: .word PATTERNS

PATTERNS:
    .word 0x66B9543C
    .word 0xCA71D738
