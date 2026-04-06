#include "./standard.h"
#define naof_extensions 1

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | node\n");
    return;
  }
	source_vecter extensions[1] = {"c"};
	quadrant naof_secs_for_extensions[naof_extensions] = {1};
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
	quadrant pause[2] = {1, 0xaed};

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
		//syscall(unix_write, 1, record[0], record[1]);
		//syscall(unix_write, 1, "\n", 1);
		source extension = (record[0] + seek_site);
		quadrant naof_extension_secs = (record[2] - seek_site);
		if(seek_site == 0) {
			extension = binary_type;
			naof_extension_secs = naof_binary_type_secs;
		}
		//syscall(unix_write, 1, extension, naof_extension_secs);
		//syscall(unix_write, 1, "\n", 1);
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
				add_to_vecter(&grid, file_for_type, &files_for_type);
				break;
			}
			tsite += 1;
		}
		//printf("tsite | %lu\n", tsite);
		//printf("naof-file-types | %lu\n", file_types[2]);
		if(tsite == file_types[2]) {
			quadrant tsite = 0;
			while(true) {
				if(tsite == naof_extensions) {
					break;
				}
				if(compair_spaces(extensions[tsite], naof_secs_for_extensions[tsite], extension, naof_extension_secs)) {
					break;
				}
				tsite += 1;
			}
			//printf("tsite | %lu\n", tsite);
			if(tsite < naof_extensions) {
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
	quadrant et = file_types[2] - 1;
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
		writer files_for_type = type_record[2];
		quadrant fet = files_for_type[2] - 1;
		quadrant fsite = 0;
		while(true) {
			if(fsite == files_for_type[2]) {
				break;
			}
			writer file_meta = ((files_for_type + 3) + (fsite * 2));
			replicate('-', header, file_meta[1]);
			syscall(unix_write, 1, header, file_meta[1]);
			syscall(unix_write, 1, "\n", 1);
			syscall(unix_write, 1, file_meta[0], file_meta[1]);
			syscall(unix_write, 1, "\n", 1);
			syscall(unix_write, 1, header, file_meta[1]);
			syscall(unix_write, 1, "\n", 1);
			if(compair_spaces(type_record[0], naof_extension_secs, "c", 1)) {
				archive_grid obj_file = syscall(unix_open, file_meta[0], archive_read);
				quadrant naof_obj_file_secs = syscall(unix_lseek, obj_file, 0, seek_completion);
				source obj_map = syscall(unix_mmap, non, naof_obj_file_secs, map_rws, clerk_descreet, obj_file, non);
				quadrant msite = 0;
				while(true) {
					if(msite >= naof_obj_file_secs) {
						break;
					}
					directional section_site = (seek_space("\n", 1, (obj_map + msite), (naof_obj_file_secs - msite)));
					//printf("section-site | %Lu\n", section_site);
					if((section_site < 0xffffffff00000000)) {
						if(section_site != 0) {
							//syscall(unix_write, 1, (obj_map + msite), (section_site));
							//syscall(unix_write, 1, "\n", 1);
							//syscall(unix_nanosleep, pause, pause);
							//printf("from-msite | %s\n", (obj_map + msite));
							if(obj_map[msite] != '\t' && obj_map[msite] != ' ') {
								directional init_noom_site = seek_space("(", 1, (obj_map + msite), (section_site));
								//printf("init-noom-site | %lu\n", init_noom_site);
								if((init_noom_site < 0xffffffff00000000)) {
									directional bracin_site = seek_space("{", 1, (obj_map + msite), (section_site));
									//printf("bracin-site | %lu\n", bracin_site);
									if((bracin_site < 0xffffffff00000000)) {
										directional com_noom_site = seek_space(")", 1, (obj_map + msite), (section_site));
										//printf("com-noom-site | %lu\n", com_noom_site);
										syscall(unix_write, 1, (obj_map + msite), (com_noom_site + 1));
										syscall(unix_write, 1, "\n", 1);
									}
								}
							}
						}
					} else {
						break;
					}
					msite += (section_site + 1);
				}
			}
			if(fsite != fet) {
				syscall(unix_write, 1, "\n", 1);
			}
			fsite += 1;
		}
		if(tsite != et) {
			syscall(unix_write, 1, "\n", 1);
		}
		tsite += 1;
	}
	return 0;
}
