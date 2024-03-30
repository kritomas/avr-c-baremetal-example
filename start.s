.section .text
.global _start
_start:
	ldi r16, hi8(RAMEND) ; Load the high 8 bits of RAM end address into r16
	out 0x3E, r16 ; Load r16 into the high 8 bits of the stack pointer (0x3E = sph)
	ldi r16, lo8(RAMEND) ; Set the stack pointer to the top
	out 0x3D, r16 ; Load r16 into the low 8 bits of the stack pointer (0x3D = spl)
	rcall cstart ; Call cstart() from cstart.c
	rjmp loop

loop:
	rjmp loop ; Infinite loop that does nothing
