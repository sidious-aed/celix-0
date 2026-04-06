#include "./standard.h"
#define naof_extensions 3

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | equations-symbol\n");
    return;
  }
	quad naof_symbol_secs = get_naof_secs(params[1]);
	source grid = 0;
	sec mnode_name[10000];
	quad mnode_name_site = 0;
	add_to_entree("asms/", 5, mnode_name, &mnode_name_site);
	add_to_entree(params[1], naof_symbol_secs, mnode_name, &mnode_name_site);
	if(mnode_name[mnode_name_site - 1] != "/") {
		mnode_name[mnode_name_site] = '/';
		mnode_name_site += 1;
	}
	printf("mnode-name | %s\n", mnode_name);
	sec snode_name[10000];
	quad snode_name_site = 0;
	add_to_entree(mnode_name, mnode_name_site, snode_name, &snode_name_site);
	wide_com("secs", (snode_name), 4);
	printf("snode-name | %s\n", snode_name);
	sec comand[1000];
	quadrant comand_site = 0;
	sec s_space[10000];
	quadrant s_space_site = 0;
	quadrant_reference nm;
	node_meta(&grid, mnode_name, &nm);
	printf("nm | %lu\n", &nm); // * recoils from swore duty mudra.
	printf("naof-files | %lu\n", nm[2]);
	sec nonce_name[1000];
	quadrant nonce_name_site = get_time_name(nonce_name);
	sec clerk_space[10000];
	writer equations_secs;
	create_vecter(&grid, 1, 0x100000, &equations_secs);
	writer main_secs;
	create_vecter(&grid, 1, 1000, &main_secs);
	sec secs_space[1000000];
	quadrant secs_space_site = 0;
	sec nop[1];
	nop[0] = 0x90;
	sec sites_chart_name[10000];
	quad sites_chart_name_site = 0;
	add_to_entree(snode_name, snode_name_site, sites_chart_name, &sites_chart_name_site);
	add_to_entree("sites.chart", 11, sites_chart_name, &sites_chart_name_site);
	printf("sites-chart-name | %s\n", sites_chart_name);
	//return;
	syscall(unix_unlink, sites_chart_name);
	archive_grid sites_chart = syscall(unix_open, sites_chart_name, archive_write|archive_create, archive_jypsy);
	//printf("sites-chart | %lu\n", sites_chart);
	sec sites_chart_space[10000];
	quadrant sites_chart_space_site = 0;
	//printf("naof-equation-files | %lu\n", (nm[2]));

	sec cs[10000];
	quad cs_site = 0;
	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		//printf("site | %lu\n", site);
		quadrant_reference record = ((nm + 3) + (site * 3));
		site += 1;
		source name = record[0];
		printf("name | %s\n", name);
		quadrant seek_site = record[2] - 1;
		while(true) {
			if(name[seek_site] == '.') {
				seek_site += 1;
				break;
			}
			seek_site -= 1;
		}
		source extension = (record[0] + seek_site);
		quadrant naof_extension_secs = (record[2] - seek_site);
		if(compair_spaces(extension, naof_extension_secs, "asm", 3)) {
			quad naof_name_secs = seek_site - 1;
			quad is_main = compair_spaces(name, naof_name_secs, "main", 4);
			printf("is-main | %lu\n", is_main);
			sec secs_name[1000];
			quadrant secs_name_site = 0;
			add_to_entree(snode_name, snode_name_site, secs_name, &secs_name_site);
			add_to_entree(record[0], seek_site, secs_name, &secs_name_site);
			add_to_entree("secs", 4, secs_name, &secs_name_site);
			cs_site = 0;
			add_to_entree("equation-name | ", 0x10, cs, &cs_site);
			add_to_entree(secs_name, secs_name_site, cs, &cs_site);
			add_to_entree("\n", 1, cs, &cs_site);
			syscall(unix_write, 1, cs, cs_site);
			syscall(unix_unlink, secs_name);
			// 15 | 30 | 33 | 6 | 7 | 27 <--> * might be salter
			if(is_main) {
				continue;
			} else {
				comand_site = 0;
				add_to_entree("./sequences ", 12, comand, &comand_site);
				add_to_entree(mnode_name, mnode_name_site, comand, &comand_site);
				add_to_entree(record[0], record[2], comand, &comand_site);
				add_to_entree(" ", 1, comand, &comand_site);
				add_to_entree(secs_name, secs_name_site, comand, &comand_site);
				add_to_entree(" 0", 2, comand, &comand_site);
				syscall(unix_write, 1, comand, (comand_site));
				syscall(unix_write, 1, "\n", 1);
				system(comand);
			}
			archive_grid secs_file = syscall(unix_open, secs_name, archive_read);
			quad naof_secs_file_secs = syscall(unix_lseek, secs_file, 0, seek_completion);
			syscall(unix_lseek, secs_file, 0, seek_origin);
			//printf("secs-file | %lu\n", secs_file);
			quadrant needs_zit_ziting = false;
			if(secs_file == code_a) {
				/*
				s_space_site = 0;
				add_to_entree("./sequences-full", 16, s_space, &s_space_site);
				add_to_entree((comand + 11), (comand_site - 23), s_space, &s_space_site);
				syscall(unix_write, 1, s_space, s_space_site);
				syscall(unix_write, 1, "\n", 1);
				system(s_space);
				*/
				syscall(unix_write, 1, "<--> | need tweaks and or zit-zit fixes for ", 44);
				syscall(unix_write, 1, record[0], record[2]);
				syscall(unix_write, 1, "\n", 1);
				syscall(unix_exit_group, 0);
			} else {
				add_to_vecter(&grid, nop, &equations_secs);
				quad equations_site = equations_secs[2];
				quad naof_ems_secs = 0;
				while(true) {
					secs_space_site = syscall(unix_read, secs_file, secs_space, 1000000);
					if(secs_space_site == 0) {
						break;
					}
					add_string_to_sec_vecter(&grid, secs_space, secs_space_site, &equations_secs);
					naof_ems_secs += secs_space_site;
				}
				syscall(unix_close, secs_file);
				printf("at an equation.\n");
				quadrant equations_secs_site = equations_secs[2];
				sites_chart_space_site = 0;
				add_to_entree(name, (naof_name_secs), (sites_chart_space), &sites_chart_space_site);
				add_to_entree("|", 1, sites_chart_space, &sites_chart_space_site);
				sites_chart_space_site += number_to_entree(equations_site, (sites_chart_space + sites_chart_space_site), 16);
				add_to_entree("\n", 1, sites_chart_space, &sites_chart_space_site);
				syscall(unix_write, sites_chart, sites_chart_space, sites_chart_space_site);
				add_to_vecter(&grid, nop, &equations_secs);
				syscall(unix_close, secs_file);
				printf("equations-site | %lu\n", equations_secs[2]);
			}
		}
	}
	syscall(unix_close, sites_chart);
	sec full_name[10000];
	quad full_name_site = 0;
	add_to_entree(snode_name, snode_name_site, full_name, &full_name_site);
	add_to_entree(params[1], naof_symbol_secs, full_name, &full_name_site);
	add_to_entree(".secs", 5, full_name, &full_name_site);
	printf("full-name | %s\n", full_name);
	syscall(unix_unlink, full_name);

	ip_file ms = syscall(unix_open, full_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, ms, (equations_secs + 3), equations_secs[2]);
	syscall(unix_close, ms);
	sec main_name[10000];
	quad main_name_site = 0;
	add_to_entree(mnode_name, mnode_name_site, main_name, &main_name_site);
	add_to_entree("main.asm", 8, main_name, &main_name_site);

	sec msh_cname[10000];
	quad msh_cname_site = 0;
	sec msh_name[10000];
	quad msh_name_site = 0;
	cs_site = 0;
	//add_to_entree("mshell-name | ", 0xe, cs, &cs_site);
	add_to_entree(full_name, (full_name_site - 4), msh_cname, &msh_cname_site);
	add_to_entree("c", 1, msh_cname, &msh_cname_site);
	//add_to_entree("\n", 1, cs, &cs_site);
	//syscall(unix_write, 1, cs, cs_site);
	add_to_entree(msh_cname, (msh_cname_site - 2), msh_name, &msh_name_site);
	add_to_entree(".msh", (4), msh_name, &msh_name_site);
	syscall(unix_unlink, msh_cname);
	syscall(unix_unlink, msh_name);
	comand_site = 0;
	add_to_entree("./build-mshell ", 0xf, comand, &comand_site);
	add_to_entree(msh_cname, msh_cname_site, comand, &comand_site);
	add_to_entree(" ", 1, comand, &comand_site);
	comand_site += number_to_entree(equations_secs[2], (comand + comand_site), 16);
	add_to_entree("\n", 1, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	comand_site -= 1;
	comand[comand_site] = 0;
	system(comand);
	comand_site = 0;
	add_to_entree("gcc ", 4, comand, &comand_site);
	add_to_entree(msh_cname, msh_cname_site, comand, &comand_site);
	add_to_entree(" -o ", 4, comand, &comand_site);
	add_to_entree(msh_name, (msh_name_site), comand, &comand_site);
	add_to_entree("\n", 1, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	comand_site -= 1;
	comand[comand_site] = 0;
	system(comand);
	comand_site = 0;
	add_to_entree("place ", 6, comand, &comand_site);
	add_to_entree(full_name, full_name_site, comand, &comand_site);
	add_to_entree(" ", 1, comand, &comand_site);
	add_to_entree(msh_name, (msh_name_site), comand, &comand_site);
	add_to_entree(" 607", 4, comand, &comand_site);
	add_to_entree("\n", 1, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	comand_site -= 1;
	comand[comand_site] = 0;
	see_space("comand", comand, (comand_site + 1));
	system(comand);
	/*
	*/
	ip_file mshf = syscall(unix_open, msh_name, archive_read);
	quad naof_mshf_secs = syscall(unix_lseek, mshf, 0, seek_completion);
  source shell_map = syscall(unix_mmap, non, naof_mshf_secs, map_rws, clerk_descreet, mshf, non);
	/*
	*/
	printf("main-name | %s\n", main_name);
	ip_file mainf = syscall(unix_open, main_name, archive_read);
	if(mainf != code_a) {
		comand_site = 0;
		add_to_entree("./sequences ", 12, comand, &comand_site);
		add_to_entree(main_name, main_name_site, comand, &comand_site);
		add_to_entree(" ", 1, comand, &comand_site);
		add_to_entree(snode_name, snode_name_site, comand, &comand_site);
		add_to_entree("main.secs 0", 11, comand, &comand_site);
		printf("comand | %s\n", comand);
		system(comand);

		cs_site = 0;
		add_to_entree(snode_name, snode_name_site, cs, &cs_site);
		add_to_entree("main.secs", 9, cs, &cs_site);
		printf("main-secs-name | %s\n", cs);
		ip_file mainf = syscall(unix_open, cs, archive_read);
		quad naof_mainf_secs = syscall(unix_lseek, mainf, 0, seek_completion);

		wide_com("secs", main_name, 4);
		msh_cname_site = 0;
		add_to_entree(main_name, (main_name_site - 4), msh_cname, &msh_cname_site);
		add_to_entree(".c", 2, msh_cname, &msh_cname_site);
		//add_to_entree("\n", 1, cs, &cs_site);
		//syscall(unix_write, 1, cs, cs_site);
		msh_name_site = 0;
		add_to_entree(msh_cname, (msh_cname_site - 2), msh_name, &msh_name_site);
		add_to_entree(".msh", (4), msh_name, &msh_name_site);
		syscall(unix_unlink, msh_cname);
		syscall(unix_unlink, msh_name);
		printf("msh-cname | %s\n", msh_cname);
		printf("msh-name | %s\n", msh_name);
		comand_site = 0;
		add_to_entree("./build-mshell ", 0xf, comand, &comand_site);
		add_to_entree(msh_cname, msh_cname_site, comand, &comand_site);
		add_to_entree(" ", 1, comand, &comand_site);
		comand_site += number_to_entree(naof_mainf_secs, (comand + comand_site), 16);
		add_to_entree("\n", 1, comand, &comand_site);
		syscall(unix_write, 1, comand, comand_site);
		comand_site -= 1;
		comand[comand_site] = 0;
		system(comand);
		comand_site = 0;
		add_to_entree("gcc ", 4, comand, &comand_site);
		add_to_entree(msh_cname, msh_cname_site, comand, &comand_site);
		add_to_entree(" -o ", 4, comand, &comand_site);
		add_to_entree(msh_name, (msh_name_site), comand, &comand_site);
		add_to_entree("\n", 1, comand, &comand_site);
		syscall(unix_write, 1, comand, comand_site);
		comand_site -= 1;
		comand[comand_site] = 0;
		system(comand);
		comand_site = 0;
		add_to_entree("place ", 6, comand, &comand_site);
		add_to_entree(cs, cs_site, comand, &comand_site);
		add_to_entree(" ", 1, comand, &comand_site);
		add_to_entree(msh_name, (msh_name_site), comand, &comand_site);
		add_to_entree(" 607", 4, comand, &comand_site);
		add_to_entree("\n", 1, comand, &comand_site);
		syscall(unix_write, 1, comand, comand_site);
		comand_site -= 1;
		comand[comand_site] = 0;
		see_space("comand", comand, (comand_site + 1));
		system(comand);
		/*
		*/
	}
	return 0;
}
