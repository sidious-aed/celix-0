#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | entree {12,231,12}\n");
    printf("2 | base (base-16)\n");
    printf("3 | view-base (base-16)\n");
    return;
  }
	quadrant naof_entree_secs = get_naof_secs(params[1]);
	sec entree[10000];
	naof_entree_secs = strip(params[1], entree, naof_entree_secs);
	quadrant naof_base_secs = get_naof_secs(params[2]);
	quadrant naof_view_base_secs = get_naof_secs(params[3]);
	quadrant base = 0;
	quadrant view_base = 0;
	entree_to_number(params[2], naof_base_secs, 16, &base);
	//printf("base | %lu\n", base);
	quadrant stave_base = base;
	entree_to_number(params[3], naof_view_base_secs, 16, &view_base);
	//sec init_rune = entree[0];
	writer grid = 0;
	writer vec = 0;
	create_vecter(&grid, 8, 0x100, &vec);
	sec com_rune[1] = {entree[naof_entree_secs - 1]};
	quad is_com = false;
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
		quad number = 0;
		entree_to_number(entree_at, seek, base, &number);
		add_to_vecter(&grid, &number, &vec);
		if(is_com) {
			break;
		}
		site += (seek + 1);
	}
	sec string[1000];
	sec string_string[1000];
	string_string[0] = 48;
	quadrant naof_string_secs = 0;
	syscall(unix_write, 1, "base-", 0x5);
	naof_string_secs = number_to_entree(view_base, string, 16);
	syscall(unix_write, 1, string, naof_string_secs);
	syscall(unix_write, 1, " | (", 0x4);
	//syscall(unix_write, 1, "\n", 1);
	quad et = vec[2] - 1;
	site = 0;
	while(true) {
		if(site == vec[2]) {
			break;
		}
		writer elem = (vec + 3) + site;
		quad number = elem[0];
		naof_string_secs = 0;
		if(view_base == 2) {
			string[naof_string_secs] = '0';
			naof_string_secs += 1;
			string[naof_string_secs] = 'b';
			naof_string_secs += 1;
		} else if(view_base == 8) {
			string[naof_string_secs] = '0';
			naof_string_secs += 1;
		} else if(view_base == 16) {
			string[naof_string_secs] = '0';
			naof_string_secs += 1;
			string[naof_string_secs] = 'x';
			naof_string_secs += 1;
		}
		naof_string_secs += number_to_entree(number, (string + naof_string_secs), view_base);
		if((naof_string_secs % 2) == 1) {
			wide_com(string, (string_string + 1), naof_string_secs);
			naof_string_secs += 1;
			wide_com(string_string, string, naof_string_secs);
		}
		if(site != et) {
			string[naof_string_secs] = ',';
			naof_string_secs += 1;
			string[naof_string_secs] = ' ';
			naof_string_secs += 1;
		}
		syscall(unix_write, 1, string, naof_string_secs);
		//printf("number | %lu\n", number);
		site += 1;
	}
	syscall(unix_write, 1, ")\n", 2);
  return 0;
}
