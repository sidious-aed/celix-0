#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | entrees {\"idea\",\"idea2\",\"idea3\"}\n");
    printf("2 | base (base-16)\n");
    return;
  }
	quadrant naof_entree_secs = get_naof_secs(params[1]);
	sec entree[10000];
	naof_entree_secs = strip(params[1], entree, naof_entree_secs);
	quadrant naof_base_secs = get_naof_secs(params[2]);
	quadrant base = 0;
	entree_to_number(params[2], naof_base_secs, 16, &base);
	writer grid = 0;
	writer vec = 0;
	create_vecter(&grid, 0x10, 0x100, &vec);
	sec com_rune[1] = {entree[naof_entree_secs - 1]};
	quad is_com = false;
	quad et_naof_secs = 0;
	quad site = 1;
	while(true) {
		source entree_at = entree + site;
		squad seek = seek_space(",", 1, (entree_at), (naof_entree_secs - site));
		//printf("seek | %ld\n", seek);
		if(seek == -1) {
			seek = seek_space(com_rune, 1, (entree_at), (naof_entree_secs - site));
			//printf("seek | %lu\n", seek);
			is_com = true;
		}
		site += (seek + 1);
		if(entree_at[0] == '"') {
			entree_at += 1;
			seek -= 1;
		}
		if(entree_at[seek - 1] == '"') {
			seek -= 1;
		}
		source rstring = 0;
		get_grid_secs(&grid, (seek + 1), &rstring);
		wide_com(entree_at, rstring, seek);
		quad record[2];
		record[0] = rstring;
		record[1] = seek;
		add_to_vecter(&grid, record, &vec);
		if(seek > et_naof_secs) {
			et_naof_secs = seek;
		}
		if(is_com) {
			break;
		}
	}
	quad et = vec[2] - 1;
	view_heading("string meta");
	sec string[10000];
	quad string_site = 0;
	site = 0;
	while(true) {
		if(site == vec[2]) {
			break;
		}
		writer record = (vec + 3) + (site * 2);
		string_site = 0;
		add_to_entree(record[0], record[1], string, &string_site);
		quad naof_spaces = et_naof_secs - record[1];
		if(naof_spaces > 0) {
			string_site += replicate(' ', (string + string_site), naof_spaces);
		}
		add_to_entree(" | ", 3, string, &string_site);
		string_site += number_to_entree(record[1], (string + string_site), base);
		add_to_entree("\n", 1, string, &string_site);
		syscall(unix_write, 1, string, string_site);
		site += 1;
	}
	view_heading("string meta");
	string_site = 0;
	add_to_entree("naof-secs-vecter | [", 20, string, &string_site);
	site = 0;
	while(true) {
		if(site == vec[2]) {
			break;
		}
		writer record = (vec + 3) + (site * 2);
		if(base == 2) {
			add_to_entree("0b", 2, string, &string_site);
		} else if(base == 8) {
			add_to_entree("0", 1, string, &string_site);
		} else if(base == 16) {
			add_to_entree("0x", 2, string, &string_site);
		}
		string_site += number_to_entree(record[1], (string + string_site), base);
		if(site != et) {
			add_to_entree(", ", 2, string, &string_site);
		}
		site += 1;
	}
	add_to_entree("]\n", 2, string, &string_site);
	syscall(unix_write, 1, string, string_site);
  return 0;
}
