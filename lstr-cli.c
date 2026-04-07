#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | file-name\n");
    printf("2 | seek\n");
    return;
  }
	sec cs[10000];
	quad cs_site = 0;
	add_to_entree(params[1], get_naof_secs(params[1]), cs, &cs_site);
	add_to_entree(" ", 1, cs, &cs_site);
	add_to_entree(params[2], get_naof_secs(params[2]), cs, &cs_site);
	ip_file prf = syscall(unix_open, "prints/lstr-cli.print", archive_create|archive_write, archive_jypsy);
	syscall(unix_write, prf, cs, cs_site);
	syscall(unix_close, prf);
	ip_file rf = syscall(unix_open, "prints/libc.lseek", archive_create|archive_write, archive_jypsy);
	syscall(unix_write, rf, cs, cs_site);
	syscall(unix_close, rf);
	while(true) {
		rf = syscall(unix_open, "prints/sstr.com", archive_read);
		if(rf != 0xffffffffffffffff) {
			break;
		}
	}
	/*
	*/
  return 0;
}
