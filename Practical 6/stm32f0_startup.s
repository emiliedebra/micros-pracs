.syntax unified
.global _start

.section .isr_vectors,"a"

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
	
	.section .text
	
Default_Handler:
    NOP
    B Default_Handler

HardFault_Handler:
    NOP
    B HardFault_Handler

_start:
BL main
_infLoop:
NOP
B _infLoop
