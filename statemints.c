#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 4) {
    printf("params | 3\n");
    printf("1 | statemints (1 + 23 - (95 * ((6 + 3) + (6 * 3))) + 1 + (8 / 2) + 2) - 3\n");
    printf("2 | base (base-16)\n");
    printf("3 | view-base (base-16)\n");
    printf("(4) | is-directional (default|no)\n");
    return;
  }
	quadrant naof_statemint_secs = get_naof_secs(params[1]);
	//printf("number-entree | %s\n", number_entree);
	quadrant naof_base_secs = get_naof_secs(params[2]);
	quadrant naof_view_base_secs = get_naof_secs(params[3]);
	quadrant base = 0;
	directional number = 0;
	quadrant view_base = 0;
	entree_to_number(params[2], naof_base_secs, 16, &base);
	//printf("base | %lu\n", base);
	entree_to_number(params[3], naof_view_base_secs, 16, &view_base);
	writer grid = 0;
	statemints(&grid, params[1], naof_statemint_secs, &number, base);
	//printf("number | %ld\n", number);
	sec entree[1000];
	quadrant naof_entree_secs = number_to_entree(view_base, (entree), 16);
	syscall(unix_write, 1, "base-", 0x5);
	syscall(unix_write, 1, entree, naof_entree_secs);
	naof_entree_secs = 0;
	//printf("naof-params | %lu\n", naof_params);
	if(naof_params == 5) {
		if(compair_spaces("yes", 3, params[4], get_naof_secs(params[4]))) {
			if(number < 0) {
				number *= -1;
				entree[0] = '-';
				naof_entree_secs = 1;
			}
		}
	}
	naof_entree_secs += number_to_entree(number, (entree + naof_entree_secs), view_base);
	syscall(unix_write, 1, " | ", 0x3);
	syscall(unix_write, 1, entree, naof_entree_secs);
	syscall(unix_write, 1, "\n", 0x1);
	see_space("quad-secs", &number, 8);
  return 0;
}
