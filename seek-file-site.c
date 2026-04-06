#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 3) {
    printf("params | 2\n");
    printf("1 | file-name\n");
    printf("2 | seek\n");
		printf("(3) | init-site (base-16)\n");
    return;
  }
	//view_header("main meta.");
	ip_file ipf = syscall(unix_open, params[1], archive_read);
	//printf("ipf | %lu\n", ipf);
	sec seek[1000000];
	quad naof_seek_secs = standardise_entree(params[2], seek);
	//printf("seek | %s\n", seek);
	//printf("naof-seek-secs | %lu\n", naof_seek_secs);
	quad naof_file_secs = syscall(unix_lseek, ipf, 0, seek_com);
	//printf("naof-file-secs | %lu\n", naof_file_secs);
	source file = syscall(unix_mmap, non, naof_file_secs, map_rws, map_console, ipf, 0);
	//printf("file | %lu\n", file);
	syscall(unix_close, ipf);
	quad isite = 0;
	if(params[3]) {
		quad naof_isite_secs = get_naof_secs(params[3]);
		//printf("naof-isite-secs | %lu\n", naof_isite_secs);
		entree_to_number(params[3], naof_isite_secs, 16, &isite);
		//printf("isite | %lu\n", isite);
	}
	//printf("naof-file-seek-secs | %lu\n", (naof_file_secs - isite));
	squad seek_site = seek_space(seek, naof_seek_secs, (file + isite), (naof_file_secs - isite));
	if(seek_site >= 0) {
		if(isite) {
			seek_site += isite;
		}
		view_header("file up to seek.");
		//printf("seek-site | %ld\n", seek_site);
		syscall(unix_write, 1, file, seek_site);
		getc(stdin);
		view_header("file at seek.");
		syscall(unix_write, 1, (file + seek_site), naof_seek_secs);
		getc(stdin);
		view_header("file after seek.");
		syscall(unix_write, 1, ((file + seek_site) + naof_seek_secs), naof_file_secs - seek_site - naof_seek_secs);
		getc(stdin);
		//printf("file | %s\n", file);
		view_header("seek meta.");
		sec base[10000];
		quad base_site = 0;
		add_to_entree("init-seek-site (base-16) | ", 0x1b, base, &base_site);
		base_site += number_to_entree(seek_site, (base + base_site), 16);
		base[base_site] = '\n';
		base_site += 1;
		add_to_entree("init-seek-site (base-10) | ", 0x1b, base, &base_site);
		base_site += number_to_entree(seek_site, (base + base_site), 10);
		base[base_site] = '\n';
		base_site += 1;
		seek_site += naof_seek_secs;
		add_to_entree("com-seek-site (base-16)  | ", 0x1b, base, &base_site);
		base_site += number_to_entree(seek_site, (base + base_site), 16);
		base[base_site] = '\n';
		base_site += 1;
		add_to_entree("com-seek-site (base-10)  | ", 0x1b, base, &base_site);
		base_site += number_to_entree(seek_site, (base + base_site), 10);
		base[base_site] = '\n';
		base_site += 1;
		syscall(unix_write, 1, base, base_site);
	} else {
		syscall(unix_write, 1, "<--> | no finds this time.\n", 0x1b);
	}
  return 0;
}
