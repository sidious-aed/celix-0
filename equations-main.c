#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	archive_grid pf;
	quad naof_procf_secs;
	source proc_name0 = "secs/equations/main.msh";
	pf = syscall(unix_open, proc_name0, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map0 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map0);
	syscall(unix_close, pf);

	source proc_name1 = "secs/equations/equations.msh";
	pf = syscall(unix_open, proc_name1, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map1 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map1);
	syscall(unix_close, pf);

	source proc_name2 = "secs/views/views.msh";
	pf = syscall(unix_open, proc_name2, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map2 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map2);
	syscall(unix_close, pf);

	source proc_name3 = "secs/vecters/vecters.msh";
	pf = syscall(unix_open, proc_name3, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map3 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map3);
	syscall(unix_close, pf);

	//asm("push %rbp");
	//asm("mov %rsp, %rbp");
	ip_file randf = syscall(unix_read, "/dev/random", archive_read);
	asm("sub $0x4c4b40, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	syscall(unix_read, randf, stack, 0x4c4b40);
	sseed(stack, 0x4c4b40);
	stack[0] = map0 + 0x607;
	stack[1] = map1 + 0x607;
	stack[2] = map2 + 0x607;
	stack[3] = map3 + 0x607;
	asm("mov 0x0(%rsp), %r8");
	asm("callq *%r8");
	asm("add $0x4c4b40, %rsp");
	//asm("pop %rbp");
	syscall(unix_close, randf);
	return 0;
}
