#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | file-name\n");
		printf("2 | seek\n");
		printf("3 | com-file-name\n");
    return;
  }
	source file_name = params[1];
	source seek = params[2];
	source com_file_name = params[3];
	sec cs[10000];
	quad cs_site = 0;
	ip_file ef = syscall(unix_open, file_name, archive_read); // <--> ef | entree-file
	if(ef == 0xffffffffffffffff) {
		quad file_name_site = get_naof_secs(file_name);
		add_to_entree("<--> could not find a file named ", 0x21, cs, &cs_site);
		add_to_entree(file_name, file_name_site, cs, &cs_site);
		add_to_entree(".\n", 2, cs, &cs_site);
		syscall(unix_write, 1, cs, cs_site);
		syscall(unix_exit_group, non);
	}
	quad fs_site = syscall(unix_lseek, ef, 0, seek_completion); // <--> fs | file-string
	source fs = syscall(unix_mmap, non, fs_site, map_rws, clerk_descreet, ef, non);
	printf("fs | %lu\n", fs);
	syscall(unix_close, ef);
	//getc(stdin);
	quad seek_site = strstr(fs, seek);
	if(seek_site == 0) {
		seek_site = code_a;
	} else {
		seek_site -= (quad)fs;
	}
	syscall(unix_unlink, com_file_name);
	ip_file comf = syscall(unix_open, com_file_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, comf, &seek_site, 8);
	syscall(unix_close, comf);
  return 0;
}
