#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | singular-asm-entree\n");
    return;
  }
	sec asm_entree[10000];
	quad naof_asm_entree_secs = standardise_entree(params[1], asm_entree);
	//syscall(unix_write, 1, asm_entree, naof_asm_entree_secs);
	//syscall(unix_write, 1, "\n", 1);
	
	ip_file init_ipf = syscall(unix_open, "c-shell.c", archive_read);
	quad naof_c_file_secs = syscall(unix_lseek, init_ipf, 0, seek_com);
	source c_file = syscall(unix_mmap, non, naof_c_file_secs, map_rws, map_console, init_ipf, 0);
	//printf("c-file | %s\n", c_file);
	quadrant naof_com_secs = naof_c_file_secs + 0xa;
	source com_file = syscall(unix_mmap, non, naof_com_secs, map_rws, map_anon|map_console, non, 0);
	quadrant com_site = 0;
	add_to_entree(c_file, c_shell_file_zone_com, com_file, &com_site);
	add_to_entree("\tasm(\"", 6, com_file, &com_site);
	add_to_entree(asm_entree, naof_asm_entree_secs, com_file, &com_site);
	add_to_entree("\");\n", 4, com_file, &com_site);
	add_to_entree((c_file + c_shell_file_zone_com), (naof_c_file_secs - c_shell_file_zone_com), com_file, &com_site);
	//view_header("com file");
	//syscall(unix_write, 1, com_file, com_site);

	//view_header("comands to clerk get machine-secs");
	sec nonce_name[1000];
	quad naof_nonce_name_secs = get_time_name(nonce_name);
	naof_nonce_name_secs -= 5;
	nonce_name[naof_nonce_name_secs] = 'c';
	naof_nonce_name_secs += 1;
	nonce_name[naof_nonce_name_secs] = 0;
	//syscall(unix_write, 1, nonce_name, naof_nonce_name_secs);
	//syscall(unix_write, 1, "\n", 1);
	ip_file c_com_file = syscall(unix_open, nonce_name, archive_write|archive_create, archive_jypsy);
	//printf("c-com-file | %lu\n", c_com_file);
	syscall(unix_write, c_com_file, com_file, com_site);
	syscall(unix_close, c_com_file);
	sec nonce_bin_name[1000];
	quad naof_nonce_bin_name_secs = 0;
	add_to_entree(nonce_name, naof_nonce_name_secs - 2, nonce_bin_name, &naof_nonce_bin_name_secs);
	sec comand[10000];
	quad comand_site = 0;
	add_to_entree("gcc ", 4, comand, &comand_site);
	add_to_entree(nonce_name, naof_nonce_name_secs, comand, &comand_site);
	add_to_entree(" -o ", 4, comand, &comand_site);
	add_to_entree(nonce_bin_name, naof_nonce_bin_name_secs, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	syscall(unix_write, 1, "\n", 1);
	system(comand);
	syscall(unix_unlink, nonce_name);
	ip_file bin_file = syscall(unix_open, nonce_bin_name, archive_read);
	if(bin_file != code_a) {
		comand_site = 0;
		add_to_entree("objdump -d ", 11, comand, &comand_site);
		add_to_entree(nonce_bin_name, naof_nonce_bin_name_secs, comand, &comand_site);
		add_to_entree(" > ", 3, comand, &comand_site);
		naof_nonce_name_secs = get_time_name(nonce_name);
		add_to_entree(nonce_name, naof_nonce_name_secs, comand, &comand_site);
		syscall(unix_write, 1, comand, comand_site);
		syscall(unix_write, 1, "\n", 1);
		system(comand);
		syscall(unix_unlink, nonce_bin_name);

		sec seek[1000];
		quad naof_seek_secs = number_to_entree(c_shell_binary_zone, seek, 16);
		seek[naof_seek_secs] = ':';
		naof_seek_secs += 1;
		ip_file obj_ipf = syscall(unix_open, nonce_name, archive_read);
		quad naof_obj_file_secs = syscall(unix_lseek, obj_ipf, 0, seek_com);
		source obj_file = syscall(unix_mmap, non, naof_obj_file_secs, map_rws, map_console, obj_ipf, 0);
		squad seek_site = seek_space(seek, naof_seek_secs, obj_file, naof_obj_file_secs) + naof_seek_secs;
		while(true) {
			sec rune = obj_file[seek_site];
			if((rune != ' ') && (rune != '\t')) {
				break;
			}
			seek_site += 1;
		}
		//printf("obj-file-from-seek | %s\n", (obj_file + seek_site));
		//printf("seek-site | %lu\n", seek_site);
		sec machine_secs[100];
		quad machine_secs_site = 0;
		quad mode = 0;
		sec b16_sec[3];
		sec machine_sec = 0;
		b16_sec[2] = 0;
		quad b16_site = 0;
		while(true) {
			sec rune = obj_file[seek_site];
			seek_site += 1;
			//printf("mode | %lu\n", mode);
			//printf("rune | %c\n", rune);
			if(mode == 0) {
				if((rune == ' ') || (rune == '\t')) {
					//printf("b16-sec | %s\n", b16_sec);
					machine_sec = 0;
					entree_to_number(b16_sec, 2, 16, &machine_sec);
					//printf("machine-sec | %u\n", machine_sec);
					machine_secs[machine_secs_site] = machine_sec;
					machine_secs_site += 1;
					//see_space("machine-secs-b10", machine_secs, machine_secs_site);
					mode = 1;
					continue;
				}
				b16_sec[b16_site] = rune;
				b16_site += 1;
			} else {
				if((rune == ' ') || (rune == '\t')) {
					break;
				} else {
					mode = 0;
					b16_site = 0;
					seek_site -= 1;
				}
			}
			//getc(stdin);
		}
		//printf("seek-site | %lu\n", seek_site);
		squad segment_site = seek_space("\n", 1, obj_file + seek_site, naof_obj_file_secs - seek_site) + 1;
		squad naof_segment_secs = seek_space("\n", 1, obj_file + seek_site, naof_obj_file_secs - seek_site);
		source segment = (obj_file + seek_site + segment_site);
		quad stack_segment = segment;
		segment += seek_space(":", 1, segment, naof_obj_file_secs - (quad)segment) + 1;
		while(true) {
			sec rune = segment[0];
			if((rune != ' ') && (rune != '\t')) {
				break;
			}
			segment += 1;
		}
		//printf("segment | %s\n", segment);
		source at_potential_aux = segment;
		mode = 0;
		while(true) {
			sec rune = segment[0];
			if(rune != '\n') {
				segment += 1;
			}
			//printf("rune | %c\n", rune);
			//printf("mode | %lu\n", mode);
			if(mode == 0) {
				if((rune == ' ') || (rune == '\t') || (rune == '\n')) {
					//printf("b16-sec | %s\n", b16_sec);
					mode = 1;
					continue;
				}
			} else {
				if((rune == ' ') || (rune == '\t') || (rune == '\n')) {
					break;
				} else {
					mode = 0;
					segment -= 1;
				}
			}
		}
		//printf("segment | %s\n", segment);
		//printf("segment | %c | %u\n", segment[0], segment[0]);
		naof_segment_secs = naof_segment_secs - ((quad)segment - stack_segment);
		//syscall(unix_write, 1, (segment), naof_segment_secs);
		//syscall(unix_write, 1, "\n", 1);
		quad is_aux_naof_secs = false;
		if(segment[0] == '\n') {
			is_aux_naof_secs = true;
		} else {
			quad ssite = 0;
			while(true) {
				sec rune = segment[0];
				segment += 1;
				//printf("rune | %c | %u\n", rune, rune);
				ssite += 1;
				if(rune == '\n') {
					is_aux_naof_secs = true;
					break;
				}
				if((rune == ' ') || (rune == '\t')) {
					continue;
				}
				if(((rune >= 48) && (rune <= 57)) || ((rune >= 97) && (rune <= 102))) {
					continue;
				} else {
					break;
				}
			}
		}
		//printf("is-aux-naof-secs | %lu\n", is_aux_naof_secs);
		if(is_aux_naof_secs) {
			b16_site = 0;
			segment = at_potential_aux;
			mode = 0;
			while(true) {
				sec rune = segment[0];
				segment += 1;
				//printf("mode | %lu\n", mode);
				//printf("rune | %c\n", rune);
				if(mode == 0) {
					if((rune == ' ') || (rune == '\t') || (rune == '\n')) {
						//printf("b16-sec | %s\n", b16_sec);
						entree_to_number(b16_sec, b16_site, 16, &machine_sec);
						machine_secs[machine_secs_site] = machine_sec;
						machine_secs_site += 1;
						//see_space("machine-secs-b10", machine_secs, machine_secs_site);
						mode = 1;
						continue;
					}
					b16_sec[b16_site] = rune;
					b16_site += 1;
				} else {
					if((rune == ' ') || (rune == '\t') || (rune == '\n')) {
						break;
					} else {
						mode = 0;
						b16_site = 0;
						segment -= 1;
					}
				}
				//getc(stdin);
			}
		}
		syscall(unix_unlink, nonce_name);

		view_header("the machine secs");
		syscall(unix_write, 1, "asm-entree       | ", 19);
		syscall(unix_write, 1, asm_entree, naof_asm_entree_secs);
		syscall(unix_write, 1, "\n", 1);
		syscall(unix_write, 1, "machine-secs-b16 | ", 0x13);
		see_encoded(machine_secs, machine_secs_site, 16);
		see_space("machine-secs-b10", machine_secs, machine_secs_site);
	} else {
		syscall(unix_write, 1, "<--> | seems asm is not in scope.\n", 0x22);
	}
  return 0;
}
