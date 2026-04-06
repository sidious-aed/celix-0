#include "./standard.h"
#define naof_extensions 3

quadrant main(quadrant naof_params, source_vecter params) {
	source_vecter extensions[3] = {"swp", "stay", "alert"};
	sec comand[1000];
	quadrant comand_site = 0;
	quadrant_reference nm;
	node_meta("assemblies/equations", &nm);

	quadrant site = 0;
	while(true) {
		if(site == nm[2]) {
			break;
		}
		quadrant_reference record = ((nm + 3) + (site * 3));
		syscall(unix_write, 1, "equation-name | ", 0x10);
		syscall(unix_write, 1, (record[0]), (record[2]));
		syscall(unix_write, 1, "\n", 0x1);
		source name = record[0];
		quadrant seek_site = record[2] - 1;
		while(true) {
			if(name[seek_site] == '.') {
				seek_site += 1;
				break;
			}
			seek_site -= 1;
		}
		syscall(unix_write, 1, "extension | ", 0xc);
		syscall(unix_write, 1, (record[0] + seek_site), (record[2] - seek_site));
		syscall(unix_write, 1, "\n", 0x1);
		//comand_site = 0;
		//add_to_entree("./sequences assemblies/equations/", comand, 0x21, &comand_site);
		// assembly-components
		//system("./sequences assemblies/equations/number-to-entree.asm secs/number-to-entree.secs");
		//system("gcc equations-main.c -o equations-main");
		site += 1;
	}
	return 0;
}
