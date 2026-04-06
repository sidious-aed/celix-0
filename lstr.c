#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | file-name\n");
		printf("2 | com-file-name\n");
    return;
  }
	source file_name = params[1];
	source com_file_name = params[2];
	quad pause[2] = {0, 0xaed};
	sec sfn[10000];
	quad sfn_site = 0;
	source seek;
	quad seek_site;
	sec cs[10000];
	quad cs_site = 0;
	while(true) {
		ip_file ef = syscall(unix_open, file_name, archive_read); // <--> ef | entree-file
		quad ef_site = syscall(unix_lseek, ef, 0, seek_completion);
		syscall(unix_lseek, ef, 0, seek_origin);
		if(ef != 0xffffffffffffffff) {
			while(true) {
				sfn_site = syscall(unix_read, ef, sfn, 10000);
				if(sfn_site != 0 || ef_site == 0) {
					break;
				}
			}
			printf("sfn-site | %lu\n", sfn_site);
			if(ef_site != 0) {
				sfn[sfn_site] = 0;
				source sfn_com = sfn + sfn_site;
				quad is_encoded = false;
				quad site = 0;
				while(true) {
					if(site == sfn_site) {
						break;
					}
					sec con = sfn[site];
					printf("con | %c\n", con);
					if(con == ' ') {
						is_encoded = true;
						break;
					}
					site += 1;
				}
				quad stack_seek_site = 0;
				if(is_encoded) {
					sfn[site] = 0;
					seek = sfn + site + 1;
					quad naof_seek_secs = sfn_com - seek;
					printf("naof-seek-secs | %lu\n", naof_seek_secs);
					seek[naof_seek_secs] = 0;
					printf("sfn | %s\n", sfn);
					printf("seek | %s\n", seek);
					ip_file sf = syscall(unix_open, sfn, archive_read);
					if(sf == 0xffffffffffffffff) {
						seek_site = code_b;
					} else {
						quad fs_site = syscall(unix_lseek, sf, 0, seek_completion); // <--> fs | file-string
						printf("fs-site | %lu\n", fs_site);
						source fs = syscall(unix_mmap, non, fs_site, map_rws, clerk_descreet, sf, non);
						printf("fs | %lu\n", fs);
						syscall(unix_close, ef);
						quad seek_site = strstr(fs, seek);
						printf("seek-site | %lu\n", seek_site);
						//getc(stdin);
						if(seek_site == 0) {
							seek_site = code_a;
						} else {
							seek_site -= (quad)fs;
						}
						printf("seek-site | %lu\n", seek_site);
						stack_seek_site = seek_site;
						syscall(unix_munmap, fs, fs_site);
					}
					/*
					syscall(unix_unlink, "droid/clerk-com.str");
					ip_file ccsf = syscall(unix_open, "droid/clerk-com.str", archive_create|archive_write, archive_jypsy);
					syscall(unix_write, ccsf, &sf, 8);
					syscall(unix_write, ccsf, &stack_seek_site, 8);
					syscall(unix_close, ccsf);
					*/
					syscall(unix_unlink, com_file_name);
					ip_file comf = syscall(unix_open, com_file_name, archive_create|archive_write, archive_jypsy);
					syscall(unix_write, comf, &stack_seek_site, 8);
					syscall(unix_close, comf);
					syscall(unix_unlink, file_name);
				} else {
					add_to_entree("<--> encoding is |file-name.ext seek|.", 38, cs, &cs_site);
					syscall(unix_write, 1, cs, cs_site);
				}
			}
		}
		syscall(unix_nanosleep, pause, pause);
	}
  return 0;
}
