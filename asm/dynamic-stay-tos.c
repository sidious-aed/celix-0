#include "/home/tyrel/celix/standard.h"

quad main(quad naof_params, source_vecter params) {
	asm("jmpq *%r8");
	asm("jmpq *%r9");
	asm("jmpq *%r10");
	asm("jmpq *%r11");
	asm("jmpq *%r12");
	asm("jmpq *%r13");
	asm("jmpq *%r14");
	asm("jmpq *%r15");
	asm("jmpq *%rax");
	asm("jmpq *%rbx");
	asm("jmpq *%rcx");
	asm("jmpq *%rdx");
	asm("jmpq *%rdi");
	asm("jmpq *%rsi");
	asm("jmpq *%rsp");
	asm("jmpq *%rbp");
	return 0;
}
