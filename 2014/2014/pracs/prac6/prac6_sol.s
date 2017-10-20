@STDNUM001 STDNUM002
@ ======= MODIFY THE LINE ABOVE!!!! =======

    .syntax unified
    .global _start
    .cpu cortex-m0
    .thumb


vectors: 
    .word RAM_END                   @ 0x00: defines the reset value of the stack pointer
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
    .word Default_Handler + 1       @ 0x2C: SVCall vector
    .word Default_Handler + 1       @ 0x30: reserved
    .word Default_Handler + 1       @ 0x34: reserved
    .word Default_Handler + 1       @ 0x38: PendSV vector
    .word Default_Handler + 1       @ 0x3C: SysTick vector
    .word Default_Handler + 1       @ 0x40: WWDG vector
    .word Default_Handler + 1       @ 0x44: PVD_VDDIO2 vector
    .word Default_Handler + 1       @ 0x48: RTC vector
    .word Default_Handler + 1       @ 0x4C: FLASH vector
    .word Default_Handler + 1       @ 0x50: RCC_CRS vector
    .word Default_Handler + 1       @ 0x54: EXTI0_1 vector
    .word Default_Handler + 1       @ 0x58: EXTI2_3 vector
    .word Default_Handler + 1       @ 0x5C: EXTI4_15 vector
    .word Default_Handler + 1       @ 0x60: TSC vector
    .word Default_Handler + 1       @ 0x64: DMA_CH1 v
    .word Default_Handler + 1       @ 0x68: DMA_CH2_3 v
    .word Default_Handler + 1       @ 0x6C: DMA_CH[4:7] v
    .word Default_Handler + 1       @ 0x70: ADC_COMP v
    .word Default_Handler + 1       @ 0x74: TIM1_BRK_UP_TRG_COM v
    .word Default_Handler + 1       @ 0x78: TIM1_CC
    .word Default_Handler + 1       @ 0x7C: TIM2 vector
    .word Default_Handler + 1       @ 0x80: TIM3 vector
    .word TIM6_DAC_IRQHandler + 1   @ 0x84: TIM6_DAC vector

HardFault_Handler:      @ should never happen, but handle it explcitly in case there's a bug in the code.
        NOP
        B HardFault_Handler

@ All other exceptions should be pointed here in order to have some sort of defined behaviour in
@ the event that they occur.
Default_Handler:        
        NOP
        B Default_Handler

_start:
    @ enable clock to ADC, Timer 6, GPIOA, GPIOB
  @ GPIOA and B
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]                 @ RCC_AHBENR
    LDR R2, AHBENR_IOPABEN              @ mask to set IOPNEN and IOPAEN
    ORRS R1, R1, R2
    STR R1, [R0, #0x14]                 @ write back to AHBENR
  @ TIM7
    LDR R1, [R0, #0x1C]                 @ RCC_APB1ENR
    MOVS R2, #0x10                      @ mask to set TIM6EN
    ORRS R1, R1, R2
    STR R1, [R0, #0x1C]                 @ write back to RCC_APB1ENR
  @ ADC
    LDR R1, [R0, #0x18]                 @ R1 = RCC_APB2ENR
    LDR R2, APB2ENR_ADCEN               @ bit 9 to set ADCEN
    ORRS R1, R1, R2                     @ mask in
    STR R1, [R0, #0x18]                 @ write back

    @ set pins to correct modes
  @ set PB7:0 as outputs
    LDR R0, GPIOB_BASE
    LDR R1, [R0, #0]                    @ GPIOB_MODER
    LDR R2, MODER_OUTPUTS               
    ORRS R1, R1, R2
    STR R1, [R0, #0]                    @ write back
  @ set PA5 as analogue mode
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0]                    @ R1 = GPIOA_MODER
    LDR R2, MODER_P5_ANALOGUE           @ pattern to set bits 11 and 10: MODER5 = Analogue
    ORRS R1, R1, R2
    STR R1, [R0, #0]                    @ write back to GPIOA_MODER


    @ pullups for buttons
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0x0C]                 @ GPIOA_PUPDR
    MOVS R2, #0x50                      @ PU for Pin 3 and Pin 2
    ORRS R1, R1, R2                     
    STR R1, [R0, #0x0C]                 @ write back to PUPDR

    @ enable ADC
    LDR R0, ADC_BASE
    MOVS R1, #1                         @ bit to set ADEN
    STR R1, [R0, #0x08]                 @ set ADEN in ADC_CR
    @ wait until ADC ready. As per Section 13.4.4: the ADC must be ready before writing to its other registers
wait_ad_rdy:
    LDR R1, [R0, #0]                    @ R1 = ADC_ISR
    MOVS R2, #1
    ANDS R1, R1, R2
    CMP R1, #0                          @ is the ADRDY bit a 0?
    BEQ wait_ad_rdy                     @ if so, keep looping

    @ ADC is now ready. Select channel and resolution/alignment 
    MOVS R1, #0b100000                   @ ADC channel 5
    STR R1, [R0, #0x28]                 @ set channel 5 in ADC_CHSELR

    @ initialise timer: Set ARR, PSR, enable update interrupt
    LDR R0, TIM6_BASE
    LDR R1, TIM7_PSC
    STR R1, [R0, #0x28]                 @ TIM7_PSC = 780
    LDR R1, TIM7_ARR
    STR R1, [R0, #0x2C]                 @ TIM7_ARR = 5119

    @ enable interrupt request
    LDR R1, [R0, #0x0C]                 @ TIM7_DIER
    MOVS R2, #1                         @ mask to set TIMx_DIER_UIE
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]                 @ write back to DIER

    @ start counter counting
    LDR R1, [R0, #0]                    @ TIM7_CR1
    MOVS R2, #1                         @ mask to set CEN
    ORRS R1, R1, R2
    STR R1, [R0, #0]                    @ TIM7_CR1_CEN = 1

    @ enable the interrupt for the timer in the NVIC
    LDR R0, NVIC_ISER
    LDR R1, [R0, #0]                    @ NVIC_ISER
    LDR R2, ISER_TIM6                   @ bit 17 = TIM6
    ORRS R1, R1, R2
    STR R1, [R0, #0]                    @ write back to NVIC ISER


infinite_loop:
    NOP
    B infinite_loop

@ The following block of code is called an Interrupt Service Routine (ISR).
@ It should be executed whenever the TIM6 IRQ occurs. 
TIM6_DAC_IRQHandler:
    @ acknowledge interrupt
    LDR R0, TIM6_BASE
    MOVS R1, #0
    STR R1, [R0, #0x10]                 @ clear TIM7_SR_UIF (only bit in register) 

    @ Read GPIOB_ODR (remember, we're only interested in the LSB!)
    LDR R0, GPIOB_BASE
    LDRB R1, [R0, #0x14]                @ R1 = GPIOB_ODR

    LDR R2, GPIOA_BASE
    LDRB R3, [R2, #0x10]                @ R3 = GPIOA_IDR
    MOVS R4, #0b1000                    @ mask to select only SW3
    ANDS R3, R3, R4
    CMP R3, #0
    BEQ sw3_pressed                     @ if 0, the button is pressed
    @ if we get here, the button was NOT pressed
    ADDS R1, R1, #1                     @ increment ODR by 1
    B write_back_to_LEDs                @ jump over the subtract instruction
sw3_pressed:
    SUBS R1, R1, #1                     @ decrement ODR by 1
write_back_to_LEDs:
    STRB R1, [R0, #0x14]
 
    LDR R2, GPIOA_BASE
    LDRB R3, [R2, #0x10]                @ R3 = GPIOA_IDR
    MOVS R4, #0b100                     @ mask to select only SW2
    ANDS R3, R3, R4
    CMP R3, #0
    BEQ get_timing_from_ADC             @ BEQ implies line low implies pressed.
    @ if we get here, the button was NOT pressed. Restore default timing
    LDR R0, TIM6_BASE
    LDR R1, TIM7_ARR                    @ This implies 2 Hz
    STR R1, [R0, #0x2C]                 @ write to ARR
    BX LR                               @ return from ISR

get_timing_from_ADC:
    LDR R0, ADC_BASE
    MOVS R1, #0b100                     @ pattern to SET ADSTART
    STR R1, [R0, #0x08]                 @ ADC_CR
    @ now wait until EOC flag goes high
eoc_wait_loop:
    LDR R1, [R0, #0]                    @ R1 = ADC_ISR
    MOVS R2, #0b100                     @ pattern to select EOC flag
    ANDS R1, R1, R2
    CMP R1, #0                          @ is it still low?
    BEQ eoc_wait_loop                   @ keep branching while the bit is 0
    @ once we here here, EOC is high and the DR can be read.
    LDR R1, [R0, #0x40]                 @ once complete, R1 = ADC_DR
    LDR R2, ARR_10HZ                       @ the offset to the delay forcing minimum to 0.1 s (10 Hz)
    ADD R1, R1, R2                      @ add offset
    LDR R0, TIM6_BASE                  
    STR R1, [R0, #0x2C]                 @ write to TIM6_ARR
    BX LR                               @ return from ISR

    .align
RAM_END: .word 0x20002000
RCC_BASE: .word 0x40021000
GPIOB_BASE: .word 0x48000400
GPIOA_BASE: .word 0x48000000
ADC_BASE: .word 0x40012400
TIM6_BASE: .word 0x40001000
NVIC_ISER: .word 0xE000E100
AHBENR_IOPABEN: .word 0x00060000
APB2ENR_ADCEN: .word 0x200
MODER_OUTPUTS: .word 0b0101010101010101
MODER_P5_ANALOGUE: .word 0b110000000000
ISER_TIM6: .word 0b100000000000000000
TIM7_PSC: .word 780
TIM7_ARR: .word 5119
ARR_10HZ: .word 1024
