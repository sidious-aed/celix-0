#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("sub $0x1000, %rsp");
	asm("mov $0xaedaed, %r8");
	asm("mov %r8, 0x0(%rsp)");
	asm("mov $0xaed, %r9");
	asm("mov %r9, 0x8(%rsp)");
	//asm("mov 0x0(%rsp), %rax");
	asm("mov 0x8(%rsp), %rax");
	asm("mov $0xaedaed, %rax");
	asm("mov $0xaed, %r8");
	asm("xor %rdx, %rdx");
	asm("divq %r8");
	asm("add $0x1000, %rsp");
	/*
	quad x = 0xaedaed;
	quad y = 0xaed;
	quad z = x / y;
	*/
	return 0;
}
