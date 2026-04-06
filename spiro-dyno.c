#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | naof-dynos (base-16)\n");
    return;
  }
	quad naof_dynos = 0;
	entree_to_number(params[1], get_naof_secs(params[1]), 16, &naof_dynos);
	static const source spiro_dynos[10] = {"* werp", "* crdra", "* goes exo", "* dwells in", "* necketics", "* recoils from swore mudra <--> like pony point back with clavies recoile", "* scale-ibras", "* thrack-ralls", "* pack up-mudras", "* up-trendsalls"};
	quad naof_seed_dynos = 012;
	static const quad spiro_dynos_naof_secs[0xa] = {6, 7, 10, 11, 11, 73, 13, 14, 16, 15};
	ip_file seedf = syscall(unix_open, "/dev/random", archive_read);
	quad sq[1];
	sq[0] = 0;
	reader sqr = sq;
	writer grid = 0;
	writer ipsum = 0;
	create_vecter(&grid, 1, 1000, &ipsum);
	quad et = naof_dynos - 1;
	quad site = 0;
	while(true) {
		if(site == naof_dynos) {
			break; // * recoils from swore murdra
									// <--> * bold stays some sl then recoils into the pack recoil
		}
		syscall(unix_read, seedf, &sq, 8);
		quad ds = sqr[0] % naof_seed_dynos;
		add_string_to_sec_vecter(&grid, spiro_dynos[ds], spiro_dynos_naof_secs[ds], &ipsum);
		if(site != et) {
			add_string_to_sec_vecter(&grid, " ", 1, &ipsum);
		}
		site += 1;
	}
	syscall(unix_close, seedf);
	add_string_to_sec_vecter(&grid, "\n", 1, &ipsum);
	syscall(unix_write, 1, (ipsum + 3), ipsum[2]);
  return 0;
}
