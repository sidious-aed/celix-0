#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 2) {
    printf("params | 1-2\n");
    printf("1 | file-name\n");
		printf("(2) | space-replacer \"_\"\n");
    return;
  }
	//view_header("main meta.");
	ip_file ipf = syscall(unix_open, params[1], archive_read);
	//printf("ipf | %lu\n", ipf);
	quad naof_file_secs = syscall(unix_lseek, ipf, 0, seek_com);
	//printf("naof-file-secs | %lu\n", naof_file_secs);
	source file = syscall(unix_mmap, non, naof_file_secs, map_rws, map_console, ipf, 0);
	//printf("file | %lu\n", file);
	syscall(unix_close, ipf);
	quad is_space_replacer = naof_params == 3;
	sec clerk_space[1000000];
	quad clerk_space_site = 0;
	quad site = 0;
	while(true) {
		//printf("site | %lu\n", site);
		if(site == naof_file_secs) {
			break;
		}
		source file_at = (file + site);
		squad section_site = seek_space("\n", 1, (file_at), (naof_file_secs - site));
		//printf("section-site | %ld\n", section_site);
		if(section_site == -1) {
			break;
		}
		//if(section_site == -2) {
			//printf("file-at | %s\n", file_at);
			//break;
		//}
		site += (section_site + 1);
		clerk_space_site = 0;
		quad sec_site = 0;
		quad naof_section_secs = section_site + 1;
		while(true) {
			if(sec_site == naof_section_secs) {
				break;
			}
			sec runes[3];
			sec at_rune = file_at[sec_site];
			//printf("at-rune | %u\n", at_rune);
			sec_site += 1;
			if(at_rune == '\t') {
				runes[0] = '\\';
				runes[1] = 't';
				add_to_entree((runes), (2), clerk_space, &clerk_space_site);
			} else if(is_space_replacer && at_rune == ' ') {
				runes[0] = params[2][0];
				add_to_entree((runes), (1), clerk_space, &clerk_space_site);
			} else {
				runes[0] = at_rune;
				add_to_entree((runes), (1), clerk_space, &clerk_space_site);
			}
		}
		syscall(unix_write, 1, clerk_space, clerk_space_site);
	}
  return 0;
}
