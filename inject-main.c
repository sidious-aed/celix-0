#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | binary-name\n");
		printf("2 | bin-site (base-16)\n");
    printf("2 | secs-name\n");
    return;
  }
	source binary_name = params[1];
	quad naof_binary_name_secs = get_naof_secs(binary_name);
	source bin_site = 0;
	entree_to_number(params[2], get_naof_secs(params[2]), 16, &bin_site);
	source secs_name = params[1];
	quad naof_secs_name_secs = get_naof_secs(binary_name);

	asm("lea -0x4684(%rip), %r8");
	asm("add $0x205fc8, %r8");
	asm("mov 0x0(%r8), %r8");
	register quad r8 asm("r8");
	quad libc_at_syscall = r8;
	//quad strstr = (libc_at_syscall - 0x11b520) + 0x9e900;
	quad strstr = (libc_at_syscall - 0x11b520) + 0xbaa70;
	printf("strstr | %lu\n", strstr);
	//getc(stdin);

	archive_grid pf;
	quad naof_procf_secs;
	source proc_name0 = "secs/bin/main.msh";
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

	source proc_name5 = "secs/bin/bin.msh";
	pf = syscall(unix_open, proc_name5, archive_read);
	naof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);
	source map5 = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);
	printf("map | %lu\n", map5);
	syscall(unix_close, pf);

	asm("sub $0x4c4b40, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	stack[0] = map0 + 0x607;
	asm("mov 0x0(%rsp), %r8");
	stack[1] = map1 + 0x607;
	stack[2] = map2 + 0x607;
	stack[3] = map3 + 0x607;
	stack[4] = map4 + 0x607;
	stack[5] = map5 + 0x607;
	stack[6] = strstr;
	stack[7] = binary_name;
	stack[8] = naof_binary_name_secs;
	stack[9] = bin_site;
	stack[10] = secs_name;
	stack[11] = naof_secs_name_secs;
	asm("callq *%r8");
	asm("add $0x4c4b40, %rsp");
	return 0;
}
