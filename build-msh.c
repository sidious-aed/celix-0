#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | proc-name\n");
    return;
  }
	source proc_name = params[1];
	quad naof_proc_name_secs = get_naof_secs(proc_name);
	sec secs_name[1000];
	quad secs_name_site = 0;
	add_to_entree(proc_name, (naof_proc_name_secs - 3), secs_name, &secs_name_site);
	add_to_entree("secs", 4, secs_name, &secs_name_site);
	wide_com("secs", secs_name, 4);
	printf("secs-name | %s\n", secs_name);
	sec msh_name[1000];
	quad msh_name_site = 0;
	add_to_entree(secs_name, (secs_name_site - 4), msh_name, &msh_name_site);
	add_to_entree("c", 1, msh_name, &msh_name_site);
	printf("msh-name | %s\n", msh_name);
	sec comand[10000];
	quad comand_site = 0;
	add_to_entree("./sequences ", 12, comand, &comand_site);
	add_to_entree(proc_name, naof_proc_name_secs, comand, &comand_site);
	add_to_entree(" ", 1, comand, &comand_site);
	add_to_entree(secs_name, secs_name_site, comand, &comand_site);
	add_to_entree(" 0", 2, comand, &comand_site);
	system(comand);
	printf("comand | %s\n", comand);
	ip_file secsf = syscall(unix_open, secs_name, archive_read);
	quad naof_secs_secs = syscall(unix_lseek, secsf, 0, seek_completion);
	printf("naof-secs-secs | %lu\n", naof_secs_secs);
	comand_site = 0;
	add_to_entree("./build-mshell ", 15, comand, &comand_site);
	add_to_entree(msh_name, msh_name_site, comand, &comand_site);
	add_to_entree(" ", 1, comand, &comand_site);
	comand_site += number_to_entree(naof_secs_secs, (comand + comand_site), 16);
	printf("comand | %s\n", comand);
	system(comand);
	sec mshb_name[1000];
	quad mshb_name_site = 0;
	add_to_entree(msh_name, (msh_name_site - 1), mshb_name, &mshb_name_site);
	add_to_entree("msh", 3, mshb_name, &mshb_name_site);
	syscall(unix_unlink, mshb_name);
	comand_site = 0;
	add_to_entree("gcc ", 4, comand, &comand_site);
	add_to_entree(msh_name, msh_name_site, comand, &comand_site);
	add_to_entree(" -o ", 4, comand, &comand_site);
	add_to_entree(mshb_name, (mshb_name_site), comand, &comand_site);
	printf("comand | %s\n", comand);
	system(comand);
	comand_site = 0;
	add_to_entree("place ", 6, comand, &comand_site);
	add_to_entree(secs_name, secs_name_site, comand, &comand_site);
	add_to_entree(" ", 1, comand, &comand_site);
	add_to_entree(mshb_name, (mshb_name_site), comand, &comand_site);
	add_to_entree(" 607", 4, comand, &comand_site);
	printf("comand | %s\n", comand);
	system(comand);
  return 0;
}
