#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	quad time[4];
	syscall(unix_gettimeofday, time, (time + 2));
	printf("time-seconds | %lu\n", time[0]);
	printf("time-microseconds | %lu\n", time[1]);
  return 0;
}
