#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | proc-name\n");
    return;
  }
	//quadrant pause[2] = {0, 0xaed};
  archive_grid source_file = syscall(unix_open, params[1], archive_read);
  quadrant source_file_distance = syscall(unix_lseek, source_file, 0, seek_completion);
  source source_map = syscall(unix_mmap, non, source_file_distance, map_rws, clerk_descreet, source_file, non);
	syscall(unix_close, source_file);
	//printf("source-map | %lu\n", source_map);
	//while(true) {
		//syscall(unix_nanosleep, pause, pause);
	//}
	asm("sub $0x1000, %rsp");
	register quadrant_reference rsp asm("rsp");
	quadrant_reference rack = rsp;
	rack[0] = source_map;
	asm("mov 0x0(%rsp), %r8");
	asm("callq *%r8");
	asm("add $0x1000, %rsp");
  return 0;
}
