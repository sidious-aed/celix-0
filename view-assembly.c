#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | secs-name\n");
    printf("2 | shell-name\n");
    return;
  }
	quadrant secs_name_distance = get_naof_secs(params[1]);
	quadrant naof_shell_name_secs = get_naof_secs(params[2]);
	sec c_shell_name[10000];
	quadrant c_shell_name_site = 0;
	add_to_entree(params[2], naof_shell_name_secs, c_shell_name, &c_shell_name_site);
	add_to_entree(".c", 2, c_shell_name, &c_shell_name_site);
	syscall(unix_write, 1, c_shell_name, c_shell_name_site);
	syscall(unix_write, 1, "\n", 1);
	source shell_shell_name = "view-asm.c";
  archive_grid shell_shell_file = syscall(unix_open, shell_shell_name, archive_read);
  quadrant naof_shell_map_secs = syscall(unix_lseek, shell_shell_file, 0, seek_completion);
  source shell_map = syscall(unix_mmap, non, naof_shell_map_secs, map_rws, clerk_descreet, shell_shell_file, non);
	printf("shell-map | %lu\n", shell_map);
	syscall(unix_close, shell_shell_file);

  archive_grid secs_file = syscall(unix_open, params[1], archive_read);
  quadrant secs_map_distance = (syscall(unix_lseek, secs_file, 0, seek_completion));
	syscall(unix_close, secs_file);
  source new_shell_map = syscall(unix_mmap, non, (naof_shell_map_secs + (secs_map_distance * 0xd)), map_rws, map_cloe, non, non);
	printf("new-shell-map | %lu\n", new_shell_map);

	quadrant nop_site = (seek_space("\tasm(\"nop\");\n", 0xd, shell_map, naof_shell_map_secs) + 0xd);
	quadrant new_shell_map_site = 0;
	printf("nop-site | %lu\n", nop_site);
	add_to_entree(shell_map, nop_site, new_shell_map, &new_shell_map_site);
	quadrant site = 0;
	while(true) {
		if(site == secs_map_distance) {
			break;
		}
		add_to_entree("\tasm(\"nop\");\n", 0xd, new_shell_map, &new_shell_map_site);
		site += 1;
	}
	add_to_entree((shell_map + nop_site), (naof_shell_map_secs - nop_site), new_shell_map, &new_shell_map_site);
	syscall(unix_unlink, c_shell_name);
	archive_grid new_shell_file = syscall(unix_open, c_shell_name, archive_write|archive_create, archive_jypsy);
	syscall(unix_write, new_shell_file, new_shell_map, new_shell_map_site);
	syscall(unix_close, new_shell_file);
	sec comand[1000];
	quadrant comand_site = 0;
	add_to_entree("gcc ", 4, comand, &comand_site);
	add_to_entree(c_shell_name, c_shell_name_site, comand, &comand_site);
	add_to_entree(" -o ", 4, comand, &comand_site);
	add_to_entree(params[2], naof_shell_name_secs, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	syscall(unix_write, 1, "\n", 1);
	system(comand);
	comand_site = 0;
	add_to_entree("place ", 0x6, comand, &comand_site);
	add_to_entree(params[1], secs_name_distance, comand, &comand_site);
	add_to_entree(" ", 0x1, comand, &comand_site);
	add_to_entree(params[2], naof_shell_name_secs, comand, &comand_site);
	add_to_entree(" 607", 4, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	syscall(unix_write, 1, "\n", 1);
	system(comand);
	syscall(unix_unlink, c_shell_name);
  return 0;
}
