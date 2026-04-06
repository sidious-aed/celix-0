#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	source main_node = "prints";
	quad a_pause_for_a_clerk[2] = {0, 0xaedaed};
	quad a_pause_for_a_clerkess[2] = {non, 0b11110101110110110101110110110010111};
	quad times[4];
	quadrant_reference zones = times + 2;
	writer grid = 0;
	source mem0 = 0;
	get_grid_secs(&grid, 0x100, &mem0);
	writer names = 0;
	sec fname[10000];
	quad fname_site;
	sec vs[10000];
	quad vs_site;
	sec rs[1000000];
	sec vs0[2000000];
	quad vs0_site;
	quad least_seconds;
	quad least_micro_seconds;
	while(true) {
		least_seconds = 0;
		quad last_gds_result = node_meta(&grid, main_node, &names);
		//printf("last-gds-result | %lu\n", last_gds_result);
		//printf("names | %lu\n", names);
		//getc(stdin);
		//names[2] = 0;
		//printf("naof-names | %lu\n", names[2]);
		quad site = 0;
		while(true) {
			if(site == names[2]) {
				break;
			}
			//printf("site | %lu\n", site);
			//printf("naof-names | %lu\n", names[2]);
			writer name = (names + 3) + (site * 3);
			site += 1;
			//see_space("name", name, 0x18);
			//printf("name | %s\n", name[0]);
			//printf("type | %lu\n", name[1]);
			//printf("name-site | %lu\n", name[2]);
			if(name[1] == 8) {
				source extension = name[0] + name[2];
				source extension_com = extension;
				while(true) {
					sec con = extension[0];
					if(con == '.') {
						extension += 1;
						break;
					}
					extension -= 1;
				}
				quad extension_site = extension_com - extension;
				//printf("extension | %s\n", extension);
				//printf("extension-site | %lu\n", extension_site);
				if(compair_spaces(extension, extension_site, "print", 5)) {
					//printf("name | %s\n", name[0]);
					source secondse = name[0];
					//printf("secondse | %s", secondse);
					source secondse_com = secondse;
					while(true) {
						//printf("secondse-com | %s", secondse_com);
						if(secondse_com[0] == '.') {
							break;
						}
						secondse_com += 1;
					}
					//printf("secondse | %s", secondse);
					quad secondse_site = secondse_com - secondse;
					//printf("secondse-site | %lu\n", secondse_site);
					quad naof_seconds = 0;
					entree_to_number(secondse, secondse_site, 36, &naof_seconds);
					//printf("naof-seconds | %lu\n", naof_seconds);
					source micro_secondse = secondse_com + 1;
					source micro_secondse_com = micro_secondse;
					while(true) {
						if(micro_secondse_com[0] == '.') {
							break;
						}
						micro_secondse_com += 1;
					}
					quad micro_secondse_site = micro_secondse_com - micro_secondse;
					quad naof_micro_seconds = 0;
					entree_to_number(micro_secondse, micro_secondse_site, 36, &naof_micro_seconds);
					//printf("naof-micro-seconds | %lu\n", naof_micro_seconds);
					if(least_seconds == 0 || naof_seconds <= least_seconds) {
						if((naof_seconds == least_seconds && naof_micro_seconds < least_micro_seconds) || (naof_seconds < least_seconds) || least_seconds == 0) {
							least_seconds = naof_seconds;
							least_micro_seconds = naof_micro_seconds;
							//printf("is a print.\n");
							fname_site = 0;
							add_to_entree("prints/", 7, fname, &fname_site);
							add_to_entree(name[0], name[2], fname, &fname_site);
							//printf("fname | %s\n", fname);
							//log_heading(fname);
							//syscall(unix_gettimeofday, times, zones);
							//vs_site = number_to_entree(times[0], vs, 36);
							//add_to_entree(".", 1, vs, &vs_site);
							//vs_site += number_to_entree(times[1], (vs + vs_site), 36);
							//printf("at | %s", vs);
						}
					}
				}
			}
		}
		//printf("least-seconds | %lu\n", least_seconds);
		if(least_seconds != 0) {
			ip_file pf = syscall(unix_open, fname, archive_read);
			//printf("pf | %lu\n", pf);
			quad naof_pf_secs = syscall(unix_lseek, pf, 0, seek_completion);
			//printf("naof-pf-secs | %lu\n", naof_pf_secs);
			//if(naof_pf_secs == 0) {
				// <--> | a shrotenger to find, could be said the.
				//continue;
			//}
			if(naof_pf_secs != 0) {
				syscall(unix_lseek, pf, 0, seek_origin);
				//getc(stdin);
				vs0_site = 0;
				while(true) {
					quad naof_rsecs = naof_pf_secs;
					if(naof_rsecs > 1000000) {
						naof_rsecs = 1000000;
					}
					naof_pf_secs -= naof_rsecs;
					quad naof_add_secs = syscall(unix_read, pf, rs, naof_rsecs);
					//printf("naof-add-secs | %lu\n", naof_add_secs);
					add_to_entree(rs, naof_add_secs, vs0, &vs0_site);
					quad is_com = naof_pf_secs == 0;
					//printf("naof-pf-secs | %lu\n", naof_pf_secs);
					if(vs0_site >= 1500000 || is_com) {
						//printf("vs0 | %s", vs0);
						syscall(unix_write, 1, vs0, vs0_site);
					}
					//getc(stdin);
					if(is_com) {
						break;
					}
				}
				syscall(unix_close, pf);
				syscall(unix_unlink, fname);
			}
		}
		syscall(unix_nanosleep, a_pause_for_a_clerk, a_pause_for_a_clerkess);
		//getc(stdin);
		//break;
	}
  return 0;
}
