ENTRY(Reset_Handler)
MEMORY {
    flash(rx) : ORIGIN = 0x08000000, LENGTH = 1024k
    sram(rwx) : ORIGIN = 0x20000000, LENGTH = 128k
}

_stack_top = ORIGIN(sram) + LENGTH(sram);
SECTIONS {
    .vector_table : {
        KEEP(*(.vector_table))
    } > flash
    .text : {
        *(.text*)
        *(.rodata*)
    } > flash
    .data : {
        . = ALIGN(4);
        _sdata = .;
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } > sram AT > flash

    _s_initial_data = LOADADDR(.data); /* save the load address of data section in flash */

    .bss (NOLOAD) : {
        . = ALIGN(4);
        _sbss = .;
        *(.bss*)
        . = ALIGN(4);
        _ebss = .;
    } > sram

    _end = .;

    
}