#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | mshell-name\n");
    printf("2 | naof-secs (base-16)\n");
    return;
  }
	// cs | clerk-space synonomous with cp | (clerk-pages|clerk-parchment) <--> * (es) always mean-(t)
	sec cs[10000];
	quad cs_site = 0;
	quadrant naof_proc_names_secs = get_naof_secs(params[1]);
	quadrant naof_shell_name_secs = get_naof_secs(params[1]);
	if(compair_spaces((params[1] + naof_shell_name_secs - 2), 2, ".c", 2) == false) {
		cs_site = 0;
		// <--> interesting that 0x53 is 83.
		add_to_entree("<--> esoteric-wide-standards is a c extension for shell-name please suffix with .c\n", 0x53, cs, &cs_site);
																																																	// <--> in short russian
		syscall(unix_write, 1, cs, cs_site);
		syscall(unix_exit_group, 0);
	}
	quad naof_secs = 0;
	entree_to_number(params[2], get_naof_secs(params[2]), 16, &naof_secs);
	//printf("naof-secs | %lu\n", naof_secs);

	writer grid = 0;
	writer shell_com = 0;
	create_vecter(&grid, 1, 10000, &shell_com);

	source shell_shell_name = "mshell.c";
  archive_grid shell_shell_file = syscall(unix_open, shell_shell_name, archive_read);
  quadrant naof_shell_map_secs = syscall(unix_lseek, shell_shell_file, 0, seek_completion);
  source shell_map = syscall(unix_mmap, non, naof_shell_map_secs, map_rws, clerk_descreet, shell_shell_file, non);
	//printf("shell-map | %s\n", shell_map);

	squad mshell_site = seek_space("\tasm(\"nop\");\n", 0xd, (shell_map), naof_shell_map_secs);
	add_string_to_sec_vecter(&grid, (shell_map), (mshell_site + 0xd), &shell_com);
	mshell_site += 0xd;

	quad site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		//printf("site | %lu\n", site);
		add_string_to_sec_vecter(&grid, ("\tasm(\"nop\");\n"), (0xd), &shell_com);
		site += 1;
	}
	add_string_to_sec_vecter(&grid, (shell_map + mshell_site), (naof_shell_map_secs - mshell_site), &shell_com);
	//syscall(unix_write, 1, (shell_com + 3), shell_com[2]);

	source shell_name = params[1];
	printf("shell-name | %s\n", shell_name);
	syscall(unix_unlink, shell_name);
	ip_file shellf = syscall(unix_open, shell_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, shellf, (shell_com + 3), shell_com[2]);
	syscall(unix_close, shellf);
	/*
	*/
  return 0;
}
