// with apreitciation to mirlins and all spec fullfilling little dinasaurs (jawsys and jawsyesses), and all in that vaster over vasters, like scaleies and scaleiesses.
// for all the extras for best prowels best brace-ins these type of inclavituides with the two type caviot specs fulfilled.
#include "./standard.h"

quadrant write_quad_teir_1(source * q) {
	q[0] = 0xaed;
}

quadrant write_quad_teir_2(source * q) {
	write_quad_teir_1(q);
}

quadrant main(quadrant naof_params, source_vecter params) {
	quadrant q = 0;
	write_quad_teir_1(&q);
	sec base[100];
	quadrant naof_secs = number_to_entree(q, base, 16);
	syscall(unix_write, 1, base, naof_secs);
	syscall(unix_write, 1, "\n", 1);
	q = 0;
	write_quad_teir_2(&q);
	naof_secs = number_to_entree(q, base, 16);
	syscall(unix_write, 1, base, naof_secs);
	syscall(unix_write, 1, "\n", 1);
	return 0;
}
