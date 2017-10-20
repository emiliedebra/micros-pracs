@GWNJAM001 GWNJAM001

        .syntax unified
        .thumb
        .cpu cortex-m0
        .global _start

        .word 0x20002000
        .word _start + 1

_start:       
       @ initialise the first 4 registers to point to the first 4 words of RAM
        LDR R0, RAM_START       @ points to start of RAM
        ADDS R1, R0, #4         @ points to next word in RAM
        ADDS R2, R1, #4
        ADDS R3, R2, #4

        @ for each word to copy, load the word into R4 and copy it to the address held in the corresponding CPU register
        LDR R4, A 
        STR R4, [R0]            @ store at start of RAM
        LDR R4, B       
        STR R4, [R1]            @ store at next word
        LDR R4, C
        STR R4, [R2]
        LDR R4, D
        STR R4, [R3]
_copy_to_RAM_complete:
        ADDS R4, R3, #4         @ point R4 to the first destination register, 16
        LDR R5, [R0]            @ R5 = A
        LDR R6, [R1]            @ R6 = B
        SUBS R5, R5, R6         @ R5 = R5 - R6 = A - B
        STR R5, [R4]            @ address 16 = R7

        ADDS R4, R4, #4         @ point R4 to the next destination register, 20
        LDR R5, [R0]            @ R5 = A, R6 still contains B from before
        ADDS R5, R5, R6         @ R5 = R5 + R6 = A + B
        LDR R6, [R2]            @ R6 = C
        ADDS R5, R5, R6         @ R5 = R5 + R6 = (A + B) + C
        STR R5, [R4]            @ address 20 = A + B + C

        ADDS R4, R4, #4         @ point R4 to the next destination register, 24
        LDR R5, [R1]            @ R5 = B, R6 still contains C
        EORS R5, R5, R6         @ R5 = R5 EOR R6 = B EOR C
        STR R5, [R4]            @ address 24 = B EOR C

        ADDS R4, R4, #4         @ point R4 to the next destination register, 28
        LDR R5, [R1]            @ R5 = B, R6 still contains C
        MULS R5, R5, R6         @ R5 = R5 * R6 = B * C
        STR R5, [R4]

infinite_loop: NOP
        B infinite_loop

        .align
RAM_START: .word 0x20000000
A:      .word 0xAABBCCDD
B:      .word 0x00001122
C:      .word 0x00002233
D:      .word 0x55555555

