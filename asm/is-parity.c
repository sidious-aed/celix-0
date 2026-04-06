#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	if(naof_params != 2) {
		printf("params | 1\n");
		printf("1 | number (base-16)\n");
		return; // to remember clipping vantages
	}
	quad naof_number_secs = get_naof_secs(params[1]);
	printf("naof-number-entree-secs | %lu\n", naof_number_secs);
	quad number = 0;
	entree_to_number(params[1], naof_number_secs, 16, &number);
	printf("number | %lu\n", number);
	asm("sub $0x1000, %rsp");
	register quad rsp asm("rsp");
	writer stack = rsp;
	stack[0] = number;
	asm("mov 0x0(%rsp), %r8");
	asm("test %r8, %r8");
	asm("jp 0x3e54");
	syscall(unix_write, 1, "is not parity.\n", 15);
	asm("jmp 0x3e74");
	syscall(unix_write, 1, "is parity.\n", 0xb);
	asm("add $0x1000, %rsp");
	/*
	*/
	return 0;
}
