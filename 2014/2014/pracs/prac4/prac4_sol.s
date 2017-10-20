@GWNJAM001

@ The only labels which are critical in this prac are 'copy_to_RAM_complete' and 'increment_of_bytes_complete'
@ The rest you are free to modify and adjust as you see fit for your algorithm. 

    .syntax unified
    .global _start


vectors: 
    .word 0x20002000
    .word _start + 1      @ specify that the instruction at _start is a Thumb instruction.

_start:
    @ Initialising pins connected to LEDs outputs and pins connected to buttons to have pullups. 
    @ enable clock for GPIOA and GPIOB
    LDR R0, RCC_BASE
    LDR R1, [R0, #0x14]                 @ get current value in RCC_AHBENR
    LDR R2, AHBENR_IOPABEN               @ mask GPIOA and GPIOB bits in
    ORRS R1, R1, R2                     
    STR R1, [R0, #0x14]                 @ write back

    @set PB0 - PB7 to outputs
    LDR R0, GPIOB_BASE
    LDR R1, [R0]                        @ get current value in GPIOB_MODER
    LDR R2, MODER_OUTPUTS               @ pattern of bits to rasie indicating pins 0 to 7 outputs
    ORRS R1, R1, R2                     @ selectively raise the specific bits
    STR R1, [R0]                        @ write to GPIOB_MODER

    @ enable pull-ups for GPIOA
    LDR R0, GPIOA_BASE
    LDR R1, [R0, #0x0C]                 @ GPIOA_PUPDR
    LDR R2, LOWER_BYTE_ZERO             @ mask out LSB to set it to 0
    ANDS R1, R1, R2
    MOVS R2, #0x55                      @ mask in pull-ups for first 4 pins
    ORRS R1, R1, R2
    STR R1, [R0, #0x0C]                 @ store to GPIOA_PUPDR

copy_to_RAM:
    @ Copy the array specified below from flash into the start of RAM.
    @ The advised way to do it is to maintain 3 pointers: destination, source and end.
    @ Also, maintain a counter keeping track of how many bytes are moved - you'll need to know how big the array in RAM is later on.

    MOVS R0, #0  @ counter for number of elements in the array
    LDR R1, =start_of_data      @ source pointer
    LDR R2, =end_of_data        @ end pointer
    LDR R3, RAM_START         @ destination pointer
copy_loop:
    LDR R4, [R1]                @ copy from source....
    STR R4, [R3, R0]            @ ... to destination plus offset
    ADDS R0, #4                 @ increment element number counter
    ADDS R1, #4                 @ point source pointer to next word
    CMP R1, R2                  @ is the source pointer pointing to the same as the end pointer?
    BNE copy_loop               @ if not, keep copying.
        
copy_to_RAM_complete:                   @ Critical! Once the program hits this label, the automarker will modify the contents of RAM.
    @ iterate through each individual *byte* in the array, add one to it and write it back. 

    LDR R1, RAM_START         @ pointer to start of data in RAM
    MOVS R2, #0                  @ counter for number of bytes incremnted. We can use this to supply an offset.
increment_loop:
    LDRB R3, [R1, R2]           @ load the value equal to (start of RAM) + (position in array)
    ADDS R3, #1                 @ incremented the value we've just loaded
    STRB R3, [R1, R2]           @ write back
    ADDS R2, #1                 @ offset to point to next byte
    CMP R2, R0                  @ is the number of bytes itterated through equal to the total number we need to iterate through?
    BNE increment_loop          @ if not, keep incrementing!

increment_of_bytes_complete:            @ Critical! Here, the automarker will verify that each byte has been incremented.
    @ The suggestion is to now iterate through the array in RAM and find the data specified in
    @ parts 3, 4 and 5. You can then store the data somewhere for use later in the program.
    
    MOVS R2, #0                          @ counter for number of bytes iterated throguh. We can use this to supply an offset.
    @ initialise R5, R6, R7 to all hold the first value in the array
    LDRB R5, [R1]                       @ will be used for unsigned max
    LDRB R6, [R1]                       @ will be used for unsigned min
    LDRSB R7, [R1, R2]                  @ will be used for SIGNED max. Necessary to sign extend loads here. Register offset required.

min_max_finder_loop:
    LDRB R3, [R1, R2]                   @ load the value equal to (start of array) + (position in array)
    CMP R5, R3                          @ compare existing unsigned max to new value
    BHI no_new_max                      @ if existing value is higher than new value, skip next instruction
    MOV R5, R3                          @ else: update unsigned max with new value
no_new_max:
    CMP R6, R3                          @ compare existing unsigned min to new value
    BLO no_new_min                      @ if existing is lower than new, skip next instruction
    MOV R6, R3                          @ else, update unsigned min with new value
no_new_min:
    LDRSB R3, [R1, R2]                  @ re-load new value signed extending
    CMP R7, R3                          @ comapre existing signed max to new value
    BGT no_new_signed_max               @ skip next if existing is greater than current
    @ else, we have a new signed max. Load without sign extending and save
    LDRB R3, [R1, R2]
    MOV R7, R3                                                   
no_new_signed_max:
    ADDS R2, #1
    CMP R2, R0                          @ is the number of bytes itterated through equal to the total number we need to iterate through?
    BNE min_max_finder_loop             @ if not, keep looping

    LDR R0, GPIOA_BASE
    LDR R1, GPIOB_BASE

display_conditional_on_pushbuttons:
    @ The suggestion is here to display one of the bytes which you found earlier on the LEDs
    @ The specific one which is displayed should be dependant on which button is pressed.

    @ we will do this by setting R4 to hold a value selected by the buttons, and then display R4 at the end.
    
@ ==== Part 3: Default R4 to unsigned max (R5) ====
    MOVS R4, R5

@ ==== Part 4: Set R4 to unsigned min (R6) if SW0 pressed ====
    LDR R2, [R0, #0x10]                 @ GPIOA_IDR
    MOVS R3, #0b1                       @ mask out all bits except bit 0
    ANDS R3, R3, R2
    CMP R3, #0
    BNE sw1_check                       @ if the bit is SET, the button is not pressed: Do next check.
    MOVS R4, R6                         @ else, set R4 to unsigned max
    B display_R4                        @ and go to display

@ === Part 5: Set R4 to hold signed max (R7) if SW1 pressed ====
sw1_check:
    MOVS R3, #0b10                      @ mask out all bits except bit 1
    ANDS R3, R3, R2                     
    CMP R3, #0
    BNE display_R4                       @ if the bit is SET, the button is not pressed: display default.
    @ else, set R4 and go to display
    MOVS R4, R7
    B display_R4

display_R4:
    LDR R2, [R1, #0x14]                 @ GPIOB_ODR
    MOVS R3, #0x00                      @ mask out LSB
    ANDS R2, R2, R3
    ORRS R2, R2, R4                     @ mask in signed maximum value
    STR R2, [R1, #0x14]                 @ write back

    @ infinite loop just re-checking the buttons to see if the displayed data should change. 
    B display_conditional_on_pushbuttons


        .align  @ all data accesses on the Cortex-M0 must be aligned data accesses. 
RAM_START: .word 0x20000000
RAM_END: .word 0x20002000
RCC_BASE: .word 0x40021000
AHBENR_IOPABEN: .word 0x00060000
GPIOB_BASE: .word 0x48000400
GPIOA_BASE: .word 0x48000000
MODER_OUTPUTS: .word 0b0101010101010101
LOWER_BYTE_ZEROS: .word 0xFFFFFF00
start_of_data:
        .word 0x22f65244
        .word 0x4e66eca3
        .word 0x25c1c308
        .word 0xe278d1ca
        .word 0x10e865fe
        .word 0x839b17fb
        .word 0xde6ac773
        .word 0x49a0392b
        .word 0x442b580
        .word 0xae6e269d
        .word 0xcb220366
        .word 0x603debbe
        .word 0xfd88b1bf
        .word 0x49c5652f
        .word 0x25476c5a
        .word 0xa5c40771
        .word 0xb04d908d
        .word 0x831c1806
        .word 0x5b4f75d4
        .word 0x6b016b93
        .word 0x90dcb11a
        .word 0xefb6e394
        .word 0x44db27da
        .word 0xcf205f79
        .word 0xb1192a24
        .word 0x79cf44e2
        .word 0x371ce3ba
        .word 0x7a279ff5
        .word 0x6047dc
        .word 0xfa165142
        .word 0x12690fdc
        .word 0x5aad829e
        .word 0x19244ba0
        .word 0xb5174a3
        .word 0xbd7172c8
        .word 0x1d3b229f
        .word 0xada0357e
        .word 0x1d44e4e6
        .word 0x37caa86e
        .word 0x6a08fc5d
        .word 0x465faee1
        .word 0x2e52e372
        .word 0xd6016409
        .word 0x52012177
        .word 0x848249e0
        .word 0xcee8ec8d
        .word 0xca09fbe7
        .word 0x45ec4e32
        .word 0xa11ccfb5
        .word 0x95584228
end_of_data:    @ we label the NEXT address as the end pointer. This is data we do not want to copy. 
                @ Hence, the conditional loop should run while the source poiter is not pointing to end_of_data.
