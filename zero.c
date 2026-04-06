#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | name\n");
    printf("1 | naof-secs (base-16)\n");
    return;
  }
	sec rspace[10000];
	quad naof_secs = 0;
	entree_to_number(params[2], get_naof_secs(params[2]), 16, &naof_secs);
	printf("naof-secs | %lu\n", naof_secs);
	ip_file zf = syscall(unix_open, "/dev/zero", archive_read);
	//ip_file zf = syscall(unix_open, "0.zeros", archive_read);
	//syscall(unix_read, zf, rspace, 10000);
	syscall(unix_unlink, params[1]);
	ip_file nf = syscall(unix_open, params[1], archive_create|archive_write, archive_jypsy);
	//syscall(unix_write, nf, rspace, naof_secs);
	syscall(unix_sendfile, nf, zf, non, naof_secs);
	syscall(unix_close, zf);
	syscall(unix_close, nf);
  return 0;
}
