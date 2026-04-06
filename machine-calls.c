#include "./machine.h"

quadrant main(quadrant naof_params, source_vecter params) {
	sec seed[100];
	ip_file seed_file = syscall(unix_open, "/dev/random", archive_read);
	syscall(unix_read, seed_file, seed, 100);
	syscall(unix_close, seed_file);
	syscall(unix_write, 1, "in machine-main.\n", 0x11);
	log_heading("get-entree-site");
	sec view_entree[10000];
	quad view_entree_site = 0;
	quad site = 0;
	while(true) {
		if(site == naof_motion_alus) {
			break;
		}
		quad esite = ((site + seed[0]) % naof_motion_alus);
		source entree = motion_alus[esite];
		quad naof_entree_secs = motion_alus_naof_secs[esite];
		squad entree_site = get_entree_site(motion_alus, motion_alus_naof_secs, naof_motion_alus, entree, naof_entree_secs);
		view_entree_site = 0;
		add_to_entree(entree, naof_entree_secs, view_entree, &view_entree_site);
		quad naof_spaces = 4 - naof_entree_secs;
		if(naof_spaces > 0) {
			view_entree_site += replicate(' ', (view_entree + view_entree_site), naof_spaces);
		}
		add_to_entree(" | ", 3, view_entree, &view_entree_site);
		view_entree_site += number_to_entree(entree_site, (view_entree + view_entree_site), 16);
		add_to_entree("\n", 1, view_entree, &view_entree_site);
		syscall(unix_write, 1, view_entree, view_entree_site);
		//printf("entree-site | %lu\n", entree_site);
		site += 1;
	}
	squad rp_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_gnu_register_pairs, "rsi-r8", 6);
	printf("rp-site | %lu\n", rp_site);
	printf("rp | %s\n", gnu_register_pairs[rp_site]);

	sec ms[10000];
	quad ms_site = 0;
	log_heading("stay-tos");
	site = 0;
	while(true) {
		if(site == naof_stay_to_asm_signs) {
			break;
		}
		source asm_sign = stay_to_asm_signs[site];
		quad naof_asm_sign_secs = stay_to_asm_signs_naof_secs[site];
		syscall(unix_write, 1, asm_sign, naof_asm_sign_secs);
		syscall(unix_write, 1, "\n", 1);
		ms_site = asm_stay_to(asm_sign, naof_asm_sign_secs, 0xaedae, 0xedae, ms);
		see_space("ms", ms, ms_site);
		syscall(unix_write, 1, "ms | ", 4);
		//see_encoded(ms, ms_site, 16);
		site += 1;
	}

	log_heading("dynamic-stay-to");
	ms_site = asm_dynamic_stay_to("r11", 3, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("dynamic-castl-stay-to");
	ms_site = asm_dynamic_castl_stay_to(0xaed, "r11", 3, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("lea");
	ms_site = asm_lea_registers("r8-rsi", 6, 0xaed, ms);
	//ms_site = asm_lea_registers("r11-rdi", 7, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("mov");
	ms_site = 0;
	//ms_site = asm_mov_registers("r8-r9", 5, ms);
	//ms_site = asm_mov_registers("r10-r8", 6, ms);
	//ms_site = asm_mov_registers("rbx-r10", 7, ms);
	ms_site = asm_mov_registers("r11-rdi", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("mov-castl");
	//ms_site = asm_mov_castl_registers("r8-rdi", 6, 0xaedaed, ms);
	//ms_site = asm_mov_castl_registers("r8-rsi", 6, 0xaed, ms);
	//ms_site = asm_mov_castl_registers("r11-rsi", 7, 0xaed, ms);
	ms_site = asm_mov_castl_registers("r12-rsp", 7, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("mov-castr");
	ms_site = asm_mov_castr_registers("r12-rsp", 7, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("mov-sec-castl");
	//ms_site = asm_mov_castl_registers("r8-rdi", 6, 0xaedaed, ms);
	//ms_site = asm_mov_castl_registers("r8-rsi", 6, 0xaed, ms);
	//ms_site = asm_mov_castl_registers("r11-rsi", 7, 0xaed, ms);
	ms_site = asm_mov_sec_castl_registers("r12-rsp", 7, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("mov-sec-castr");
	//ms_site = asm_mov_castl_registers("r8-rdi", 6, 0xaedaed, ms);
	//ms_site = asm_mov_castl_registers("r8-rsi", 6, 0xaed, ms);
	//ms_site = asm_mov_castl_registers("r11-rsi", 7, 0xaed, ms);
	ms_site = asm_mov_sec_castr_registers("r12-rsp", 7, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("add-const-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	ms_site = asm_add_const_register("rax", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("add-registers");
	ms_site = asm_add_registers("r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("sub-const-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	ms_site = asm_sub_const_register("rax", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("sub-registers");
	ms_site = asm_sub_registers("r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("and-const-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	//ms_site = asm_and_const_register("rax", 3, 0xaedaed, ms);
	ms_site = asm_and_const_register("rdi", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("and-const-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	//ms_site = asm_and_const_register("rax", 3, 0xaedaed, ms);
	ms_site = asm_and_const_register("rdi", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("and-registers");
	ms_site = asm_and_registers("r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("xor-const-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	ms_site = asm_xor_const_register("rax", 3, 0xaedaed, ms);
	//ms_site = asm_xor_const_register("rdi", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("xor-registers");
	ms_site = asm_xor_registers("r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("or-const-register");
	//ms_site = asm_or_const_register("r13", 3, 0xaedaed, ms);
	ms_site = asm_or_const_register("rax", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("or-registers");
	ms_site = asm_or_registers("r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("not-register");
	//ms_site = asm_add_const_register("rsp", 3, 0xaedaed, ms);
	ms_site = asm_not_register("rax", 3, ms);
	//ms_site = asm_xor_const_register("rdi", 3, 0xaedaed, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("multiply-with-stack");
	sec zit_zit_seeking_space[1000];
	quad zit_zit_seeking_space_site = 0;
	add_to_entree("ms-site | ", 0xa, zit_zit_seeking_space, &zit_zit_seeking_space_site);
	zit_zit_seeking_space_site += number_to_entree(ms, (zit_zit_seeking_space + zit_zit_seeking_space_site), 0x10);
	add_to_entree("\n", 1, zit_zit_seeking_space, &zit_zit_seeking_space_site);
	syscall(unix_write, 1, zit_zit_seeking_space, zit_zit_seeking_space_site);
	/*
	while(true) {
		quad pause_meta[2] = {0, 0xaed};
		syscall(unix_nanosleep, pause_meta);
	}
	*/
	ms_site = asm_multiply_register_with_stack(0xaed, "rsi", 3, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("multiply-registers");
	ms_site = asm_multiply_registers(0xaed, "r12-rsp", 7, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("divide-register-to-returns");
	ms_site = asm_divide_castl_to_returns(0xaed, "rdi", 3, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("nops");
	ms_site = asm_nops(100, ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	/*
	writer grid = 0;
	quad naof_nops = 1000;
	log_heading("naof-nops");
	writer nops_motion = 0;
	create_motion(&grid, "nops-motion-0", 13, 0, 20, 1, &nops_motion);
	expand_for_motion_string(&grid, naof_nops, &nops_motion);
	writer entree = nops_motion[3];
	ms_site = asm_nops(naof_nops, (entree + 3));
	see_space("motion-ms", (entree + 3), ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("syscall");
	ms_site = asm_syscall(ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);

	log_heading("return");
	ms_site = asm_return(ms);
	see_space("ms", ms, ms_site);
	syscall(unix_write, 1, "ms | ", 4);
	see_encoded(ms, ms_site, 16);
	syscall(unix_write, 1, "\n", 1);
	*/
	return 0;
}
