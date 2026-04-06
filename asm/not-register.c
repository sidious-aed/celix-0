#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("mov $0xaed, %r8");
	asm("neg %r8");
	register quad r8 asm("r8");
	quad number = r8;
	printf("number | %lu\n", number);
	asm("not %r8");
	asm("not %r9");
	asm("not %r10");
	asm("not %r11");
	asm("not %r12");
	asm("not %r13");
	asm("not %r14");
	asm("not %r15");
	asm("not %rax");
	asm("not %rbx");
	asm("not %rcx");
	asm("not %rdx");
	asm("not %rdi");
	asm("not %rsi");
	asm("not %rsp");
	asm("not %rbp");
	return 0;
}
