#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("callq *%r8");
	asm("callq *%r9");
	asm("callq *%r10");
	asm("callq *%r11");
	asm("callq *%r12");
	asm("callq *%r13");
	asm("callq *%r14");
	asm("callq *%r15");
	asm("callq *%rax");
	asm("callq *%rbx");
	asm("callq *%rcx");
	asm("callq *%rdx");
	asm("callq *%rdi");
	asm("callq *%rsi");
	asm("callq *%rsp");
	asm("callq *%rbp");
	return 0;
}
