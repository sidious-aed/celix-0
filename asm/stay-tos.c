#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("jmpq *%rax");
	asm("jmp 0x123");
	asm("je 0x123");
	asm("jne 0x123");
	asm("ja 0x123");
	asm("jae 0x123");
	asm("jb 0x123");
	asm("jbe 0x123");
	asm("jg 0x123");
	asm("jge 0x123");
	asm("jl 0x123");
	asm("jle 0x123");
	asm("js 0x123");
	asm("jo 0x123");
	asm("js 0x123");
	return 0;
}
