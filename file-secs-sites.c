#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    syscall(unix_write, 1, "params | 1\n", 11);
    syscall(unix_write, 1, "1 | file\n", 9);
    syscall(unix_write, 1, "2 | init-site (base-16)\n", 0x18);
    syscall(unix_write, 1, "3 | com-site (base-16)\n", 0x17);
    return 0;
  }
  archive_grid file = syscall(unix_open, params[1], archive_read);
  if(file == 0xffffffffffffffff) {
    syscall(unix_write, 1, "[]\n", 3);
    return 0;
  }
	quadrant naof_init_site_secs = get_naof_secs(params[2]);
	//printf("params[2] | %s\n", params[2]);
	//printf("naof-init-site-secs | %lu\n", naof_init_site_secs);
	quadrant init_site = 0;
	entree_to_number(params[2], naof_init_site_secs, 16, &init_site);
	//printf("init-site | %lu\n", init_site);
	quadrant naof_com_site_secs = get_naof_secs(params[3]);
	//printf("naof-com-site-secs | %lu\n", naof_com_site_secs);
	//printf("params[3] | %s\n", params[3]);
	quadrant com_site = 0;
	entree_to_number(params[3], naof_com_site_secs, 16, &com_site);
	//return 0;
  quadrant file_distance = syscall(unix_lseek, file, 0, seek_completion);
	//printf("file-distance | %lu\n", file_distance);
  syscall(unix_lseek, file, 0, seek_origin);
	//printf("file-distance | %lu\n", file_distance);
	quadrant naof_secs = (com_site - init_site);
	if(com_site == code_a) {
		//printf("in et com-site.\n");
		naof_secs = (file_distance - init_site);
	}
	//printf("com-site | %lu\n", com_site);
	//printf("naof-secs | %lu\n", naof_secs);
  if(file_distance == 0) {
    syscall(unix_write, 1, "[]\n", 3);
    return 0;
  }
  source fast_from_archives = syscall(unix_mmap, non, file_distance, map_read, 0x1, file, 0);
  see_space("fast-from-archives", (fast_from_archives + init_site), naof_secs);
	see_quad("naof-secs (base-16) | ", naof_secs, 16);
	see_quad("naof-secs (base-16) | ", naof_secs, 10);
	see_quad("file-distance (base-16) | ", file_distance, 16);
	see_quad("file-distance (base-16) | ", file_distance, 10);
  return 0;
}
