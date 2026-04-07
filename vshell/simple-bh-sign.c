#include "../standard.h"
#include <string.h>
#include <stdio.h>
#include <math.h>
#define cs_buffer_size 0x2932e0

// try moded from a bricks-hall archive.
struct wav_header
{
  char riff[4];           /* "RIFF"                                  */
  int flength;        /* file length in bytes                    */
  char wave[4];           /* "WAVE"                                  */
  char fmt[4];            /* "fmt "                                  */
  int chunk_size;     /* size of FMT chunk in bytes (usually 16) */
  short format_tag;     /* 1=PCM, 257=Mu-Law, 258=A-Law, 259=ADPCM */
  short num_chans;      /* 1=mono, 2=stereo                        */
  int srate;          /* Sampling rate in samples per second     */
  int bytes_per_sec;  /* bytes per second = srate*bytes_per_samp */
  short bytes_per_samp; /* 2=16-bit mono, 4=16-bit stereo          */
  short bits_per_samp;  /* Number of bits per sample               */
  char data[4];           /* "data"                                  */
  int dlength;        /* data length in bytes (filelength - 44)  */
};

quad main(void) {
	struct wav_header wavh;
	float MIDDLE_C = 256.00;
	int sample_rate = 44100;
	int duration_seconds = 2;
	short int buffer[cs_buffer_size] = {};
	int header_length = sizeof(struct wav_header);

  strncpy(wavh.riff, "RIFF", 4);
  strncpy(wavh.wave, "WAVE", 4);
  strncpy(wavh.fmt, "fmt ", 4);
  strncpy(wavh.data, "data", 4);

  wavh.chunk_size = 16;
  wavh.format_tag = 1;
  wavh.num_chans = 1;
  wavh.srate = sample_rate;
  wavh.bits_per_samp = 16;
  wavh.bytes_per_sec = wavh.srate * 2;
	quad naof_samples = duration_seconds * sample_rate;
	printf("naof-samples | %lu\n", naof_samples);
  wavh.bytes_per_samp = 2;
  wavh.dlength = naof_samples * wavh.bytes_per_samp;
  wavh.flength = wavh.dlength + header_length;
	printf("wavh.dlength | %lu\n", wavh.dlength);
	getc(stdin);

	quad aish = 110;
	quad naof_samples_per_mod = sample_rate / aish;
	printf("naof_samples_per_mod | %lu\n", naof_samples_per_mod);
	//getc(stdin);
	quad mod_portion = naof_samples_per_mod / 2;
	printf("mod-portion | %lu\n", mod_portion);
	quad i = 0;
	while(true) {
		if(i == naof_samples) {
			break;
		}
		//printf("i | %lu\n", i);
		quad mod = i % naof_samples_per_mod;
		//printf("mod | %lu\n", mod);
		if(mod >= mod_portion) {
			mod -= mod_portion;
			mod = mod_portion - mod;
		}
		//printf("mod | %lu\n", mod);
		double fact = (double)mod / mod_portion;
		//printf("fact | %lf\n", fact);
		short sample = ((0x10000 - 800) * fact);
		printf("sample | %lu\n", sample);
    buffer[i] = (sample);
		i += 1;
  }

	source com_name = "test.wav";
	syscall(unix_unlink, com_name);
	ip_file wavf = syscall(unix_open, com_name, archive_create|archive_write, archive_jypsy);
	syscall(unix_write, wavf, &wavh, header_length);
	syscall(unix_write, wavf, buffer, wavh.dlength);
	return 0;
}
