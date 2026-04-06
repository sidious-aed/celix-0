#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	archive_grid pf;
	quad naof_procf_secs;
	//asm("push %rbp");
	//asm("mov %rsp, %rbp");
	asm("sub $0x3d0900, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	stack[0] = map;
	asm("add $0x607, %r8");
	asm("callq *%r8");
	asm("add $0x3d0900, %rsp");
	//asm("pop %rbp");
	return 0;
}
