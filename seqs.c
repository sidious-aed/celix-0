#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 4) {
    printf("params | 3-4\n");
    printf("1 | sequence-file\n");
    printf("2 | secs-file\n");
    printf("3 | bs (base-16)\n");
    printf("(4) | params\n");
    return;
  }
	writer grid = 0;
	ip_file seqs_file = syscall(unix_open, params[1], archive_read);
	quad naof_seqs_secs = syscall(unix_lseek, seqs_file, 0, seek_com);
	source seqs = syscall(unix_mmap, non, (naof_seqs_secs + 1), map_rws, map_console, seqs_file, 0);
	syscall(unix_close, seqs_file);
	writer ms = 0;
	create_vecter(&grid, 1, 10000, &ms);
	//printf("seqs | %s\n", seqs);
	sec stack_ms[10000];
	quad stack_ms_site = 0;
	sec stack_names[10000];
	quad stack_names_site = 0;
	sec clerk_com[10000];
	quad clerk_com_site = 0;
	quad seqs_site = 0;
	while(true) {
		log_heading("seqs task");
		//printf("seqs-site | %lu\n", seqs_site);
		source seqs_at = seqs + seqs_site;
		printf("seqs-at | %s\n", seqs_at);
		quad naof_rsecs = naof_seqs_secs - seqs_site; // rsecs | remaining-secs
		squad sect_site = seek_space("\n", 1, seqs_at, naof_rsecs);
		clerk_com_site = 0;
		add_to_entree("section | ", 10, clerk_com, &clerk_com_site);
		add_to_entree(seqs_at, (sect_site + 1), clerk_com, &clerk_com_site);
		syscall(unix_write, 1, clerk_com, clerk_com_site);
		seqs_site += (sect_site + 1);
		writer comps = 0;
		create_vecter(&grid, 0x20, 100, &comps);
		quad const_site = code_b;
		quad comp_site = 0;
		quad sect_site2 = 0;
		printf("sect-site | %lu\n", sect_site);
		while(true) {
			if(sect_site2 >= sect_site) {
				break;
			}
			//log_heading("in comp task");
			//printf("sect-site2 | %lu\n", sect_site2);
			source sect_at = seqs_at + sect_site2;
			scroll_to_then(seqs_at, &sect_site2);
			//printf("sect-site2 | %lu\n", sect_site2);
			sect_at = seqs_at + sect_site2;
			quad naof_rsect_secs = sect_site;
			//printf("sect-at | %s\n", sect_at);
			quad naof_comp_secs = seek_space(" ", 1, sect_at, (sect_site - sect_site2));
			if(naof_comp_secs == code_a) {
				naof_comp_secs = sect_site - sect_site2;
			}
			//printf("naof-comp-secs | %lu\n", naof_comp_secs);
			sect_site2 += naof_comp_secs;
			quad comp[4];
			source comp_entr = 0;
			create_vecter(&grid, 1, (naof_comp_secs + 1), &comp_entr);
			wide_com(sect_at, comp_entr, naof_comp_secs);
			comp[0] = comp_entr;
			comp[1] = naof_comp_secs;
			comp[2] = is_base(comp_entr, naof_comp_secs, 16);
			comp[3] = 0;
			if(comp[2]) {
				quad stack_number = 0;
				entree_to_number(comp[0], comp[1], 16, &stack_number);
				comp[3] = stack_number;
				const_site = comp_site;
			}
			//printf("com-is-base16 | %lu\n", comp[2]);
			//see_space("comp", comp, 0x18);
			//printf("comp-entree | %s\n", comp[0]);
			add_to_vecter(&grid, comp, &comps);
			/*
			*/
			sect_at = seqs_at + sect_site2;
			scroll_to_then(seqs_at, &sect_site2);
			sect_at = seqs_at + sect_site2;
			//printf("sect-at | %s\n", sect_at);
			//printf("sect-site2 | %lu\n", sect_site2);
			//getc(stdin);
			//break;
			comp_site += 1;
		}
		log_heading("components");
		printf("naof-components | %lu\n", comps[2]);
		printf("const-site | %lu\n", const_site);
		comp_site = 0;
		while(true) {
			if(comp_site == comps[2]) {
				break;
			}
			writer comp = (comps + 3) + (comp_site * 4);
			//printf("comp | %lu\n", comp);
			see_space("comp", comp, 0x18);
			//printf("comp-entree | %s\n", comp[0]);
			clerk_com_site = 0;
			add_to_entree("comp-entree | ", 14, clerk_com, &clerk_com_site);
			add_to_entree(comp[0], comp[1], clerk_com, &clerk_com_site);
			add_to_entree("\n", 1, clerk_com, &clerk_com_site);
			syscall(unix_write, 1, clerk_com, clerk_com_site);
			printf("is-base16 | %lu\n", comp[2]);
			printf("number | %lu\n", comp[3]);
			comp_site += 1;
		}
		if(const_site == 0) {
			const_site = code_b;
		}
		/*
		*/
		stack_ms_site = 0;
		writer comp0 = (comps + 3);
		writer comp1 = (comps + 3) + (4);
		writer comp2 = (comps + 3) + (8);
		writer comp3 = (comps + 3) + (16);
		if(compair_spaces("add", 3, comp0[0], comp0[1])) {
			if(const_site == code_b) {
				stack_names_site = 0;
				add_to_entree(comp1[0], comp1[1], stack_names, &stack_names_site);
				add_to_entree("-", 1, stack_names, &stack_names_site);
				add_to_entree(comp2[0], comp2[1], stack_names, &stack_names_site);
				syscall(unix_write, 1, stack_names, stack_names_site);
				syscall(unix_write, 1, "\n", 1);
				stack_ms_site = asm_add_registers(stack_names, stack_names_site, stack_ms);
			} else {
				if(comps[2] == 3) {
					//printf("adding-const to | %s\n", comp2[0]);
					//printf("naof-register-secs | %lu\n", comp2[1]);
					stack_ms_site = asm_add_const_register(comp2[0], comp2[1], comp1[3], stack_ms);
				}
			}
		} else if(compair_spaces("sub", 3, comp0[0], comp0[1])) {
			if(const_site == code_b) {
				stack_names_site = 0;
				add_to_entree(comp1[0], comp1[1], stack_names, &stack_names_site);
				add_to_entree("-", 1, stack_names, &stack_names_site);
				add_to_entree(comp2[0], comp2[1], stack_names, &stack_names_site);
				syscall(unix_write, 1, stack_names, stack_names_site);
				syscall(unix_write, 1, "\n", 1);
				stack_ms_site = asm_sub_registers(stack_names, stack_names_site, stack_ms);
			} else {
				if(comps[2] == 3) {
					//printf("adding-const to | %s\n", comp2[0]);
					//printf("naof-register-secs | %lu\n", comp2[1]);
					stack_ms_site = asm_sub_const_register(comp2[0], comp2[1], comp1[3], stack_ms);
				}
			}
		} else if(compair_spaces("lea", 3, comp0[0], comp0[1])) {
		} else if(compair_spaces("mov", 3, comp0[0], comp0[1])) {
		}
		see_space("stack-ms", stack_ms, stack_ms_site);
		see_space("ms", (ms + 3), ms[2]);
		if(stack_ms_site > 0) {
			add_string_to_sec_vecter(&grid, stack_ms, stack_ms_site, &ms);
		}
		if(seqs_site >= naof_seqs_secs) {
			break;
		}
	}
	see_space("ms", (ms + 3), ms[2]);
	syscall(unix_unlink, params[2]);
	ip_file ipsecs = syscall(unix_open, params[2], archive_create|archive_write, archive_jypsy);
	syscall(unix_write, ipsecs, (ms + 3), ms[2]);
	syscall(unix_close, ipsecs);
	return 0;
}
