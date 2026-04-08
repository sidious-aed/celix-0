#include "./standard.h"
#define sickle_3m 0x2932e0
#define revin_stackm 0x38752

double org0_sign(double modf) {
	double sampl = modf;
	sampl *= 2;
	if(sampl >= 1) {
		sampl = 2 - (sampl - 1);
	}
	sampl /= 2;
	return sampl;
}

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 5) {
    printf("(base-10) params | 4\n");
    printf("1 | base-note\n");
    printf("2 | quartet (nuance|subtlety)\n");
		printf("3 | notes (0.0.6.255|0.1.7.144) | [octive,nuance,subtlty,amps(1-sec-scope)))\n");
		printf("4 | com-file-name\n");
    return;
  }
	source base_notee = params[1];
	source quartet = params[2];
	quad quartet_naof_secs = get_naof_secs(quartet);
	source notese = params[3];
	quad naof_notese_secs = get_naof_secs(notese);
	source com_file_name = params[4];

	quad base_note = 0;
	entree_to_number(base_notee, get_naof_secs(base_notee), 10, &base_note);
	printf("base-note | %lu\n", base_note);
	quad nuance_site = 0;
	while(true) {
		if(quartet[nuance_site] == '|') {
			break;
		}
		nuance_site += 1;
	}
	source subtlety = (quartet + nuance_site + 1);
	quad subtlety_site = quartet_naof_secs - (((quad)subtlety - (quad)quartet));
	syscall(unix_write, 1, quartet, nuance_site);
	syscall(unix_write, 1, "\n", 1);
	syscall(unix_write, 1, subtlety, subtlety_site);
	syscall(unix_write, 1, "\n", 1);
	// quartet-meta
	quad naof_nuances = 0;
	entree_to_number(quartet, nuance_site, 10, &naof_nuances);
	quad naof_subtlties = 0;
	entree_to_number(subtlety, subtlety_site, 10, &naof_subtlties);
	printf("naof-nuances | %lu\n", naof_nuances);
	printf("naof-subtlties | %lu\n", naof_subtlties);

	quad note[4];
	note[0] = 0;
	note[1] = 0;
	note[2] = 0;
	note[3] = 0;
	quad site;
	sec cs[10000];
	quad cs_site = 0;
	writer grid = 0;
	writer notes;
	create_vecter(&grid, 0x20, 10000, &notes);
	quad notese_site = 0;
	quad mode = 0;
	quad is_com;
	while(true) {
		sec con = notese[notese_site];
		//printf("con | %c\n", con);
		site = notese_site;
		notese_site += 1;
		if(notese_site == naof_notese_secs) {
			is_com = true;
		} else {
			is_com = false;
		}
		//////////////////////////////
			quad is_record_com = is_com;
			if(con == '.' || con == '|') {
				quad number = 0;
				entree_to_number(cs, cs_site, 10, &number);
				//printf("number | %lu\n", number);
				cs_site = 0;
				note[mode] = number;
				mode += 1;
				if(mode == 4) {
					is_record_com = true;
				}
			} else {
				cs[cs_site] = con;
				cs_site += 1;
			}
			if(is_com) {
				quad number = 0;
				entree_to_number(cs, cs_site, 10, &number);
				//printf("number | %lu\n", number);
				cs_site = 0;
				note[mode] = number;
				mode += 1;
			}
			if(is_record_com) {
				//printf("octive | %lu\n", note[0]);
				//printf("nuance | %lu\n", note[1]);
				//printf("subtlty | %lu\n", note[2]);
				add_to_vecter(&grid, note, &notes);
				mode = 0;
			}
		//////////////////////////////
		if(is_com) {
			break;
		}
	}
	printf("naof-notes | %lu\n", notes[2]);
	printf("com-file-name | %s\n", com_file_name);

	//////////////////////////
	sec wav0[sickle_3m];
	double samples_ps = 44100;
	double elapsed = 0;
	quad naof_sample_secs = 2;
	quad naof_duration_secs = notes[2] / 4;
	quad naof_samples = samples_ps * naof_duration_secs;
	quad naof_data_secs = naof_samples * naof_sample_secs;
	double sample_duration = 1 / samples_ps;
	quad naof_quarter_second_samples = samples_ps / 4;
	/*
	quad naof_wav_secs = naof_data_secs + 0x2c;
	double sample_bar = 0x10000;
	quad data_osite = wav0 + 0x2c;
	wav_header(naof_wav_secs, wav0);
	wide_com(&naof_data_secs, (wav0 + 0x28), 4);
	see_space("wav0", wav0, 0x2c);
	*/

	// <--> notes to samples one at a time taskages
	////////////////////////////////////////
	///  hmma the data
	double samples[revin_stackm];
	sec data_secs = syscall(unix_mmap, non, 10000000, map_rws, 0x22, non, non);
	quad data_secs_site = 0;
	//samples[0xaed] = 0.123;
	////////////////////////////////////////
	double amps_bar = 0x100;
	quad samples_site = 0;
	site = 0;
	while(true) {
		if(site == notes[2]) {
			break;
		}
		writer tonem = (notes + 3) + (site * 4);
		printf("octive | %lu\n", tonem[0]);
		printf("nuance | %lu\n", tonem[1]);
		printf("subtlty | %lu\n", tonem[2]);
		printf("amps | %lu\n", tonem[3]);
		quad tone = base_note;
		quad exp_site = 0;
		while(true) {
			if(exp_site == tonem[0]) {
				break;
			}
			tone *= tone;
			exp_site += 1;
		}
		printf("tone-at-octive | %lu\n", tone);
		quad next_octive = tone * 2;
		printf("next-octive | %lu\n", next_octive);
		double octive_span = ((double)(next_octive - tone));
		printf("octive-span | %lf\n", octive_span);
		double nuance_step = octive_span / (double)naof_nuances;
		printf("nuance-step | %lf\n", nuance_step);
		double next_nstep = tone + nuance_step;
		double subtle_step = (next_nstep - tone) / (double)naof_subtlties;
		printf("subtle-step | %lf\n", subtle_step);
		double ampsf = tonem[3] / amps_bar;
		//getc(stdin);
		quad stp_site = 0;
		while(true) {
			if(stp_site == tonem[1]) {
				break;
			}
			tone += nuance_step;
			stp_site += 1;
		}
		stp_site = 0;
		while(true) {
			if(stp_site == tonem[2]) {
				break;
			}
			tone += subtle_step;
			stp_site += 1;
		}
		printf("tone | %lu\n", tone);
		quad oss = naof_quarter_second_samples * site; // oss | origin-sample-site
		printf("oss | %lu\n", oss);
		//getc(stdin);
		quad ssite = 0;
		while(true) {
			if(ssite == naof_quarter_second_samples) {
				break;
			}
			quad sampl_site = oss + ssite;
			double naof_seconds = (oss + ssite) * sample_duration;
			double secs_mod = naof_seconds - ((quad)naof_seconds);
			printf("secs-mod | %lf\n", secs_mod);
			double tone_mod = secs_mod * tone;
			tone_mod = tone_mod - (quad)tone_mod;
			//tone_mod /= tone;
			printf("tone-mod | %lf\n", tone_mod);
			double sampl_ampsf = org0_sign(tone_mod);
			sampl_ampsf *= ampsf;
			printf("sampl-ampsf | %lf\n", sampl_ampsf);
			quad sample_site = oss + ssite;
			printf("sample-site | %lu\n", sample_site);
			if(sample_site > samples_site) {
				samples_site = sample_site;
			}
			samples[sample_site] = sampl_ampsf;
			ssite += 1;
		}
		//getc(stdin);
		site += 1;
	}
	printf("samples-site | %lu\n", samples_site);
	//getc(stdin);
	sec heading[0x2c];
	wav_header(samples_site * 2 + 0x2c, heading);
	syscall(unix_unlink, com_file_name);
	ip_file wavf = syscall(unix_open, com_file_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, wavf, heading, 0x2c);
	lh("samples");
	site = 0;
	while(true) {
		if(site == samples_site) {
			break;
		}
		printf("site | %lu\n", site);
		double sample = samples[site];
		printf("sample | %lf\n", sample);
		short bar = sample * 0x10000;
		printf("bar | %hu\n", bar);
		//wide_com(&bar, (data_secs + data_secs_site), 2);
		syscall(unix_write, wavf, &bar, 2);
		data_secs_site += 2;
		site += 1;
	}
	/*
	*/
  return 0;
}
