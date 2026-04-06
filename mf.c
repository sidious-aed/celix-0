#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | source-file\n");
    printf("2 | destination-file\n");
    return;
  }
  archive_grid source_file = syscall(unix_open, params[1], archive_read);
  quadrant source_file_distance = syscall(unix_lseek, source_file, 0, seek_completion);
  source source_map = syscall(unix_mmap, non, source_file_distance, map_readable|map_writable, clerk_descreet, source_file, non);
  syscall(unix_close, source_file);
	//printf("source-map | %lu\n", source_map);
	//perror("mmap");

	syscall(unix_unlink, params[1]);
  archive_grid destination_file = syscall(unix_open, params[2], archive_read_write|archive_create, archive_jypsy);
	syscall(unix_write, destination_file, source_map, source_file_distance);
  syscall(unix_close, destination_file);
  return 0;
}
