#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("mov $0xaed, %r8");
	asm("mov $0xaee, %r9");
	asm("cmp %r8, %r9");
	asm("jne 0x671");
	asm("ja 0x69c");
	syscall(unix_write, 1, "is not above.\n", 14);
	asm("jmp 0x6bc");
	syscall(unix_write, 1, "is above.\n", 10);
	return 0;
}
