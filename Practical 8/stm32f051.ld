ENTRY(_start)

MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 0x08000 /* 32KiB*/
  RAM (xrw)       : ORIGIN = 0x20000000, LENGTH = 0x02000 /* 8KiB */
}
 
SECTIONS
{
    /* Ensure vectors don't get garbage collected. Place first in flash */
    .vectors : { 
        KEEP(*(.vectors))  
    } >FLASH
    /* Code follows vectors */
    .text : { 
        *(.text) ; 
        __text_end__ = . ; 
    } >FLASH
    /* VMA of data to start of RAM, LMA to flash so that the values persist */
    .data : { 
        . = ALIGN(4);
        __data_start__ = . ;
        *(.data) ; 
        . = ALIGN(4);
        __data_end__ = . ;
    } >RAM AT>FLASH
    /* Reserve space for the zero initialised variables, but don't load into memory */
    .bss (NOLOAD) : { 
        . = ALIGN(4);
        __bss_start__ = .; 
        *(.bss)
        *(COMMON)
        . = ALIGN(4);
        __bss_end__ = .;
    } >RAM
}
