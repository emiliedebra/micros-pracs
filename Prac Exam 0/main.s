.syntax unified
.global _start
.cpu cortex-m0
.thumb

vectors:
    .word 0x20002000                                          @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                                          @ 0x04: defines the reset vector, thereby specifying the first instruction.
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
    .word TIM6_Handler + 1                                    @ 0x84: TIM6 ISR vector
    .word Default_Handler + 1                                 @ 0x88: reserved
    .word Default_Handler + 1                                 @ 0x8C: reserved

_start:
  BL LED_init
  BL pot_init
  BL copy_to_RAM_init
  B enable_TIMER

copy_to_RAM_init:
  LDR R0, DATA_ADDR                                         @ define these
  LDR R1, DATA_END_ADDR                                     @ define these
  SUBS R1, R1, R0                                           @ R1 holds length of data
  LDR R2, =0                                                @ R2 holds count - incr by 4 or 1 dependent on byte or word
  LDR R5, RAM_START                                         @ increase this, do not offset

copy_to_RAM:
  CMP R2, R1
  BEQ copy_to_RAM_done
  LDRB R3, [R0, R2]                                         @ loads data to R3
  STRB R3, [R5]                                             @ stores it in RAM
  ADDS R2, R2, #1
  ADDS R5, R5, #1
  B copy_to_RAM

copy_to_RAM_done:
  BX LR

enable_TIMER:
  BL TIM6_init
  B Default_Handler

Default_Handler:
    NOP
    B Default_Handler

HardFault_Handler:
    NOP
    B HardFault_Handler

TIM6_Handler:

TIM6_Handler_exit:
  LDR R0, TIM6_START
  LDR R1, =0x0
  STR R1, [R0, 0x10]
  LDR R1, =0x0
  STR R1, [R0, 0x24]
  BX LR

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

DATA_END:

@================== End of Literals =========================================
