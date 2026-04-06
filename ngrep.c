#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | node\n");
    printf("2 | extension\n");
		printf("3 | seek\n");
    return;
  }
	source node = params[1];
	source seek_extension = params[2];
	quadrant naof_seek_extension_secs = get_naof_secs(seek_extension);
	source seek = params[3];
	quadrant naof_seek_secs = get_naof_secs(params[3]);
	sec comand[1000];
	sec time_name[1000];
	sec clerk_space[1000];
	quadrant naof_time_name_secs = 0;
	quadrant comand_site = 0;
	quadrant_reference grid = 0;
	quadrant_reference nm = 0;
	node_meta(&grid, node, &nm);
	source binary_type = "binary";
	quadrant naof_binary_type_secs = 0x6;
	writer files = 0;
	create_vecter(&grid, 0x18, 100, &files);

	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		quadrant_reference record = ((nm + 3) + (site * 3));
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
		//printf("seek-site | %lu\n", seek_site);
		source extension = (record[0] + seek_site);
		quadrant naof_extension_secs = (record[2] - seek_site);
		if(seek_site == 0) {
			extension = binary_type;
			naof_extension_secs = naof_binary_type_secs;
		}
		if(compair_spaces(extension, naof_extension_secs, seek_extension, naof_seek_extension_secs)) {
			naof_time_name_secs = get_time_name(time_name);
			//see_space("record", record, 0x18);
			comand_site = 0;
			add_to_entree("grep \"", 0x6, comand, &comand_site);
			add_to_entree(seek, naof_seek_secs, comand, &comand_site);
			add_to_entree("\" ", 0x2, comand, &comand_site);
			add_to_entree(name, record[2], comand, &comand_site);
			add_to_entree(" > ", 0x3, comand, &comand_site);
			add_to_entree(time_name, naof_time_name_secs, comand, &comand_site);
			//syscall(unix_write, 1, comand, comand_site);
			//syscall(unix_write, 1, "\n", 1);
			system(comand);
			archive_grid grep_results = syscall(unix_open, time_name, archive_read);
			quadrant naof_grep_result_secs = syscall(unix_lseek, grep_results, 0, seek_completion);
			if(naof_grep_result_secs > 0) {
				//printf("name | %s\n", name);
				writer file_record[0x2];
				file_record[0] = name;
				file_record[1] = record[1];
				add_to_vecter(&grid, record, &files);
			}
			syscall(unix_unlink, time_name);
		}
		site += 1;
	}
	if(files[2] > 0) {
		syscall(unix_write, 1, "------------\n", 0xd);
		syscall(unix_write, 1, "seek-results\n", 0xd);
		syscall(unix_write, 1, "------------\n\n", 0xe);
		quadrant fsite = 0;
		while(true) {
			if(fsite == files[2]) {
				break;
			}
			writer file_record = ((files + 3) + (fsite * 3));
			syscall(unix_write, 1, file_record[0], (file_record[2]));
			syscall(unix_write, 1, "\n", 1);
			//printf("%s\n", file_record[0]);
			fsite += 1;
		}
		syscall(unix_write, 1, "\n", 1);
	} else {
		syscall(unix_write, 1, "no results.\n", 0xc);
	}
	return 0;
}
