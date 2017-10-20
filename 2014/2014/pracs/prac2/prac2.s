@GWNJAM001 GWNJAM001
    .syntax unified
    .global _start

vectors:
    .word 0x20002000
    .word _start + 1

_start:
    @ the following block enables the GPIOB by setting the 18th bit of the RCC_AHBENR
    LDR R0, RCC_BASE                 @ R0 = RCC base address
    LDR R1, [R0, #0x14]                 @ R1 = RCC_AHBENR
    LDR R2, AHBENR_IOPBEN               @ 18th bit high
    ORRS R1, R1, R2                     @ Force 18th bit (IOBEN) high
    STR R1, [R0, #0x14]                 @ write back to RCC_AHBENR

    @ the following sets the GPIOB[0:7] to be outputs by writing a pattern of 01 to the GPIOB_MODER
    LDR R0, GPIOB_BASE                  @ R0 = GPIOB base address
    LDR R1, [R0]                        @ R1 = GPIOB_MODER
    LDR R2, MODER_OUTPUTS               @ pattern to set first 8 pairs of bits to be 01 (output)
    ORRS R1, R1, R2                     @ force the bits high, leaving the other bits unchanged
    STR R1, [R0]                        @ write back to GPIOB_MODER

all_off:
    @ read in the data from GPIOB_ODR, force the lower byte to 0 and write back
    LDR R1, [R0, #0x14]                 @ R1 = GPIOB_ODR (R0 still contains GPIOB base address from above)
    LDR R2, MASK_CLEAR_LOWER_BYTE       @ pattern which will leave upper 3 bytes unchanged while clearing lower byte
    ANDS R1, R1, R2                     @ clear lower byte of ODR
    STR R1, [R0, #0x14]                 @ write back to GPIOB_ODR

display_AA:
    @ R1 already contains the pattern on the LEDs - just OR it with 0xAA
    MOVS R2, #0xAA                      @ can use MOVS as we only need to load 1 byte
    ORRS R1, R1, R2                     @ set lower byte to AA, leaving rest of R1 unchanged.
    STR R1, [R0, #0x14]                 @ write back to GPIOB_ODR

all_on:
   @ again, R1 already contains the contents of the ODR. Now we just need to set the lower byte
   MOVS R2, #0xFF                       @ pattern to set lower byte
   ORRS R1, R1, R2                      @ set lower byte
   STR R1, [R0, #0x14]                  @ write back to GPIOB_ODR

bonus:
   @ you wish!
end: B all_off

    .align
RCC_BASE: 		.word 0x40021000
AHBENR_IOPBEN: 	.word 0b1000000000000000000
GPIOB_BASE: 	.word 0x48000400
MODER_OUTPUTS: 	.word 0b0101010101010101
MASK_CLEAR_LOWER_BYTE: .word 0xFFFFFF00
