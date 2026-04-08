#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 4) {
    printf("params | 3\n");
    printf("1 | wav-0-name\n");
    printf("2 | wav-1-name\n");
		printf("3 | com-file-name\n");
    return;
  }
	sec cs[10000];
	quad cs_site = 0;
	ip_file wav0f = syscall(unix_open, params[1], archive_read);
	ip_file wav1f = syscall(unix_open, params[2], archive_read);
	ip_file comf = syscall(unix_open, params[3], archive_create|archive_write, archive_jypsy);
	quad naof_secs = 0;
	quad wav_site = 0;
	quad wav0_site = 0;
	quad wav1_site = 0;

	naof_secs = syscall(unix_lseek, wav0f, 0, seek_completion);
	if(naof_secs > wav_site) {
		wav_site = naof_secs;
	}
	wav0_site = naof_secs;
	printf("wav0-site | %lu\n", wav0_site);
	syscall(unix_lseek, wav0f, 0x2c, seek_origin);
	source in0 = syscall(unix_mmap, non, wav0_site, map_rws, clerk_descreet, wav0f, non);
	printf("in0 | %lu\n", in0);
	see_space("in0", in0, 0x100);

	syscall(unix_lseek, wav0f, 0x2c, seek_origin);
	naof_secs = syscall(unix_lseek, wav1f, 0, seek_completion);
	if(naof_secs > wav_site) {
		wav_site = naof_secs;
	}
	wav1_site = naof_secs;
	printf("wav1-site | %lu\n", wav1_site);
	source in1 = syscall(unix_mmap, non, wav1_site, map_rws, clerk_descreet, wav1f, non);
	printf("in1 | %lu\n", in1);
	see_space("in1", in1, 0x100);

	syscall(unix_lseek, wav1f, 0x2c, seek_origin);
	printf("wav-site | %lu\n", wav_site);
	double wav2_bar = 0x10000;
	sec wh[0x2c];
	wav_header(wav_site, wh);
	syscall(unix_write, comf, wh, 0x2c);
	see_space("wh", wh, 0x2c);
	quad naof_dsecs = wav_site - 0x2c;
	printf("naof-dsecs | %lu\n", naof_dsecs);
	quad wav0_sample = 0;
	double wav0fl = 0.0;
	quad wav1_sample = 0;
	double wav1fl = 0.0;
	quad site = 0x2c;
	while(true) {
		if(site == naof_dsecs) {
			break;
		}
		printf("site | %lu\n", site);
		site += 2;
		double mixf = 0.0;
		//quad naof_inzies = 0;
		double naof_mixzies = 0.0;
		if(site < wav0_site) {
			wide_com((in0 + site), &wav0_sample, 2);
			printf("wav0-sample | %ld\n", wav0_sample);
			wav0fl = wav0_sample / wav2_bar;
			printf("wav0fl | %lf\n", wav0fl);
			mixf += wav0fl;
			naof_mixzies += 1;
		}
		if(site < wav1_site) {
			wide_com((in1 + site), &wav1_sample, 2);
			printf("wav1-sample | %ld\n", wav1_sample);
			wav1fl = wav1_sample / wav2_bar;
			printf("wav1fl | %lf\n", wav1fl);
			mixf += wav1fl;
			naof_mixzies += 1;
		}
		if(naof_mixzies > 0) {
			mixf /= naof_mixzies;
		}
		printf("mixf | %lf\n", mixf);
		quad mixq = mixf * wav2_bar;
		syscall(unix_write, comf, &mixq, 2);
		//getc(stdin);
	}
	syscall(unix_close, wav0f);
	syscall(unix_close, wav1f);
	syscall(unix_close, comf);
  return 0;
}
