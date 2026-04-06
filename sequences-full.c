#include "./machine.h"

quadrant main(quadrant naof_params, source_vecter params) {
	//printf("naof-params | %lu\n", naof_params);
	//view_params(naof_params, params);
  if(naof_params < 4) {
    syscall(unix_write, 1, "params | 3-*\n", 13);
    syscall(unix_write, 1, "1 | asm-file\n", 13);
    syscall(unix_write, 1, "2 | secs-file\n", 14);
    syscall(unix_write, 1, "3 | origin-site (base-16)\n", 26);
    syscall(unix_write, 1, "(3-*) | asm-params\n", 19);
    return 0;
  }
	source grid = 0;
  quadrant asm_file_distance = get_naof_secs(params[1]);
  quadrant secs_file_distance = get_naof_secs(params[2]);
  quadrant origin_site_distance = get_naof_secs(params[3]);
  quadrant origin_site;
  entree_to_number(params[3], origin_site_distance, 16, &origin_site);
  quadrant naof_asm_params = naof_params - 3;
  archive_grid asm_file = open(params[1], archive_read);
  if(asm_file == 0xffffffffffffffff) {
    syscall(unix_write, 1, "clerical warn | could not open ", 31);
    syscall(unix_write, 1, params[1], asm_file_distance);
    syscall(unix_write, 1, "\n", 1);
  }
  quadrant assembly_distance = syscall(unix_lseek, asm_file, 0, seek_completion);
  syscall(unix_lseek, asm_file, 0, seek_origin);
  source assembly = syscall(unix_mmap, non, assembly_distance, map_readable, clerk_descreet, asm_file, 0);
  close(asm_file);
  archive_grid secs_file = open(params[2], archive_read);
  if(secs_file != 0xffffffffffffffff) {
		syscall(unix_close, secs_file);
		syscall(unix_unlink, params[2]);
  }
  quadrant binary_site = origin_site;
  quadrant asm_rack_site = 0;
  writer entrees;
  create_vecter(&grid, 24, 100, &entrees);
  writer markers;
  create_vecter(&grid, 24, 100, &markers);
  writer futures;
  create_vecter(&grid, 40, 100, &futures);
  writer sources;
  create_vecter(&grid, 24, 100, &sources);
  //source machine_secs = malloc(1000000);
	//printf("i sim.\n");
	writer machine_secs = 0;
	create_vecter(&grid, 1, 0x10000, &machine_secs);
  sec machine_space[100000];
  sec clerical_space[100];
  //naoify(machine_space, 100);
  quadrant is_replicate = false;
  sec replicate_params[1000];
	sec conjoined_if_param[100];
	quadrant conjoined_if_param_site = 0;
  quadrant replicate_params_site;
  quadrant clerical_param_site;
  quadrant replicate_params_distance;
  quadrant clerical_site_for_replicate;
  //quadrant is_in_if = false;
  quadrant is_if_not = false;
  quadrant site = 0;
  while(true) {
    sec b16[100];
    quadrant b16_site = number_to_entree(binary_site, b16, 16);
    b16[b16_site] = 0;
    //printf("binary-site | %s\n", b16);
    directional segment_distance = seek_space("\n", 1, (assembly + site), (assembly_distance - site));
    if(segment_distance < 0) {
      break;
    }
    source segment = (assembly + site);
		//syscall(unix_write, 1, segment, segment_distance);
		//syscall(unix_write, 1, "\n", 1);
    site += (segment_distance + 1);
    sec segment_space[10000];
    quadrant segment_space_site = 0;
    quadrant segment_site = 0;
    quadrant machine_site = 0;
		//syscall(unix_write, 1, "i sim.\n", 7);
		while(true) {
			if(segment_site == segment_distance) {
				break;
			}
			sec rune = segment[segment_site];
			if((rune != '\t') && (rune != ' ')) {
				break;
			}
			segment_site += 1;
		}
		//syscall(unix_write, 1, (segment + segment_site), segment_distance);
		//syscall(unix_write, 1, "\n", 1);
    while(true) {
      quadrant remaining_segment_distance = (segment_distance - segment_site);
      directional param_site = seek_space("$", 1, (segment + segment_site), (remaining_segment_distance));
      if(param_site < 0) {
        place((segment + segment_site), (segment_space + segment_space_site), (remaining_segment_distance));
        segment_space_site += remaining_segment_distance;
        segment_site += remaining_segment_distance;
        break;
      } else {
        quadrant segment_is_complete = false;
        place((segment + segment_site), (segment_space + segment_space_site), (param_site));
        segment_site += (param_site + 1);
        segment_space_site += (param_site);
        quadrant remaining_segment_distance = (segment_distance - segment_site);
        directional space_site = seek_space(" ", 1, (segment + segment_site), remaining_segment_distance);
        if(space_site < 0) {
          space_site = remaining_segment_distance;
          segment_is_complete = true;
        }
        quadrant site_of_param;
        entree_to_number((segment + segment_site), space_site, 10, &site_of_param);
        site_of_param += 3;
        if(site_of_param >= naof_params) {
          printf("clerical warn | need asm-param-site %lu\n", (site_of_param - 3));
          syscall(unix_exit_group, 0);
        }
        quadrant param_distance = get_naof_secs(params[site_of_param]);
        place(params[site_of_param], (segment_space + segment_space_site), param_distance);
        segment_space_site += param_distance;
        segment_site += space_site;
        if(segment_is_complete) {
          break;
        }
      }
    }
    segment_space[segment_space_site] = 0;
    segment_distance = segment_space_site;
    if(is_replicate && (is_if_not == false)) {
      sec replicate_space[1000];
      // r | ready, read, right.
      // rsite | replicate-segment-site
      quadrant rsite = 0;
      // ssite | segment-site
      quadrant ssite = 0;
      while(true) {
        if(ssite >= segment_distance) {
          break;
        }
        directional replicate_symbol_site = seek_space("*", 1, (segment_space + ssite), (segment_distance - ssite));
        //printf("replicate-symbol-site | %ld\n", replicate_symbol_site);
        //printf("params-from | %s\n", (replicate_params + replicate_params_site));
        //printf("ssite | %lu\n", ssite);
        //printf("segment-distance | %lu\n", segment_distance);
        //printf("segment-from-site | %s\n", (segment_space + ssite));
        if(replicate_symbol_site < 0) {
          quadrant send_distance = (segment_distance - ssite);
          place((segment_space + ssite), (replicate_space + rsite), (send_distance));
          ssite += (send_distance);
          rsite += send_distance;
        } else {
					//syscall(unix_write, 1, (replicate_params + replicate_params_site), (replicate_params_distance - replicate_params_site));
					//syscall(unix_write, 1, "\n", 1);
          directional param_site = seek_space("*", 1, (replicate_params + replicate_params_site), (replicate_params_distance - replicate_params_site));
          //syscall(unix_write, 1, "param | ", 8);
          //syscall(unix_write, 1, (replicate_params + replicate_params_site), (param_site));
          //syscall(unix_write, 1, "\n", 1);
					quadrant is_cif = (compair_spaces("cif", 3, (segment_space), 3) >= 0);
          if((param_site < 0)) {
            syscall(unix_write, 1, "clerical warn | need replicate param ", 37);
            quadrant clerical_distance = number_to_entree(clerical_param_site, clerical_space, 10);
            syscall(unix_write, 1, clerical_space, clerical_distance);
            syscall(unix_write, 1, "\n", 1);
            syscall(unix_exit_group, 0);
          } else {
						if(compair_spaces("cif", 3, (segment_space), 3)) {
							if(conjoined_if_param_site == 0) {
								//printf("initing conjoined if.\n");
								//printf("conjoined-if-param | %s\n", conjoined_if_param);
								//printf("param-site | %lu\n", param_site);
								quadrant send_distance = (replicate_symbol_site - 1);
								place((segment_space + ssite), (replicate_space + rsite), (send_distance));
								ssite += (send_distance + 2);
								rsite += send_distance;
								place(" ", (replicate_space + rsite), 1);
								rsite += 1;
								place((replicate_params + replicate_params_site), (replicate_space + rsite), (param_site));
								place((replicate_params + replicate_params_site), (conjoined_if_param), (param_site));
								conjoined_if_param_site = param_site;
								conjoined_if_param[conjoined_if_param_site] = 0;
								//printf("conjoined-if-param | %s\n", conjoined_if_param);
								rsite += param_site;
								replicate_params_site += (param_site + 1);
								clerical_param_site += 1;
							} else {
								//printf("continuing conjoined if.\n");
								quadrant send_distance = (replicate_symbol_site - 1);
								place((segment_space + ssite), (replicate_space + rsite), (send_distance));
								ssite += (send_distance + 2);
								rsite += send_distance;
								place(" ", (replicate_space + rsite), 1);
								rsite += 1;
								place((conjoined_if_param), (replicate_space + rsite), (conjoined_if_param_site));
								rsite += conjoined_if_param_site;
							}
						} else {
							quadrant send_distance = (replicate_symbol_site - 1);
							place((segment_space + ssite), (replicate_space + rsite), (send_distance));
							ssite += (send_distance + 2);
							rsite += send_distance;
							place(" ", (replicate_space + rsite), 1);
							rsite += 1;
							place((replicate_params + replicate_params_site), (replicate_space + rsite), (param_site));
							rsite += param_site;
							replicate_params_site += (param_site + 1);
							clerical_param_site += 1;
						}
            //syscall(unix_write, 1, (replicate_space), (rsite));
            //syscall(unix_write, 1, "\n", 1);
          }
        }
      }
      //printf("\n");
      place((replicate_space), (segment_space), rsite);
      segment_space[rsite] = 0;
      segment_distance = rsite;
      segment_space_site = segment_distance;
    }
		//syscall(unix_write, 1, segment_space, segment_space_site);
		//syscall(unix_write, 1, "\n", 1);
    if((segment_space[0] != '^') && (is_if_not == false) && (((segment_space[0] == 'i') && (segment_space[1] == 'f')) == false)) {
      syscall(unix_write, 1, segment_space, segment_space_site);
      syscall(unix_write, 1, "\n", 1);
    }
		if(is_if_not) {
			//syscall(unix_write, 1, "is-if-not\n", 10);
		} else {
			//syscall(unix_write, 1, "is-not-if-not\n", 14);
		}
		/*
		*/
    quadrant naof_components = 0;
    quadrant components[111]; // fly by one; fly by two, fly by three.
    segment_site = 0;
    while(true) {
      quadrant components_site = naof_components * 2;
      quadrant is_completion = false;
      quadrant remaining_distance = (segment_space_site - segment_site);
      directional space_site = seek_space(" ", 1, (segment_space + segment_site), (remaining_distance));
      if(space_site < 0) {
        is_completion = true;
        space_site = remaining_distance;
      }
      components[components_site] = segment_site;
      components[components_site + 1] = space_site;
      segment_site += (space_site + 1);
      naof_components += 1;
      if(is_completion) {
        break;
      }
    }
    //see_space("components", components, (naof_components * 16));
    if((compair_spaces("#init", 5, (segment_space + components[0]), components[1]))) {
			is_if_not = true;
		} else if(is_if_not && (compair_spaces("#com", 4, (segment_space + components[0]), components[1]))) {
      is_if_not = false;
		} else if(is_if_not && (compair_spaces("fi", 2, (segment_space + components[0]), components[1]))) {
      // secs for set if be(benieth-equal) to rack back-words | 0f 96 84 24 88 f0 ff ff
      is_if_not = false;
		} else if(is_if_not) {
			// when in if not.
    } else if(compair_spaces("ret", 3, (segment_space + components[0]), components[1])) {
			machine_space[machine_site] = return_sign_sec[0];
			machine_site = 1;
    } else if(compair_spaces("secs", 4, (segment_space + components[0]), components[1])) {
      quadrant section_site = 1;
      while(true) {
        if(section_site == naof_components) {
          break;
        }
        quadrant components_site = section_site * 2;
        quadrant distance_site = components_site + 1;
        if(components[distance_site] > 2) {
          printf("clerical warn | secs segment has at least a more than two base16 sec\n");
          syscall(unix_exit_group, 0);
        }
        quadrant machine_sec;
        entree_to_number((segment_space + components[components_site]), components[distance_site], 16, &machine_sec);
        machine_space[machine_site] = machine_sec;
        machine_site += 1;
        section_site += 1;
      }
    } else if(compair_spaces("naof-secs", 9, (segment_space + components[0]), components[1])) {
      quadrant naof_secs = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &naof_secs);
      quadrant machine_sec = 0;
      entree_to_number((segment_space + components[4]), components[5], 16, &machine_sec);
			sec replicate_sec[1];
			replicate_sec[0] = machine_sec;
			quadrant rsite = 0;
			while(true) {
				if(rsite == naof_secs) {
					break;
				}
				add_string_to_sec_vecter(&grid, replicate_sec, 1, &machine_secs);
				rsite += 1;
			}
    } else if(compair_spaces("marker", 6, (segment_space + components[0]), components[1])) {
      source entree = 0;
			get_grid_secs(&grid, components[3], &entree);
      place((segment_space + components[2]), entree, components[3]);
      //see_space("entree", &entree, 8);
      //printf("entree | %s\n", entree);
      sec record[24];
      place(&entree, record, 8);
      place((components + 3), (record + 8), 8);
      place(&binary_site, (record + 16), 8);
      //see_space("record", record, 24);
      add_to_vecter(&grid, record, &markers);
      reader record_quads = record;
      //printf("destination | %lu\n", record_quads[2]);
		} else if(compair_spaces("reset-rack-site", 15, (segment_space + components[0]), components[1])) {
			asm_rack_site = 0;
			//printf("in reset-rack-site.\n");
			//syscall(unix_exit_group, 0);
    } else if(compair_spaces("^", 1, (segment_space + components[0]), components[1])) {
      if(is_replicate) {
				conjoined_if_param_site = 0;
        if(replicate_params_site == replicate_params_distance) {
          is_replicate = false;
        } else {
          site = clerical_site_for_replicate;
        }
      } else {
        is_replicate = true;
        clerical_param_site = 0;
        clerical_site_for_replicate = site;
        place((segment_space + components[2]), replicate_params, components[3]);
        replicate_params_distance = components[3];
        replicate_params_site = 0;
        //printf("is-replicate | %lu\n", is_replicate);
      }
		// cif | conjoined-if
    } else if(compair_spaces("if", 2, (segment_space + components[0]), components[1]) || compair_spaces("cif", 3, (segment_space + components[0]), components[1])) {
      if(compair_spaces((segment_space + components[2]), (components[3]), (segment_space + components[4]), (components[5]))) {
        // if; if is true, than any could make entrees here. in prose of could we.
				//syscall(unix_write, 1, "if compair is not to is-if-not state\n", 37);
      } else {
				//syscall(unix_write, 1, "if compair is to is-if-not state\n", 33);
        is_if_not = true;
      }
      //printf("is-if-not | %lu\n", is_if_not);
    } else if(compair_spaces("motion-stay", 11, (segment_space + components[0]), components[1])) {
      quadrant stack_site;
      entree_to_number((segment_space + components[2]), components[3], 16, &stack_site);
      machine_site = asm_clerical_motion_stay_from((segment_space + components[4]), components[5], binary_site, stack_site, machine_space);
    } else if(compair_spaces("stay-to", 7, (segment_space + components[0]), components[1])) {
      machine_site = asm_clerical_motion_stay_from((segment_space + components[4]), components[5], binary_site, 0, machine_space);
      source entree = 0;
			get_grid_secs(&grid, components[3], &entree);
      place((segment_space + components[2]), entree, components[3]);
      //see_space("entree", &entree, (components[3] + 4));
      //printf("entree | %s\n", entree);
      sec record[40];
      place(&entree, record, 8);
      place((components + 3), (record + 8), 8);
      entree = 0;
			get_grid_secs(&grid, components[5], &entree);
      place((segment_space + components[4]), entree, components[5]);
      //see_space("entree", &entree, 8);
      place(&entree, (record + 16), 8);
      place((components + 5), (record + 24), 8);
      place(&binary_site, (record + 32), 8);
      //see_space("record", record, 40);
      add_to_vecter(&grid, record, &futures);
    } else if(compair_spaces("set-conditional", 15, (segment_space + components[0]), components[1])) {
      machine_site = asm_set_conditional((segment_space + components[2]), components[3], machine_space);
    } else if(compair_spaces("entree", 6, (segment_space + components[0]), components[1])) {
      source entree = 0;
			get_grid_secs(&grid, components[3], &entree);
      place((segment_space + components[2]), entree, components[3]);
      //see_space("entree", &entree, 8);
      //printf("entree | %s\n", entree);
      sec record[24];
      place(&entree, record, 8);
      place((components + 3), (record + 8), 8);
      place(&asm_rack_site, (record + 16), 8);
      //see_space("record", record, 24);
      add_to_vecter(&grid, record, &entrees);
      quadrant quad_site = 0;
      quadrant segment_site = components[6];
      quadrant quad = 0;
      source quad_secs = &quad;
      machine_site = 0;
      //printf("segment-distance | %lu\n", segment_distance);
      while(true) {
        //printf("segment-site | %lu\n", segment_site);
        quadrant is_completion = false;
        quadrant is_quad_completion = false;
        if(segment_site == segment_distance) {
          is_completion = true;
          is_quad_completion = true;
        }
        if(segment_space[segment_site] == '\\') {
          segment_site += 1;
          sec special = segment_space[segment_site];
          if(special == 't') {
            special = 9;
          } else if(special == 'n') {
            special = 10;
					} else if(special == 'r') {
						special = 13;
          } else if(special == '\\') {
            special = 92;
          }
          quad_secs[quad_site] = special;
          quad_site += 1;
          segment_site += 1;
        } else {
          quad_secs[quad_site] = segment_space[segment_site];
          quad_site += 1;
          segment_site += 1;
        }
        if(quad_site == 8) {
          is_quad_completion = true;
        }
        if(is_quad_completion) {
          //printf("quad | %lu\n", quad);
          machine_site += asm_set_register("r8", 2, quad, (machine_space + machine_site));
          machine_site += asm_move_to("r8-rsp", 6, asm_rack_site, (machine_space + machine_site));
          asm_rack_site += 8;
          quad_site = 0;
          quad = 0;
        }
        if(is_completion) {
          break;
        }
      }
    } else if(compair_spaces("register-to-rack", 16, (segment_space + components[0]), components[1])) {
      machine_site = asm_register_to_rack((segment_space + components[2]), components[3], machine_space);
    } else if(compair_spaces("rack-to-register", 16, (segment_space + components[0]), components[1])) {
      machine_site = asm_rack_to_register((segment_space + components[2]), components[3], machine_space);
    } else if(compair_spaces("leeve-entree", 12, (segment_space + components[0]), components[1])) {
      //see_space("entrees", entrees, 0x100);
      quadrant naof_entrees = entrees[2];
      //printf("naof-entrees | %lu\n", entrees[2]);
      quadrant rack_site = 0; 
      quadrant entree_site = 0;
      while(true) {
        if(entree_site == naof_entrees) {
          printf("clerical warn | entree %s could not be found in asm.\n", (segment_space + components[2]));
          syscall(unix_exit_group, 0);
        }
        reader record = (entrees + (3 + (entree_site * 3)));
        if(compair_spaces(record[0], record[1], (segment_space + components[2]), components[3])) {
          rack_site = record[2];
          break;
        }
        entree_site += 1;
      }
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree("rsp-", 4, (registers), &registers_site);
      add_to_entree((segment_space + components[4]), components[5], (registers), &registers_site);
      machine_site = asm_leeve_registers(registers, registers_site, rack_site, (machine_space + machine_site));
    } else if(compair_spaces("add-to-rack-site", 16, (segment_space + components[0]), components[1])) {
      quadrant number = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &number);
      asm_rack_site += number;
    } else if(compair_spaces("reset-site", 10, (segment_space + components[0]), components[1])) {
      asm_rack_site = 0;
    } else if(compair_spaces("quad-source", 11, (segment_space + components[0]), components[1])) {
      source entree = 0;
			get_grid_secs(&grid, components[3], &entree);
      place((segment_space + components[2]), entree, components[3]);
      //see_space("entree", &entree, 8);
      //printf("entree | %s\n", entree);
      sec record[24];
      place(&entree, record, 8);
      place((components + 3), (record + 8), 8);
      quadrant rack_site;
      entree_to_number((segment_space + components[4]), components[5], 16, &rack_site);
      place(&rack_site, (record + 16), 8);
      //see_space("record", record, 24);
      add_to_vecter(&grid, record, &sources);
    } else if(compair_spaces("auto-quad-source", 16, (segment_space + components[0]), components[1])) {
      source entree = 0;
			get_grid_secs(&grid, components[3], &entree);
      place((segment_space + components[2]), entree, components[3]);
      //see_space("entree", &entree, 8);
      //printf("entree | %s\n", entree);
			//printf("rack-site | %lu\n", asm_rack_site);
      sec record[24];
      place(&entree, record, 8);
      place((components + 3), (record + 8), 8);
      place(&asm_rack_site, (record + 16), 8);
      asm_rack_site += 8;
      //see_space("record", record, 24);
      add_to_vecter(&grid, record, &sources);
    } else if(compair_spaces("leeve-quad", 10, (segment_space + components[0]), components[1])) {
      quadrant naof_sources = sources[2];
      quadrant source_site = 0;
      reader record;
      //printf("seeking | %s\n", (segment_space + components[2]));
      while(true) {
        if(source_site == naof_sources) {
          printf("clerical warn | could not find %s quad-source.\n", (segment_space + components[4]));
          syscall(unix_exit_group, 0);
        }
        record = (sources + (3 + (source_site * 3)));
        //printf("against | %s\n", record[0]);
        if(compair_spaces((segment_space + components[2]), components[3], record[0], record[1])) {
          break;
        }
        source_site += 1;
      }
      quadrant rack_site = record[2];
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree("rsp-", 4, (registers), &registers_site);
      add_to_entree((segment_space + components[4]), components[5], (registers), &registers_site);
      machine_site = asm_leeve_registers(registers, registers_site, rack_site, (machine_space + machine_site));
    } else if(compair_spaces("move-quad", 9, (segment_space + components[0]), components[1])) {
      quadrant naof_sources = sources[2];
      quadrant source_site = 0;
      reader record;
      while(true) {
        if(source_site == naof_sources) {
          printf("clerical warn | could not find %s quad-source.\n", (segment_space + components[4]));
          syscall(unix_exit_group, 0);
        }
        record = (sources + (3 + (source_site * 3)));
        if(compair_spaces((segment_space + components[4]), components[5], record[0], record[1])) {
          break;
        }
        source_site += 1;
      }
      quadrant rack_site = record[2];
			//printf("rack-site | %lu\n", rack_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[2]), components[3], (registers), &registers_site);
      add_to_entree("-rsp", 4, (registers), &registers_site);
			//printf("registers | %s\n", registers);
      machine_site = asm_move_to(registers, registers_site, rack_site, (machine_space + machine_site));
    } else if(compair_spaces("move-quad-to", 12, (segment_space + components[0]), components[1])) {
      quadrant naof_sources = sources[2];
      quadrant source_site = 0;
      reader record;
      while(true) {
        if(source_site == naof_sources) {
          printf("clerical warn | could not find %s quad-source.\n", (segment_space + components[4]));
          syscall(unix_exit_group, 0);
        }
        record = (sources + (3 + (source_site * 3)));
				//printf("source | %s\n", record[0]);
        if(compair_spaces((segment_space + components[2]), components[3], record[0], record[1])) {
          break;
        }
        source_site += 1;
      }
      quadrant rack_site = record[2];
			//printf("rack-site | %lu\n", rack_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree("rsp-", 4, (registers), &registers_site);
      add_to_entree((segment_space + components[4]), components[5], (registers), &registers_site);
			//printf("registers | %s\n", registers);
      machine_site = asm_move_registers(registers, registers_site, rack_site, (machine_space + machine_site));
    } else if(compair_spaces("store-state", 11, (segment_space + components[0]), components[1])) {
      machine_site = asm_store_state(machine_space);
    } else if(compair_spaces("restore-state", 13, (segment_space + components[0]), components[1])) {
      machine_site = asm_restore_state(machine_space);
    } else if(compair_spaces("set", 3, (segment_space + components[0]), components[1])) {
      quadrant number;
      entree_to_number((segment_space + components[2]), components[3], 16, &number);
			//printf("number | %lu\n", number);
			//printf("naof-register-name-secs | %lu\n", components[5]);
			//syscall(unix_write, 1, (segment_space + components[4]), components[5]);
			//syscall(unix_write, 1, "\n", 1);
      machine_site = asm_set_register((segment_space + components[4]), components[5], number, machine_space);
    } else if(compair_spaces("and", 3, (segment_space + components[0]), components[1])) {
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[2]), components[3], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      machine_site = asm_and_registers(registers, registers_site, machine_space);
    } else if(compair_spaces("leeve", 5, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_leeve_registers((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("leeve-from", 10, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      leeve_site -= (binary_site + 7);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_leeve_registers((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("back-move", 9, (segment_space + components[0]), components[1])) {
      quadrant constant = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &constant);
      directional leeve_site = 0 - constant;
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_registers((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move", 4, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_registers((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move-to", 7, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_to((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("back-move-to", 12, (segment_space + components[0]), components[1])) {
      quadrant constant = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &constant);
      directional leeve_site = 0 - constant;
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_to((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move-from", 9, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      leeve_site -= (binary_site + 7);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_registers((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move-to-from", 12, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      leeve_site -= (binary_site + 7);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_to((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move-sec", 8, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_sec((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("move-sec-to", 11, (segment_space + components[0]), components[1])) {
      quadrant leeve_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &leeve_site);
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[6]), components[7], registers, &registers_site);
      machine_site = asm_move_sec_to((registers), registers_site, leeve_site, machine_space);
    } else if(compair_spaces("add-constant", 12, (segment_space + components[0]), components[1])) {
      quadrant number = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &number);
      machine_site = asm_add_constant((segment_space + components[4]), components[5], number, machine_space);
    } else if(compair_spaces("sub-constant", 12, (segment_space + components[0]), components[1])) {
      quadrant number = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &number);
      machine_site = asm_sub_constant((segment_space + components[4]), components[5], number, machine_space);
    } else if(compair_spaces("compair-constant", 16, (segment_space + components[0]), components[1])) {
      quadrant number = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &number);
      machine_site = asm_compair_constant((segment_space + components[4]), components[5], number, machine_space);
    } else if(compair_spaces("to-domain", 9, (segment_space + components[0]), components[1])) {
      machine_site = asm_to_domain(machine_space);
    } else if(compair_spaces("domain-back", 11, (segment_space + components[0]), components[1])) {
      machine_site = asm_domain_back(machine_space);
    } else if(compair_spaces("to-xmm0", 7, (segment_space + components[0]), components[1])) {
      machine_site = asm_rsp_at_r8_to_xmm0(machine_space);
    } else if(compair_spaces("from-xmm0", 9, (segment_space + components[0]), components[1])) {
      machine_site = asm_xmm0_to_rsp_at_r8(machine_space);
    } else if(compair_spaces("send-quads", 10, (segment_space + components[0]), components[1])) {
      machine_site = repeat_send_quads(machine_space);
    } else if(compair_spaces("send-secs", 9, (segment_space + components[0]), components[1])) {
      machine_site = asm_repeat_send_secs(machine_space);
    } else if(compair_spaces("naoify", 6, (segment_space + components[0]), components[1])) {
      sec registers[100];
      quadrant registers_site = 0;
      machine_site = asm_naoify((segment_space + components[2]), (components[3]), machine_space);
    } else if(compair_spaces("add", 3, (segment_space + components[0]), components[1])) {
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[2]), components[3], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      machine_site = asm_add_registers(registers, registers_site, machine_space);
    } else if(compair_spaces("sub", 3, (segment_space + components[0]), components[1])) {
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[2]), components[3], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      machine_site = asm_sub_registers(registers, registers_site, machine_space);
    } else if(compair_spaces("compair", 7, (segment_space + components[0]), components[1])) {
      sec registers[100];
      quadrant registers_site = 0;
      add_to_entree((segment_space + components[2]), components[3], registers, &registers_site);
      add_to_entree("-", 1, registers, &registers_site);
      add_to_entree((segment_space + components[4]), components[5], registers, &registers_site);
      machine_site = asm_compair_registers(registers, registers_site, machine_space);
    } else if(compair_spaces("divide", 6, (segment_space + components[0]), components[1])) {
      quadrant rack_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &rack_site);
      machine_site = asm_divide(rack_site, machine_space);
    } else if(compair_spaces("multiply", 8, (segment_space + components[0]), components[1])) {
      quadrant rack_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &rack_site);
      machine_site = asm_multiply(rack_site, machine_space);
    } else if(compair_spaces("divide-by-quad", 14, (segment_space + components[0]), components[1])) {
      quadrant naof_sources = sources[2];
      quadrant source_site = 0;
      reader record;
      while(true) {
        if(source_site == naof_sources) {
          printf("clerical warn | could not find %s quad-source.\n", (segment_space + components[4]));
          syscall(unix_exit_group, 0);
        }
        record = (sources + (3 + (source_site * 3)));
        if(compair_spaces((segment_space + components[2]), components[3], record[0], record[1])) {
          break;
        }
        source_site += 1;
      }
      quadrant rack_site = record[2];
      machine_site = asm_divide(rack_site, machine_space);
    } else if(compair_spaces("multiply-by-quad", 16, (segment_space + components[0]), components[1])) {
      quadrant naof_sources = sources[2];
      quadrant source_site = 0;
      reader record;
      while(true) {
        if(source_site == naof_sources) {
          printf("clerical warn | could not find %s quad-source.\n", (segment_space + components[4]));
          syscall(unix_exit_group, 0);
        }
        record = (sources + (3 + (source_site * 3)));
        if(compair_spaces((segment_space + components[2]), components[3], record[0], record[1])) {
          break;
        }
        source_site += 1;
      }
      quadrant rack_site = record[2];
      machine_site = asm_multiply(rack_site, machine_space);
    } else if(compair_spaces("syscall", 7, (segment_space + components[0]), components[1])) {
      machine_site = asm_syscall(machine_space);
    } else if(compair_spaces("stay-from-rack", 14, (segment_space + components[0]), components[1])) {
      quadrant rack_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &rack_site);
      machine_site = asm_stay_from_rack(rack_site, machine_space);
    } else if(compair_spaces("rack-to-mm", 10, (segment_space + components[0]), components[1])) {
			//printf("in-rack-to-mm\n");
      quadrant mm_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &mm_site);
      machine_site += asm_rack_to_mm(mm_site, machine_space);
    } else if(compair_spaces("mm-to-rack", 10, (segment_space + components[0]), components[1])) {
      quadrant mm_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &mm_site);
      machine_site += asm_mm_to_rack(mm_site, machine_space);
    } else if(compair_spaces("naof-thread-sequences", 21, (segment_space + components[0]), components[1])) {
      machine_site += asm_naof_thread_sequences(machine_space);
    } else if(compair_spaces("add-to-stack", 12, (segment_space + components[0]), components[1])) {
			//printf("in-add-to-stack\n");
			quadrant constant_site = 0;
      entree_to_number((segment_space + components[2]), components[3], 16, &constant_site);
      quadrant number = 0;
      entree_to_number((segment_space + components[4]), components[5], 16, &number);
      machine_site = asm_add_to_stack((constant_site), (number), machine_space);
    }
    //printf("machine-site | %lu\n", machine_site);
    //see_base16("machine-space", machine_space, machine_site);
    if(machine_site > 0) {
      quadrant machine_secs_site = binary_site - origin_site;
      //printf("machine-site | %lu\n", machine_site);
      //place(machine_space, (machine_secs + machine_secs_site), machine_site);
			add_string_to_sec_vecter(&grid, machine_space, machine_site, &machine_secs);
      //write(secs_file, machine_space, machine_site);
      binary_site += machine_site;
    }
    //printf("\n");
  }
  //printf("after generating machine-secs\n");
  quadrant naof_futures = futures[2];
  quadrant naof_markers = markers[2];
  quadrant futures_site = 0;
  while(true) {
    if(futures_site == naof_futures) {
      break;
    }
    reader record = (futures + (3 + (futures_site * 5)));
		//see_space("record", record, 0x28);
		//printf("entree-0 | %s\n", record[0]);
		//printf("entree-1 | %s\n", record[2]);
    reader marker;
    quadrant marker_site = 0;
    while(true) {
      if(marker_site == naof_markers) {
        printf("clerical warn | could not find marker %s.\n", record[0]);
        syscall(unix_exit_group, 0);
      }
      marker = (markers + (3 + (marker_site * 3)));
      //see_space("marker", marker, 24);
      //printf("marker | %s\n", marker[0]);
      //printf("marker-destination | %lu\n", marker[2]);
      if(compair_spaces(record[0], record[1], marker[0], marker[1])) {
        break;
      }
      marker_site += 1;
    }
    directional motion_alu_site = source_site(naof_standard_motion_alus, clerical_motion_alus, clerical_motion_alus_distances, record[2], record[3]);
    quadrant naof_secs = standard_motion_signs_distances[motion_alu_site];
    directional motion = marker[2] - (record[4] + naof_secs);
    //printf("origin | %lu\n", record[4]);
    //printf("destination | %lu\n", marker[2]);
    quadrant machine_site = asm_clerical_motion_stay_from(record[2], record[3], record[4], marker[2], machine_space);
    quadrant machine_secs_site = record[4] - origin_site;
    //see_space("machine-secs", (machine_secs + machine_secs_site), machine_site);
    //place(machine_space, (machine_secs + machine_secs_site), machine_site);
		add_string_to_sec_vecter(&grid, machine_space, machine_site, &machine_secs);
    //see_space("machine-secs", (machine_secs + machine_secs_site), machine_site);
    futures_site += 1;
  }
  /*
  */
  quadrant machine_secs_site = binary_site - origin_site;
  //see_space("machine-secs", machine_secs, machine_secs_site);
	if(machine_secs[2] > 0) {
		secs_file = open(params[2], archive_create|archive_write, archive_arws);
		write(secs_file, (machine_secs + 3), machine_secs_site);
		close(secs_file);
	}
  return 0;
}
