#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | entree\n");
    printf("2 | base (base-16)\n");
    return;
  }
	quadrant naof_entree_secs = get_naof_secs(params[1]);
	//printf("naof-entree-secs | %lu\n", naof_entree_secs);
	quadrant naof_base_secs = get_naof_secs(params[2]);
	quadrant base = 0;
	entree_to_number(params[2], naof_base_secs, 16, &base);
	quad ib = is_base(params[1], naof_entree_secs, base);
	sec clerk_com[10000];
	quad clerk_com_site = 0;
	add_to_entree("is-base | ", 10, clerk_com, &clerk_com_site);
	if(ib) {
		add_to_entree("true\n", 5, clerk_com, &clerk_com_site);
	} else {
		add_to_entree("false\n", 6, clerk_com, &clerk_com_site);
	}
	syscall(unix_write, 1, clerk_com, clerk_com_site);
  return 0;
}
