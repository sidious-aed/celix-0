#include "./standard.h"
#include "./clerk.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | binary-name\n");
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

	archive_grid obj_file = syscall(unix_open, time_name, archive_read);
	quadrant naof_obj_file_secs = syscall(unix_lseek, obj_file, 0, seek_completion);
  source obj = syscall(unix_mmap, non, naof_obj_file_secs, map_rws, clerk_descreet, obj_file, non);
	//printf("obj-map | %lu\n", obj_map);
	syscall(unix_close, obj_file);
	//printf("naof-obj-file-secs | %lu\n", naof_obj_file_secs);
	sec clerk_com[10000];
	quad clerk_com_site = 0;
	quadrant site = 0;
	while(true) {
		//printf("site | %lu\n", site);
		if(site >= naof_obj_file_secs) {
			break;
		}
		source obj_at = obj + site;
		squad sect_site = seek_space("\n", 1, (obj_at) (naof_obj_secs - site));
		clerk_com_site = 0;
		add_to_entree("section | ", 11, clerk_com, &clerk_com_site);
		add_to_entree(obj_at, sect_site, clerk_com, &clerk_com_site);
		add_to_entree("\n", 1, clerk_com, &clerk_com_site);
		site += (sect_site + 1);
	}
	syscall(unix_unlink, time_name);
  return 0;
}
