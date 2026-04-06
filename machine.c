#include "./machine.h"

squad get_entree_site(source_vecter entrees, reader entrees_naof_secs, quad naof_entrees, source entree, quad naof_entree_secs) {
  quadrant site = 0;
  while(true) {
    if(site == naof_entrees) {
      break;
    }
		//printf("entrees[site] | %s\n", entrees[site]);
		//printf("entrees_naof_secs[site] | %lu\n", entrees_naof_secs[site]);
    if(compair_spaces(entree, naof_entree_secs, entrees[site], entrees_naof_secs[site])) {
      return site;
    }
    site += 1;
  }
  return -1;
}

quad asm_stay_to(source asm_sign, quad naof_asm_sign_secs, quad stack_site, quad com_stay_site, source space) {
	squad motion = com_stay_site - stack_site;
	squad sign_site = get_entree_site(stay_to_asm_signs, stay_to_asm_signs_naof_secs, naof_stay_to_asm_signs, asm_sign, naof_asm_sign_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = stay_to_signs_naof_secs[sign_site];
	motion -= (naof_sign_secs + 4);
	wide_com(stay_to_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&motion, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_short_stay_to(source asm_sign, quad naof_asm_sign_secs, quad stack_site, quad com_stay_site, source space) {
	squad motion = com_stay_site - stack_site;
	printf("motion | %lu\n", motion);
	if(motion > 0xff) {
		syscall(unix_write, 1, "short stays motion needs other method to stay-to.\n", 50);
		syscall(unix_exit_group, non);
	}
	squad sign_site = get_entree_site(stay_to_asm_signs, stay_to_asm_signs_naof_secs, naof_stay_to_asm_signs, asm_sign, naof_asm_sign_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = short_stay_to_sings_naof_secs[sign_site];
	motion -= (naof_sign_secs + 1);
	wide_com(short_stay_to_sings[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&motion, (space + ms_site), 1);
	ms_site += 1;
	//printf("ms-site | %lu\n", ms_site);
	return ms_site;
}

quad asm_dynamic_stay_to(source mod_register, quad naof_mod_register_secs, source space) {
	squad sign_site = get_entree_site(dynamic_asm_signs, dynamic_asm_signs_naof_secs, naof_dynamic_asm_signs, mod_register, naof_mod_register_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = dynamic_stay_to_signs_naof_secs[sign_site];
	wide_com(dynamic_stay_to_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_call_to(quad stack_site, quad com_stay_site, source space) {
	squad motion = com_stay_site - stack_site - 5;
	//printf("motion | %lu\n", motion);
	wide_com(call_sign_sec, space, 1);
	quad ms_site = 1;
	wide_com(&motion, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_dynamic_call_to(source mod_register, quad naof_mod_register_secs, source space) {
	squad sign_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_general_registers, mod_register, naof_mod_register_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = dynamic_call_to_signs_naof_secs[sign_site];
	wide_com(dynamic_call_to_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_dynamic_castl_stay_to(quad cast_site, source mod_register, quad naof_mod_register_secs, source space) {
	squad sign_site = get_entree_site(dynamic_asm_signs, dynamic_asm_signs_naof_secs, naof_dynamic_asm_signs, mod_register, naof_mod_register_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = dynamic_castl_stay_to_signs_naof_secs[sign_site];
	wide_com(dynamic_castl_stay_to_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_push_register(source register_name, quad naof_register_name_secs, source space) {
	squad sign_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_general_registers, register_name, naof_register_name_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = push_register_signs_naof_secs[sign_site];
	wide_com(push_register_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_pop_register(source register_name, quad naof_register_name_secs, source space) {
	squad sign_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_general_registers, register_name, naof_register_name_secs);
	//printf("sign-site | %lu\n", sign_site);
	quad naof_sign_secs = pop_register_signs_naof_secs[sign_site];
	wide_com(pop_register_signs[sign_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_lea_registers(source registers, quad naof_registers_secs, quad site, source space) {
	squad registers_site = get_entree_site(full_gnu_register_pairs, full_gnu_register_pairs_naof_secs, naof_gnu_full_register_pairs, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = lea_registers_signs_naof_secs[registers_site];
	wide_com(lea_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_set_register(quad constant, source register_name, quad naof_register_secs, source space) {
	squad registers_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", registers_site);
	quad naof_sign_secs = set_registers_signs_naof_secs[registers_site];
	wide_com(set_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 8);
	ms_site += 8;
	return ms_site;
}

quad asm_mov_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = mov_registers_signs_naof_secs[registers_site];
	wide_com(mov_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_mov_castl_registers(source registers, quad naof_registers_secs, quad site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = mov_castl_registers_signs_naof_secs[registers_site];
	wide_com(mov_castl_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_mov_castr_registers(source registers, quad naof_registers_secs, quad site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = mov_castr_registers_signs_naof_secs[registers_site];
	wide_com(mov_castr_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_mov_sec_castl_registers(source registers, quad naof_registers_secs, quad site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = mov_sec_castl_registers_signs_naof_secs[registers_site];
	wide_com(mov_sec_castl_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_mov_sec_castr_registers(source registers, quad naof_registers_secs, quad site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = mov_sec_castr_registers_signs_naof_secs[registers_site];
	wide_com(mov_sec_castr_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_add_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = add_const_register_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	wide_com(add_const_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_add_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = add_registers_signs_naof_secs[registers_site];
	wide_com(add_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_add_register_castr(source registers, quad naof_registers_secs, quad cast_site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = add_register_to_castr_signs_naof_secs[registers_site];
	wide_com(add_register_to_castr_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_sub_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = sub_const_register_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	wide_com(sub_const_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_sub_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = sub_registers_signs_naof_secs[registers_site];
	wide_com(sub_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_sub_register_castr(source registers, quad naof_registers_secs, quad cast_site, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = sub_register_to_castr_signs_naof_secs[registers_site];
	wide_com(sub_register_to_castr_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_and_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = and_const_register_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	wide_com(and_const_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_and_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = and_registers_signs_naof_secs[registers_site];
	wide_com(and_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_xor_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = xor_const_register_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	//see_space("xor-sign", xor_const_register_signs[register_site], naof_sign_secs);
	wide_com(xor_const_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_xor_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = xor_registers_signs_naof_secs[registers_site];
	wide_com(xor_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	//printf("sec-0 | %u\n", space[0]);
	return ms_site;
}

quad asm_or_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = or_const_register_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	//see_space("xor-sign", xor_const_register_signs[register_site], naof_sign_secs);
	wide_com(or_const_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_or_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = or_registers_signs_naof_secs[registers_site];
	wide_com(or_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	//printf("sec-0 | %u\n", space[0]);
	return ms_site;
}

quad asm_not_register(source register_name, quad naof_register_secs, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = not_register_signs_naof_secs[register_site];
	wide_com(not_register_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_multiply_register_with_stack(quad cast_site, source register_name, quad naof_register_secs, source space) {
	quad ms_site = 0;
	source space_con = (space + ms_site);
	//printf("sec-0 | %u\n", space_con[0]);
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	wide_com(multiply_with_stack_signs[register_site], space, 5);
	ms_site += 5;
	//see_space("at-cast-site", (multiply_with_stack_signs[register_site]), 5);
	//see_space("at-cast-site", (space + ms_site), 5);
	//space_con[0] = 0xae;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_multiply_registers(quad cast_site, source registers, quad naof_registers_secs, source space) {
	//printf("registers | %s\n", registers);
	//printf("naof-registers-secs | %lu\n", naof_registers_secs);
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = multiply_registers_signs_naof_secs[registers_site];
	wide_com(multiply_registers_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_divide(source register_name, quad naof_register_secs, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = divide_signs_naof_secs[register_site];
	wide_com(divide_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	return ms_site;
}

quad asm_divide_to_returns(quad cast_site, source register_name, quad naof_register_secs, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = divide_to_returns_signs_naof_secs[register_site];
	wide_com(divide_to_returns_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&cast_site, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_cmp_const_register(source register_name, quad naof_register_secs, quad constant, source space) {
	squad register_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_secs);
	//printf("register-site | %lu\n", register_site);
	quad naof_sign_secs = cmp_cnst_reg_signs_naof_secs[register_site];
	//printf("naof-sign-secs | %lu\n", naof_sign_secs);
	//getc(stdin);
	//see_space("xor-sign", xor_const_register_signs[register_site], naof_sign_secs);
	wide_com(cmp_cnst_reg_signs[register_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	wide_com(&constant, (space + ms_site), 4);
	ms_site += 4;
	return ms_site;
}

quad asm_cmp_registers(source registers, quad naof_registers_secs, source space) {
	squad registers_site = get_entree_site(gnu_register_pairs, gnu_register_pairs_naof_secs, naof_mov_pair_registers, registers, naof_registers_secs);
	//printf("registers-site | %lu\n", registers_site);
	quad naof_sign_secs = cmp_regzeez_signs_naof_secs[registers_site];
	wide_com(cmp_regzeez_signs[registers_site], space, naof_sign_secs);
	quad ms_site = naof_sign_secs;
	//printf("sec-0 | %u\n", space[0]);
	return ms_site;
}
/*
*/

quad asm_nops(quad naof_nops, source space) {
	replicate(nop_sign_sec[0], space, naof_nops);
	return naof_nops;
}

quad asm_syscall(source space) {
	//printf("in syscall.\n");
	//see_space("syscall-sing-secs", syscall_sign_secs, 2);
	wide_com(syscall_sign_secs, space, 2);
	return 2;
}

quad asm_return(source space) {
	wide_com(return_sign_sec, space, 1);
	return 1;
}

quad asm_store_state(source space) {
	wide_com(store_state_sign_sec, space, 1);
	return 1;
}

quad asm_restore_state(source space) {
	wide_com(restore_state_sign_sec, space, 1);
	return 1;
}

quad asm_repz_cmp(source space) {
	wide_com(repz_cmp_sign_secs, space, 2);
	return 2;
}

// z | spells intreague in tiger speak. and the questzeez here; is the meager gem of
// the clerk-clerkess type-scanner which probably the best scope for movzeez and cmpzeez
// as the mms are like a printing press in a prose compaired to the repz digi-type-thingy,
// and the quest to get to ask kernel stay of procedures where the mms scope should be better sense
// the kernel should have the zmms.
quad asm_repz_movq(source space) {
	wide_com(rep_movq_sign_secs, space, 3);
	return 3;
}

quad asm_repz_movb(source space) {
	wide_com(rep_movb_sign_secs, space, 2);
	return 2;
}

quad asm_repz_cmpq(source space) {
	wide_com(rep_cmpq_sign_secs, space, 3);
	return 3;
}

quad asm_repz_cmpb(source space) {
	wide_com(rep_cmpb_sign_secs, space, 2);
	return 2;
}

/*
vast abstract_thingy() {
}
*/

vast call_site(source calls, source name, writer cs) {
	source at_name = strstr(calls, name);
	quad at_site = at_name - calls;
	//printf("at-name | %s\n", at_name);
	squad segment_site = seek_space("\n", 1, (calls + at_site), (1000000));
	squad col_site = seek_space("|", 1, (calls + at_site), (segment_site));
	quad call_site = 0;
	source at_call_site = at_name + col_site + 1;
	quad naof_call_site_secs = segment_site - col_site - 1;
	entree_to_number((at_call_site), (naof_call_site_secs), 16, &call_site);
	cs[0] = call_site;
	return;
}
