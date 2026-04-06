#include "./standard.h"
#define seek_scope 0x2932e0

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
	quad naof_seek_secs = get_naof_secs(seek);
	source com_file_name = params[3];
	sec cs[seek_scope];
	quad cs_site;
	quad cs_et = seek_scope - 1;
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
	quad seek_site = 0;
	quad see_site = 0;
	quad fsite = 0;
	quad lfsite = 0;
	cs[cs_et] = 0;
	while(true) {
		if(lfsite == fsite && fsite != 0) {
			break;
		}
		quad cs_site = syscall(unix_lseek, ef, fsite, seek_origin);
		cs_site = syscall(unix_read, ef, cs, cs_et);
		if(cs_site == 0) {
			break;
		}
		seek_site = strstr(cs, seek);
		printf("seek-site | %lu\n", seek_site);
		if(seek_site != 0) {
			// <--> seems we need to fit the whole thing into ram for a sparse quarke no doubt.
			seek_site = (seek_site + (see_site * cs_et) + naof_seek_secs) - ((quad)cs);
			break;
		}
		lfsite = fsite;
		fsite += (cs_site - naof_seek_secs - 1);
		see_site += 1;
	}
	printf("seek-site | %lu\n", seek_site);
	syscall(unix_close, ef);
	//getc(stdin);
	if(seek_site == 0) {
		//seek_site = code_c;
		seek_site = code_a;
	}
	syscall(unix_unlink, com_file_name);
	ip_file comf = syscall(unix_open, com_file_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, comf, &seek_site, 8);
	syscall(unix_close, comf);
  return 0;
}
