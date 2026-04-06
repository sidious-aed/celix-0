#include "./standard.h"

// tyrel@fearsome:~/celix$ ./abstract "\tasm(\"mov \$0xaedaed, %^\");" "{"r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "rax", "rbx", "rcx", "rdx", "rdi", "rsi", "rsp", "rbp"}"
quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | abstract | \"\\tasm(\"mov $0xaedaed, %^\");\\n\"\n");
    printf("2 | vecter   | {\"r8\", \"r9\", \"r10\", \"r11\", \"r12\", \"r13\", \"r14\", \"r15\", \"rax\", \"rbx\", \"rcx\", \"rdx\", \"rdi\", \"rsi\", \"rsp\", \"rbp\", \"rip\"}\n");
    return;
  }
	quad naof_abstract_secs = get_naof_secs(params[1]);
	quad naof_vec_secs = get_naof_secs(params[2]);
	writer grid = 0;
	source abstract_entree = 0;
	get_grid_secs(&grid, (naof_abstract_secs + 1), &abstract_entree);
	quad naof_abstract_entree_secs = standardise_entree(params[1], abstract_entree);
	printf("abstract-entree | %s\n", abstract_entree);
	source vec_entree = 0;
	get_grid_secs(&grid, (naof_vec_secs + 1), &vec_entree);
	quad naof_vec_entree_secs = strip(params[2], vec_entree, naof_vec_secs);
	printf("vec-entree | %s\n", vec_entree);
	sec com_rune[1] = {vec_entree[naof_vec_entree_secs - 1]};
	writer vec = 0;
	create_vecter(&grid, 0x10, 0x100, &vec);
	quad et_naof_secs = 0;
	quad is_com = false;
	quad site = 1;
	while(true) {
		source entree_at = vec_entree + site;
		squad seek = seek_space(",", 1, (entree_at), (naof_vec_entree_secs - site));
		//printf("seek | %ld\n", seek);
		if(seek == -1) {
			seek = seek_space(com_rune, 1, (entree_at), (naof_vec_entree_secs - site));
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
	squad dsite = seek_space("^", 1, abstract_entree, naof_abstract_entree_secs);
	printf("dsite | %ld\n", dsite);
	source com_abstraction = (abstract_entree + dsite + 1);
	quad naof_com_abstraction_secs = naof_abstract_entree_secs - dsite - 1;
	sec string[10000];
	quad string_site = 0;
	site = 0;
	while(true) {
		if(site == vec[2]) {
			break;
		}
		writer record = (vec + 3) + (site * 2);
		string_site = 0;
		add_to_entree(abstract_entree, dsite, string, &string_site);
		add_to_entree(record[0], record[1], string, &string_site);
		add_to_entree(com_abstraction, naof_com_abstraction_secs, string, &string_site);
		add_to_entree("\n", 1, string, &string_site);
		syscall(unix_write, 1, string, string_site);
		site += 1;
	}
  return 0;
}
