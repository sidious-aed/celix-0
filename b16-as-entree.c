#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | entree (base|vecter([12,231,12]))\n");
    return;
  }
	writer grid = 0;
	quadrant naof_entree_secs = get_naof_secs(params[1]);
	if(naof_entree_secs == 0) {
		printf("<--> | must have at least one entree-sec to evaluate b16-numbet-to-entree.");
		return 0;
	}
	writer number_entree = 0;
	create_vecter(&grid, 1, 10000, &number_entree);
	if((naof_entree_secs & 1) != 0) {
		add_string_to_sec_vecter(&grid, "0", 1, &number_entree);
	}
	add_string_to_sec_vecter(&grid, params[1], naof_entree_secs, &number_entree);
	source ne = (number_entree + 3);
	//printf("ne | %s\n", ne);
	writer base_as_entree = 0;
	create_vecter(&grid, 1, 10000, &base_as_entree);
	quad naof_secs = number_entree[2];
	//printf("naof-secs | %lu\n", naof_secs);
	quad site = naof_secs - 2;
	while(true) {
		//printf("site | %lu\n", site);
		quad secv = 0;
		entree_to_number((ne + site), 2, 16, &secv);
		//printf("secv | %u\n", secv);
		add_string_to_sec_vecter(&grid, &secv, 1, &base_as_entree);
		if(site == 0) {
			break;
		}
		site -= 2;
	}
	sec ps[10000]; // ps | poly-space
	quad ps_site = 0;
	add_to_entree((base_as_entree + 3), base_as_entree[2], ps, &ps_site);
	add_to_entree("\n", 1, ps, &ps_site);
	syscall(unix_write, 1, ps, ps_site);
  return 0;
}
