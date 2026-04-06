#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | vecter-entree ([1, 2, 3]|{1,2,3})\n");
    return;
  }
	quadrant naof_secs = get_naof_secs(params[1]);
	source vecter_entree = params[1];
	quadrant naof_elements = 1;
	quadrant site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		sec rune = vecter_entree[site];
		if(rune == ',') {
			naof_elements += 1;
		}
		site += 1;
	}
	//printf("naof-elements | %lu\n", naof_elements);
	sec entree[100];
	quadrant naof_entree_secs = number_to_entree(naof_elements, entree, 0xa);
	syscall(unix_write, 1, "base-a  | ", 0xa);
	syscall(unix_write, 1, entree, naof_entree_secs);
	syscall(unix_write, 1, "\n", 0x1);
	naof_entree_secs = number_to_entree(naof_elements, entree, 0x10);
	syscall(unix_write, 1, "base-10 | ", 0xa);
	syscall(unix_write, 1, entree, naof_entree_secs);
	syscall(unix_write, 1, "\n", 0x1);
  return 0;
}
