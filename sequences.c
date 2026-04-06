#include "./machine.h"

vast poly_alert(source relay) {
	quad naof_secs = get_naof_secs(relay);
	sec poly_space[10000];
	quad poly_site = 0;
	add_to_entree("<--> | ", 7, poly_space, &poly_site);
	add_to_entree(relay, naof_secs, poly_space, &poly_site);
	add_to_entree("\n", 1, poly_space, &poly_site);
	syscall(unix_write, 1, poly_space, poly_site);
	syscall(unix_exit_group, 0);
}

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params < 4) {
    printf("params | 3-*\n");
    printf("1 | asm-file\n");
    printf("2 | secs-file\n");
    printf("3 | init-bs (base-16)\n");
		printf("(4-*) | params\n");
    return;
  }
  ip_file asm_file = syscall(unix_open, params[1], archive_read);
  quadrant naof_asm_secs = syscall(unix_lseek, asm_file, 0, seek_completion);
	//printf("naof-asm-secs | %lu\n", naof_asm_secs);
	source asms = syscall(unix_mmap, non, (naof_asm_secs + 1), map_rws, map_console, asm_file, 0);
	//syscall(unix_write, 1, asms, naof_asm_secs);
	writer grid = 0;
	writer mparams = 0;
	create_vecter(&grid, 0x10, 1000, &mparams);
	quad naof_mparams = naof_params - 4;
	quad psite = 0;
	while(true) {
		if(psite == naof_mparams) {
			break;
		}
		quad param_site = psite + 4;
		quad naof_param_secs = get_naof_secs(params[param_site]);
		source entree = 0;
		get_grid_secs(&grid, (naof_param_secs + 1), &entree);
		wide_com(params[param_site], entree, naof_param_secs);
		//printf("entree | %s\n", entree);
		//getc(stdin);
		quad param[2];
		param[0] = entree;
		param[1] = naof_param_secs;
		add_to_vecter(&grid, param, &mparams);
		psite += 1;
	}
	//printf("naof-params | %lu\n", mparams[2]);
	writer mach = 0;
	create_vecter(&grid, 1, 1000, &mach);
	writer components = 0;
	create_vecter(&grid, 0x28, 100, &components);
	quad init_bs = 0;
	entree_to_number(params[3], get_naof_secs(params[3]), 16, &init_bs);
	writer entrees = 0;
	create_vecter(&grid, 0x18, 1000, &entrees);
	writer quads = 0;
	create_vecter(&grid, 0x18, 1000, &quads);
	writer stats = 0;
	create_vecter(&grid, 0x18, 1000, &stats);
	writer cmetas = 0;
	create_vecter(&grid, 0x18, 1000, &cmetas);
	writer futures = 0;
	create_vecter(&grid, 0x40, 1000, &futures);

	quad bs = init_bs;
	quad ms = 0; // ms | machine-site
	quad sr = 0; // sr | stack-reference
	quad bsr = 0; //
	sec cp[10000]; // cp | clerk-space
	quad cp_site = 0;
	sec cs[10000]; // cs | clerk-space-2
	quad cs_site = 0;
	sec msecs[10000];
	quad is_in_multy_comment = false;
	quad msite = 0;
	quad site = 0;
	while(true) {
		//printf("at | %s\n", (cp + cp_site));
		cp_site = 0;
		add_to_entree("bs | ", 5, cp, &cp_site);
		cp_site += number_to_entree(bs, (cp + cp_site), 16);
		add_to_entree("\n", 1, cp, &cp_site);
		//syscall(unix_write, 1, cp, cp_site);
		while(true) {
			sec sec0 = (asms + site)[0];
			if(sec0 == '\t' || sec0 == ' ') {
				site += 1;
			} else {
				break;
			}
		}
		source sect = (asms + site);
		squad sect_site = seek_space("\n", 1, sect, (naof_asm_secs - site));
		syscall(unix_write, 1, sect, (sect_site + 1));
		site += (sect_site + 1);
		if(compair_spaces((sect), 4, "#com", 4)) {
			//printf("com of multi-comment.\n");
			is_in_multy_comment = false;
		}
		if((sect_site == 0) || (is_in_multy_comment)) {
			continue;
		}
		//printf("ms | %lu\n", ms);
		quad b16_site = 0;
		components[2] = 0;
		quad is_params = false;
		quad comp_site = 0;
		while(true) {
			if(comp_site >= sect_site) {
				break;
			}
			source sect_at = (sect + comp_site);
			squad csite = seek_space(" ", 1, (sect_at), (sect_site - comp_site));
			//printf("csite | %lu\n", csite);
			if(csite == code_a) {
				csite = (sect_site - comp_site);
			}
			//syscall(unix_write, 1, (sect_at), (csite));
			//syscall(unix_write, 1, "\n", 1);
			quad component[5];
			source entree = 0;
			if(sect_at[0] == '$') {
				quad param_site = 0;
				entree_to_number((sect_at + 1), (csite - 1), 16, &param_site);
				//printf("param-site | %lu\n", param_site);
				if(param_site >= mparams[2]) {
					cp_site = 0;
					// b | 11 | 2 | 13 | 17 <--> is to 27
					add_to_entree("need param ", 0xb, cp, &cp_site);
					cp_site += number_to_entree(param_site, (cp + cp_site), 16);
					add_to_entree(".", 1, cp, &cp_site);
					poly_alert(cp);
				}
				//getc(stdin);
				writer param = (mparams + 3) + (param_site * 2);
				get_grid_secs(&grid, (param[1] + 1), &entree);
				wide_com(param[0], (entree), param[1]);
				component[1] = param[1];
				is_params = true;
			} else {
				get_grid_secs(&grid, (csite + 1), &entree);
				wide_com(sect_at, (entree), csite);
				component[1] = csite;
			}
			//printf("comp-entree | %s\n", entree);
			component[0] = entree;
			//syscall(unix_write, 1, component[0], csite);
			//syscall(unix_write, 1, "\n", 1);
			quad is_b16 = is_base((component[0]), component[1], 16);
			//printf("is-b16 | %lu\n", is_b16);
			component[2] = is_b16;
			component[3] = 0;
			if(component[2]) {
				quad number = 0;
				entree_to_number(component[0], component[1], 16, &number);
				//printf("number | %lu\n", number);
				component[3] = number;
				b16_site = components[2];
			}
			component[4] = comp_site;
			//see_space("component", component, 0x28);
			add_to_vecter(&grid, component, &components);
			comp_site += (csite + 1);
			//printf("comp-site | %lu\n", comp_site);
			//getc(stdin);
		}
		if(b16_site == 0) {
			b16_site = code_b;
		}
		//printf("b16-site | %lu\n", b16_site);
		msite = 0;
		quad naof_comps = components[2];
		//printf("naof-comps | %lu\n", naof_comps);
		writer comp0 = (components + 3);
		writer comp1 = (components + 3) + (5);
		writer comp2 = (components + 3) + (10);
		writer comp3 = (components + 3) + (15);
		writer comp4 = (components + 3) + (20);
		cp_site = 0;
		//printf("is-in-multy-comment | %lu\n", is_in_multy_comment);
		//printf("module-name | %s\n", comp0[0]);
		//printf("naof-module-secs | %lu\n", comp0[1]);
		//printf("first-con | %c\n", (((source)(comp0[0])))[0]);
		if(compair_spaces(comp0[0], comp0[1], "#init", 5)) {
			//printf("init of multi-comment.\n");
			is_in_multy_comment = true;
		} else if(((((source)(comp0[0])))[0] == '#') || compair_spaces(comp0[0], comp0[1], "#", 1)) {
			// explicit comment aura-clerically registered.
			//getc(stdin);
		} else if(((((source)(comp0[0])))[0] == '%')) {
			source cname = 0;
			get_grid_secs(&grid, comp1[1], &cname);
			wide_com(comp1[0], cname, comp1[1]);
			writer meta_name = 0;
			create_vecter(&grid, 1, 100, &meta_name);
			add_string_to_sec_vecter(&grid, "secs/", 5, &meta_name);
			add_string_to_sec_vecter(&grid, comp1[0], comp1[1], &meta_name);
			add_string_to_sec_vecter(&grid, "/sites.chart", 12, &meta_name);
			//printf("meta-name | %lu\n", meta_name);
			//printf("meta-name | %s\n", (meta_name + 3));
			quad cmetar[3];
			cmetar[0] = cname;
			cmetar[1] = comp1[1];
			cmetar[2] = meta_name;
			add_to_vecter(&grid, cmetar, &cmetas);
		} else if(compair_spaces(comp0[0], comp0[1], "push", 4)) {
			msite = asm_push_register(comp1[0], comp1[1], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "pop", 3)) {
			msite = asm_pop_register(comp1[0], comp1[1], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "lea", 3)) {
			if(naof_comps != 4) {
				poly_alert("lea params are add-site, src-register, dest-register.");
			}
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp3[0], comp3[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_lea_registers(cp, cp_site, comp1[3], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "mov", 3)) {
			if(naof_comps == 3) {
				if(b16_site == code_b) {
					add_to_entree(comp1[0], comp1[1], cp, &cp_site);
					add_to_entree("-", 1, cp, &cp_site);
					add_to_entree(comp2[0], comp2[1], cp, &cp_site);
					//syscall(unix_write, 1, cp, cp_site);
					//syscall(unix_write, 1, "\n", 1);
					msite = asm_mov_registers(cp, cp_site, msecs);
				} else {
					//printf("set-register | %s\n", comp1[0]);
					msite = asm_set_register(comp1[3], comp2[0], comp2[1], msecs);
				}
			} else if(naof_comps == 4) {
				if(b16_site == 1) {
					add_to_entree(comp2[0], comp2[1], cp, &cp_site);
					add_to_entree("-", 1, cp, &cp_site);
					add_to_entree(comp3[0], comp3[1], cp, &cp_site);
					//syscall(unix_write, 1, cp, cp_site);
					//syscall(unix_write, 1, "\n", 1);
					msite = asm_mov_castl_registers(cp, cp_site, comp1[3], msecs);
				} else if(b16_site == 2) {
					add_to_entree(comp1[0], comp1[1], cp, &cp_site);
					add_to_entree("-", 1, cp, &cp_site);
					add_to_entree(comp3[0], comp3[1], cp, &cp_site);
					//syscall(unix_write, 1, cp, cp_site);
					//syscall(unix_write, 1, "\n", 1);
					msite = asm_mov_castr_registers(cp, cp_site, comp2[3], msecs);
				}
			} else {
				poly_alert("mov can except (constant, dest-register), (src-register, dest-register), (cast-site src-register dest-register), and (src-register, cast-site, dest-register).");
			}
		} else if(compair_spaces(comp0[0], comp0[1], "movs", 4)) { // movs | move-sec
			if(b16_site == 1) {
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp3[0], comp3[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_mov_sec_castl_registers(cp, cp_site, comp1[3], msecs);
			} else if(b16_site == 2) {
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp3[0], comp3[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_mov_sec_castr_registers(cp, cp_site, comp2[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "sub", 3)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_sub_registers(cp, cp_site, msecs);
			} else {
				msite = asm_sub_const_register(comp2[0], comp2[1], comp1[3], msecs);
				if(compair_spaces(comp2[0], comp2[1], "rsp", 3)) {
					bsr += comp1[3];
				}
			}
		} else if(compair_spaces(comp0[0], comp0[1], "add", 3)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_add_registers(cp, cp_site, msecs);
			} else {
				msite = asm_add_const_register(comp2[0], comp2[1], comp1[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "addc", 4)) {
			quad call_site = 0;
			quad found_call_meta = false;
			quad csite = 0;
			while(true) {
				if(csite == cmetas[2]) {
					break;
				}
				writer cmeta = (cmetas + 3) + (csite * 3);
				writer cmetae = cmeta[2];
				//see_space("cmeta", cmeta, 0x18);
				if(compair_spaces(cmeta[0], cmeta[1], comp1[0], comp1[1])) {
					//printf("addc | %lu\n", cmetae);
					//printf("addc | %s\n", (cmetae + 3));
					ip_file cf = syscall(unix_open, (cmetae + 3), archive_read);
					quad found_call_site = false;
					quad rsite = 0;
					while(true) {
						syscall(unix_lseek, cf, rsite, seek_origin);
						quad naof_rsecs = syscall(unix_read, cf, cp, 1000);
						//printf("naof-rsecs | %lu\n", naof_rsecs);
						if(naof_rsecs == 0) {
							break;
						}
						squad segment_site = seek_space("\n", 1, cp, naof_rsecs);
						syscall(unix_write, 1, cp, (segment_site + 1));
						squad section_site = seek_space("|", 1, cp, segment_site);
						if(compair_spaces(cp, section_site, comp2[0], comp2[1])) {
							entree_to_number((cp + section_site + 1), (segment_site - section_site - 1), 16, &call_site);
							printf("call-site | %lu\n", call_site);
							found_call_site = true;
							break;
						}
						rsite += (segment_site + 1);
					}
					if(found_call_site == false) {
						cp_site = 0;
						add_to_entree("could not find call-site for ", 29, cp, &cp_site);
						add_to_entree(cmeta[0], cmeta[1], cp, &cp_site);
						add_to_entree(" ", 1, cp, &cp_site);
						add_to_entree(comp2[0], comp2[1], cp, &cp_site);
						poly_alert(cp);
						syscall(unix_exit_group, 0);
					}
					found_call_meta = true;
				}
				csite += 1;
			}
			if(found_call_meta == false) {
				cp_site = 0;
				add_to_entree("could not find call-site for ", 29, cp, &cp_site);
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				poly_alert(cp);
				syscall(unix_exit_group, 0);
			}
			msite = asm_add_const_register(comp3[0], comp3[1], call_site, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "adde", 4)) {
			ip_file entsitesf = syscall(unix_open, comp1[0], archive_read);
			if(entsitesf == code_a) {
				cp_site = 0;
				add_to_entree("<--> could not open entrees file ", 33, cp, &cp_site);
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				poly_alert(cp);
				syscall(unix_exit_group, 0);
			}
			quad asfe = code_a;
			quad ansfe = code_a;
			quad es = 0;
			while(true) {
				syscall(unix_lseek, entsitesf, es, seek_origin);
				quad nrs = syscall(unix_read, entsitesf, cs, 10000);
				if(nrs == 0) {
					break;
				}
				squad nnls = seek_space("\n", 1, cs, nrs);
				if(nnls == code_a || nnls == code_b) {
					break;
				}
				squad nss = seek_space("|", 1, cs, nnls);
				//syscall(unix_write, 1, "at-name | ", 10);
				//syscall(unix_write, 1, (cs), nss);
				//syscall(unix_write, 1, "\n", 1);
				//syscall(unix_write, 1, "at-site | ", 10);
				//syscall(unix_write, 1, (cs + nss), (nnls - nss));
				//syscall(unix_write, 1, "\n", 1);
				es += (nnls + 1);
				if(compair_spaces(cs, nss, comp2[0], comp2[1])) {
					//printf("entree found.\n");
					nss += 1;
					squad naof_site_secs = seek_space("|", 1, (cs + nss), (nnls - nss));
					entree_to_number((cs + nss), (naof_site_secs), 16, &asfe);
					nss += (naof_site_secs + 1);
					entree_to_number((cs + nss), (nnls - nss), 16, &ansfe);
					break;
				}
			}
			syscall(unix_close, entsitesf);
			if(asfe == code_a) {
				cp_site = 0;
				add_to_entree("<--> could not find entrees code-named ", 0x27, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				poly_alert(cp);
				syscall(unix_exit_group, 0);
			} else {
				//printf("es | %lu\n", es);
				//printf("asfe | %lu\n", asfe);
				//printf("ansfe | %lu\n", ansfe);
				msite = asm_add_const_register(comp3[0], comp3[1], asfe, msecs);
				if(naof_comps == 5) {
					msite += asm_set_register(ansfe, comp4[0], comp4[1], (msecs + msite));
				}
			}
		} else if(compair_spaces(comp0[0], comp0[1], "and", 3)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_and_registers(cp, cp_site, msecs);
			} else {
				printf("and-const | %lu\n", comp1[3]);
				msite = asm_and_const_register(comp2[0], comp2[1], comp1[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "xor", 3)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_xor_registers(cp, cp_site, msecs);
			} else {
				msite = asm_xor_const_register(comp2[0], comp2[1], comp1[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "nao", 3)) { // nao | naoify (xor self)
			cp_site = 0;
			add_to_entree(comp1[0], comp1[1], cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp1[0], comp1[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_xor_registers(cp, cp_site, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "or", 2)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_or_registers(cp, cp_site, msecs);
			} else {
				msite = asm_or_const_register(comp2[0], comp2[1], comp1[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "not", 3)) {
			msite = asm_not_register(comp1[0], comp1[1], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "fact", 4)) { // fact | (facter|multiply)
			cp_site = 0;
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp3[0], comp3[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_multiply_registers(comp1[3], cp, cp_site, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "factq", 5)) { // factq | (facter-with-auto-name-sourcing)
			cp_site = 0;
			add_to_entree("rsp-", 4, cp, &cp_site);
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3);
				//printf("qua | %s\n", qua[0]);
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					msite = asm_multiply_registers(qua[2], cp, cp_site, msecs);
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "factqb", 6)) {
			cp_site = 0;
			add_to_entree("rbp-", 4, cp, &cp_site);
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			syscall(unix_write, 1, cp, cp_site);
			syscall(unix_write, 1, "\n", 1);
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3);
				//printf("qua | %s\n", qua[0]);
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					msite = asm_multiply_registers((qua[2] - bsr), cp, (cp_site), msecs);
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "div", 3)) { // div | (unfacter|devide) | castl register with rax.
			//printf("cast-site | %lu\n", comp1[3]);
			msite = asm_divide_to_returns(comp1[3], comp2[0], comp2[1], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "divq", 4)) { // divq | devide-quad-(auto-name-sourcing)
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3);
				//printf("qua | %s\n", qua[0]);
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					cp_site = 0;
					//msite = asm_divide_castl_to_returns(qua[2], "rsp", 3, msecs);
					msite = asm_divide_to_returns(qua[2], "rsp", 3, msecs);
				}
				qsite += 1;
			}
		/*
		*/
		} else if(compair_spaces(comp0[0], comp0[1], "divqb", 5)) { // divq | devide-quad-(auto-name-sourcing)
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3);
				//printf("qua | %s\n", qua[0]);
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					cp_site = 0;
					//msite = asm_divide_castl_to_returns(qua[2], "rsp", 3, msecs);
					msite = asm_divide_to_returns((qua[2] - bsr), "rbp", 3, msecs);
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "cmp", 3)) {
			if(b16_site == code_b) {
				cp_site = 0;
				add_to_entree(comp1[0], comp1[1], cp, &cp_site);
				add_to_entree("-", 1, cp, &cp_site);
				add_to_entree(comp2[0], comp2[1], cp, &cp_site);
				//syscall(unix_write, 1, cp, cp_site);
				//syscall(unix_write, 1, "\n", 1);
				msite = asm_cmp_registers(cp, cp_site, msecs);
			} else {
				msite = asm_cmp_const_register(comp2[0], comp2[1], comp1[3], msecs);
			}
		} else if(compair_spaces(comp0[0], comp0[1], "s", 1)) { // s | (stat|marker)
			quad stat[3];
			stat[0] = comp1[0];
			stat[1] = comp1[1];
			stat[2] = bs;
			add_to_vecter(&grid, stat, &stats);
		} else if(compair_spaces(comp0[0], comp0[1], "st", 2)) { // st | (stay-to)
			msite = asm_stay_to(comp1[0], comp1[1], bs, 0, msecs);
			quad ct[8];
			ct[0] = 2;
			ct[1] = comp2[0];
			ct[2] = comp2[1];
			ct[3] = ms;
			ct[4] = bs;
			ct[5] = comp1[0];
			ct[6] = comp1[1];
			ct[7] = 0;
			add_to_vecter(&grid, ct, &futures);
		} else if(compair_spaces(comp0[0], comp0[1], "sst", 3)) { // st | (stay-to)
			msite = asm_short_stay_to(comp1[0], comp1[1], bs, 0, msecs);
			quad ct[8];
			ct[0] = 3;
			ct[1] = comp2[0];
			ct[2] = comp2[1];
			ct[3] = ms;
			ct[4] = bs;
			ct[5] = comp1[0];
			ct[6] = comp1[1];
			ct[7] = 0;
			add_to_vecter(&grid, ct, &futures);
		} else if(compair_spaces(comp0[0], comp0[1], "dst", 3)) { // dst | (dynamic-stay-to)
			cp_site = 0;
			add_to_entree("jmpq", 4, cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp1[0], comp1[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_dynamic_stay_to(cp, cp_site, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "ct", 2)) { // ct | (call-to)
			quad ct[8];
			ct[0] = 1;
			ct[1] = comp1[0];
			ct[2] = comp1[1];
			ct[3] = ms;
			ct[4] = bs;
			ct[5] = 0;
			ct[6] = 0;
			ct[7] = 0;
			add_to_vecter(&grid, ct, &futures);
			msite = asm_call_to(bs, 0, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "dct", 3)) { // dct | (dynamic-call-to)
			msite = asm_dynamic_call_to(comp1[0], comp1[1], msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "sys", 3)) { // sys | syscall
			msite = asm_syscall(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "rcmp", 4)) { // rcmp | repz-compair
			msite = asm_repz_cmp(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "ret", 3)) { // ret | return
			msite = asm_return(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "mzq", 3)) { // mzq | repz-mov-quads
			msite = asm_repz_movq(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "mzs", 3)) { // mzs | repz-mov-secs
			msite = asm_repz_movb(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "czq", 3)) { // czq | repz-cmp-quads
			msite = asm_repz_movq(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "czs", 3)) { // czs | repz-cmp-secs
			msite = asm_repz_movb(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "ss", 2)) { // ss | store-state
			msite = asm_store_state(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "rs", 2)) { // rs | store-state
			msite = asm_restore_state(msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "naof", 4)) { // naof | number-of | in this focuser naof-secs, so 90 100 is 256 nops.
			sec mach_sec = comp1[3];
			//printf("mach-sec | %u\n", mach_sec);
			//expand_for_string_to_sec_vecter(&grid, comp2[3], &mach);
			//source mach_at = ((mach + 3) + mach[2]);
			//replicate(mach_sec, mach_at, comp2[3]);
			//printf("mach-site | %lu\n", mach[2]);
			//mach[2] += comp2[3];
			replicate_to_sec_vecter(&grid, mach_sec, comp2[3], &mach);
			bs += comp2[3];
			ms += comp2[3];
		} else if(compair_spaces(comp0[0], comp0[1], "aqs", 3)) { // aqs | auto-quad-source
			quad aqs[3];
			aqs[0] = comp1[0];
			aqs[1] = comp1[1];
			aqs[2] = sr;
			add_to_vecter(&grid, aqs, &quads);
			sr += 8;
		} else if(compair_spaces(comp0[0], comp0[1], "lq", 2)) { // lq | leeve-quad
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3); // qua --- ke for aqsing <--> * sirindiplea ... like final fantasy
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					printf("lq matched with %s\n", qua[0]);
					cp_site = 0;
					add_to_entree("rsp-", 4, cp, &cp_site);
					add_to_entree(comp2[0], comp2[1], cp, &cp_site);
					msite = asm_lea_registers(cp, cp_site, qua[2], msecs);
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "lqb", 3)) { // lq | leeve-quad
			//printf("bsr | %lu\n", bsr);
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3); // qua --- ke for aqsing <--> * sirindiplea ... like final fantasy
				if(compair_spaces(comp1[0], comp1[1], qua[0], qua[1])) {
					//printf("entree | %s\n", qua[0]);
					cp_site = 0;
					add_to_entree("rbp-", 4, cp, &cp_site);
					add_to_entree(comp2[0], comp2[1], cp, &cp_site);
					//syscall(unix_write, 1, cp, cp_site);
					//syscall(unix_write, 1, "\n", 1);
					msite = asm_lea_registers(cp, cp_site, (qua[2] - (bsr)), msecs);
					//see_space("msecs", msecs, msite);
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "mq", 2)) { // mq | move-quad
			quad is_castr = true;
			source register_name = comp1[0];
			quad naof_register_name_secs = comp1[1];
			source source_name = comp2[0];
			quad naof_source_name_secs = comp2[1];
			squad registers_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_name_secs);
			if(registers_site == -1) {
				is_castr = false;
				source_name = comp1[0];
				naof_source_name_secs = comp1[1];
				register_name = comp2[0];
				naof_register_name_secs = comp2[1];
				registers_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_name_secs);
				if(registers_site == -1) {
					poly_alert("mq needs one of the two params to be a gnu-64-general register. and the other, a aqs.");
				}
			}
			//printf("source-name | %s\n", source_name);
			//printf("naof-source-name-secs | %lu\n", naof_source_name_secs);
			//printf("is-castr | %lu\n", is_castr);
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3); // qua --- ke for aqsing <--> * sirindiplea ... like final fantasy
				//printf("qua | %s\n", qua[0]);
				if(compair_spaces(source_name, naof_source_name_secs, qua[0], qua[1])) {
					cp_site = 0;
					if(is_castr) {
						add_to_entree(register_name, naof_register_name_secs, cp, &cp_site);
						add_to_entree("-rsp", 4, cp, &cp_site);
						msite = asm_mov_castr_registers(cp, cp_site, qua[2], msecs);
						//see_space("msecs", msecs, msite);
					} else {
						add_to_entree("rsp-", 4, cp, &cp_site);
						add_to_entree(register_name, naof_register_name_secs, cp, &cp_site);
						msite = asm_mov_castl_registers(cp, cp_site, qua[2], msecs);
						//see_space("msecs", msecs, msite);
					}
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "mqb", 3)) { // mq | move-quad
			quad is_castr = true;
			source register_name = comp1[0];
			quad naof_register_name_secs = comp1[1];
			source source_name = comp2[0];
			quad naof_source_name_secs = comp2[1];
			squad registers_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_name_secs);
			if(registers_site == -1) {
				is_castr = false;
				source_name = comp1[0];
				naof_source_name_secs = comp1[1];
				register_name = comp2[0];
				naof_register_name_secs = comp2[1];
				registers_site = get_entree_site(gnu_registers, gnu_registers_naof_secs, naof_gnu_registers, register_name, naof_register_name_secs);
				if(registers_site == -1) {
					poly_alert("mq needs one of the two params to be a gnu-64-general register. and the other, a aqs.");
				}
			}
			//printf("source-name | %s\n", source_name);
			//printf("naof-source-name-secs | %lu\n", naof_source_name_secs);
			//printf("is-castr | %lu\n", is_castr);
			//printf("bsr | %lu\n", bsr);
			quad qsite = 0;
			while(true) {
				if(qsite == quads[2]) {
					break;
				}
				writer qua = (quads + 3) + (qsite * 3); // qua --- ke for aqsing <--> * sirindiplea ... like final fantasy
				if(compair_spaces(source_name, naof_source_name_secs, qua[0], qua[1])) {
					//printf("qua | %s\n", qua[0]);
					//printf("qua | %lu\n", qua[2]);
					cp_site = 0;
					if(is_castr) {
						add_to_entree(register_name, naof_register_name_secs, cp, &cp_site);
						add_to_entree("-rbp", 4, cp, &cp_site);
						msite = asm_mov_castr_registers(cp, cp_site, (qua[2] - bsr), msecs);
						//see_space("msecs", msecs, msite);
					} else {
						add_to_entree("rbp-", 4, cp, &cp_site);
						add_to_entree(register_name, naof_register_name_secs, cp, &cp_site);
						msite = asm_mov_castl_registers(cp, cp_site, (qua[2] - bsr), msecs);
						//see_space("msecs", msecs, msite);
					}
				}
				qsite += 1;
			}
		} else if(compair_spaces(comp0[0], comp0[1], "secs", 4)) {
			quad naof_csecs = (naof_comps - 1);
			quad csec_site = 0;
			while(true) {
				if(csec_site == naof_csecs) {
					break;
				}
				writer csec_comp = (components + 3) + 5 + (csec_site * 5);
				add_string_to_sec_vecter(&grid, (csec_comp + 3), 1, &mach);
				csec_site += 1;
			}
			bs += (naof_csecs);
			ms += (naof_csecs);
		} else if(compair_spaces(comp0[0], comp0[1], "isr", 3)) { // isr | incriment-stack-reference
			sr += comp1[3];
		} else if(compair_spaces(comp0[0], comp0[1], "dslr", 4)) { // dslr | decriment-shakecelar
			bsr += comp1[3];
		} else if(compair_spaces(comp0[0], comp0[1], "lent", 4)) { // lent | leave-entree
			quad lent[8];
			source entree = 0;
			get_grid_secs(&grid, (comp1[1] + 1), &entree);
			wide_com(comp1[0], entree, comp1[1]);
			lent[0] = 0; // entree-type
			lent[1] = entree;
			lent[2] = comp1[1];
			lent[3] = ms;
			lent[4] = comp2[0];
			lent[5] = comp2[1];
			lent[6] = 0;
			lent[7] = 0;
			add_to_vecter(&grid, lent, &futures);
			cp_site = 0;
			add_to_entree("rsp", 3, cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_lea_registers(cp, cp_site, 0, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "lentb", 5)) { // lent | leave-entree
			//printf("in lentb.\n");
			quad lent[8];
			source entree = 0;
			get_grid_secs(&grid, (comp1[1] + 1), &entree);
			wide_com(comp1[0], entree, comp1[1]);
			lent[0] = 0; // entree-type
			lent[1] = entree;
			lent[2] = comp1[1];
			lent[3] = ms;
			lent[4] = comp2[0];
			lent[5] = comp2[1];
			lent[6] = 0;
			lent[7] = 0xaed;
			add_to_vecter(&grid, lent, &futures);
			cp_site = 0;
			add_to_entree("rbp", 3, cp, &cp_site);
			add_to_entree("-", 1, cp, &cp_site);
			add_to_entree(comp2[0], comp2[1], cp, &cp_site);
			//syscall(unix_write, 1, cp, cp_site);
			//syscall(unix_write, 1, "\n", 1);
			msite = asm_lea_registers(cp, cp_site, 0, msecs);
		} else if(compair_spaces(comp0[0], comp0[1], "ent", 3)) { // ent | entree
			//printf("com0 | %s\n", comp0[0]);
			//printf("com1 | %s\n", comp1[0]);
			source ent0 = (sect + comp0[1] + comp1[1] + 2);
			quad naof_ent0_secs = sect_site - 2 - comp0[1] - comp1[1];
			//printf("ent | %s", ent0);
			//printf("naof-ent0-secs | %lu\n", naof_ent0_secs);
			quad ent[2];
			ent[0] = comp1[0];
			ent[1] = comp1[1];
			ent[2] = sr;
			add_to_vecter(&grid, ent, &entrees);
			quad ent_quad = 0;
			quad quad_site = 0; // awesome or plenty fine set in is beyond defferent than of.
			source ent_com = &ent_quad;
			quad ent_site = 0;
			while(true) {
				quad is_qcom = false;
				quad is_com = false;
				sec con = ent0[ent_site];
				if(con == '\\') {
					ent_site += 1;
					if(ent0[ent_site] == 'n') {
						con = '\n';
					} else if(ent0[ent_site] == 't') {
						con = '\t';
					} else if(ent0[ent_site] == '\\') {
						con = '\\';
					} else {
						con = 16;
					}
				}
				ent_com[quad_site] = con;
				quad_site += 1;
				if(quad_site == 8) {
					is_qcom = true;
				}
				ent_site += 1;
				if(ent_site == naof_ent0_secs) {
					is_qcom = true;
					is_com = true;
				}
				if(is_qcom) {
					msite = asm_set_register(ent_quad, "r8", 2, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = asm_mov_castr_registers("r8-rsp", 6, sr, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					sr += 8;
					ent_quad = 0;
					quad_site = 0;
				}
				if(is_com) {
					msite = asm_xor_registers("r8-r8", 5, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = asm_mov_castr_registers("r8-rsp", 6, sr, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = 0;
					sr += 8;
					break;
				}
			}
		} else if(compair_spaces(comp0[0], comp0[1], "entb", 4)) { // ent | entree
			//printf("com0 | %s\n", comp0[0]);
			//printf("com1 | %s\n", comp1[0]);
			source ent0 = (sect + comp0[1] + comp1[1] + 2);
			quad naof_ent0_secs = sect_site - 2 - comp0[1] - comp1[1];
			//printf("ent | %s", ent0);
			//printf("naof-ent0-secs | %lu\n", naof_ent0_secs);
			quad ent[2];
			ent[0] = comp1[0];
			ent[1] = comp1[1];
			ent[2] = sr;
			add_to_vecter(&grid, ent, &entrees);
			quad ent_quad = 0;
			quad quad_site = 0; // awesome or plenty fine set in is beyond defferent than of.
			source ent_com = &ent_quad;
			quad ent_site = 0;
			while(true) {
				quad is_qcom = false;
				quad is_com = false;
				sec con = ent0[ent_site];
				if(con == '\\') {
					ent_site += 1;
					if(ent0[ent_site] == 'n') {
						con = '\n';
					} else if(ent0[ent_site] == 't') {
						con = '\t';
					} else if(ent0[ent_site] == '\\') {
						con = '\\';
					} else {
						con = 16;
					}
				}
				ent_com[quad_site] = con;
				quad_site += 1;
				if(quad_site == 8) {
					is_qcom = true;
				}
				ent_site += 1;
				if(ent_site == naof_ent0_secs) {
					is_qcom = true;
					is_com = true;
				}
				if(is_qcom) {
					msite = asm_set_register(ent_quad, "r8", 2, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = asm_mov_castr_registers("r8-rbp", 6, (sr - bsr), msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					sr += 8;
					ent_quad = 0;
					quad_site = 0;
				}
				if(is_com) {
					msite = asm_xor_registers("r8-r8", 5, msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = asm_mov_castr_registers("r8-rbp", 6, (sr - bsr), msecs);
					add_string_to_sec_vecter(&grid, msecs, msite, &mach);
					bs += msite;
					ms += (msite);
					msite = 0;
					sr += 8;
					break;
				}
			}
		}
		if(msite > 0) {
			//see_space("msecs", msecs, msite);
			add_string_to_sec_vecter(&grid, msecs, msite, &mach);
			bs += msite;
			ms += (msite);
		}
		//printf("mach-site | %lu\n", mach[2]);
		if(site >= naof_asm_secs) {
			break;
		}
		//printf("\n");
	}

	//log_heading("entrees");
	site = 0;
	while(true) {
		if(site == entrees[2]) {
			break;
		}
		writer ent = (entrees + 3) + (site * 3);
		//printf("entree-%lu | %s | %lu\n", site, ent[0], ent[2]);
		site += 1;
	}

	//log_heading("quads");
	site = 0;
	while(true) {
		if(site == quads[2]) {
			break;
		}
		writer aqs = (quads + 3) + (site * 3);
		//printf("quad-%lu | %s | %lu\n", site, aqs[0], aqs[2]);
		site += 1;
	}

	//log_heading("stats");
	site = 0;
	while(true) {
		if(site == stats[2]) {
			break;
		}
		writer ent = (stats + 3) + (site * 3);
		//printf("stat-%lu | %s | %lu\n", site, ent[0], ent[2]);
		site += 1;
	}

	source last_mach_com = 0;
	quad last_mach_com_naof_secs = 0;
	//log_heading("futures");
	site = 0;
	while(true) {
		if(site == futures[2]) {
			break;
		}
		writer future = (futures + 3) + (site * 8);
		//see_space("future", future, 0x20);
		if(future[0] == 0) {
			//printf("entree-name | %s\n", future[1]);
			//printf("naof-entree-secs | %lu\n", future[2]);
			quad esite = 0;
			while(true) {
				if(esite == entrees[2]) {
					break;
				}
				writer ent = (entrees + 3) + (esite * 3);
				//printf("entree-%lu | %s | %lu\n", site, ent[0], ent[2]);
				if(compair_spaces(future[1], future[2], ent[0], ent[1])) {
					//printf("entree matched for lent.\n");
					cp_site = 0;
					if(future[7] == 0xaed) {
						add_to_entree("rbp", 3, cp, &cp_site);
					} else {
						add_to_entree("rsp", 3, cp, &cp_site);
					}
					add_to_entree("-", 1, cp, &cp_site);
					add_to_entree(future[4], future[5], cp, &cp_site);
					//syscall(unix_write, 1, cp, cp_site);
					//syscall(unix_write, 1, "\n", 1);
					if(future[7] == 0xaed) {
						//printf("bsr | %lu\n", bsr);
						msite = asm_lea_registers(cp, cp_site, (ent[2] - bsr), msecs);
					} else {
						msite = asm_lea_registers(cp, cp_site, ent[2], msecs);
					}
					//printf("msecs | ");
					//see_encoded(msecs, msite, 16);
					//printf("\n");
					//printf("mach-site | %lu\n", future[3]);
					source mach_com = (((source)(mach + 3)) + future[3]);
					//source mach_com = (mach + 3);
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
					//com_string_to_sec_vecter(&grid, msecs, msite, &mach, futures[3]);
					wide_com(msecs, (mach_com), msite);
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
				}
				esite += 1;
			}
		} else if(future[0] == 1) {
			//printf("entree-name | %s\n", future[1]);
			//printf("naof-entree-secs | %lu\n", future[2]);
			quad st_site = 0;
			while(true) {
				if(st_site == stats[2]) {
					break;
				}
				writer stat = (stats + 3) + (st_site * 3);
				//printf("stat-%lu | %s | %lu\n", site, stat[0], stat[2]);
				if(compair_spaces(future[1], future[2], stat[0], stat[1])) {
					//printf("stat matched for ct.\n");
					//printf("stack-site | %lu\n", future[3]);
					//printf("stat-stack-site | %lu\n", stat[2]);
					//printf("bs | %lu\n", future[4]);
					//printf("ds | %lu\n", stat[2]);
					msite = asm_call_to(future[4], stat[2], msecs);
					//printf("msecs | ");
					//see_encoded(msecs, msite, 16);
					//printf("\n");
					source mach_com = (((source)(mach + 3)) + future[3]);
					last_mach_com = mach_com;
					last_mach_com_naof_secs = msite;
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
					wide_com(msecs, (mach_com), msite);
					//com_string_to_sec_vecter(&grid, msecs, msite, &mach, future[3]);
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
				}
				st_site += 1;
			}
		} else if((future[0] == 2) || (future[0] == 3)) {
			//printf("entree-name | %s\n", future[1]);
			//printf("naof-entree-secs | %lu\n", future[2]);
			quad st_site = 0;
			while(true) {
				if(st_site == stats[2]) {
					break;
				}
				writer stat = (stats + 3) + (st_site * 3);
				//printf("stat-%lu | %s | %lu\n", site, stat[0], stat[2]);
				if(compair_spaces(future[1], future[2], stat[0], stat[1])) {
					//printf("stat matched for ct.\n");
					//printf("stack-site | %lu\n", future[3]);
					//printf("stat-stack-site | %lu\n", stat[2]);
					//printf("bs | %lu\n", future[4]);
					//printf("ds | %lu\n", stat[2]);
					//printf("fmode | %lu\n", future[0]);
					if(future[0] == 2) {
						msite = asm_stay_to(future[5], future[6], future[4], stat[2], msecs);
					} else if(future[0] == 3) {
						msite = asm_short_stay_to(future[5], future[6], future[4], stat[2], msecs);
					}
					//printf("msite | %lu\n", msite);
					//see_space("msecs", msecs, msite);
					//printf("msecs | ");
					//see_encoded(msecs, msite, 16);
					//printf("\n");
					source mach_com = (((source)(mach + 3)) + future[3]);
					last_mach_com = mach_com;
					last_mach_com_naof_secs = msite;
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
					wide_com(msecs, (mach_com), msite);
					//com_string_to_sec_vecter(&grid, msecs, msite, &mach, future[3]);
					//printf("mach-com | ");
					//see_encoded(mach_com, msite, 16);
					//printf("\n");
				}
				st_site += 1;
			}
			/*
			*/
		}
		site += 1;
	}

	quad mach_com = (mach + 3);
	//printf("mach-com | ");
	//see_encoded((mach + 3), mach[2], 16);
	//printf("\n");
	//see_space("mach", (mach + 3), mach[2]);
	//printf("last-mach-com | ");
	//see_encoded((last_mach_com), last_mach_com_naof_secs, 16);
	//printf("\n");
	//see_space("mach", (mach + 3), (mach[2]));
	syscall(unix_unlink, params[2]);
  archive_grid secs_file = syscall(unix_open, params[2], archive_write|archive_create, archive_jypsy);
	syscall(unix_write, secs_file, (mach + 3), mach[2]);
  syscall(unix_close, secs_file);
	/*
	*/
  return 0;
}
