#include "./standard.h"
#include "./clerk.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 3) {
    printf("params | 2\n");
    printf("1 | binary-name\n");
		printf("2 | chart-name\n");
    return;
  }
	quadrant naof_binary_name_secs = get_naof_secs(params[1]);
	sec time_name[1000];
	quadrant naof_time_name_secs = get_time_name(time_name);
	sec comand[1000];
	quadrant comand_site = 0;
	add_to_entree("objdump -d ", 0xb, comand, &comand_site);
	add_to_entree(params[1], naof_binary_name_secs, comand, &comand_site);
	add_to_entree(" > ", 0x3, comand, &comand_site);
	add_to_entree(time_name, naof_time_name_secs, comand, &comand_site);
	syscall(unix_write, 1, comand, comand_site);
	syscall(unix_write, 1, "\n", 1);
	system(comand);
	syscall(unix_unlink, params[2]);
	ip_file chart = syscall(unix_open, params[2], archive_create|archive_write, archive_jypsy);
	sec base[1000];
	quad base_site = 0;

	archive_grid obj_file = syscall(unix_open, time_name, archive_read);
	quadrant naof_obj_secs = syscall(unix_lseek, obj_file, 0, seek_completion);
  source obj = syscall(unix_mmap, non, naof_obj_secs, map_rws, clerk_descreet, obj_file, non);
	//printf("obj | %lu\n", obj);
	syscall(unix_close, obj_file);
	//printf("naof-obj-secs | %lu\n", naof_obj_secs);
	sec clerk_com[10000];
	quad clerk_com_site = 0;
	quadrant site = 0;
	while(true) {
		//printf("site | %lu\n", site);
		if(site >= naof_obj_secs) {
			break;
		}
		source obj_at = obj + site;
		squad sect_site = seek_space("\n", 1, (obj_at), (naof_obj_secs - site));
		if(sect_site >= 2) {
			if(compair_spaces(">:", 2, (obj_at + sect_site - 2), 2)) {
				clerk_com_site = 0;
				add_to_entree("section | ", 11, clerk_com, &clerk_com_site);
				add_to_entree(obj_at, sect_site, clerk_com, &clerk_com_site);
				add_to_entree("\n", 1, clerk_com, &clerk_com_site);
				syscall(unix_write, 1, clerk_com, clerk_com_site);
				quad b16_site = 0;
				quad mode = 0;
				while(true) {
					if(b16_site == 16) {
						//syscall(unix_write, 1, "<--> | problem parsing b16.\n", 0x1c);
						//syscall(unix_exit_group, 0);
						mode = 1;
						break;
					}
					sec con = obj_at[b16_site];
					//printf("con | %c\n", con);
					if(con != '0') {
						break;
					}
					b16_site += 1;
				}
				quad naof_b16_secs = 16 - b16_site;
				quad bin_site = 0;
				if(mode == 0) {
					entree_to_number((obj_at + b16_site), naof_b16_secs, 16, &bin_site);
				}
				/*
				clerk_com_site = 0;
				add_to_entree("bin-site | ", 0xb, clerk_com, &clerk_com_site);
				clerk_com_site += number_to_entree(bin_site, (clerk_com + clerk_com_site), 16);
				add_to_entree("\n", 1, clerk_com, &clerk_com_site);
				syscall(unix_write, 1, clerk_com, clerk_com_site);
				*/
				source at_dest = obj_at + 18;
				quad naof_dest_secs = sect_site - 20;
				syscall(unix_write, 1, (at_dest + naof_dest_secs - 4), 4);
				syscall(unix_write, 1, "\n", 1);
				if(compair_spaces("@plt", 4, (at_dest + naof_dest_secs - 4), 4)) {
					//getc(stdin);
					naof_dest_secs -= 4;
				}
				if(compair_spaces("@@GLIBC_2.2.5", 0xd, (at_dest + naof_dest_secs - 0xd), 0xd)) {
					//getc(stdin);
					naof_dest_secs -= 0xd;
				}
				clerk_com_site = 0;
				add_to_entree("from-destination | ", 19, clerk_com, &clerk_com_site);
				add_to_entree((at_dest), (naof_dest_secs), clerk_com, &clerk_com_site);
				add_to_entree("\n", 1, clerk_com, &clerk_com_site);
				syscall(unix_write, 1, clerk_com, clerk_com_site);
				quad naof_base_secs = number_to_entree(bin_site, base, 16);
				clerk_com_site = 0;
				add_to_entree(at_dest, naof_dest_secs, clerk_com, &clerk_com_site);
				add_to_entree("|", 1, clerk_com, &clerk_com_site);
				add_to_entree(base, naof_base_secs, clerk_com, &clerk_com_site);
				add_to_entree("\n", 1, clerk_com, &clerk_com_site);
				syscall(unix_write, 1, clerk_com, clerk_com_site);
				syscall(unix_write, chart, clerk_com, clerk_com_site);
			}
		}
		site += (sect_site + 1);
	}
	syscall(unix_unlink, time_name);
	syscall(unix_close, chart);
  return 0;
}
