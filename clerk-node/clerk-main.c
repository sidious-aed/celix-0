#include "./clerk.h"

quadrant main(quadrant naof_params, source_vecter params) {
	quadrant pause[2] = {0, 0xaed};
	sec time_name[1000];
	quadrant naof_secs = get_time_name(time_name);
	syscall(unix_write, 1, time_name, naof_secs);
	syscall(unix_write, 1, "\n", 1);

	/*
	 - memory from standard
	*/
	source grid = 0;
	printf("grid | %lu\n", grid);
	quadrant entree = 0;
	get_grid_secs(&grid, 0xf4240, &entree);
	writer qgrid = grid;
	source tabs = qgrid[4];
	printf("grid | %lu\n", grid);
	see_space("grid", grid, (0x28));
	printf("entree | %lu\n", entree);
	//see_space("tabs", tabs, (qgrid[3] * 0x10));

	quadrant site = 0;
	while(true) {
		if(site == 0x100) {
			break;
		}
		//printf("site | %lu\n", site);
		quadrant tentree = 0;
		tentree = get_grid_secs(&grid, 0x8, &tentree);
		site += 1;
	}
	/*
	*/

	/*
	qgrid = grid;
	tabs = qgrid[4];
	printf("grid | %lu\n", grid);
	printf("entree-2 | %lu\n", entree2);
	qgrid = grid;
	tabs = qgrid[4];
	printf("grid | %lu\n", grid);
	printf("entree-3 | %lu\n", entree3);
	//see_space("meta", grid, (0x28));
	//see_space("tabs", tabs, (qgrid[3] * 0x10));
	*/
	//printf("grid | %lu\n", grid);
	//see_space("grid", grid, (0x28));
	printf("entree | %lu\n", entree);
	quadrant entree_site = 0;
	add_to_entree("i sim. ka tic boo tic but.\n", 0x1b, (entree), &entree_site);
	see_space("grid", grid, (0x28));
	syscall(unix_write, 1, (entree), entree_site);
	quadrant entree2 = 0;
	printf("grid | %lu\n", grid);
	see_space("grid", grid, (0x28));
	get_grid_secs(&grid, 0xf4240, &entree2);
	printf("entree2 | %lu\n", entree2);
	printf("grid | %lu\n", grid);
	see_space("grid", grid, (0x28));
	quadrant entree_site2 = 0;
	add_to_entree("nai. aht set two law. aht fitty nah. bra of a broom today.\n", 0x3b, (entree2), &entree_site2);
	syscall(unix_write, 1, (entree2), entree_site2);
	quadrant entree3 = 0;
	get_grid_secs(&grid, 0xf4240, &entree3);
	quadrant entree_site3 = 0;
	add_to_entree("talkie talkie.\n", 0xf, (entree3), &entree_site3);
	quadrant write_result = syscall(unix_write, 1, (entree3), entree_site3);
	printf("write-result | %lu\n", write_result);
	/*
	*/

	/*
	 - charts
	*/
	sec section[10000];
	quadrant section_site = 0;
	source chart = 0;
	writer index = 0;
	//printf("grid | %lu\n", grid);
	//see_space("grid", grid, 0x28);
	//getc(stdin);
	index_chart(&grid, "charts/aeoliaon.chart", &chart, &index);
	//printf("index | %lu\n", index);
	quadrant naof_elements = naof_chart_elements(index);
	printf("naof-chart-secs | %lu\n", index[3]);
	printf("chart-breadth | %lu\n", index[4]);
	printf("naof-elements | %lu\n", naof_elements);
	//printf("chart | %lu\n", chart);
	//printf("chart | %s\n", chart);
	site = 0;
	while(true) {
		if(site == naof_elements) {
			break;
		}
		//printf("site | %lu\n", site);
		section_site = 0;
		writer rmeta = chart_index_at(index, site);
		//printf("rmeta | %lu\n", rmeta);
		//printf("rmeta[0] | %lu\n", rmeta[0]);
		//printf("rmeta[1] | %lu\n", rmeta[1]);
		add_to_entree("section-", 8, section, &section_site);
		section_site += number_to_entree(site, (section + section_site), 16);
		add_to_entree(" | ", 3, section, &section_site);
		add_to_entree((chart + rmeta[0]), rmeta[1], section, &section_site);
		add_to_entree("\n", 1, section, &section_site);
		syscall(unix_write, 1, section, section_site);
		site += 1;
	}

	writer string = 0;
	create_vecter(&grid, 1, 0xb, &string);
	add_string_to_sec_vecter(&grid, "with joust", 0xa, &string);
	printf("string | %s\n", (string + 3));
	writer s = string;
	add_string_to_sec_vecter(&grid, "s max lessered, inbraishinam brought to real, and more in the aeolean; sweet ins as good to the next, made as can be, spiro0xaed went for gnu and out is early treands for higher lab.", 0xb6, &s);
	string = s;
	printf("string | %s\n", (string + 3));

	sec element[10000];
	quadrant element_site = 0;
	sec base[100];
	quadrant base_site = 0;
	source new_chart = 0;
	writer new_index = 0;
	get_new_chart(&grid, 0x10, &new_chart, &new_index);
	printf("naof-chart-secs | %lu\n", new_index[3]);
	printf("chart-breadth | %lu\n", new_index[4]);
	naof_elements = naof_chart_elements(index);
	printf("naof-elements | %lu\n", naof_elements);
	//printf("element | %lu\n", element);
	site = 0;
	while(true) {
		if(site == 0x111) {
			break;
		}
		element_site = 0;
		add_hash_collumn(element, &element_site, "name", 4, "ipe-ot", 6);
		quadrant naof_years = site;
		base_site = number_to_entree(naof_years, base, 16);
		add_hash_collumn(element, &element_site, "naof-years", 0xa, base, base_site);
		syscall(unix_write, 1, "element | ", 0xa);
		syscall(unix_write, 1, element, element_site);
		syscall(unix_write, 1, "\n", 1);
		add_element(&grid, element, element_site, &new_chart, &new_index);
		site += 1;
	}
	printf("naof-chart-secs | %lu\n", new_index[3]);
	printf("chart-breadth | %lu\n", new_index[4]);
	naof_elements = naof_chart_elements(new_index);
	printf("naof-elements | %lu\n", naof_elements);
	site = 0;
	while(true) {
		if(site == naof_elements) {
			break;
		}
		//printf("site | %lu\n", site);
		section_site = 0;
		writer rmeta = chart_index_at(new_index, site);
		//printf("rmeta | %lu\n", rmeta);
		//printf("rmeta[0] | %lu\n", rmeta[0]);
		//printf("rmeta[1] | %lu\n", rmeta[1]);
		add_to_entree("section-", 8, section, &section_site);
		section_site += number_to_entree(site, (section + section_site), 16);
		add_to_entree(" | ", 3, section, &section_site);
		add_to_entree((new_chart + rmeta[0]), rmeta[1], section, &section_site);
		add_to_entree("\n", 1, section, &section_site);
		syscall(unix_write, 1, section, section_site);
		site += 1;
	}
	save_chart(new_chart, new_index, "charts/new.chart");
	add_element(&grid, element, element_site, &chart, &index);
	site = 0;
	naof_elements = naof_chart_elements(index);
	while(true) {
		if(site == naof_elements) {
			break;
		}
		//printf("site | %lu\n", site);
		section_site = 0;
		writer rmeta = chart_index_at(index, site);
		//printf("rmeta | %lu\n", rmeta);
		//printf("rmeta[0] | %lu\n", rmeta[0]);
		//printf("rmeta[1] | %lu\n", rmeta[1]);
		add_to_entree("section-", 8, section, &section_site);
		section_site += number_to_entree(site, (section + section_site), 16);
		add_to_entree(" | ", 3, section, &section_site);
		add_to_entree((chart + rmeta[0]), rmeta[1], section, &section_site);
		add_to_entree("\n", 1, section, &section_site);
		syscall(unix_write, 1, section, section_site);
		site += 1;
	}
	//save_chart(chart, index, "charts/aeoliaon.chart");
	get_chart_element(new_chart, new_index, 0x81, element, &element_site);
	syscall(unix_write, 1, "element | ", 0xa);
	syscall(unix_write, 1, element, element_site);
	syscall(unix_write, 1, "\n", 1);
	sec collumn[1000];
	quadrant collumn_site = 0;
	get_collumn(element, element_site, "name", 4, collumn, &collumn_site);
	syscall(unix_write, 1, collumn, collumn_site);
	syscall(unix_write, 1, "\n", 1);
	get_collumn(element, element_site, "naof-years", 10, collumn, &collumn_site);
	syscall(unix_write, 1, collumn, collumn_site);
	syscall(unix_write, 1, "\n", 1);
	sec collumn_name[1000];
	quadrant collumn_name_site = 0;
	sec collumn_entree[1000];
	quadrant collumn_entree_site = 0;
	see_space("chart-index", index, (0x8 * 3 + (2 * naof_chart_elements(index))));
	quadrant esite = 0;
	writer rmeta = chart_index_at(index, 0);;
	see_space("rmeta", rmeta, 0x10);
	site = rmeta[0];
	while(true) {
		if(site == code_a) {
			break;
		}
		printf("site | %lu\n", site);
		site = through_element(chart, index, 0, collumn_name, &collumn_name_site, collumn_entree, &collumn_entree_site, site);
		syscall(unix_write, 1, "collumn-name | ", 0xf);
		syscall(unix_write, 1, collumn_name, collumn_name_site);
		syscall(unix_write, 1, "\n", 1);
		syscall(unix_write, 1, "collumn-entree | ", 0x11);
		syscall(unix_write, 1, collumn_entree, collumn_entree_site);
		syscall(unix_write, 1, "\n", 1);
		//printf("site | %lu\n", site);
	}
	view_index(index);
	writer view_chart = 0;
	create_vecter(&grid, 0x18, 0x1000, &view_chart);
	view_full_chart(&grid, new_chart, new_index, view_chart);
	/*
		return 0;
	*/

	sec nonce_name[1000];
	quadrant time_name_site = get_time_name(nonce_name);
	printf("nonce-name | %s\n", nonce_name);
	/*
	source exec_params[3] = {0};
	source exec_env[1] = {0};
	archive_grid file = syscall(unix_open, time_name, archive_write|archive_create, archive_jypsy);
	clerk_stay(pause, "/bin/ls", exec_params, exec_env, file);
	*/

	/*
	syscall(unix_unlink, "secs/nops.secs");
	source_vecter env[100];
	env[0] = "USER=tyrel";
	env[0] = 0;
	env[1] = "PWD=/home/tyrel/celix";
	env[2] = "HOME=/home/tyrel";
	env[3] = "SHELL=/bin/bash";
	env[4] = "TERM=xterm-256color";
	env[5] = "LOGNAME=tyrel";
	env[6] = "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus";
	env[7] = "PATH=/home/tyrel/ware:/home/tyrel/bin:/home/tyrel/ware:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin";
	env[8] = "SESSION_MANAGER=local/fearsome:@/tmp/.ICE-unix/2272,unix/fearsome:/tmp/.ICE-unix/2272";
	env[9] = "LESSOPEN=| /usr/bin/lesspipe %s";
	env[10] = "_=/usr/bin/env";
	env[11] = 0;
	source_vecter exec_params_2[100];
	sec paramb[1000];
	quadrant paramb_site = 0;
	add_to_entree("/bin/bash", 9, paramb, &paramb_site);
	sec paramc[1000];
	quadrant paramc_site = 0;
	add_to_entree("-c", 2, paramc, &paramc_site);
	sec param0[1000];
	quadrant param0_site = 0;
	add_to_entree("/home/tyrel/celix/sequences", 27, param0, &param0_site);
	//param0_site = 0;
	//add_to_entree("/bin/ls", 7, param0, &param0_site);
	sec param1[1000];
	quadrant param1_site = 0;
	add_to_entree("assemblies/nops.asm", 19, param1, &param1_site);
	sec param2[1000];
	quadrant param2_site = 0;
	add_to_entree("secs/nops.asm", 13, param2, &param2_site);
	sec param3[1000];
	quadrant param3_site = 0;
	add_to_entree("100", 3, param3, &param3_site);
	sec param4[1000];
	quadrant param4_site = 0;
	add_to_entree("0", 1, param4, &param4_site);
	exec_params_2[0] = paramb;
	//exec_params_2[1] = 0;
	exec_params_2[0] = param0;
	exec_params_2[1] = param1;
	exec_params_2[1] = 0;
	exec_params_2[2] = param2;
	exec_params_2[3] = param3;
	exec_params_2[4] = param4;
	exec_params_2[5] = 0;
	printf("nonce-name | %s\n", nonce_name);
	view_params(6, exec_params_2);
	//system(comand);
	clerk_stay("/home/tyrel/celix/sequences", exec_params_2, env, nonce_name);
	*/
	//while(true) {
		//syscall(unix_nanosleep, pause, pause);
	//}
	return 0;
}
