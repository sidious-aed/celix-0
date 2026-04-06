#include "./clerk.h"

vast i_sim_from_clerk() {
	syscall(unix_write, 1, "i sim.\n", 7);
	return;
}

quadrant clerk_code(source entree, writer entree_site) {
	asm("push %r8");
	asm("mov $0xffffffffffffff80, %rax");
	asm("mov %fs:(%rax), %r8");
	register quadrant rbx asm("r8");
	quadrant code = rbx;
	//asm("xor %r8, %r8");
	//asm("mov %r8, %fs:(%rax)");
	asm("pop %r8");
	if(entree && entree_site) {
		add_to_entree(clerk_syscall_code_entrees[code], clerk_syscall_code_entrees_naof_secs[code], entree, entree_site);
	}
	return code;
}

vast a_pause_for_a_clerk(source nonce_name) {
	archive_grid file = 0;
	while(true) {
		syscall(unix_nanosleep, pause, pause);
		file = syscall(unix_open, nonce_name, archive_read);
		if(file != code_a) {
			printf("file | %lu\n", file);
			quadrant naof_secs = syscall(unix_lseek, file, 0, seek_completion);
			printf("naof-secs | %lu\n", naof_secs);
			syscall(unix_close, file);
			if(naof_secs == 8) {
				break;
			}
		}
	}
	quadrant pid[1];
	pid[0] = 0;
	file = syscall(unix_open, nonce_name, archive_read);
	syscall(unix_read, file, pid, 8);
	syscall(unix_close, file);
	//syscall(unix_unlink, nonce_name);
	//printf("pid | %lu\n", pid[0]);
	sec zdetect[10000];
	sec proc_name[1000];
	quadrant proc_name_site = 0;
	sec status_name[1000];
	quadrant status_name_site = 0;
	add_to_entree("/proc/", 6, proc_name, &proc_name_site);
	proc_name_site += number_to_entree(pid[0], (proc_name + proc_name_site), 10);
	printf("proc-name | %s\n", proc_name);
	add_to_entree(proc_name, proc_name_site, status_name, &status_name_site);
	add_to_entree("/status", 7, status_name, &status_name_site);
	while(true) {
		syscall(unix_nanosleep, pause, pause);
		archive_grid node = syscall(unix_open, proc_name, archive_read);
		//printf("node | %lu\n", node);
		if(node == code_a) {
			break;
		}
		syscall(unix_close, node);
		archive_grid file = syscall(unix_open, status_name, archive_read);
		quadrant naof_read_secs = syscall(unix_read, file, zdetect, 10000);
		//syscall(unix_write, 1, zdetect, naof_read_secs);
		//syscall(unix_write, 1, "\n", 1);
		directional zd = seek_space("State:\tZ (zombie)", 17, zdetect, naof_read_secs);
		syscall(unix_close, file);
		if(zd != -1) {
			break;
		}
	}
	return;
}

// seems there is might potential after an execve syscall that we need to exit_group ourself from our main
// so; where clerk-stay is a nice abstraction, simply replace return 0 in main with syscall(unix_exit_group, 0)
// seems the tty-print-map has some extra result quarks than the chain results of the stock basises
vast clerk_stay(source binary_name, source_vecter params, source_vecter environment, source file_name) {
	sec nonce_name[1000];
	quadrant nonce_name_site = 0;
	add_to_entree("clerk/", 6, nonce_name, &nonce_name_site);
	nonce_name_site += get_time_name((nonce_name + nonce_name_site));
	printf("clerk-file-name | %s\n", nonce_name);
	archive_grid file;
	if(file_name != 0) {
		//printf("file-name | %s\n", file_name);
		file = syscall(unix_open, file_name, archive_write|archive_create, archive_jypsy);
	}
	quadrant et_clerk_pid = syscall(unix_getpid, 0);
	printf("et-clerk-pid | %lu\n", et_clerk_pid);
	quadrant process_id[1];
	process_id[0] = 0;
	quadrant pid = syscall(unix_clone, 0x100011, 0, process_id);
	//printf("process-id | %lu\n", process_id[0]);
	//futex_swtch(switches, switch_site, 11);
	quadrant pause[2] = {0, 0xaed};
	if(pid == 0) {
		quadrant new_clerk_pid = syscall(unix_getpid, 0);
		printf("new-clerk-pid | %lu\n", new_clerk_pid);
		archive_grid clerk_file = syscall(unix_open, nonce_name, archive_create|archive_write, archive_jypsy);
		syscall(unix_write, clerk_file, &new_clerk_pid, 8);
		syscall(unix_close, clerk_file);
		//view_params(4, params);
		if(file_name != 0) {
			quadrant result = syscall(unix_dup2, file, 1);
		}
		//syscall(unix_write, 1, "initing-clerk-stay\n", 19);
		printf("binary-name | %s\n", binary_name);
		getc(stdin);
		syscall(unix_execve, binary_name, params, environment);
		//perror("execve");
		//syscall(unix_exit_group, 0);
		//futex_swtch(switches, switch_site, 0);
		//printf("switch | %lu\n", ((source)(switches))[switch_site]);
		//printf("et-clerk return * ess always meant.\n");
	} else {
		printf("et-clerk-process-id | %lu\n", pid);
		a_pause_for_a_clerk(nonce_name);
		//while(true) {
			//syscall(unix_nanosleep, pause, pause);
		//}
		//printf("et-clerk * ess always meant.\n");
		//printf("pid | %lu\n", pid);
		//syscall(unix_wait4, non, non, non);
		printf("file-name | %lu\n", file_name);
		if(file_name != 0) {
			printf("file | %lu\n", file);
			//getc(stdin);
			syscall(unix_close, file);
		}
	}
	// later maybe; environment still up, maybe meant still warnly
	//syscall(unix_write, 1, "i sim.\n", 7);
	return;
}

quadrant node_meta(writer grid, source node_name, writer rnode_meta) {
	sec nm[1000];
	writer node_meta;
	//printf("grid | %lu\n", grid);
	create_vecter(grid, 0x18, 100, &node_meta);
	//printf("grid | %lu\n", grid);
	archive_grid node = syscall(unix_open, node_name, archive_read);
	//see_space("grid", grid, 0x100);
	//printf("node | %lu\n", node);
	quadrant naof_getdents = 0;
	while(true) {
		//naoify(nm, 1000);
		quadrant naof_secs = syscall(unix_getdents, node, nm, 1000);
		if(naof_secs == 0) {
			break;
		}
		naof_getdents += 1;
		//perror("getdents");
		//printf("naof-secs | %lu\n", naof_secs);
		//see_space("nm", nm, naof_secs);
		quadrant psite = 0;
		while(true) {
			if(psite >= naof_secs) {
				break;
			}
			quadrant rsite = psite;
			psite += 16;
			quadrant naof_record_secs = ((dyno_reference)(nm + psite))[0];
			//see_space("nm-rsite", (nm + rsite), naof_record_secs);
			psite += 2;
			//see_space("nm-psite", (nm + psite), 100);
			quadrant entree_site = psite;
			while(true) {
				if(nm[psite] == 0) {
					break;
				}
				psite += 1;
			}
			quadrant naof_entree_secs = psite - entree_site;
			//syscall(unix_write, 1, (nm + entree_site), naof_entree_secs);
			//syscall(unix_write, 1, "\n", 1);
			quadrant naof_memory_secs = (naof_entree_secs + 1);
			source nm_entree = (nm + entree_site);
			//see_space("nm-psite", (nm + psite), 100);
			psite = rsite + naof_record_secs;
			if((naof_entree_secs == 1 && (nm_entree[0] == '.')) || (naof_entree_secs == 2 && (nm_entree[0] == '.' && nm_entree[1] == '.'))) {
				continue;
			}
			quadrant entree = 0;
			//printf("entree | %lu\n", entree);
			get_grid_secs(grid, naof_memory_secs, &entree);
			//printf("entree | %lu\n", entree);
			naoify(entree, naof_memory_secs);
			place((nm_entree), entree, naof_entree_secs);
			sec record[0x18] = {0, 0, 0};
			// 0-type
			// 1-entree
			// 2-naof-entree-secs
			place(&entree, record, 8);
			place(&nm[(rsite + naof_record_secs - 1)], (record + 8), 1);
			place(&naof_entree_secs, (record + 0x10), 8);
			//see_space("record", record, 0x18);
			add_to_vecter(grid, record, &node_meta);
			//break;
		}
		//printf("\n");
		//break;
	}
	//printf("naof-getdents | %lu\n", naof_getdents);
	//printf("naof-records | %lu\n", node_meta[2]);
	//printf("node-meta | %lu\n", node_meta);
	//see_space("record-0", (node_meta + 3), 0x18);
	rnode_meta[0] = node_meta;
	return 0;
}

vast node_meta_completion(quadrant_reference nm) {
	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		writer record = (nm + 3 + (site * 2));
		//see_space("record", record, 16);
		//printf("entree\t%lu\t%s\n", record[1], record[0]);
		free(record[0]);
		site += 1;
	}
	free(nm[0]);
	return;
}

vast index_chart(source * grid, source chart_name, source * chart, writer index) {
	//printf("index-chart\n");
	//printf("grid | %lu\n", grid[0]);
	//see_space("grid", grid[0], 0x28);
	//getc(stdin);
	archive_grid chart_file = syscall(unix_open, chart_name, archive_read);
	quadrant naof_secs = syscall(unix_lseek, chart_file, 0, seek_completion);
	//printf("naof-secs | %lu\n", naof_secs);
	syscall(unix_lseek, chart_file, 0, seek_origin);
	quadrant chart_breadth = (naof_secs * 2);
	quadrant stack_chart = 0;
	get_grid_secs(grid, chart_breadth, &stack_chart);
	quadrant stack_index = 0;
	quadrant cmeta[2];
	cmeta[0] = naof_secs;
	cmeta[1] = chart_breadth;
	create_vecter(grid, 0x10, 0x100, &stack_index);
	add_to_vecter(grid, cmeta, &stack_index);
	syscall(unix_read, chart_file, stack_chart, naof_secs);
	quadrant site = 0;
	while(true) {
		if(site >= naof_secs) {
			break;
		}
		directional section_site = seek_space("\n", 1, (stack_chart + site), (naof_secs - site));
		if(section_site == -1) {
			break;
		}
		printf("section-site | %lu\n", section_site);
		quadrant meta[2];
		meta[0] = site;
		meta[1] = section_site;
		add_to_vecter(grid, meta, &stack_index);
		site += (section_site + 1);
	}
	index[0] = stack_index;
	printf("index | %lu\n", index);
	chart[0] = stack_chart;
	printf("chart | %lu\n", chart[0]);
	return;
}

vast get_new_chart(source * grid, quadrant chart_breadth, source * chart, writer index) {
	quadrant stack_chart = 0;
	get_grid_secs(grid, chart_breadth, &stack_chart);
	quadrant stack_index = 0;
	quadrant cmeta[2];
	cmeta[0] = 0;
	cmeta[1] = chart_breadth;
	create_vecter(grid, 0x10, 0x100, &stack_index);
	add_to_vecter(grid, cmeta, &stack_index);
	index[0] = stack_index;
	printf("index | %lu\n", index);
	chart[0] = stack_chart;
	printf("chart | %lu\n", chart[0]);
	return;
}

vast add_hash_collumn(source element, quadrant_reference element_site, source name, quadrant naof_name_secs, source entree, quadrant naof_entree_secs) {
	//printf("element | %lu\n", element);
	if(element_site[0] == 0) {
		element[element_site[0]] = '|';
		element_site[0] += 1;
	}
	element_site[0] += number_to_entree(naof_name_secs, (element + element_site[0]), 16);
	element[element_site[0]] = '|';
	element_site[0] += 1;
	add_to_entree(name, naof_name_secs, element, element_site);
	element[element_site[0]] = '|';
	element_site[0] += 1;
	element_site[0] += number_to_entree(naof_entree_secs, (element + element_site[0]), 16);
	element[element_site[0]] = '|';
	element_site[0] += 1;
	add_to_entree(entree, naof_entree_secs, element, element_site);
	element[element_site[0]] = '|';
	element_site[0] += 1;
	//syscall(unix_write, 1, "element | ", 0xa);
	//syscall(unix_write, 1, element, element_site[0]);
	//syscall(unix_write, 1, "\n", 1);
	return;
}

vast add_element(source * grid, source element, quadrant element_site, source * chart, writer * index) {
	//printf("naof-elements | %lu\n", (index[0][2] - 1));
	writer chart_meta = (index[0] + 3);
	//see_space("chart-meta", chart_meta, 0x10);
	quadrant chart_site = chart_meta[0];
	//printf("chart-site | %lu\n", chart_site);
	quadrant chart_breadth = chart_meta[1];
	//printf("chart-breadth | %lu\n", chart_breadth);
	quadrant et_site = (chart_site + element_site);
	quadrant com_site = (et_site + 1);
	//printf("com-site | %lu\n", com_site);
	quadrant naof_com_secs = (element_site + 1);
	if(com_site >= chart_breadth) {
		//printf("expanding chart.\n");
		//getc(stdin);
		chart_breadth = ((chart_breadth * 2) + (naof_com_secs));
		quadrant stack_chart = 0;
		get_grid_secs(grid, chart_breadth, &stack_chart);
		place(chart[0], stack_chart, chart_site);
		chart[0] = stack_chart;
	}
	//printf("naof-elements | %lu\n", (index[0][2] - 1));
	//printf("adding element.\n");
	//syscall(unix_write, 1, (chart[0] + chart_site), element_site);
	place(element, (chart[0] + chart_site), element_site);
	chart[0][et_site] = '\n';
	chart_meta[0] = com_site;
	chart_meta[1] = chart_breadth;
	//printf("adding index.\n");
	quadrant cmeta[2];
	cmeta[0] = (chart_site);
	cmeta[1] = (element_site);
	//printf("cmeta-site | %lu\n", cmeta[0]);
	//printf("cmeta-chart-site | %lu\n", cmeta[1]);
	//printf("\n");
	add_to_vecter(grid, cmeta, index);
	return;
}

vast save_chart(source chart, writer index, source name) {
	writer chart_meta = (index + 3);
	quadrant chart_site = chart_meta[0];
	//printf("naof-secs | %lu\n", chart_site);
	syscall(unix_unlink, name);
	syscall(unix_write, 1, chart, chart_site);
	archive_grid chart_file = syscall(unix_open, name, archive_create|archive_write, archive_arws);
	syscall(unix_write, chart_file, chart, chart_site);
	syscall(unix_close, chart_file);
	return;
}


vast get_chart_element(source chart, writer index, quadrant site, source element, writer element_site) {
	writer rmeta = chart_index_at(index, site);
	see_space("rmeta", rmeta, 0x10);
	place((chart + rmeta[0]), element, rmeta[1]);
	element_site[0] = rmeta[1];
	element[element_site[0]] = 0;
	return;
}

vast get_collumn(source element, quadrant element_site, source collumn_name, quadrant naof_collumn_name_secs, source collumn, writer collumn_site) {
	quadrant site = 1;
	while(true) {
		source at = (element + site);
		directional seek_site = seek_space("|", 1, (at), (element_site - site));
		quadrant naof_name_secs = 0;
		entree_to_number((at), seek_site, 16, &naof_name_secs);
		//printf("naof-name-secs | %lu\n", naof_name_secs);
		site += (seek_site + 1);
		at = (element + site);
		//printf("element-at | %s\n", (at));
		source name = at;
		site += (naof_name_secs + 1);
		at = (element + site);
		seek_site = seek_space("|", 1, (at), (element_site - site));
		quadrant naof_collumn_secs = 0;
		entree_to_number(at, seek_site, 16, &naof_collumn_secs);
		//printf("naof-collumn-secs | %lu\n", naof_collumn_secs);
		site += (seek_site + 1);
		at = (element + site);
		seek_site = seek_space("|", 1, (at), (element_site - site));
		if(compair_spaces(name, naof_name_secs, collumn_name, naof_collumn_name_secs)) {
			place(at, collumn, naof_collumn_secs);
			collumn_site[0] = naof_collumn_secs;
			collumn[collumn_site[0]] = 0;
			break;
		}
		site += (seek_site + 1);
		at = (element + site);
		//getc(stdin);
	}
	return;
}

// vasterlea; was answering the priorlies of the creedists leviests, the moste wrongfull ask in the essentials of ask.
// in part to, in part to it meant, warm mabe even, in answer vasterlea to the mix of ask, meant warm for course bearing,
// in the climate, with all respects to mitocondria, meant warm for sitch understand to persays in refinement, were it
// meant warm to conjure into the didactic, where bracin in sitch, in part to philosophy, is with all respects to quartz.
quadrant through_element(source chart, writer index, quadrant esite, source * rname, quadrant_reference rname_site, source rentree, quadrant_reference rentree_site, quadrant site) {
	//printf("esite | %lu\n", esite);
	writer rmeta = chart_index_at(index, esite);
	//see_space("rmeta", rmeta, 0x10);
	//syscall(unix_write, 1, "record | ", 9);
	//syscall(unix_write, 1, (chart + rmeta[0]), rmeta[1]);
	//syscall(unix_write, 1, "\n", 1);
	source element = ((chart + rmeta[0]));
	quadrant element_site = ((rmeta[1]));
	if(site == 0) {
		site = 1;
	}
	//printf("site | %lu\n", site);
	//printf("element-site | %lu\n", element_site);
	while(true) {
		//printf("site | %lu\n", site);
		source at = (element + site);
		//printf("at | %s\n", at);
		directional seek_site = seek_space("|", 1, (at), (element_site - site));
		quadrant naof_name_secs = 0;
		entree_to_number((at), seek_site, 16, &naof_name_secs);
		//printf("naof-name-secs | %lu\n", naof_name_secs);
		site += (seek_site + 1);
		at = (element + site);
		//printf("element-at | %s\n", (at));
		source name = at;
		site += (naof_name_secs + 1);
		at = (element + site);
		seek_site = seek_space("|", 1, (at), (element_site - site));
		quadrant naof_collumn_secs = 0;
		entree_to_number(at, seek_site, 16, &naof_collumn_secs);
		//printf("naof-collumn-secs | %lu\n", naof_collumn_secs);
		site += (seek_site + 1);
		at = (element + site);
		source collumn = at;
		//printf("element-site | %lu\n", element_site);
		//printf("at | %s\n", at);
		seek_site = seek_space("|", 1, (at), (element_site - site));
		//printf("seek-site | %lu\n", seek_site);
		rname_site[0] = naof_name_secs;
		//printf("rname-site | %lu\n", rname_site[0]);
		//printf("rname-sec-site-0 | %u\n", rname[0]);
		place((name), rname, rname_site[0]);
		rentree_site[0] = naof_collumn_secs;
		//printf("rentree-site | %lu\n", rentree_site[0]);
		place((collumn), rentree, rentree_site[0]);
		//printf("site | %lu\n", site);
		site += (seek_site + 1);
		//printf("site | %lu\n", site);
		at = (element + site);
		//printf("at | %s\n", at);
		if((site + 2) >= element_site) {
			//printf("at element com.\n");
			return code_a;
		}
		break;
	}
	return site;
}

vast view_index(writer index) {
	printf("in view-index.\n");
	writer chart_meta = (index + 3);
	printf("chart-site | %lu\n", chart_meta[0]);
	printf("chart-breadth | %lu\n", chart_meta[1]);
	printf("naof-elements | %lu\n", naof_chart_elements(index));
	quadrant esite = 0;
	while(true) {
		if(esite == naof_chart_elements(index)) {
			break;
		}
		writer rmeta = chart_index_at(index, esite);
		see_space("rmeta", rmeta, 0x10);
		esite += 1;
	}
	return;
}

vast view_full_chart(source * grid, source chart, writer index, writer view_chart) {
	view_chart[2] = 0;
	printf("in view-chart.\n");
	sec collumn_name[1000];
	quadrant collumn_name_site = 0;
	sec collumn_entree[1000];
	quadrant collumn_entree_site = 0;
	writer chart_meta = (index + 3);
	quadrant esite = 0;
	while(true) {
		if(esite == naof_chart_elements(index)) {
			break;
		}
		quadrant site = 0;
		while(true) {
			printf("site | %lu\n", site);
			site = through_element(chart, index, esite, collumn_name, &collumn_name_site, collumn_entree, &collumn_entree_site, site);
			syscall(unix_write, 1, "collumn-name | ", 0xf);
			syscall(unix_write, 1, collumn_name, collumn_name_site);
			syscall(unix_write, 1, "\n", 1);
			syscall(unix_write, 1, "collumn-entree | ", 0x11);
			syscall(unix_write, 1, collumn_entree, collumn_entree_site);
			syscall(unix_write, 1, "\n", 1);
			quadrant vsite = 0;
			while(true) {
				if(vsite == view_chart[2]) {
					vsite = code_a;
					break;
				}
				printf("vsite | %lu\n", vsite);
				writer view = ((view_chart + 3) + (vsite * 3));
				if(compair_spaces(collumn_name, collumn_name_site, view[0], view[1])) {
					break;
				}
				vsite += 1;
			}
			printf("vsite | %lu\n", vsite);
			if(vsite == code_a) {
				quadrant view_record[3];
				quadrant name_entree = 0;
				get_grid_secs(grid, (collumn_name_site + 1), &name_entree);
				printf("name-entree | %lu\n", name_entree);
				view_record[0] = name_entree;
				place(collumn_name, view_record[0], collumn_name_site);
				view_record[1] = collumn_name_site;
				view_record[2] = collumn_name_site;
				vsite = view_chart[2];
				add_to_vecter(grid, view_record, &view_chart);
				printf("view-record[0] | %s\n", view_record[0]);
			}
			writer view = ((view_chart + 3) + (vsite * 3));
			printf("collumn-entree-site | %lu\n", collumn_entree_site);
			see_space("view", view, 0x18);
			//if(esite == 0x100) {
				//printf("at | %s\n", (chart + ((index + 3) + (esite * 2))[0] + site));
				//getc(stdin);
			//}
			if(collumn_entree_site > view[2]) {
				view[2] = collumn_entree_site;
			}
			if(site == code_a) {
				break;
			}
			printf("i sim. | %lu\n", site);
		}

		//syscall(unix_write, 1, "\n", 1);
		esite += 1;
	}

	printf("at header print.\n");
	sec bar_space[1000];
	quadrant bar_site = 0;
	sec clerk_space[naof_clerk_space_secs];
	quadrant clerk_space_site = 0;
	quadrant vsite = 0;
	while(true) {
		if(vsite == view_chart[2]) {
			break;
		}
		writer view = ((view_chart + 3) + (vsite * 3));
		if(vsite == 0) {
			add_to_entree("| ", 2, clerk_space, &clerk_space_site);
		} else {
			add_to_entree(" | ", 3, clerk_space, &clerk_space_site);
		}
		add_to_entree(view[0], view[1], clerk_space, &clerk_space_site);
		if(view[1] < view[2]) {
			quadrant naof_spaces = view[2] - view[1];
			clerk_space_site += replicate(' ', (clerk_space + clerk_space_site), naof_spaces);
		}
		vsite += 1;
	}
	add_to_entree(" |", 2, clerk_space, &clerk_space_site);
	clerk_space[clerk_space_site] = '\n';
	bar_site = replicate('-', bar_space, clerk_space_site);
	bar_space[bar_site] = '\n';
	bar_site += 1;
	clerk_space_site += 1;
	syscall(unix_write, 1, bar_space, bar_site);
	syscall(unix_write, 1, clerk_space, clerk_space_site);

	esite = 0;
	while(true) {
		if(esite == naof_chart_elements(index)) {
			break;
		}
		quadrant site = 0;
		clerk_space_site = 0;
		while(true) {
			site = through_element(chart, index, esite, collumn_name, &collumn_name_site, collumn_entree, &collumn_entree_site, site);
			quadrant vsite = 0;
			while(true) {
				if(vsite == view_chart[2]) {
					break;
				}
				writer view = ((view_chart + 3) + (vsite * 3));
				if(compair_spaces(collumn_name, collumn_name_site, view[0], view[1])) {
					break;
				}
				vsite += 1;
			}
			writer view = ((view_chart + 3) + (vsite * 3));

			if(vsite == 0) {
				add_to_entree("| ", 2, clerk_space, &clerk_space_site);
			} else {
				add_to_entree(" | ", 3, clerk_space, &clerk_space_site);
			}
			add_to_entree(collumn_entree, collumn_entree_site, clerk_space, &clerk_space_site);
			if(collumn_entree_site < view[2]) {
				quadrant naof_spaces = view[2] - collumn_entree_site;
				clerk_space_site += replicate(' ', (clerk_space + clerk_space_site), naof_spaces);
			}

			if(site == code_a) {
				break;
			}
			//printf("site | %lu\n", site);
		}
		add_to_entree(" |\n", 3, clerk_space, &clerk_space_site);
		syscall(unix_write, 1, clerk_space, clerk_space_site);

		//syscall(unix_write, 1, "\n", 1);
		esite += 1;
	}
	syscall(unix_write, 1, bar_space, bar_site);
	/*
	*/
	return;
}

/*
vast view_elements(source chart, writer index, writer view_sites) {
	writer chart_meta = (index + 3);
	quadrant site = 0;
	while(true) {
		if(site == view_sites[2]) {
			break;
		}
		quadrant vsite =(rsite = (view_sites + 3) + (site * 2));
		rmeta = ((index + 3) + (vsite * 2));
		site += 1;
	}
	return;
}
*/

// inbraishinamic-clerk
// works with clerk node
quadrant get_nao_file(squad naof_secs) {
	sec nao_space[1000000];
	naoify(nao_space, 1000000);
	sec name[10000];
	quadrant name_site = 0;
	add_to_entree("clerk/", 6, name, &name_site);
	syscall(unix_mkdir, name, archive_jypsy);
	name_site += get_time_name((name + name_site));
	syscall(unix_write, 1, name, name_site);
	syscall(unix_write, 1, "\n", 1);
	archive_grid nao_file = syscall(unix_open, name, archive_write|archive_create, archive_jypsy);
	squad naof_secs_to_write = naof_secs;
	while(true) {
		quadrant naof_write_secs = 1000000;
		naof_secs_to_write -= 1000000;
		if(naof_secs_to_write < 0) {
			naof_secs_to_write += 1000000;
			naof_write_secs = naof_secs_to_write;
		}
		syscall(unix_write, nao_file, nao_space, naof_write_secs);
		naof_secs_to_write -= naof_write_secs;
		if(naof_secs_to_write == 0) {
			break;
		}
	}
	syscall(unix_close, nao_file);
	nao_file = syscall(unix_open, name, archive_read);
	return nao_file;
}

vast clear_clerk_bin() {
	sec comand[1000];
	quad comand_site = 0;
	add_to_entree("rm -r clerk", 11, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	syscall(unix_write, 1, "\n", 1);
	system(comand);
}

quadrant get_naof_lines(source file_name) {
	//printf("file-name | %s\n", file_name);
	sec clerk_space[10000];
	archive_grid file = syscall(unix_open, file_name, archive_read);
	//printf("file | %lu\n", file);
	if(file == code_a) {
		return 0;
	}
	quadrant line_site = 0;
	quadrant site = 0;
	while(true) {
		//printf("site | %lu\n", site);
		syscall(unix_lseek, file, site, seek_origin);
		quadrant naof_secs = syscall(unix_read, file, clerk_space, 10000);
		//perror("read");
		//printf("naof-secs | %lu\n", naof_secs);
		if(naof_secs == 0) {
			break;
		}
		directional segment_site = seek_space("\n", 1, clerk_space, naof_secs);
		if(line_site == code_a || line_site == code_b) {
			break;
		}
		site += (segment_site + 1);
		line_site += 1;
	}
	return line_site;
}

vast view_params(quadrant naof_params, source_vecter params) {
	quadrant psite = 0;
	while(true) {
		if(psite == naof_params) {
			break;
		}
		printf("param-%lu | %s\n", psite, params[psite]);
		psite += 1;
	}
	printf("naof-params | %lu\n", naof_params);
	return;
}
