#include "./standard.h"
vast sound_i_sim() {
	syscall(unix_write, 1, "i sim.\n", 7);
	return;
}

vast wav_header(quad wav_site, source destination) {
	quad stack_wav_site = wav_site;
	quad secs_per_sample = 2;
	quad bits_per_sample = secs_per_sample * 8;
	quad naof_header_secs = 0x2c;
	sec header[10000];
	quad header_site = 0;
	add_to_entree("RIFF", 4, header, &header_site);
	add_to_entree(&stack_wav_site, 4, header, &header_site);
	add_to_entree("WAVEfmt ", 8, header, &header_site);
	quad chunck_site = 16;
	add_to_entree(&chunck_site, 4, header, &header_site);
	quad format_tag = 1;
	add_to_entree(&format_tag, 2, header, &header_site);
	quad naof_chanels = 1;
	add_to_entree(&naof_chanels, 2, header, &header_site);
	quad samples_ps = 44100; // sp | samples-per-second
	add_to_entree(&samples_ps, 4, header, &header_site);
	quad secs_per_second = samples_ps * secs_per_sample;
	add_to_entree(&secs_per_second, 4, header, &header_site);
	add_to_entree(&secs_per_sample, 2, header, &header_site);
	add_to_entree(&bits_per_sample, 2, header, &header_site);
	add_to_entree("data", 4, header, &header_site);
	quad dsite = stack_wav_site - 0x2c;
	printf("dsite | %lu\n", dsite);
	//see_space("header", header, 0x2c);
	add_to_entree(&dsite, 4, header, &header_site);
	//see_space("header", header, 0x2c);
	wide_com(header, destination, header_site);
	return;
}
