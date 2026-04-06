#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 3) {
    printf("params | 2-4\n");
    printf("1 | entrees-name\n");
    printf("2 | stats-name\n");
    printf("(3) | me\n");
    printf("(4) | mn\n");
    return;
  }
	quad site = 0;
	quad osite;
	sec nao[1] = {0};
	writer grid = 0;
	writer entrees;
	create_vecter(&grid, 1, 1000000, &entrees);
	ip_file ef = syscall(unix_open, params[1], archive_read);
	if(ef != code_a) {
		quad naof_efsecs = syscall(unix_lseek, ef, 0, seek_completion);
		syscall(unix_close, ef);
		add_file_string_to_sec_vecter(&grid, params[1], 0, naof_efsecs, &entrees);
	}
	if(naof_params == 5) {
		writer entree;
		create_vecter(&grid, 1, 1000000, &entree);
		add_string_to_sec_vecter(&grid, (params[3]), get_naof_secs(params[3]), &entrees);
		add_string_to_sec_vecter(&grid, nao, 1, &entrees);
		quad naof_esecs = get_naof_secs(params[4]);
		quad et = naof_esecs - 1;
		site = 0;
		while(true) {
			if(site == naof_esecs) {
				break;
			}
			sec con = params[3][site];
			//printf("con | %c\n", con);
			if(site != et && con == '\\') {
				osite = site;
				site += 1;
				sec con1 = params[3][site];
				if(con1 == 'n') {
					add_string_to_sec_vecter(&grid, "\n", 1, &entree);
				} else if(con1 == 't') {
					add_string_to_sec_vecter(&grid, "\t", 1, &entree);
				} else {
					add_string_to_sec_vecter(&grid, (params[4] + osite), 1, &entree);
					add_string_to_sec_vecter(&grid, (params[4] + site), 1, &entree);
				}
			} else {
				add_string_to_sec_vecter(&grid, (params[4] + site), 1, &entree);
			}
			site += 1;
		}
		add_string_to_sec_vecter(&grid, (entree + 3), entree[2], &entrees);
		add_string_to_sec_vecter(&grid, nao, 1, &entrees);
	}
	printf("naof-entrees-secs | %lu\n", entrees[2]);
	syscall(unix_unlink, params[2]);
	ip_file sf = syscall(unix_open, params[2], archive_create|archive_write, archive_jypsy);
	sec siter[10000];
	quad siter_site = 0;
	site = 0;
	while(true) {
		if(site >= entrees[2]) {
			break;
		}
		printf("site | %lu\n", site);
		osite = site;
		see_space("at", (((source)(entrees + 3)) + site), 100);
		squad coms = seek_space(nao, 1, (((source)(entrees + 3)) + site), (entrees[2] - site));
		site += (coms + 1);
		printf("coms | %lu\n", coms);
		if(coms == code_a || coms == code_b) {
			break;
		}
		siter_site = 0;
		add_to_entree((((source)(entrees + 3)) + osite), coms, siter, &siter_site);
		add_to_entree("|", 1, siter, &siter_site);

		see_space("at", (((source)(entrees + 3)) + site), 100);
		coms = seek_space(nao, 1, (((source)(entrees + 3)) + site), (entrees[2] - site));
		printf("coms | %lu\n", coms);

		siter_site += number_to_entree(coms, (siter + siter_site), 16);
		add_to_entree("|", 1, siter, &siter_site);

		siter_site += number_to_entree(site, (siter + siter_site), 16);
		add_to_entree("\n", 1, siter, &siter_site);
		printf("siter | %s\n", siter);
		syscall(unix_write, sf, siter, siter_site);
		site += (coms + 1);
		//getc(stdin);
	}
	syscall(unix_close, sf);
	ef = syscall(unix_open, params[1], archive_create|archive_write, archive_jypsy);
	syscall(unix_write, ef, (entrees + 3), entrees[2]);
	syscall(unix_close, ef);
	//printf("entrees | %s\n", (entrees + 3));
  return 0;
}
