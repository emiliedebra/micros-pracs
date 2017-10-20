    .syntax unified
    .global _start

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
    .word Default_Handler + 1       @ 0x88: TIM7 (not implemented)
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
    @ ack interrupt
    LDR R0, TIM6_BASE
    MOVS R1, #0
    STR R1, [R0, #0x10]
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0x10]
    MOVS R2, #0b1
    ANDS R1, R1, R2
    BNE default_timing
    @ set timing to two seconds
    LDR R0, TIM6_BASE
    LDR R1, TWO_SEC_ARR
    STR R1, [R0, #0x2C]
    B change_pattern
default_timing:  @ set one second timing
    LDR R0, TIM6_BASE
    LDR R1, ONE_SEC_ARR
    STR R1, [R0, #0x2C]
change_pattern:
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0x10]
    MOVS R2, #0b10
    ANDS R1, R1, R2
    BNE increment_by_one
    LDR R0, PATTERN_OFFSET_ADDR
    LDR R1, [R0]
    ADDS R1, #1
    MOVS R2, #8
    CMP R1, R2
    BNE no_wrap
    MOVS R1, #0
no_wrap:
    STR R1, [R0]
    LDR R0, PATTERNS_ADDR
    LDRB R0, [R0, R1]
    LDR R1, GPIOB_BASE
    STR R0, [R1, #0x14]
    BX LR
increment_by_one:
    LDR R0, GPIOB_BASE
    LDRB R1, [R0, #0x14]
    ADDS R1, R1, #1
    STRB R1, [R0, #0x14]
    BX LR

_start:
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]     @ RCC_AHBENR
    LDR R2, AHBENR_IOPABEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]     @ RCC_AHBENR write back
    LDR R1, [R0, #0x18]     @ RCC_APB2ENR
    LDR R2, APB2ENR_ADCEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x18]     @ RCC_APB2ENR write back
    LDR R1, [R0, #0x1C]     @ RCC_APB1ENR
    LDR R2, APB1ENR_TIM6EN
    ORRS R1, R1, R2
    STR R1, [R0, #0x1C]

    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0]        @ GPIOA_MODER
    LDR R2, GPIOA_BUTTONS_INPUTS_MASK_OUT
    ANDS R1, R1, R2
    LDR R2, GPIOA_POTS_ANALOGUE_MASK_IN
    ORRS R1, R1, R2
    STR R1, [R0, #0]        @ GPIOA_MODER write back
    LDR R1, [R0, #0x0C]     @ GPIO_PUPDR
    MOVS R2, 0xFF
    BICS R1, R1, R2         @ clear lower byte
    MOVS R2, #0b01010101
    ORRS R1, R1, R2         @ set lower 4 lines to have pullups
    STR R1, [R0, #0x0C]     @ GPIO_PUPDR write back

    LDR R0, GPIOB_BASE
    LDR R1, [R0, #0]        @ GPIOB_MODER
    LDR R2, GPIOB_LEDS_OUTPUTS_MASK_OUT
    ANDS R1, R1, R2
    LDR R2, GPIOB_LEDS_OUTPUTS_MASK_IN
    ORRS R1, R1, R2
    STR R1, [R0, #0]        @ GPIOB_MODER write back

    LDR R0, ADC_BASE
    LDR R1, [R0, #0x0C]     @ ADC_CFGR1
    MOVS R2, #0b11000
    BICS R1, R1, R2         @ clear bit 3 and 4 thereby setting 12-bit res
    STR R1, [R0, #0x0C]     @ ADC_CFGR1 write back
    MOVS R1, #1
    LSLS R1, #31
    STR R1, [R0, #0x08]     @ set ADC_CR ADCAL bit high. Will remain high until cal complete
adcal_loop:
    LDR R2, [R0, #0x08]     @ ADC_CR
    ANDS R2, R2, R1
    BNE adcal_loop
    MOVS R1, #1
    STR R1, [R0, #0x08]
adrdy_loop:
    LDR R2, [R0, #0]
    ANDS R2, R2, R1
    BEQ adrdy_loop
    MOVS R1, #0b1000000
    STR R1, [R0, #0x28]     @ ADC_CHSELR set to channel 6 (POT1)

    LDR R0, TIM6_BASE
    LDR R1, TIM_PSC
    STR R1, [R0, #0x28]
    LDR R1, ONE_SEC_ARR
    STR R1, [R0, #0x2C]
    MOVS R1, #1
    STR R1, [R0, #0x0C]     @ enable UI in DIER
    STR R1, [R0, #0x00]     @ set CEN in CR1 starting counter

    LDR R0, NVIC_BASE
    LDR R1, [R0, #0]
    MOVS R2, #1
    LSLS R2, #17
    ORRS R1, R1, R2
    STR R1, [R0, #0]

    LDR R0, PATTERN_OFFSET_ADDR
    MOVS R1, #0
    STR R1, [R0]
    
main_loop:
    NOP
    B main_loop
    

    .align
RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0b11 << 17
APB2ENR_ADCEN: .word 0b1 << 9
APB1ENR_TIM6EN: .word 0b1 << 4
GPIOA_BASE: .word 0x48000000
GPIOA_BUTTONS_INPUTS_MASK_OUT: .word 0xFFFFFFF0
GPIOA_POTS_ANALOGUE_MASK_IN: .word 0x00003C00
GPIOB_BASE: .word 0x48000400
GPIOB_LEDS_OUTPUTS_MASK_OUT: .word 0xFFFF0000
GPIOB_LEDS_OUTPUTS_MASK_IN:  .word 0x00005555
ADC_BASE: .word 0x40012400
TIM6_BASE: .word 0x40001000
TIM_PSC: .word 3515
ONE_SEC_ARR: .word 2275
TWO_SEC_ARR: .word 4550
NVIC_BASE: .word 0xE000E100
PATTERN_OFFSET_ADDR: .word 0x20000000
PATTERNS_ADDR: .word PATTERNS

@ The values of the following words will be modified at compile time by the marker,
@ but the number of values will not change. Hence, you can hard-code your bounds
@ checking loop if you wish
PATTERNS:
    .word 0xBBAA5500
    .word 0xFFEEDDCC
PATTERNS_END:
