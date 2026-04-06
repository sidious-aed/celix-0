#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	sec io_chart[0x4f721c];
	ip_file io_chartf = syscall(unix_open, "bin/io.so.9.bc", archive_read);
	quad naof_rsecs = syscall(unix_read, io_chartf, io_chart, 0x4f721b);
	io_chart[naof_rsecs] = 0;
	//printf("io-chart | %s\n", io_chart);
  source vrio_chart = syscall(unix_mmap, non, 0x4f721b, map_rws, clerk_descreet, io_chartf, non);
	source rio_chart = malloc(0x4f721c);
	syscall(unix_lseek, io_chartf, 0, 0);
	naof_rsecs = syscall(unix_read, io_chartf, rio_chart, 0x4f721b);
	printf("io-chart | %lu\n", io_chart);
	printf("vrio-chart | %lu\n", vrio_chart);
	quad time0[2];
	quad zones0[2];
	quad time1[2];
	quad zones1[2];
	while(true) {
		quad when = false;
		log_heading("str-str");
		syscall(unix_gettimeofday, time0, zones0);
		source at_stack_chart_for_seek = strstr(io_chart, "214d8") - 7;
		syscall(unix_gettimeofday, time1, zones1);
		quad naof_seconds_for_stack = time1[0] - time0[0];
		quad naof_micro_seconds_for_stack = time1[1] - time0[1];
		if(naof_seconds_for_stack > 0) {
			when = true;
		}

		syscall(unix_gettimeofday, time0, zones0);
		source at_vram_chart_for_seek = strstr(vrio_chart, "214d8") - 7;
		syscall(unix_gettimeofday, time1, zones1);
		quad naof_seconds_for_vram = time1[0] - time0[0];
		quad naof_micro_seconds_for_vram = time1[1] - time0[1];
		if(naof_seconds_for_vram > 0) {
			when = true;
		}

		syscall(unix_gettimeofday, time0, zones0);
		source at_ram_chart_for_seek = strstr(rio_chart, "214d8") - 7;
		syscall(unix_gettimeofday, time1, zones1);
		quad naof_seconds_for_ram = time1[0] - time0[0];
		quad naof_micro_seconds_for_ram = time1[1] - time0[1];
		if(naof_seconds_for_ram > 0) {
			when = true;
		}

		log_heading("stack");
		syscall(unix_write, 1, at_stack_chart_for_seek, 0xba);
		printf("naof-seconds-for-stack | %lu\n", naof_seconds_for_stack);
		printf("naof-micro-seconds-for-stack | %lu\n", naof_micro_seconds_for_stack);

		log_heading("vram");
		syscall(unix_write, 1, at_vram_chart_for_seek, 0xba);
		printf("naof-seconds-for-vram | %lu\n", naof_seconds_for_vram);
		printf("naof-micro-seconds-for-vram | %lu\n", naof_micro_seconds_for_vram);

		log_heading("cram");
		syscall(unix_write, 1, at_ram_chart_for_seek, 0xba);
		printf("naof-seconds-for-ram | %lu\n", naof_seconds_for_vram);
		printf("naof-micro-seconds-for-ram | %lu\n", naof_micro_seconds_for_ram);

		log_heading("clerk-wide-8-1");
		syscall(unix_gettimeofday, time0, zones0);
		at_stack_chart_for_seek = io_chart + seek_space("214d8", 5, io_chart, 0x4f721b) - 7;
		syscall(unix_gettimeofday, time1, zones1);
		naof_seconds_for_stack = time1[0] - time0[0];
		naof_micro_seconds_for_stack = time1[1] - time0[1];
		if(naof_seconds_for_stack > 0) {
			when = true;
		}

		syscall(unix_gettimeofday, time0, zones0);
		at_vram_chart_for_seek = vrio_chart + seek_space("214d8", 5, vrio_chart, 0x4f721b) - 7;
		syscall(unix_gettimeofday, time1, zones1);
		naof_seconds_for_vram = time1[0] - time0[0];
		naof_micro_seconds_for_vram = time1[1] - time0[1];
		if(naof_seconds_for_vram > 0) {
			when = true;
		}

		syscall(unix_gettimeofday, time0, zones0);
		at_ram_chart_for_seek = rio_chart + seek_space("214d8", 5, rio_chart, 0x4f721b);
		syscall(unix_gettimeofday, time1, zones1);
		naof_seconds_for_ram = time1[0] - time0[0];
		naof_micro_seconds_for_ram = time1[1] - time0[1];
		if(naof_seconds_for_ram > 0) {
			when = true;
		}

		log_heading("stack");
		syscall(unix_write, 1, at_stack_chart_for_seek, 0xba);
		printf("naof-seconds-for-stack | %lu\n", naof_seconds_for_stack);
		printf("naof-micro-seconds-for-stack | %lu\n", naof_micro_seconds_for_stack);

		log_heading("vram");
		syscall(unix_write, 1, at_vram_chart_for_seek, 0xba);
		printf("naof-seconds-for-vram | %lu\n", naof_seconds_for_vram);
		printf("naof-micro-seconds-for-vram | %lu\n", naof_micro_seconds_for_vram);

		log_heading("cram");
		syscall(unix_write, 1, at_ram_chart_for_seek, 0xba);
		printf("naof-seconds-for-ram | %lu\n", naof_seconds_for_ram);
		printf("naof-micro-seconds-for-ram | %lu\n", naof_micro_seconds_for_ram);
		if(when) {
			break;
		}
	}
  return 0;
}
