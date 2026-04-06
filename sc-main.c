#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("lea -0x46af(%rip), %r8");
	asm("add $0x205fc8, %r8");
	asm("mov 0x0(%r8), %r8");
	register quad r8 asm("r8");
	quad libc_at_syscall = r8;
	quad strstr = (libc_at_syscall - 0x11b520) + 0xbaa70;
	printf("strstr | %lu\n", strstr);
	//getc(stdin);

	archive_grid pf;
	quad naof_procf_secs;
	source proc_name0 = "secs/sc/main.msh";
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

	source proc_name3 = "secs/cf/cf.msh";
	pf = syscall(unix_open, proc_name3, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map3 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map3);
	syscall(unix_close, pf);

	source proc_name4 = "secs/sc/sc.msh";
	pf = syscall(unix_open, proc_name4, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map4 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map4);
	syscall(unix_close, pf);

	ip_file randf = syscall(unix_open, "/dev/random", archive_read);
	asm("sub $0x4c4b40, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	syscall(unix_read, randf, ((source)stack), 0x4c4b40);
	//see_space("stack", stack, 0x200);
	//see_space("stack", (stack + 0x98968 - 0x200), 0x200);
	sseed(stack, 0x4c4b40);
	//see_space("stack", stack, 0x200);
	//see_space("stack", (stack + 0x98968 - 0x200), 0x200);
	stack[0] = map0 + 0x607;
	stack[1] = map1 + 0x607;
	stack[2] = map2 + 0x607;
	stack[3] = map3 + 0x607;
	stack[4] = map4 + 0x607;
	stack[5] = strstr;
	asm("mov 0x0(%rsp), %r8");
	asm("callq *%r8");
	//asm("lea 0x3(%rip), %r9");
	//asm("jmpq *%r8");
	asm("add $0x4c4b40, %rsp");
	syscall(unix_close, randf);
	return 0;
}
