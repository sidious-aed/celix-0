#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | number (base|vecter([12,231,12]))\n");
    printf("2 | base (base-16)\n");
    printf("3 | view-base (base-16)\n");
    return;
  }
	/*
	printf("naof-params | %lu\n", naof_params);
	quadrant site = 0;
	while(true) {
		if(site == naof_params) {
			break;
		}
		printf("param%lu | %s\n", site, params[site]);
		site += 1;
	}
	*/
	quadrant naof_number_secs = get_naof_secs(params[1]);
	sec number_entree[10000];
	naof_number_secs = strip(params[1], number_entree, naof_number_secs);
	//printf("number-entree | %s\n", number_entree);
	quadrant naof_base_secs = get_naof_secs(params[2]);
	quadrant naof_view_base_secs = get_naof_secs(params[3]);
	quadrant base = 0;
	quadrant number = 0;
	quadrant view_base = 0;
	entree_to_number(params[2], naof_base_secs, 16, &base);
	//printf("base | %lu\n", base);
	quadrant stave_base = base;
	entree_to_number(params[3], naof_view_base_secs, 16, &view_base);
	if(number_entree[0] == '[') {
		quadrant et = naof_number_secs - 1;
		if(number_entree[et] != ']') {
			printf("vecter is not encoded correct | %s\n", params[1]);
			return 0;
		}
		source number_tab = &number;
		sec sec_runes[100];
		sec quadrant_secs[8];
		quadrant quadrant_secs_site = 0;
		quadrant sec_runes_site = 0;
		quadrant site = 1;
		while(true) {
			//printf("base | %lu\n", base);
			quadrant mode = 0;
			if(site == et) {
				mode = 1;
			}
			if(mode == 0) {
				sec rune = number_entree[site];
				//printf("rune | %c\n", rune);
				if(rune == ',') {
					mode = 1;
				} else {
					sec_runes[sec_runes_site] = rune;
					sec_runes_site += 1;
				}
			}
			if(mode == 1) {
				//printf("sec-runes-site | %lu\n", sec_runes_site);
				//see_space("sec-runes", sec_runes, sec_runes_site);
				sec quad_sec = 0;
				//printf("base | %lu\n", base);
				entree_to_number(sec_runes, sec_runes_site, base, &quad_sec);
				// stave-base is a clerk-through and also a reminder of a duel-stay lead for after we finish our c-asm-shell-inject.
				base = stave_base;
				//printf("base | %lu\n", base);
				//printf("quad-sec | %u\n", quad_sec);
				//printf("\n");
				quadrant_secs[quadrant_secs_site] = quad_sec;
				quadrant_secs_site += 1;
				sec_runes_site = 0;
			}
			if(site == et) {
				break;
			}
			site += 1;
		}
		//see_space("quadrant-secs", quadrant_secs, quadrant_secs_site);
		number = number_aof(quadrant_secs, quadrant_secs_site);
		//printf("number | %lu\n", number);
	} else {
		entree_to_number(params[1], naof_number_secs, base, &number);
	}
	sec entree[1000];
	syscall(unix_write, 1, "base-", 0x5);
	quadrant naof_entree_secs = number_to_entree(view_base, entree, 16);
	syscall(unix_write, 1, entree, naof_entree_secs);
	syscall(unix_write, 1, " | ", 0x3);
	naof_entree_secs = number_to_entree(number, entree, view_base);
	syscall(unix_write, 1, entree, naof_entree_secs);
	syscall(unix_write, 1, "\n", 0x1);
	see_space("quad-secs", &number, 8);
  return 0;
}
