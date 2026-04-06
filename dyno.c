#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	sec base[100];
	asm("sub $0x1000, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference rack = rsp;
	((source)rack)[0] = 0xed;
	((source)rack)[1] = 0xa;
	asm("movzbl 0x0(%rsp), %eax");
	asm("movzbl %al, %eax");
	asm("mov %rax, 0x10(%rsp)");
	asm("mov 0x10(%rsp), %rax");
	/*
	*/
	asm("xor %rax, %rax");
	asm("mov 0x0(%rsp), %rax");
	register quadrant rax asm("rax");
	quadrant number = rax;
	quadrant naof_secs = number_to_entree(number, base, 16);
	syscall(unix_write, 1, base, naof_secs);
	syscall(unix_write, 1, "\n", 1);
	asm("add $0x1000, %rsp");
	return 0;
}
