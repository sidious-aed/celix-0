#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	sec file_name[7] = {176, 124, 149, 229, 253, 127, 0};
	ip_file f = syscall(unix_open, file_name, archive_read);
	printf("f | %lu\n", f);
	syscall(unix_unlink, file_name);
  return 0;
}
