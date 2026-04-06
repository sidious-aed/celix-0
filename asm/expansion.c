#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	getc(stdin);
	asm("mov %rsp, %r10");
	asm("sub $0x1000000, %r10");
	getc(stdin);
	asm("add $0x1000000, %r10");
	/*
	*/

	/*
	asm("push %rbp");
	asm("mov %rsp, %rbp");
	asm("sub $0x100000, %rbp");
	getc(stdin);
	asm("add $0x100000, %rbp");
	asm("pop %rbp");
	*/

	/*
	asm("sub $0x100000, %rsp");
	getc(stdin);
	asm("add $0x100000, %rsp");
	*/
	return 0;
}
