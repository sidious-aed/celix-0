#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	source proc_name = "equations-main.proc";
	archive_grid procf = syscall(unix_open, proc_name, archive_read);
	quadrant naof_procf_secs = syscall(unix_lseek, procf, 0, seek_completion);
	source map = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, procf, non);
	printf("map | %lu\n", map);
	syscall(unix_close, procf);

	//asm("push %rbp");
	//asm("mov %rsp, %rbp");
	asm("sub $0x1000, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	stack[0] = (map + 0);
	stack[1] = (map + 264);
	asm("mov 0x0(%rsp), %r8");
	asm("mov 0x8(%rsp), %r9");
	asm("lea 0x3(%rip), %rsi");
	asm("jmpq *%r8");
	asm("add $0x1000, %rsp");
	//asm("pop %rbp");
	return 0;
}
