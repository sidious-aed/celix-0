#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | node\n");
    return;
  }
	sec comand[1000];
	source binary_type = "binary";
	quadrant naof_binary_type_secs = 0x6;
	quadrant comand_site = 0;
	quadrant_reference grid = 0;
	quadrant_reference nm = 0;
	//printf("grid | %lu\n", grid);
	//printf("nm | %lu\n", nm);
	node_meta(&grid, params[1], &nm);
	//see_space("record-0", (nm + 3), 0x18);
	writer file_types = 0;
	create_vecter(&grid, 0x18, 100, &file_types);

	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		//printf("site | %lu\n", site);
		quadrant_reference record = ((nm + 3) + (site * 3));
		//see_space("record", record, 0x18);
		site += 1;
		if(record[1] != 8) {
			//continue;
		}
		source name = record[0];
		//printf("name | %s\n", name);
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
		//syscall(unix_write, 1, record[0], record[2]);
		//syscall(unix_write, 1, "\n", 1);
		//printf("type | %lu\n", record[1]);
		if(record[1] == 8) {
			source extension = (record[0] + seek_site);
			quadrant naof_extension_secs = (record[2] - seek_site);
			if(seek_site == 0) {
				extension = binary_type;
				naof_extension_secs = naof_binary_type_secs;
			}
			syscall(unix_write, 1, extension, naof_extension_secs);
			syscall(unix_write, 1, "\n", 1);
			//printf("naof-file-types | %lu\n", file_types[2]);
			quadrant tsite = 0;
			while(true) {
				if(tsite == file_types[2]) {
					break;
				}
				writer type_record = ((file_types + 3) + (tsite * 3));
				//printf("extension | %s\n", extension);
				//see_space("type-record", type_record, 0x18);
				if(compair_spaces(extension, naof_extension_secs, type_record[0], type_record[1])) {
					writer files_for_type = type_record[2];
					writer file_for_type[0x2];
					file_for_type[0] = name;
					file_for_type[1] = record[2];
					//printf("i sim.\n");
					add_to_vecter(&grid, file_for_type, &files_for_type);
					break;
				}
				tsite += 1;
			}
			//printf("tsite | %lu\n", tsite);
			if(tsite == file_types[2]) {
				//printf("adding type.\n");
				writer files_for_type = 0;
				create_vecter(&grid, 0x10, 100, &files_for_type);
				//printf("files-for-type | %lu\n", files_for_type);
				writer file_for_type[0x2];
				file_for_type[0] = name;
				file_for_type[1] = record[2];
				add_to_vecter(&grid, file_for_type, &files_for_type);
				writer type_record[0x2];
				type_record[0] = extension;
				type_record[1] = naof_extension_secs;
				type_record[2] = files_for_type;
				//see_space("type-record", type_record, 0x18);
				add_to_vecter(&grid, type_record, &file_types);
			}
		}
		//printf("\n");
	}
	sec header[1000];
	quadrant tsite = 0;
	while(true) {
		if(tsite == file_types[2]) {
			break;
		}
		writer type_record = ((file_types + 3) + (tsite * 3));
		//see_space("type-record", type_record, 0x18);
		quadrant naof_extension_secs = type_record[1];
		replicate('-', header, naof_extension_secs);
		header[naof_extension_secs] = 0;
		syscall(unix_write, 1, header, naof_extension_secs);
		syscall(unix_write, 1, "\n", 1);
		syscall(unix_write, 1, type_record[0], naof_extension_secs);
		syscall(unix_write, 1, "\n", 1);
		syscall(unix_write, 1, header, naof_extension_secs);
		syscall(unix_write, 1, "\n", 1);
		writer files_for_type_us = type_record[2];
		writer files_for_type = 0;
		order_vecter(&grid, files_for_type_us, 2, 0, 1, &files_for_type);
		quadrant fsite = 0;
		while(true) {
			if(fsite == files_for_type[2]) {
				break;
			}
			writer file_meta = ((files_for_type + 3) + (fsite * 2));
			syscall(unix_write, 1, file_meta[0], file_meta[1]);
			syscall(unix_write, 1, "\n", 1);
			see_space("nsecs", (file_meta[0]), file_meta[1]);
			fsite += 1;
		}
		syscall(unix_write, 1, "\n", 1);
		tsite += 1;
	}
	return 0;
}
