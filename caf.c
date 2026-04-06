#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 3) {
    printf("params | 3\n");
		printf("1  | type\n (open|append)\n");
    printf("2  | file-name\n");
    printf("3* | entree\n");
    return;
  }
	quad is_append = false;
	if(compair_spaces(params[1], get_naof_secs(params[1]), "append", 6)) {
		is_append = true;
	}
	ip_file file;
	if(is_append) {
		file = syscall(unix_open, params[2], 0x441);
	} else {
		syscall(unix_unlink, params[2]);
		file = syscall(unix_open, params[2], archive_create|archive_write, archive_jypsy);
	}
	sec cs[10000];
	quad cs_site = 0;
	quad et = naof_params - 1;
	quad site = 3;
	while(true) {
		if(site == naof_params) {
			break;
		}
		quad is_write_to = false;
		if(site == et) {
			is_write_to = true;
		}
		quad naof_secs = get_naof_secs(params[site]);
		quad cet = naof_secs - 1;
		quad csite = 0;
		while(true) {
			if(csite == naof_secs) {
				break;
			}
			sec con = params[site][csite];
			/*
			// <--> intended for no com\s
			if(con == '\\') {
				if(csite != cet) {
					csite += 1;
					con = params[site][csite];
					if(con == 't') {
						con = '\t';
					} else if(con == 'n') {
						con = '\n';
					}
				}
			}
			*/
			printf("con | %u\n", con);
			cs[cs_site] = con;
			cs_site += 1;
			csite += 1;
		}
		if(site != et) {
			cs[cs_site] = ' ';
			cs_site += 1;
		}
		site += 1;
	}
	syscall(unix_write, file, cs, cs_site);
	syscall(unix_close, file);
  return 0;
}
