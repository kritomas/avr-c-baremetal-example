CROSS_COMPILER=avr-

all : start.s
	$(CROSS_COMPILER)as start.s -c -o start.o # Assemble assembly loader
	$(CROSS_COMPILER)gcc cstart.c -nostdlib -ffreestanding -c -o cstart.o # Compile C without linking
	$(CROSS_COMPILER)ld -T link.ld start.o cstart.o --no-dynamic-linker -static -nostdlib -s -o avr.elf # Linking everything, producing an ELF
	$(CROSS_COMPILER)objcopy -O binary avr.elf avr.bin # Converting the ELF into a raw binary