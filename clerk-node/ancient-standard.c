#include "./standard.h"

// some natural is an old say.
vast place(reader space, writer destination, quadrant distance) {
	//printf("entree | %s\n", space);
	//printf("destination-first-quad | %lu\n", destination[0]);
	//printf("distance | %lu\n", distance);
  quadrant naof_quads = distance / 8;
	//printf("naof-quads | %lu\n", naof_quads);
  quadrant naof_secs = distance % 8;
	//printf("naof-secs | %lu\n", naof_secs);
  quadrant site = 0;
  while(true) {
    if(site == naof_quads) {
      break;
    }
		//printf("site | %lu\n", site);
    //printf("space[site] | %lu\n", space[site]);
    destination[site] = space[site];
    site += 1;
  }
  source space_secs = space + naof_quads;
  source destination_secs = destination + naof_quads;
  site = 0;
  while(true) {
    if(site == naof_secs) {
      break;
    }
		//printf("site | %lu\n", site);
		//printf("space-secs[site] | %u\n", space_secs[site]);
    destination_secs[site] = space_secs[site];
    site += 1;
  }
  return;
}


// seems syscall non print asks the kernel to clear some memory module things.
// with just one case wide-seek is faster the seek-space but not to a threshold that strstr has.
// so; we have more in regards to back support and the kernels relationship with the mm registers and syscall.
squad wide_seek(source seek, quad naof_seek_secs, source entree, quad naof_entree_secs) {
	// rack
	// 0-20  | ymm0           | 0-4
	// 20-40 | ymm1           | 4-8
	// 40    | first-sec      | 8
	// 48    | entree         | 9
	// 50    | entree-site    | a
	// 58    | seek-site      | b
	// 60-80 | replicated-fs  | c-10
	// 80    | entree-at      | 10
	// 88    | cmp-set        | 11
	// 90    | seek           | 12
	// 98    | naof-seek-secs | 13
	//printf("in wide place.\n");
	quad naof_throughs = naof_entree_secs / 0x20;
	//printf("naof-throughs | %lu\n", naof_throughs);
	quad naof_sec_seeks = naof_entree_secs - (naof_throughs * 0x20);
	//printf("naof-sec-seeks | %lu\n", naof_sec_seeks);
	asm("sub $0x1000, %rsp");
	asm("lea 0x0(%rsp), %r8");
	register quad r8 asm("r8");
	writer rack = r8;
	source sec_rack = rack;

	rack[0x8] = 0;
	sec_rack[0x40] = seek[0];
	rack[0x9] = entree;
	rack[0xa] = 0;
	rack[0xb] = 0;
	rack[0x10] = 0;
	rack[0x11] = 0;
	rack[0x12] = seek;
	rack[0x13] = naof_seek_secs;
	asm("vpxor %ymm0, %ymm0, %ymm0");
	asm("vmovups 0x40(%rsp), %ymm0");
	asm("vpbroadcastb %xmm0, %ymm0");
	asm("vmovups %ymm0, 0x60(%rsp)");
	//see_space("after-punpcklbw ymm0", ((source)(rack + 0xc)), 0x20);

	quad through_site = 0;
	while(true) {
		if(through_site == naof_throughs) {
			break;
		}
		asm("mov 0x50(%rsp), %r11");
		asm("mov 0x48(%rsp), %r10");
		asm("add 0x50(%rsp), %r10");
		asm("vmovups 0x60(%rsp), %ymm0");
		asm("vmovups 0x0(%r10), %ymm1");
		asm("vpcmpeqb %ymm1, %ymm0, %ymm1");
		asm("vmovups %ymm1, 0x8(%rsp)");
		//see_space("after-vpcmpeqb ymm1", ((source)(rack + 0x1)), 0x20);
		asm("xor %r8, %r8");
		asm("vpmovmskb %ymm1, %r8");
		register quad r82 asm("r8");
		quad seek_bits = r82;
		rack[0xb] = seek_bits;
		//printf("seek-bits | %lu\n", seek_bits);
		while(true) {
			if(rack[0xb] == 0) {
				break;
			}
			asm("mov 0x58(%rsp), %r8");
			asm("xor %r9, %r9");
			asm("bsf %r8, %r9");
			register quad r9 asm("r9");
			quad bsf = r9;
			asm("lea 0x1(%r9), %rcx");
			asm("shr %cl, %r8");
			asm("mov %r8, 0x58(%rsp)");
			//syscall(unix_write, 1, non, 0);
			//printf("bsf-result-r9 | %lu\n", bsf);
			asm("xor %r11, %r11");
			quad entree_at = entree + rack[0xa]+ bsf;
			asm("add %r9, 0x50(%rsp)");
			asm("add $0x1, 0x50(%rsp)");
			//printf("stack-entree-site | %lu\n", stack_entree_site);
			//printf("bsf-result-r9 | %lu\n", bsf);
			rack[0x10] = entree_at;
			//printf("at-bsf | %s\n", (entree_at));
			register quad r83 asm("r8");
			seek_bits = r83;
			//printf("seek-bits | %lu\n", seek_bits);
			asm("mov 0x90(%rsp), %rsi");
			asm("mov 0x80(%rsp), %rdi");
			asm("mov 0x98(%rsp), %rcx");
			asm("xor %r8, %r8");
			asm("repz cmpsb %es:(%rdi), %ds:(%rsi)");
			asm("sete %r8b");
			asm("movq %r8, 0x88(%rsp)");
			//printf("set-e | %lu\n", rack[0x11]);
			if(rack[0x11]) {
				rack[0xa] -= 1;
				//printf("entree-site | %lu\n", rack[0xa]);
				return rack[0xa];
			}
			//break;
		}
		asm("add $0x20, 0x50(%rsp)");
		through_site += 1;
	}

	quad sec_seek_site = 0;
	while(true) {
		if(sec_seek_site == naof_sec_seeks) {
			break;
		}
		/*
		asm("mov 0x90(%rsp), %rsi");
		asm("mov 0x48(%rsp), %rdi");
		asm("mov 0x50(%rsp), %r8");
		asm("add %r8, %rdi");
		*/
		/*
		register quad rsi asm("rsi");
		source seek_at1 = rsi;
		printf("seek-at | %s\n", seek_at1);
		*/
		/*
		register quad rdi asm("rdi");
		source entree_at = rdi;
		printf("entree-at | %s\n", entree_at);
		printf("naof-seek-secs | %lu\n", rack[0x13]);
		*/

		asm("mov 0x90(%rsp), %rsi");
		asm("mov 0x48(%rsp), %rdi");
		asm("mov 0x50(%rsp), %r8");
		asm("add %r8, %rdi");
		asm("mov 0x98(%rsp), %rcx");
		asm("xor %r8, %r8");
		asm("repz cmpsb %es:(%rdi), %ds:(%rsi)");
		asm("sete %r8b");
		asm("mov %r8, 0x88(%rsp)");
		//printf("set-e | %lu\n", rack[0x11]);
		syscall(unix_write, 1, non, 0);
		if(rack[0x11]) {
			return rack[0xa];
		}
		rack[0xa] += 1;
		sec_seek_site += 1;
	}

	asm("add $0x1000, %rsp");
	return -1;
}
