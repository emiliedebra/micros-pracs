 ENTRY (_start)
 
 MEMORY
 {
 FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 0x08000
 RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 0x02000
 }
 
 SECTIONS
 {
 .isr_vectors : { KEEP(*(.isr_vectors))} > FLASH
 .text : {*(.text)} > FLASH
 }