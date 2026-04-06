#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	asm("mov %rsp, %r11");
	getc(stdin);
	//asm("sub $0x700000, %r11");
	asm("sub $0x700000, %rsp");
	asm("mov $0xaed, %r8");
	asm("mov %r8, 0x0(%rsp)");
	getc(stdin);
	//asm("add $0x700000, %r11");
	asm("add $0x700000, %rsp");
  return 0;
}
