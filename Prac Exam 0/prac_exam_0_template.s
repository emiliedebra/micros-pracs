@ WDXEMI001
@ Intro to micros practical exam 0 ; 2017-01-11

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
    .word Default_Handler + 1       @ 0x2C: SVCall
    .word Default_Handler + 1       @ 0x30: reserved
    .word Default_Handler + 1       @ 0x34: reserved
    .word Default_Handler + 1       @ 0x38: PendSV
    .word Default_Handler + 1       @ 0x3C: SysTick
    .word Default_Handler + 1       @ 0x40: WWDG
    .word Default_Handler + 1       @ 0x44: PVD_VDDIO2
    .word Default_Handler + 1       @ 0x48: RTC
    .word Default_Handler + 1       @ 0x4C: FLASH
    .word Default_Handler + 1       @ 0x50: RCC_CRS
    .word Default_Handler + 1       @ 0x54: EXTI0_1
    .word Default_Handler + 1       @ 0x58: EXTI2_3
    .word Default_Handler + 1       @ 0x5C: EXTI4_15
    .word Default_Handler + 1       @ 0x60: TSC vector
    .word Default_Handler + 1       @ 0x64: DMA_CH1
    .word Default_Handler + 1       @ 0x68: DMA_CH2_3
    .word Default_Handler + 1       @ 0x6C: DMA_CH[4:7]
    .word Default_Handler + 1       @ 0x70: ADC_COMP v
    .word Default_Handler + 1       @ 0x74: TIM1_BRK_UP_TRG_COM
    .word Default_Handler + 1       @ 0x78: TIM1_CC
    .word Default_Handler + 1       @ 0x7C: TIM2
    .word Default_Handler + 1       @ 0x80: TIM3
    .word TIM6_Handler + 1          @ 0x84: TIM6_DAC
    .word Default_Handler + 1       @ 0x88: TIM7
    .word Default_Handler + 1       @ 0x8C: TIM14
    .word Default_Handler + 1       @ 0x90: TIM15
    .word Default_Handler + 1       @ 0x94: TIM16
    .word Default_Handler + 1       @ 0x98: TIM17
    .word Default_Handler + 1       @ 0x9C: I2C1
    .word Default_Handler + 1       @ 0xA0: I2C2
    .word Default_Handler + 1       @ 0xA4: SPI1
    .word Default_Handler + 1       @ 0xA8: SPI2
    .word Default_Handler + 1       @ 0xAC: USART1
    .word Default_Handler + 1       @ 0xB0: USART2
    .word Default_Handler + 1       @ 0xB4: USART3_4
    .word Default_Handler + 1       @ 0xB8: CEC_CAN
    .word Default_Handler + 1       @ 0xBC: USB

HardFault_Handler:
    NOP
    B HardFault_Handler

Default_Handler:
    NOP
    B Default_Handler

    TIM6_Handler:
      @acknowledge interrupt

      LDR R0, TIM6_START
      LDR R1, =0x0
      STR R1, [R0, 0x10]
      LDR R1, =0x0
      STR R1, [R0, 0x24]
    @resetting timer
      LDR R0, TIM6_START                                        @ Set ARR to a default value for now
      LDR R1, TIM6_DELAY_DEF_1
      STR R1, [R0, #0x2C]

      LDR R1, TIM6_DELAY_PSC                                    @ Set the prescalar to 100 (100 times as slow)
      STR R1, [R0, #0x28]

      check_switch_timer:                                              @ AND switch number with R1 and compare to value to see if switch is pressed
        LDR R0, PORTA_START
        LDR R1, [R0, 0x10]
        LDR R2, =0b1111
        EORS R1, R1, R2
        LDR R2, =0b1111
        ANDS R1, R1, R2
        CMP R1, #4
        BEQ read_POT_1_delay

      display:
      LDR R0, PORTB_START
      STR R5, [R0, 0x14]
      ADDS R5, R5, #1
      BX LR

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
          LDR R1, =0x3D45
          STR R1, [R0, #0x2C]

        change_PSC:
          @ set value
          LDR R0, TIM6_START
          LDR R1, =0xFE
          ADDS R1, R1, R7
          STR R1, [R0, #0x28]
          B display

    _start:
    @ Initliase LEDs
    BL LED_init
    BL pot_init
    @ perform copy to RAM 0x20001000
    copy_to_RAM_init:
      LDR R0, DATA_ADDR                                         @ define these
      LDR R1, DATA_END_ADDR                                     @ define these
      SUBS R1, R1, R0                                           @ R1 holds length of data
      LDR R2, =0b0                                                @ R2 holds count - incr by 4 or 1 dependent on byte or word
      LDR R5, RAM_START                                         @ increase this, do not offset

    copy_to_RAM:
      CMP R2, R1
      BEQ copy_to_RAM_complete
      LDRB R3, [R0, R2]                                         @ loads data to R3 // load as signed byte and store as word for automatic sign extending
      ADDS R3, R3, #1
      STRB R3, [R5]                                             @ stores it in RAM
      ADDS R2, R2, #1
      ADDS R5, R5, #1
      B copy_to_RAM
    @ CRITICAL! Here, the automarker will verify block in RAM.
copy_to_RAM_complete:

sum_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R3, =0                                                @ holds offset
  LDR R0, RAM_START
  LDR R2, =0
  LDR R5, =0                                                @ holds sum

find_sum:
  CMP R3, R1
  BGT display_sum
  LDRSB R4, [R0, R2]                                             @ NB change to LDRSB for signed values
  ADDS R5, R5, R4
  ADDS R3, R3, #1
  ADDS R2, R2, #1
  B find_sum
    @ Find sum of signed numbers in RAM

    @ Display SUM  on the LEDs
display_sum:
  LDR R0, PORTB_START
  STR R5, [R0, 0x14]
    @ CRITICAL! Automarker will verify value displayed on LEDs here
display_sum_done:
  BL TIM6_init
    @ Initialise TIM6, NVIC, push buttons, ADC

main_loop:
check_switch_loop:                                              @ AND switch number with R1 and compare to value to see if switch is pressed
    LDR R0, PORTA_START
    LDR R1, [R0, 0x10]
    LDR R2, =0b1111
    EORS R1, R1, R2
    LDR R2, =0b1111
    ANDS R1, R1, R2
    CMP R1, #2
    BEQ read_POT_0
    CMP R1, #4
    BNE reset_timer_values
    B main_loop

reset_timer_values:
  @ set #value
  LDR R0, TIM6_START
  LDR R1, =0x3D45 @NB YOU NEED TO WORK THIS OUT
  STR R1, [R0, #0x2C]
  @ set value
  LDR R0, TIM6_START
  LDR R1, =0xFE @NB YOU NEED TO WORK THIS OUT
  STR R1, [R0, #0x28]
  @ branching to whatever the timer is meant to do
  B main_loop

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

compare_value:
  CMP R7, #0xE0
  BHI display_10000000
  CMP R7, #0xA2
  BHI display_01000000
  CMP R7, #0x83
  BHI display_00100000
  CMP R7, #0x64
  BHI display_00010000
  CMP R7, #0x45
  BHI display_00001000
  CMP R7, #0x26
  BHI display_00000100
  CMP R7, #0x00
  BEQ display_00000001
  CMP R7, #0x00
  BHI display_00000010

  display_10000000:
    LDR R0, PORTB_START
    LDR R3, =0b10000000
    STR R3, [R0, 0x14]
    B main_loop
  display_01000000:
    LDR R0, PORTB_START
    LDR R3, =0b01000000
    STR R3, [R0, 0x14]
    B main_loop
  display_00100000:
    LDR R0, PORTB_START
    LDR R3, =0b00100000
    STR R3, [R0, 0x14]
    B main_loop
  display_00010000:
    LDR R0, PORTB_START
    LDR R3, =0b00010000
    STR R3, [R0, 0x14]
    B main_loop
  display_00001000:
    LDR R0, PORTB_START
    LDR R3, =0b00001000
    STR R3, [R0, 0x14]
    B main_loop
  display_00000100:
    LDR R0, PORTB_START
    LDR R3, =0b00000100
    STR R3, [R0, 0x14]
    B main_loop
  display_00000010:
    LDR R0, PORTB_START
    LDR R3, =0b00000010
    STR R3, [R0, 0x14]
    B main_loop
  display_00000001:
    LDR R0, PORTB_START
    LDR R3, =0b00000001
    STR R3, [R0, 0x14]
    B main_loop
    @=========== Literals ===============

    .align
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

    @ variables for pot_init
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

    @ variables for timer delay
    TIM6_DELAY_DEF_.5:      .word 0x000033E8 @ Default Timer 6 delay (2Hz)
    TIM6_DELAY_DEF_1.5:     .word 0x00009BB9 @ Default Timer 6 delay (0.6667Hz)
    TIM6_DELAY_DEF_1:       .word 0x000067D1 @ Default Timer 6 delay (1Hz)
    TIM6_DELAY_GRAD:        .word 0x00000067 @ Gradient for pot relationship (2 to 1Hz) - requires PSC of 150
    TIM6_DELAY_CONST:       .word 0x00006779 @ Constant for pot relationship - requires PSC of 150
    TIM6_DELAY_PSC:         .word 0x0000012C @ PSC standard - set to 300
    TIM6_POT_DELAY_PSC:     .word 0x00000096 @ PSC for varying pot relationship - set to 150

    @ variables for timer_init
    TIM6_START:             .word 0x40001000
    RCC_APB1ENR_TIM6_EN:    .word 0x00000010 @ TIM6 enable bit
    TIM6_CR1_CEN:           .word 0x00000001 @ TIM 6 counter enable bit
    TIM6_DIER_IEN:          .word 0x00000001 @ Update interrupt enable bit
    ISER_ADDR:              .word 0xE000E100 @ NVIC interrupt set-enable register
    ISER_TIM6_EN:           .word 0x00020000 @ TIM 6 NVIC interrupt enable bit

    DATA_ADDR: .word DATA
    DATA_END_ADDR: .word DATA_END

DATA:
    .word 0x2436f1cd
    .word 0x215a9596
    .word 0x7118bd2b
    .word 0x1708d29b
DATA_END:  @ this will point to the address immediately after the block.
