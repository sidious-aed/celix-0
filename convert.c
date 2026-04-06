#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 2) {
    printf("params | *\n");
    printf("* | ffmpeg params (with -y auto filled here)\n");
    return;
  }
	sec comand[10000];
	quad comand_site = 0;
	add_to_entree("ffmpeg -y ", 10, comand, &comand_site);
	quad et = naof_params - 1;
	quad site = 1;
	while(true) {
		if(site == naof_params) {
			break;
		}
		add_to_entree(params[site], get_naof_secs(params[site]), comand, &comand_site);
		if(site != et) {
			add_to_entree(" ", 1, comand, &comand_site);
		}
		site += 1;
	}
	//syscall(unix_write, 1, comand, comand_site);
	//syscall(unix_write, 1, "\n", 1);
	system(comand);
  return 0;
}
