#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	source proc_name = "secs/equations/main.secs";
	archive_grid source_file = syscall(unix_open, proc_name, archive_read);
	quadrant source_file_distance = syscall(unix_lseek, source_file, 0, seek_completion);
	source em = syscall(unix_mmap, non, source_file_distance, map_rws, clerk_descreet, source_file, non);
	printf("em | %lu\n", em);
	syscall(unix_close, source_file);

	proc_name = "secs/equations/equations.secs";
	source_file = syscall(unix_open, proc_name, archive_read);
	source_file_distance = syscall(unix_lseek, source_file, 0, seek_completion);
	source es = syscall(unix_mmap, non, source_file_distance, map_rws, clerk_descreet, source_file, non);
	printf("es | %lu\n", es);
	syscall(unix_close, source_file);

	proc_name = "secs/views/views.secs";
	source_file = syscall(unix_open, proc_name, archive_read);
	source_file_distance = syscall(unix_lseek, source_file, 0, seek_completion);
	source vs = syscall(unix_mmap, non, source_file_distance, map_rws, clerk_descreet, source_file, non);
	printf("vs | %lu\n", vs);
	see_space("vs", vs, 0x506);
	syscall(unix_close, source_file);
	/*
	*/

	asm("nopl   (%rax)");
	asm("nopw   %cs:0x0(%rax,%rax,1)");
	asm("push %rbp");
	/*
	asm("mov %rsp, %rbp");
	*/
	asm("sub $0x1000, %rsp");
	register quadrant_reference rsp asm("rbp");
	quadrant_reference rack = rsp;
	asm("nop");
	rack[0x200] = em;
	asm("nop");
	rack[0x199] = es;
	asm("nop");
	/*
	rack[2] = vs;
	asm("nop");
	*/
	asm("mov 0x1000(%rbp), %r9");
	//asm("mov 0x998(%r8), %r10");
	//asm("mov 0x10(%r8), %r11");
	//asm("mov 0x10(%rsp), %r12");
	asm("lea 0x3(%rip), %r13");
	asm("jmpq *%r9");
	asm("add $0x1000, %rsp");
	asm("pop %rbp");
	asm("test %rax, %rax");
	/*
	*/
	return 0;
}
