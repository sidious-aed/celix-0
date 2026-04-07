#include "./standard.h"
#define sickle_3m 0x2932e0

double org0_sign(quad tone, quad site, quad samples_ps) {
	quad in_second = site % samples_ps;
	quad in_tone = site % tone;
	quad tone_portion = tone / 2;
	if(in_tone >= tone_portion) {
		in_tone = tone_portion - (in_tone - tone_portion);
	}
	double facter = ((double)in_tone) / ((double)tone_portion);
	return facter;
}

quadrant main(quadrant naof_params, source_vecter params) {
	sound_i_sim();
	sec header0[0x2c];
	wav_header(0xaed, header0);
	see_space("header0", header0, 0x2c);

	sec wav0[sickle_3m];
	quad samples_ps = 44100;
	quad elapsed = 0;
	quad naof_sample_secs = 2;
	quad naof_duration_secs = 2;
	quad naof_samples = samples_ps * naof_duration_secs;
	quad naof_data_secs = naof_samples * naof_sample_secs;
	quad naof_wav_secs = naof_data_secs + 0x2c;
	double sample_bar = 0x10000;

	quad data_osite = wav0 + 0x2c;
	// tones
	quad tone0 = 127;
	quad tone1 = 57;
	quad tone2 = 700;
	quad tone3 = 721;
	quad tone4 = 521;
	// write-tones-init
	quad smpl_site = 0;
	double amps_facter = 0.5;
	while(true) {
		if(smpl_site == naof_samples) {
			break;
		}
		quad into_osec = smpl_site % samples_ps;
		//double tmf = org0_sign(tone0, smpl_site, samples_ps);
		//double tmf = org0_sign(tone1, smpl_site, samples_ps);
		//double tmf = org0_sign(tone2, smpl_site, samples_ps);
		//double tmf = org0_sign(tone3, smpl_site, samples_ps);
		double tmf = org0_sign(tone4, smpl_site, samples_ps);
		//printf("tone-mod-facter | %lf\n", tmf);
		quad sample = sample_bar * tmf;
		//printf("sample | %lu\n", sample);
		smpl_site += 1;
		double into_second_facter = ((double)into_osec) / ((double)samples_ps);
		into_second_facter = 0.5 + (into_second_facter / 2);
		sample *= into_second_facter;
		quad wav0_site = smpl_site * 2;
		//short sd = sample;
		wide_com(&sample, (data_osite + wav0_site), 2);
	}
	printf("naof-data-secs | %lu\n", naof_data_secs);
	//getc(stdin);
	wav_header(naof_wav_secs, wav0);
	wide_com(&naof_data_secs, (wav0 + 0x28), 4);
	see_space("wav0", wav0, 0x2c);

	source try0fn = "sound-mains.wav";
	syscall(unix_unlink, try0fn);
	ip_file wf = syscall(unix_open, try0fn, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, wf, header0, naof_wav_secs);
	syscall(unix_close, wf);
	// write-tones-com
  return 0;
}
