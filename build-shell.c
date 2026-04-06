#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | proc-names\n");
    printf("2 | shell-name\n");
    return;
  }
	// cs | clerk-space synonomous with cp | (clerk-pages|clerk-parchment) <--> * (es) always mean-(t)
	sec cs[10000];
	quad cs_site = 0;
	quadrant naof_proc_names_secs = get_naof_secs(params[1]);
	quadrant naof_shell_name_secs = get_naof_secs(params[2]);
	if(compair_spaces((params[2] + naof_shell_name_secs - 2), 2, ".c", 2) == false) {
		cs_site = 0;
		// <--> interesting that 0x53 is 83.
		add_to_entree("<--> esoteric-wide-standards is a c extension for shell-name please suffix with .c\n", 0x53, cs, &cs_site);
																																																	// <--> in short russian
		syscall(unix_write, 1, cs, cs_site);
		syscall(unix_exit_group, 0);
	}
	source procs_entree = params[1];
	quad proc_names_fi = true;
	squad sect_site = seek_space("[", 1, (procs_entree), (naof_proc_names_secs));
	if(sect_site == code_a) {
		proc_names_fi = false;
	}
	sect_site = seek_space("]", 1, (procs_entree), (naof_proc_names_secs));
	if(sect_site == code_a) {
		proc_names_fi = false;
	}
	if(proc_names_fi == false) {
		cs_site = 0;
		add_to_entree("<--> proc-names are a simple space sectioned vecter | [secs/equations/get-naof-secs.secs secs/equations/main.secs]\n", 0x73, cs, &cs_site);
		syscall(unix_write, 1, cs, cs_site);
		syscall(unix_exit_group, 0);
	}

	quad msite = 0;
	writer grid = 0;
	writer procs = 0;
	create_vecter(&grid, 0x18, 100, &procs);
	quad site = 1;
	while(true) {
		printf("site | %lu\n", site);
		quad is_com = false;
		scroll_to_then(procs_entree, &site);
		squad sect_site = seek_space(" ", 1, (procs_entree + site), (naof_proc_names_secs - site));
		if(sect_site == code_a) {
			sect_site = seek_space("]", 1, (procs_entree + site), (naof_proc_names_secs - site));
			is_com = true;
		}
		printf("at | %s\n", (procs_entree + site));
		printf("sect-site | %ld\n", sect_site);
		printf("is-com | %lu\n", is_com);
		if(sect_site != code_a) {
			source proc_name = 0;
			get_grid_secs(&grid, (sect_site + 1), &proc_name);
			wide_com((procs_entree + site), proc_name, sect_site);
			printf("proc-name | %s\n", proc_name);
			quad proc[3];
			proc[0] = proc_name;
			proc[1] = sect_site;
			proc[2] = msite;
			add_to_vecter(&grid, proc, &procs);

			ip_file procf = syscall(unix_open, proc_name, archive_read);
			if(procf == code_a) {
				cs_site = 0;
				add_to_entree("<--> could not find proc-secs named |", 0x25, cs, &cs_site);
				add_to_entree(proc_name, sect_site, cs, &cs_site);
				add_to_entree("\n", 0x1, cs, &cs_site);
				syscall(unix_write, 1, cs, cs_site);
				syscall(unix_exit_group, 0);
			}
			msite += syscall(unix_lseek, procf, 0, seek_completion);
			site += (sect_site + 1);
		}
		if(is_com) {
			break;
		}
		scroll_to_then(procs_entree, &site);
	}
	//see_space("procs", procs, 0x18);

	sec shell_secs_name[10000];
	quad shell_secs_name_site = 0;
	add_to_entree(params[2], (naof_shell_name_secs - 2), shell_secs_name, &shell_secs_name_site);
	add_to_entree(".proc", 5, shell_secs_name, &shell_secs_name_site);
	printf("shell-secs-name | %s\n", shell_secs_name);
	syscall(unix_unlink, shell_secs_name);

	ip_file shell_secsf = syscall(unix_open, shell_secs_name, archive_create|archive_write, archive_jypsy);
	printf("naof-procs | %lu\n", procs[2]);
	site = 0;
	while(true) {
		if(site == procs[2]) {
			break;
		}
		writer proc = (procs + 3) + (site * 3);
		printf("proc | %s\n", proc[0]);
		printf("naof-name-secs | %lu\n", proc[1]);
		printf("msite | %lu\n", proc[2]);
		ip_file secsf = syscall(unix_open, proc[0], archive_read);
		quad naof_fsecs = syscall(unix_lseek, secsf, 0, seek_completion);
		syscall(unix_lseek, secsf, 0, seek_origin);
		syscall(unix_sendfile, shell_secsf, secsf, 0, naof_fsecs);
		syscall(unix_close, secsf);
		site += 1;
	}
	syscall(unix_close, shell_secsf);
	/*
	*/

	writer shell_com = 0;
	create_vecter(&grid, 1, 10000, &shell_com);

	source shell_shell_name = "shell.c";
  archive_grid shell_shell_file = syscall(unix_open, shell_shell_name, archive_read);
  quadrant naof_shell_map_secs = syscall(unix_lseek, shell_shell_file, 0, seek_completion);
  source shell_map = syscall(unix_mmap, non, naof_shell_map_secs, map_rws, clerk_descreet, shell_shell_file, non);
  source new_shell_map = syscall(unix_mmap, non, (naof_shell_map_secs + 0x1000), map_rws, map_cloe, non, non);
	printf("shell-map | %s\n", shell_map);

	squad source_site = seek_space("\tquad naof_procf_secs;\n", 23, (shell_map), naof_shell_map_secs);
	add_string_to_sec_vecter(&grid, (shell_map), (source_site + 23), &shell_com);
	source_site += (23);

	sec base[1000];
	quad base_site = 0;
	site = 0;
	while(true) {
		if(site == procs[2]) {
			break;
		}
		writer proc = (procs + 3) + (site * 3);
		printf("proc | %s\n", proc[0]);
		printf("naof-name-secs | %lu\n", proc[1]);
		printf("msite | %lu\n", proc[2]);
		cs_site = 0;
		add_to_entree(proc[0], (proc[1] - 4), cs, &cs_site);
		add_to_entree("msh", 3, cs, &cs_site);
		add_string_to_sec_vecter(&grid, ("\tsource proc_name"), (17), &shell_com);
		base_site = number_to_entree(site, base, 0x10);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, (" = \""), (4), &shell_com);
		add_string_to_sec_vecter(&grid, (cs), (cs_site), &shell_com);
		//wide_com("msh", (((source)(shell_com + 3))), 3);
		add_string_to_sec_vecter(&grid, ("\";\n"), (3), &shell_com);
		add_string_to_sec_vecter(&grid, ("\tpf = syscall(unix_open, proc_name"), (34), &shell_com);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, (", archive_read);\n"), (17), &shell_com);
		add_string_to_sec_vecter(&grid, ("\tnaof_procf_secs = syscall(unix_lseek, pf, 0, seek_completion);\n"),(64), &shell_com);
		add_string_to_sec_vecter(&grid, ("\tsource map"), (11), &shell_com);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, (" = syscall(unix_mmap, non, naof_procf_secs, map_rws, clerk_descreet, pf, non);\n"), (79), &shell_com);
		add_string_to_sec_vecter(&grid, ("\tprintf(\"map | %lu\\n\", map"), 26, &shell_com);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, (");\n"), (3), &shell_com);
		//add_string_to_sec_vecter(&grid, ("\tprintf(\"i sim. | %lu\", number);\n"), (33), &shell_com);
		add_string_to_sec_vecter(&grid, ("\tsyscall(unix_close, pf);\n"), (26), &shell_com);
		add_string_to_sec_vecter(&grid, ("\n"), (1), &shell_com);
		site += 1;
	}


	//printf("at | %s\n", (shell_map + source_site));
	squad in_main_site = seek_space("\tstack[0] = map;\n", 11, (shell_map + source_site), (naof_shell_map_secs - source_site));
	add_string_to_sec_vecter(&grid, (shell_map + source_site), (in_main_site), &shell_com);
	add_string_to_sec_vecter(&grid, ("\tip_file rf = syscall(unix_open, \"/dev/random\", archive_read);\n"), (0x3f), &shell_com);
	add_string_to_sec_vecter(&grid, ("\tsyscall(unix_read, rf, stack, 0x3d0900);\n"), (42), &shell_com);
	add_string_to_sec_vecter(&grid, ("\tsyscall(unix_close, rf);\n"), (26), &shell_com);
	//	<--> * awesomes are awesome. always meant.

	site = 0;
	while(true) {
		if(site == procs[2]) {
			break;
		}
		writer proc = (procs + 3) + (site * 3);
		printf("proc | %s\n", proc[0]);
		printf("naof-name-secs | %lu\n", proc[1]);
		printf("msite | %lu\n", proc[2]);
		base_site = number_to_entree(site, base, 0x10);
		add_string_to_sec_vecter(&grid, ("\tstack["), (7), &shell_com);
		base_site = number_to_entree(((site)), base, 0xa);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, ("] = map"), 7, &shell_com);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, " + 0x607;\n", (0xa), &shell_com);
		site += 1;
	}
	add_string_to_sec_vecter(&grid, "\tasm(\"mov 0x0(%rsp), %r8\");\n", (0x1c), &shell_com);

	/*
	source gnu_registers[16] = {"r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15", "rax", "rbx", "rcx", "rdx", "rdi", "rsi", "rsp", "rbp", "rip"};
	quadrant gnu_registers_naof_secs[16] = {2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3};
	//add_string_to_sec_vecter(&grid, ("\tasm(\"mov -0x1000(%rbp), %r8\");\n"), (32), &shell_com);
	site = 0;
	while(true) {
		if(site == procs[2]) {
			break;
		}
		writer proc = (procs + 3) + (site * 3);
		printf("proc | %s\n", proc[0]);
		printf("naof-name-secs | %lu\n", proc[1]);
		printf("msite | %lu\n", proc[2]);
		add_string_to_sec_vecter(&grid, ("\tasm(\"mov 0x"), (12), &shell_com);
		base_site = number_to_entree(((site * 8)), base, 16);
		add_string_to_sec_vecter(&grid, (base), (base_site), &shell_com);
		add_string_to_sec_vecter(&grid, ("(%rsp), %"), 9, &shell_com);
		add_string_to_sec_vecter(&grid, gnu_registers[site], gnu_registers_naof_secs[site], &shell_com);
		add_string_to_sec_vecter(&grid, ("\");\n"), 4, &shell_com);

		add_string_to_sec_vecter(&grid, ("\tasm(\"add $0x607, %"), (19), &shell_com);
		add_string_to_sec_vecter(&grid, gnu_registers[site], gnu_registers_naof_secs[site], &shell_com);
		add_string_to_sec_vecter(&grid, ("\");\n"), 4, &shell_com);
		site += 1;
	}
	*/

	/*
	*/
	squad in_main_com_site = seek_space("\tasm(\"add $0x607, %r8\");\n", 0x19, shell_map, naof_shell_map_secs);
	printf("in-main-com-site | %lu\n", in_main_com_site);
	add_string_to_sec_vecter(&grid, (shell_map + in_main_com_site + 0x19), (naof_shell_map_secs - (in_main_com_site + 0x19)), &shell_com);
	syscall(unix_write, 1, (shell_com + 3), shell_com[2]);

	source shell_name = params[2];
	syscall(unix_unlink, shell_name);
	ip_file shellf = syscall(unix_open, shell_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, shellf, (shell_com + 3), shell_com[2]);
	syscall(unix_close, shellf);
	/*
	*/
  return 0;
}
