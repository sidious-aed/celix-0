#include "/home/tyrel/celix/standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("rep movsq %ds:(%rsi), %es:(%rdi)");
	asm("rep movsb %ds:(%rsi), %es:(%rdi)");
	asm("repz cmpsq %es:(%rdi),%ds:(%rsi)");
	asm("repz cmpsb %es:(%rdi),%ds:(%rsi)");
	return 0;
}
