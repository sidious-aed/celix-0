#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | entrees-vec\n");
		printf("2 | is-quotes-noomed (yes|no)\n");
    return;
  }
	source entrees_vec = params[1];
	quad naof_entrees_vec_secs = get_naof_secs(entrees_vec);
	quad is_quotes_noomed = compair_spaces("yes", 3, params[2], get_naof_secs(params[2]));
	writer grid = 0;
	writer clerk_com;
	create_vecter(&grid, 1, 10000, &clerk_com);
	add_string_to_sec_vecter(&grid, "naof-secs-vecter -|- {", 0x16, &clerk_com);
	sec base[100];
	quad site = 1;
	while(true) {
		scroll_to_then(entrees_vec, &site);
		sec con = entrees_vec[0];
		quad is_com = false;
		if(con == '"') {
			site += 1;
			continue;
		}
		squad sect_site = seek_space(",", 1, (entrees_vec + site), (naof_entrees_vec_secs - site));
		//printf("sect-site | %lu\n", sect_site);
		if(sect_site == -1) {
			sect_site = naof_entrees_vec_secs - site - 1;
			is_com = true;
		}
		//printf("sect-site | %lu\n", sect_site);
		quad naof_element_secs = sect_site;
		if(is_quotes_noomed) {
			naof_element_secs -= 2;
		}
		quad naof_base_secs = number_to_entree(naof_element_secs, base, 10);
		add_string_to_sec_vecter(&grid, (base), naof_base_secs, &clerk_com);
		if(is_com) {
			break;
		}
		add_string_to_sec_vecter(&grid, ", ", 2, &clerk_com);
		site += (sect_site + 1);
	}
	add_string_to_sec_vecter(&grid, "};\n", 3, &clerk_com);
	printf("naof-clerk-com-secs | %lu\n", clerk_com[2]);
	syscall(unix_write, 1, (clerk_com + 3), clerk_com[2]);
  return 0;
}
