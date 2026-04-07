#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	quad naof_data_secs = 176400;
	ip_file wf = syscall(unix_open, "sound-mains.wav", archive_write);
	syscall(unix_lseek, wf, 0x28, seek_origin);
	syscall(unix_write, wf, &naof_data_secs, 4);
	syscall(unix_exit_group, non);
  return 0;
}
