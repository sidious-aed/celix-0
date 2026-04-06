#include "./standard.h"
#define naof_extensions 7

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | node\n");
    return;
  }
	squad nf = syscall(unix_open, params[1], archive_read);
	if(nf < 0) {
		sec poly_alert[1000];
		quad poly_alert_site = 0;
		add_to_entree("<--> | could not find node ", 0x1b, poly_alert, &poly_alert_site);
		add_to_entree(params[1], get_naof_secs(params[1]), poly_alert, &poly_alert_site);
		add_to_entree("\n", 1, poly_alert, &poly_alert_site);
		syscall(unix_write, 1, poly_alert, poly_alert_site);
		syscall(unix_exit_group, 0);
	}
	writer grid = 0;
	source_vecter extensions[naof_extensions] = {"swp", "stay", "alert", "nonce", "objd", "elfd", "print"};
	quadrant extension_distances[naof_extensions] = {3, 4, 5, 5, 4, 4, 5};
	sec comand[1000];
	quadrant comand_site = 0;
	quadrant_reference nm;
	node_meta(&grid, params[1], &nm);
	sec ipname[10000];
	quad ipname_site = 0;
	add_to_entree(params[1], get_naof_secs(params[1]), ipname, &ipname_site);
	if(ipname[(ipname_site - 1)] != '/') {
		ipname[ipname_site] = '/';
		ipname_site += 1;
	}
	quad ipname_site_at = ipname_site;
	//printf("ipname | %s\n", ipname);
	//printf("ipname-site-at | %lu\n", ipname_site_at);

	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		//printf("site | %lu\n", site);
		quadrant_reference record = ((nm + 3) + (site * 3));
		site += 1;
		if(record[1] != 8) {
			continue;
		}
		source name = record[0];
		quadrant seek_site = record[2] - 1;
		while(true) {
			if(name[seek_site] == '.') {
				seek_site += 1;
				break;
			}
			if(seek_site == 0) {
				break;
			}
			seek_site -= 1;
		}
		source extension = (record[0] + seek_site);
		quadrant naof_extension_secs = (record[2] - seek_site);
		//syscall(unix_write, 1, "extension | ", 0xc);
		//syscall(unix_write, 1, (extension), (naof_extension_secs));
		//syscall(unix_write, 1, "\n", 0x1);
		quadrant is_in_extensions = false;
		if(seek_site != 0) {
			quadrant esite = 0;
			while(true) {
				if(esite == naof_extensions) {
					break;
				}
				if(compair_spaces(extension, naof_extension_secs, extensions[esite], extension_distances[esite])) {
					is_in_extensions = true;
					break;
				}
				esite += 1;
			}
		}
		//printf("is-in-extensions | %lu\n", is_in_extensions);
		if(is_in_extensions) {
			//syscall(unix_write, 1, "equation-name | ", 0x10);
			//syscall(unix_write, 1, (name), (record[2]));
			//syscall(unix_write, 1, "\n", 0x1);
			//printf("type | %lu\n", record[1]);
			ipname_site = ipname_site_at;
			add_to_entree(record[0], record[2], ipname, &ipname_site);
			//printf("i sim.\n");
			//printf("ipname | %s\n", ipname);
			syscall(unix_unlink, ipname);
			add_to_entree("\n", 1, ipname, &ipname_site);
			syscall(unix_write, 1, ipname, ipname_site);
		}
	}
	return 0;
}
