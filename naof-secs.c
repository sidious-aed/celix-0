#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | entree\n");
    return;
  }
	sec standard_entree[10000];
	standardise_entree(params[1], standard_entree);
	quadrant naof_secs = get_naof_secs(standard_entree);
	sec base[100];
	quadrant naof_base_secs = number_to_entree(naof_secs, base, 0xa);
	syscall(unix_write, 1, "base-10 | ", 0xa);
	syscall(unix_write, 1, base, naof_base_secs);
	syscall(unix_write, 1, "\n", 0x1);
	naof_base_secs = number_to_entree(naof_secs, base, 0x10);
	syscall(unix_write, 1, "base-16 | ", 0xa);
	syscall(unix_write, 1, base, naof_base_secs);
	syscall(unix_write, 1, "\n", 0x1);
  return 0;
}
