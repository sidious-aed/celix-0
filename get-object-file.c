#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter ** params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | binary-name\n");
    return 0;
  }
	get_object_file(params[1], true);
	sec object_name[10000];
	quad naof_object_name_secs = get_object_file_name(params[1], object_name);
	syscall(unix_write, 1, object_name, naof_object_name_secs);
	syscall(unix_write, 1, "\n", 1);
  return 0;
}
