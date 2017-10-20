@ library file for prac exams
@ WDXEMI001
.cpu cortex-m0
.thumb
.syntax unified

.global LED_init
.global TIM6_init
.global pot_init
.global pot_init_wait

@ ============ Initialisations =================================================================

LED_init:
    PUSH {R0-R2, LR}                                          @== Initialise LEDs

    LDR R0, RCC_START                                         @ Enable GPIOA and GPIOB RCC Clock
    LDR R1, [R0, #0x14]
    LDR R2, RCC_AHBENR_GPIO_ABEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]

    LDR R0, PORTB_START
    LDR R2, PORTB_MODEROUT                                    @ Set Port B Mode to OUTPUT
    STR R2, [R0]

    LDR R0, PORTA_START                                       @ initialise GPIOA
    LDR R1, PORTA_PUPDR
    LDR R2, [R0, #0x0C]
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]
    LDR R1, PORTA_MODERIN
    STR R1, [R0]

    POP {R0-R2, PC}

TIM6_init:
    PUSH {R0-R2, LR}                                          @== Initialise TIMER 6

    LDR R0, RCC_START
    LDR R1, RCC_APB1ENR_TIM6_EN                               @ Enable RCC for Timer 6
    LDR R2, [R0, #0x1C]
    ORRS R1, R1, R2
    STR R1, [R0, #0x1C]

    LDR R0, TIM6_START                                        @ Set ARR to a default value for now
    LDR R1, =0x3D45
    STR R1, [R0, #0x2C]

    LDR R1, =0xFE                                    @ Set the prescalar to 100 (100 times as slow)
    STR R1, [R0, #0x28]

    LDR R1, TIM6_DIER_IEN                                     @ Enable the interupt for TIM6
    LDR R2, [R0, #0x0C]
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]

    LDR R1, =0x0                                              @ Clear any possible interrupt
    STR R1, [R0, #0x10]

    LDR R1, TIM6_CR1_CEN                                      @ Start the clock!
    LDR R2, [R0]
    ORRS R1, R1, R2
    STR R1, [R0]

    LDR R0, ISER_ADDR                                         @ Enable TIM 6 interrupt in the NVIC
    LDR R1, ISER_TIM6_EN
    LDR R2, [R0]
    ORRS R1, R1, R2
    STR R1, [R0]

    POP {R0-R2, PC}

pot_init:
    PUSH {R0-R2, LR}                                          @== Enable ADC with Pot 0
    LDR R0, RCC_START
    LDR R1, [R0, #0x18]                                        @ Enable RCC for ADC
    LDR R2, RCC_APB2ENR_ADC_EN
    ORRS R1, R1, R2
    STR R1, [R0, #0x18]

    LDR R0, PORTA_START                                       @ Set PA5 to ANALOG
    LDR R1, [R0]
    LDR R2, GPIOA_MODER_MODER5
    ORRS R1, R1, R2
    STR R1, [R0]

    LDR R0, PORTA_START                                       @ Set PA6 to ANALOG
    LDR R1, [R0]
    LDR R2, GPIOA_MODER_MODER6
    ORRS R1, R1, R2
    STR R1, [R0]

    LDR R0, ADC1_START                                        @ Select ADC channel 6
    LDR R1, [R0, 0x28]
    LDR R2, ADC_CHSELR_CHSEL6
    STR R2, [R0, 0x28]

    LDR R1, [R0, #0x0C]                                        @ Set resolution to 8 bits
    LDR R2, ADC_CFGR1_RES_1
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]

    LDR R1, [R0, #0x08]                                        @ Set ADEN = 1
    LDR R2, ADC_CR_ADEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x08]

    B pot_init_wait

pot_init_wait:
    LDR R0, ADC1_START
    LDR R1, [R0]
    LDR R2, ADC_ISR_ADRDY
    ANDS R1, R1, R2
    CMP R1, #0
    BEQ pot_init_wait
    POP {R0-R2, PC}

@ ============================= End of Initialisations ===========================================

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
TIM6_DELAY_PSC:         .word 0x0000012C @ PSC standard - set to 100
TIM6_POT_DELAY_PSC:     .word 0x00000096 @ PSC for varying pot relationship - set to 150

@ variables for timer_init
TIM6_START:             .word 0x40001000
RCC_APB1ENR_TIM6_EN:    .word 0x00000010 @ TIM6 enable bit
TIM6_CR1_CEN:           .word 0x00000001 @ TIM 6 counter enable bit
TIM6_DIER_IEN:          .word 0x00000001 @ Update interrupt enable bit
ISER_ADDR:              .word 0xE000E100 @ NVIC interrupt set-enable register
ISER_TIM6_EN:           .word 0x00020000 @ TIM 6 NVIC interrupt enable bit
