#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | binary-name\n");
		//printf("2 | com-node\n");
    return;
  }
	source binary_name = params[1];
	quad naof_binary_name_secs = get_naof_secs(binary_name);
	/*
	source com_nodep = params[2];
	quad com_name_site = get_naof_secs(com_nodep);
	*/
	sec com_name[1000];
	quad com_name_site = 0;
	add_to_entree(binary_name, naof_binary_name_secs, com_name, &com_name_site);
	add_to_entree(".bc", 3, com_name, &com_name_site);
	printf("com-name | %s\n", com_name);
	printf("com-name-site | %lu\n", com_name_site);
	archive_grid pf;
	sec nonce[100];
	quad nonce_site = 0;
	add_seed62_to_entree(7, nonce, &nonce_site);
	add_to_entree(".objd", 5, nonce, &nonce_site);
	sec comand[1000];
	quad comand_site = 0;
	add_to_entree("objdump -d ", 11, comand, &comand_site);
	add_to_entree(binary_name, naof_binary_name_secs, comand, &comand_site);
	add_to_entree(" > ", 3, comand, &comand_site);
	add_to_entree(nonce, nonce_site, comand, &comand_site);
	printf("comand | %s\n", comand);
	//return 0;
	system(comand);

	quad naof_procf_secs;
	source proc_name0 = "secs/procs/aux-chart-binary.msh";
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

	//asm("push %rbp");
	//asm("mov %rsp, %rbp");
	asm("sub $0x4c4b40, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference stack = rsp;
	stack[0] = map0 + 0x607;
	stack[1] = map1 + 0x607;
	stack[2] = map2 + 0x607;
	stack[3] = map3 + 0x607;
	stack[4] = binary_name;
	stack[5] = naof_binary_name_secs;
	stack[6] = nonce;
	stack[7] = com_name;
	stack[8] = com_name_site;
	asm("mov 0x0(%rsp), %r8");
	asm("callq *%r8");
	asm("add $0x4c4b40, %rsp");
	//asm("pop %rbp");
	syscall(unix_unlink, nonce);
	return 0;
}
