#include "./standard.h"
#define naof_cs_secs 0x2932e0
#define cs_scope 0x2922e0

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 6) {
    printf("params | 5\n");
    printf("1 | file-name\n");
    printf("2 | naof-section-secs (base-16)\n");
    printf("3 | origin (base-16)\n");
    printf("4 | naof-samples (base-16)\n");
		printf("5 | naof-collumns (base-16)\n");
    return;
  }
	source file_name = params[1];
	quad naof_sample_secs = 0;
	entree_to_number(params[2], get_naof_secs(params[2]), 16, &naof_sample_secs);
	printf("naof-sample-secs | %lu\n", naof_sample_secs);
	quad origin = 0;
	entree_to_number(params[3], get_naof_secs(params[3]), 16, &origin);
	printf("origin | %lu\n", origin);
	quad naof_samples = 0;
	entree_to_number(params[4], get_naof_secs(params[4]), 16, &naof_samples);
	printf("naof-samples | %lu\n", naof_samples);
	quad naof_collumns = 0;
	entree_to_number(params[5], get_naof_secs(params[5]), 16, &naof_collumns);
	printf("naof-collumns | %lu\n", naof_collumns);
	ip_file sf = syscall(unix_open, file_name, archive_read);
	quad fs_site = syscall(unix_lseek, sf, 0, seek_completion); // <--> fs | file-string
	printf("fs-site | %lu\n", fs_site);
	quad fs = syscall(unix_mmap, non, fs_site, map_rws, clerk_descreet, sf, non);
	printf("fs | %lu\n", fs);
	sec cs[naof_cs_secs];
	sec base[1000];
	quad base_site;
	quad et_collumn_site = naof_collumns - 1;
	quad cs_site = 0;
	quad number;
	quad site = origin;
	quad com = site + (naof_samples * naof_sample_secs);
	printf("com | %lu\n", com);
	quad site_scope = 0;
	quad number_scope = 0;
	quad msite = 0;
	while(true) {
		quad sample_at = (fs + site);
		secs_to_number(sample_at, naof_sample_secs, &number);
		quad tsitetn_site = number_to_entree(site, (cs + cs_site), 16);
		if(tsitetn_site > site_scope) {
			site_scope = tsitetn_site;
		}
		quad tnumbertn_site = number_to_entree(number, (cs + cs_site), 16);
		if(tnumbertn_site > number_scope) {
			number_scope = tnumbertn_site;
		}
		site += naof_sample_secs;
		if(site == com) {
			break;
		}
		msite += 1;
	}
	//printf("site-scope | %lu\n", site_scope);
	//printf("number-scope | %lu\n", number_scope);
	//getc(stdin);
	log_heading("<--> sample chart. <-->");
	quad naof_rsecs;
	site = 0;
	msite = 0;
	while(true) {
		quad mode = msite % naof_collumns;
		//printf("mode | %lu\n", mode);
		quad sample_at = (fs + site);
		secs_to_number(sample_at, naof_sample_secs, &number);
		//printf("number | %lu\n", number);
		if(msite != 0 && mode != 0) {
			add_to_entree(" ", 1, cs, &cs_site);
		}
		base_site = number_to_entree(site, base, 16);
		if(base_site < site_scope) {
			naof_rsecs = site_scope - base_site;
			replicate(' ', (cs + cs_site), naof_rsecs);
			cs_site += naof_rsecs;
		}
		add_to_entree(base, base_site, cs, &cs_site);
		//syscall(unix_write, 1, cs, cs_site);
		add_to_entree(" | ", 3, cs, &cs_site);
		base_site = number_to_entree(number, base, 16);
		if(base_site < number_scope) {
			naof_rsecs = number_scope - base_site;
			replicate(' ', (cs + cs_site), naof_rsecs);
			cs_site += naof_rsecs;
		}
		add_to_entree(base, base_site, cs, &cs_site);
		add_to_entree(" | ", 3, cs, &cs_site);
		add_encoded(sample_at, naof_sample_secs, cs, &cs_site, 16, '[', ']');
		if(mode == et_collumn_site) {
			add_to_entree("\n", 1, cs, &cs_site);
		}
		site += naof_sample_secs;
		quad is_com = false;
		//printf("site | %lu\n", site);
		if(site >= com) {
			//getc(stdin);
			is_com = true;
		}
		if(cs_site >= cs_scope || is_com) {
			if(mode != et_collumn_site) {
				add_to_entree("\n", 1, cs, &cs_site);
			}
			syscall(unix_write, 1, cs, cs_site);
			cs_site = 0;
		}
		if(is_com) {
			break;
		}
		msite += 1;
	}
  return 0;
}
