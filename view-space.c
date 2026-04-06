#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 4) {
    printf("params | 3-4\n");
    printf("1 | space-vecter-entree \"[1, 2, 3, 4]\"\n");
		printf("2 | base (base-16)\n");
		printf("3 | vbase (base-16)\n");
		printf("(4) | space-replacer \"_\"\n");
    return;
  }
	//view_header("main meta.");
	source sve = params[1];
	quad naof_sve_secs = get_naof_secs(sve);
	quad b = 0;
	entree_to_number(params[2], get_naof_secs(params[2]), 16, &b);
	quad vb = 0;
	entree_to_number(params[3], get_naof_secs(params[3]), 16, &vb);
	quad is_space_replacer = naof_params == 5;
	sec srpcr;
	if(is_space_replacer) {
		srpcr = params[4][0];
	}
	writer grid = 0;
	writer sv = 0;
	create_vecter(&grid, 1, 1000, &sv);
	writer ss = 0;
	create_vecter(&grid, 0x10, 1000, &ss);
	quad sr[2];
	sr[0] = 0;
	sr[1] = 0;
	sec base[1000];
	quad base_site = 0;
	quad site = 0;
	while(true) {
		if(site == naof_sve_secs) {
			break;
		}
		sec con0 = sve[site];
		site += 1;
		if(con0 == '[') {
			break;
		}
	}
	quad ssmode = 0;
	quad sssite = 0;
	quad b16n = 0;
	while(true) {
		quad is_vcom = false;
		quad is_tcom = false;
		scroll_to_then(sve, &site);
		if(site == naof_sve_secs) {
			break;
		}
		sec con0 = sve[site];
		site += 1;
		if(con0 == ',') {
			is_vcom = true;
		} else if(con0 == ']') {
			is_vcom = true;
			is_tcom = true;
		} else {
			base[base_site] = con0;
			base_site += 1;
		}
		if(is_vcom) {
			entree_to_number(base, base_site, b, &b16n);
			base_site = 0;
			if(is_space_replacer && b16n == 0x20) {
				b16n = srpcr;
			}
			if(is_tcom || b16n == 0) {
				if(is_tcom || ssmode == 0) {
					sr[0] = sssite;
					sr[1] = sv[2] - sssite;
					if(is_tcom) {
						sr[1] += 1;
					}
					add_to_vecter(&grid, sr, &ss);
				}
				ssmode = 1;
			} else {
				if(ssmode == 1) {
					sssite = sv[2];
				}
				ssmode = 0;
			}
			add_to_vecter(&grid, &b16n, &sv);
		}
		if(is_tcom) {
			break;
		}
	}
	sec entree[1000000];
	quad entree_site = 0;
	see_spaceb("sv", (sv + 3), sv[2], vb);
	log_heading("entrees");
	printf("naof-entrees | %lu\n\n", ss[2]);
	site = 0;
	while(true) {
		if(site == ss[2]) {
			break;
		}
		writer stringr = (ss + 3) + (site * 2);
		//printf("stringr-naof-secs | %lu\n", stringr[1]);
		source ent = (((source)(sv + 3)) + stringr[0]);
		entree_site = number_to_entree(site, entree, vb);
		add_to_entree(" | ", 3, entree, &entree_site);
		add_to_entree(ent, stringr[1], entree, &entree_site);
		add_to_entree("\n", 1, entree, &entree_site);
		syscall(unix_write, 1, entree, entree_site);
		entree_site = 0;
		base_site = number_to_entree(site, base, vb);
		base[base_site] = 0;
		see_spaceb(base, ent, stringr[1], vb);
		add_to_entree("naof-secs | ", 12, entree, &entree_site);
		entree_site += number_to_entree(stringr[1], (entree + entree_site), 16);
		add_to_entree("\n\n", 2, entree, &entree_site);
		syscall(unix_write, 1, entree, entree_site);
		//printf("entree%lu | %s\n", site, ((source)(sv + 3)) + stringr[0]);
		//printf("naof-secs | %lu\n", stringr[1]);
		site += 1;
	}
  return 0;
}
