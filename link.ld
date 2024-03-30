OUTPUT_ARCH(avr)
MEMORY {
	RAM (rwx) : ORIGIN = 0x0, LENGTH = 2K /*Define RAM (length and origin obtained datasheet)*/
}
ENTRY(_start)

RAMEND = ORIGIN(RAM) + LENGTH(RAM); /*Set RAMEND to the end of RAM*/

SECTIONS
{
    . = 0x0; /*Force load to address 0x0*/
    .text : { start.o (.text) } /*Load section .vector_table at the address specified above, followed immediately by section .text*/
    . = ALIGN(8); /*8 byte alignment*/
}