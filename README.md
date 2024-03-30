# AVR C Baremetal Example 

This project demonstrates how to use C on baremetal AVR, emulated via QEMU. This example is very short, for a quick start.

# Overview

+	`cstart.c`: The C code to be executed.
+	`start.s`: Short loader assembly code, which initializes the CPU, and then invokes `cstart()` from `cstart.c`.
+	`link.ld`: Linker script, linking everything together, as well as defining the RAM and the entry point.
+	`Makefile`: The Makefile that compiles and links everything.

Firstly, the CPU needs to be initialized (most notably the stack pointer). This is done using assembly (`start.s`). After that, C can be called.

Lastly, if the C code returns, it is important that execution ends in a loop which does nothing.

`Link.ld` Contains the linker script needed to load `_start` from `start.s` at the correct address (the beginning of RAM space), so that it actually executes. It also contains a pointer to the end of RAM space, which is where the stack pointer is initialized to.

**Note:** RAM Space may differ system to system. You may need to modify its definition in `link.ld` with data obtained from your board's datasheet. Since Arduino's aren't defined via Device Trees, we can't use QEMU's `dumpdtb` (like we could with my other examples).

Makefile just build everything.

# Usage

Firstly, install everything necessary, most notably `qemu-system-avr` and an AVR cross compiler.

Then, you can compile everything by running `make`, which will produce `avr.bin`.

Lastly, run the example by invoking `qemu-system-avr -M uno -bios avr.bin`. If everything is working correctly, the registers `r24` and `r25` should contain 0x489. You can check by running `info registers` in the QEMU monitor console, or by adding `-d cpu` to the QEMU invocation command.