#include "./standard.h"

// low-clerk
vast wide_com(source init, source com, quad naof_com_secs) {
	//printf("in wide place.\n");
	asm("sub $0x1000, %rsp");
	asm("lea 0x0(%rsp), %r8");
	register quad r8 asm("r8");
	writer rack = r8;
	rack[0] = init;
	rack[1] = com;
	quad naof_quads = naof_com_secs / 8;
	//printf("naof-quads | %lu\n", naof_quads);
	rack[2] = naof_quads;
	quad naof_quad_secs = (naof_quads * 8);
	quad naof_secs = naof_com_secs - naof_quad_secs;
	//printf("naof-secs | %lu\n", naof_secs);
	rack[3] = naof_secs;
	//printf("sending quads.\n");
	asm("mov 0x0(%rsp), %rsi");

	asm("mov 0x8(%rsp), %rdi");
	asm("mov 0x10(%rsp), %rcx");
	asm("rep movsq %ds:(%rsi), %es:(%rdi)");
	//printf("at com of quads-com\n");
	quad init_secs_con = (init + naof_quad_secs);
	rack[0] = init_secs_con;
	//printf("init-secs-con | %lu\n", init_secs_con);
	quad com_secs_con = (com + naof_quad_secs);
	rack[1] = com_secs_con;
	//printf("con-secs-con | %lu\n", com_secs_con);
	asm("mov 0x0(%rsp), %rsi");
	asm("mov 0x8(%rsp), %rdi");
	asm("mov 0x18(%rsp), %rcx");
	//printf("init-secs-con | %lu\n", init_secs_con);
	asm("rep movsb %ds:(%rsi), %es:(%rdi)");
	asm("add $0x1000, %rsp");
	//printf("at com of wide place.\n");

	/*
	register quad rsi asm("rsi");
	quad stack_number = rsi;
	printf("stack-number | %lu\n", rsi);
	*/
	return;
}

quadrant get_naof_secs(source entree) {
	quadrant site = 0;
	while(true) {
		if(entree[site] == 0) {
			break;
		}
		site += 1;
	}
	return site;
}

quadrant wide_naof_secs(source entree) {
	source back_entree = entree;
	while(true) {
		if(entree[0] == 0) {
			break;
		}
		entree += 1;
	}
	return entree - back_entree;
}

/*
// ready to go with clerk-clerkess print inspecting.
quadrant get_naof_com_secs(source entree) {
	quadrant site = 0;
	while(true) {
		//printf("con | %c\n", entree[site]);
		if(entree[site] == 0) {
			break;
		}
		site += 1;
	}
	return site;
}
*/

quadrant replicate(sec rune, source destination, quadrant naof_secs) {
	//printf("rune | %u\n", rune);
	//see_space("init-dest", destination, naof_secs);
  quadrant site = 0;
  while(true) {
    if(site == naof_secs) {
      break;
    }
    destination[site] = rune;
    site += 1;
  }
	//see_space("com-dest", destination, naof_secs);
  return naof_secs;
}

// stave all spaces.
quadrant strip(source entree, source destination, quadrant naof_secs) {
	quadrant destination_site = 0;
	quadrant site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		sec rune = entree[site];
		if(rune != ' ') {
			destination[destination_site] = rune;
			destination_site += 1;
		}
		site += 1;
	}
	return destination_site;
}
// todo | brace

vast reverse(source entree, source destination, quadrant naof_secs) {
  source from = (entree + naof_secs - 1);
  quadrant site = 0;
  while(true) {
    if(site == naof_secs) {
      break;
    }
    destination[site] = from[0];
    from -= 1;
    site += 1;
  }
  return;
}

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
	//see_space("space-secs", space_secs, naof_secs);
  site = 0;
  while(true) {
    if(site == naof_secs) {
      break;
    }
		//printf("site | %lu\n", site);
		//printf("space-secs[site] | %u\n", space_secs[site]);
		//while(true) {
			//quad pause_meta[2] = {0, 0xaed};
			//syscall(unix_nanosleep, pause_meta);
		//}
		//printf("destination-sec-before-cast-sec | %u\n", destination_secs[site]);
    destination_secs[site] = space_secs[site];
		//printf("destination-sec-after-cast-sec | %u\n", destination_secs[site]);
    site += 1;
  }
	//see_space("destination-secs", destination_secs, naof_secs);
  return;
}

// numerology
vast sseed(source seed, quad seed_site) {
	quadrant_reference qseed = seed;
	quad naof_quads = seed_site / 8;
	quad naof_quad_secs = (naof_quads * 8);
	quad naof_secs = seed_site - (naof_quad_secs);
	source seed_at_secs = seed + naof_quad_secs;
	quad site = 0;
	quad sum = 0;
	while(true) {
		if(site == naof_quads) {
			break;
		}
		sum += qseed[site];
		site += 1;
	}
	site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		sum += seed_at_secs[site];
		site += 1;
	}
	site = 0;
	while(true) {
		if(site == naof_quads) {
			break;
		}
		qseed[site] ^= sum;
		sum += qseed[site];
		site += 1;
	}
	sec ssum = sum;
	site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		seed_at_secs[site] ^= ssum;
		ssum += seed_at_secs[site];
		site += 1;
	}
	return;
}

quadrant number_to_entree(quadrant number, source entree, quadrant base) {
	//printf("number | %lu\n", number);
	//printf("entree | %lu\n", entree);
	//printf("base | %lu\n", base);
  quadrant focus = 1;
  quadrant focus_site = 0;
  while(true) {
    quadrant prime_focus = focus;
    focus *= base;
    focus /= base;
    if(focus != prime_focus) {
      break;
    }
    focus *= base;
    focus_site += 1;
  }
  quadrant site = 0;
  focus = 1;
  while(true) {
    if(site == focus_site) {
      break;
    }
    focus *= base;
    site += 1;
  }
	//printf("focus | %lu\n", focus);
  quadrant entree_site = 0;
  quadrant mode = 0;
  while(true) {
    quadrant singular = number / focus;
    if((mode == 0) && (singular > 0)) {
      mode = 1;
    }
    if(mode == 1) {
      // gain in an avast draw and shares; meaning, not a wrestle well, sense.
      quadrant gain = singular * focus;
      number -= gain;
      if((singular >= 0) && (singular <= 9)) {
        singular += 48;
      } else if((singular >= 10) && (singular <= 35)) {
        singular += 87;
      } else if((singular >= 36) && (singular <= 61)) {
        singular += 29;
      }
      entree[entree_site] = singular;
      entree_site += 1;
    }
    focus /= base;
    if(focus == 0) {
      break;
    }
  }
  if(mode == 0) {
    entree[entree_site] = 48;
    entree_site += 1;
  }
  entree[entree_site] = 0;
  return entree_site;
}

quadrant presice_to_entree(quadrant height, quadrant bar, quadrant base, source entree) {
	//printf("\n");
	//printf("init-height | %lu\n", height);
	//printf("init-bar | %lu\n", bar);
	//printf("init-base | %lu\n", base);
	quadrant number = height / bar;
	//printf("number | %lu\n", number);
	quadrant naof_secs = number_to_entree(number, entree, base);
	height -= (number * bar);
	//printf("data-com-height | %lu\n", height);
	if(height > 0) {
		entree[naof_secs] = '.';
		naof_secs += 1;
		quadrant naof_presice_secs = 0;
		while(true) {
			sec digit;
			while(true) {
				//printf("----------\n");
				height *= base;
				//printf("height | %lu\n", height);
				digit = height / bar;
				//printf("digit | %lu\n", digit);
				if(digit != 0) {
					break;
				}
				entree[naof_secs] = '0';
				naof_secs += 1;
				naof_presice_secs += 1;
				if(naof_presice_secs == clerk_presision) {
					break;
				}
			}
			if(naof_presice_secs == clerk_presision) {
				break;
			}
			//printf("digit | %lu\n", digit);
			//printf("base | %lu\n", base);
			//printf("height | %lu\n", height);
			height -= (digit * bar);
			naof_secs += number_to_entree(digit, (entree + naof_secs), base);
			naof_presice_secs += 1;
			if(height == 0 || naof_presice_secs == clerk_presision) {
				break;
			}
		}
	}
	return naof_secs;
}

quadrant entree_to_number(source entree, quadrant entree_distance, quadrant base, quadrant_reference number) {
	//printf("entree | %s\n", entree);
	//printf("entree-distance | %lu\n", entree_distance);
	quadrant stack_base = base;
  number[0] = 0;
  quadrant focus = 1;
	if(entree_distance > 0) {
		quadrant site = entree_distance - 1;
		while(true) {
			sec singular = entree[site];
			//printf("rune | %c\n", singular);
			if((singular >= 48) && (singular <= 57)) {
				singular -= 48;
			} else if((singular >= 97) && (singular <= 122)) {
				singular -= 87;
			} else if((singular >= 65) && (singular <= 90)) {
				singular -= 29;
			}
			//printf("singular | %u\n", singular);
			//printf("focus | %lu\n", focus);
			quadrant add_number = (singular * focus);
			//printf("add-number | %lu\n", add_number);
			number[0] += (add_number);
			focus = focus * base;
			if(site == 0) {
				break;
			}
			site -= 1;
		}
	}
	//printf("entree-to-number-com-base | %lu\n", base);
  return number;
}

quadrant secs_to_number(source secs, quadrant naof_secs, quadrant_reference number) {
	//printf("naof-secs | %lu\n", naof_secs);
  number[0] = 0;
  quadrant focus = 1;
	if(naof_secs > 0) {
		quadrant site = naof_secs - 1;
		while(true) {
			sec singular = secs[site];
			//printf("singular | %lu\n", singular);
			quadrant add_number = (singular * focus);
			number[0] += (add_number);
			focus = focus * 0x100;
			if(site == 0) {
				break;
			}
			site -= 1;
		}
	}
	//printf("entree-to-number-com-base | %lu\n", base);
  return number;
}

quadrant number_aof(source space, quadrant naof_secs) {
	quadrant base = 1;
	quadrant number = 0;
	quadrant site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		sec quad_sec = space[site];
		//printf("quad-sec | %lu\n", quad_sec);
		number += (quad_sec * base);
		//printf("number | %lu\n", number);
		base *= 256;
		site += 1;
	}
	return number;
}

quad is_base(source entree, quad naof_entree_secs, quad base) {
	quad ib = true;
	quad site = 0;
	while(true) {
		if(site == naof_entree_secs) {
			break;
		}
		sec con = entree[site];
		quad is_in_scopes = true;
		if((con >= '0') && (con <= '9')) {
			con -= '0';
		} else if((con >= 'A') && (con <= 'Z')) {
			con = con - 'A' + 0xa;
		} else if((con >= 'a') && (con <= 'z')) {
			con = con - 'a' + 10;
		} else {
			is_in_scopes = false;
		}
		//printf("con | %u\n", con);
		if(is_in_scopes) {
			if(con >= base) {
				ib = false;
			}
		} else {
			ib = false;
		}
		if(ib == false) {
			break;
		}
		site += 1;
	}
	return ib;
}

// clerical
quadrant compair_spaces(source seek, quadrant seek_distance, source space, quadrant space_distance) {
  if(seek_distance != space_distance) {
    return false;
  }
  quadrant naof_quadrants = seek_distance >> 3;
	//printf("naof-quadrants | %lu\n", naof_quadrants);
  quadrant naof_quadrant_secs = naof_quadrants << 3;
  quadrant naof_secs = seek_distance - naof_quadrant_secs;
	//printf("naof-secs | %lu\n", naof_secs);
  quadrant * seek_quadrants = (reader)seek;
  quadrant * space_quadrants = (reader)space;
  source seek_secs = seek + naof_quadrant_secs;
  source space_secs = space + naof_quadrant_secs;
  quadrant site = 0;
  while(true) {
    if(site == naof_quadrants) {
      break;
    }
		//printf("quad-site | %lu\n", site);
    if(seek_quadrants[site] != space_quadrants[site]) {
      return false;
    }
    site += 1;
  }
  site = 0;
  while(true) {
    if(site == naof_secs) {
      break;
    }
		//printf("comp | %u | %u\n", seek_secs[site], space_secs[site]);
		//printf("sec-site | %lu\n", site);
    if(seek_secs[site] != space_secs[site]) {
      return false;
    }
    site += 1;
  }
  return true;
}

// 0 | equal, (code_a|-1) | left-less, 1 | right-less
squad orderc_spaces(source entree0, quad naof_entree_secs0, source entree1, quad naof_entree_secs1) {
	//printf("naof-entree-secs0 | %lu\n", naof_entree_secs0);
	//printf("naof-entree-secs1 | %lu\n", naof_entree_secs1);
	quad naof_csecs = naof_entree_secs0;
	if(naof_entree_secs1 < naof_entree_secs0) {
		naof_csecs = naof_entree_secs1;
	}
	//printf("naof-csecs | %lu\n", naof_csecs);
	squad comp = 0;
	quad site = 0;
	quad site2 = 0;
	while(true) {
		if(site == naof_csecs) {
			break;
		}
		//printf("site | %lu\n", site);
		quad has_con0 = true;
		sec con0;
		while(true) {
			if(site == naof_csecs) {
				has_con0 = false;
				break;
			}
			con0 = entree0[site];
			//printf("con0 | %c\n", con0);
			quad is_in_scopes = true;
			if((con0 >= '0') && (con0 <= '9')) {
				con0 -= '0';
			} else if((con0 >= 'A') && (con0 <= 'Z')) {
				con0 = con0 - 'A' + 0xa;
			} else if((con0 >= 'a') && (con0 <= 'z')) {
				con0 = con0 - 'a' + 10;
			} else {
				is_in_scopes = false;
			}
			if(is_in_scopes) {
				break;
			}
			site += 1;
		}
		//printf("con0 | %c\n", con0);
		//printf("con0 | %u\n", con0);
		quad has_con1 = true;
		sec con1;
		while(true) {
			if(site2 == naof_csecs) {
				has_con1 = false;
				break;
			}
			con1 = entree1[site2];
			//printf("con1 | %c\n", con1);
			quad is_in_scopes = true;
			if((con1 >= '0') && (con1 <= '9')) {
				con1 -= '0';
			} else if((con1 >= 'A') && (con1 <= 'Z')) {
				con1 = con1 - 'A' + 0xa;
			} else if((con1 >= 'a') && (con1 <= 'z')) {
				con1 = con1 - 'a' + 10;
			} else {
				is_in_scopes = false;
			}
			if(is_in_scopes) {
				break;
			}
			site2 += 1;
		}
		//printf("con1 | %c\n", con1);
		//printf("con1 | %u\n", con1);
		//printf("is-in-scopes0 | %lu\n", is_in_scopes0);
		//printf("is-in-scopes1 | %lu\n", is_in_scopes1);
		if((has_con0 == false) && (has_con1 == false)) {
			return 0;
		} else if((has_con0 == false)) {
			return 1;
		} else if((has_con1 == false)) {
			return -1;
		}
		if(con0 != con1) {
			if(con0 < con1) {
				return -1;
			} else {
				return 1;
			}
		}
		site += 1;
		site2 += 1;
	}
	//printf("naof-entree-secs0 | %lu\n", naof_entree_secs0);
	//printf("naof-entree-secs1 | %lu\n", naof_entree_secs1);
	if(naof_entree_secs0 != naof_entree_secs1) {
		if(naof_entree_secs0 < naof_entree_secs1) {
			return -1;
		} else {
			return 1;
		}
	}
	return 0;
}

directional seek_space(source seek, quadrant seek_distance, source space, quadrant space_distance) {
  if(seek_distance > space_distance) {
    return -2;
  }
  quadrant naof_seek_quadrants = seek_distance >> 3;
	//printf("naof-seek-quadrants | %lu\n", naof_seek_quadrants);
  quadrant naof_quadrant_secs = naof_seek_quadrants << 3;
  quadrant naof_seek_secs = seek_distance - naof_quadrant_secs;
	//printf("naof-seek-secs | %lu\n", naof_seek_secs);
  quadrant naof_trys = space_distance - seek_distance + 1;
	//printf("naof-trys | %lu\n", naof_trys);
  quadrant site = 0;
  while(true) {
		//printf("site | %lu\n", site);
    reader compair_seek_quadrants = (reader)seek;
    source compair_seek_secs = seek + naof_quadrant_secs;
    reader compair_space_quadrants = (reader)(space + site);
    source compair_space_secs = space + site + naof_quadrant_secs;
    quadrant is_equal = true;
    quadrant compair_site = 0;
    while(true) {
      if(compair_site == naof_seek_quadrants) {
        break;
      }
			//printf("comp | %lu | %lu\n", compair_seek_quadrants[compair_site], compair_space_quadrants[compair_site]);
      if(compair_seek_quadrants[compair_site] != compair_space_quadrants[compair_site]) {
        is_equal = false;
        break;
      }
      compair_site += 1;
    }
		//printf("site | %lu\n", site);
    compair_site = 0;
    if(is_equal) {
      while(true) {
        if(compair_site == naof_seek_secs) {
          break;
        }
				//printf("comp | %c | %c\n", compair_seek_secs[compair_site], compair_space_secs[compair_site]);
        if(compair_seek_secs[compair_site] != compair_space_secs[compair_site]) {
          is_equal = false;
          break;
        }
        compair_site += 1;
      }
    }
		//printf("is-equal | %lu\n", is_equal);
		//printf("site | %lu\n", site);
    if(is_equal) {
      return site;
    }
    site += 1;
    if(site == naof_trys) {
      return -1;
    }
  }
}

vast add_to_entree(source entree, quadrant naof_secs, source destination, writer site) {
  wide_com(entree, (destination + site[0]), naof_secs);
  site[0] += naof_secs;
  destination[site[0]] = 0;
  return;
}

vast add_seed62_to_entree(quadrant naof_secs, source destination, writer site) {
  if(naof_secs > 100) {
    printf("clerical warn | naof secs is %lu; design is for 100 et.\n", naof_secs);
    return 0;
  }
  sec seed[100];
  archive_grid seed_file = open("/dev/random", archive_read);
  read(seed_file, seed, naof_secs);
  close(seed_file);
  quadrant seed_site = 0;
  while(true) {
    if(seed_site == naof_secs) {
      break;
    }
    sec seed_sec = seed[seed_site];
    seed_sec = seed_sec % 62;
    if(seed_sec <= 9) {
      seed_sec += 48;
    } else if((seed_sec >= 10) && (seed_sec <= 35)) {
      seed_sec += 87;
    } else {
      seed_sec += 29;
    }
    seed[seed_site] = seed_sec;
    seed_site += 1;
  }
  seed[seed_site] = 0;
  wide_com(seed, (destination + site[0]), naof_secs);
  site[0] += naof_secs;
  destination[site[0]] = 0;
  return;
}

quadrant get_time_name(source time_name) {
	quadrant times[2];
	times[0] = 0;
	times[1] = 0;
	quadrant zones[2];
	syscall(unix_gettimeofday, times, zones);
	sec base[100];
	quadrant naof_base_secs = number_to_entree(times[0], base, 16);
	quadrant time_name_site = 0;
	add_to_entree(base, naof_base_secs, time_name, &time_name_site);
	add_to_entree(".", 0x1, time_name, &time_name_site);
	naof_base_secs = number_to_entree(times[1], base, 16);
	add_to_entree(base, naof_base_secs, time_name, &time_name_site);
	add_to_entree(".nonce", 0x6, time_name, &time_name_site);
	return time_name_site;
}

quadrant standardise_entree(source entree, source destination) {
	quadrant naof_secs = get_naof_secs(entree);
	quadrant dsite = 0;
	quadrant site = 0;
	while(true) {
		if(site >= naof_secs) {
			break;
		}
		sec rune = entree[site];
		//printf("rune | %c\n", rune);
		site += 1;
		if(rune == '\\') {
			sec nrune = entree[site];
			site += 1;
			if(nrune == 'n') {
				destination[dsite] = '\n';
			} else if (nrune == 't') {
				destination[dsite] = '\t';
			} else if (nrune == '\\') {
				destination[dsite] = '\\';
			} else {
				destination[dsite] = nrune;
			}
		} else {
			destination[dsite] = rune;
		}
		//printf("drune | %c\n", destination[dsite]);
		dsite += 1;
		//printf("dsite | %lu\n", dsite);
	}
	return dsite;
}

// clerical-views
vast see_quad(source relay, quad number, quad base) {
	quad naof_relay_secs = get_naof_secs(relay);
	sec entree[10000];
	quadrant entree_site = 0;
	add_to_entree(relay, naof_relay_secs, entree, &entree_site);
	entree_site += number_to_entree(number, (entree + entree_site), base);
	add_to_entree("\n", 1, entree, &entree_site);
	syscall(unix_write, 1, entree, entree_site);
	return;
}

vast see_spaceb(source relay, source space, quadrant distance, quad base) {
  sec print_space[100];
  quadrant print_space_site;
  quadrant relay_distance = get_naof_secs(relay);
  syscall(unix_write, 1, relay, relay_distance);
  syscall(unix_write, 1, " | [", 4);
  if(distance > 0) {
		quadrant site = 0;
		if(distance > 1) {
			quadrant et = distance - 1;
			while(true) {
				print_space_site = number_to_entree(space[site], print_space, base);
				syscall(unix_write, 1, print_space, print_space_site);
				syscall(unix_write, 1, ", ", 2);
				site += 1;
				if(site == et) {
					break;
				}
			}
		}
		print_space_site = number_to_entree(space[site], print_space, base);
		syscall(unix_write, 1, print_space, print_space_site);
  }
  syscall(unix_write, 1, "]\n", 2);
  return;
}

vast see_base16(source relay, source space, quadrant distance) {
  sec print_space[3] = {0};
  quadrant et = distance - 1;
  quadrant relay_distance = get_naof_secs(relay);
  syscall(unix_write, 1, relay, relay_distance);
  syscall(unix_write, 1, " | ", 3);
  quadrant site = 0;
  while(true) {
    if(site == distance) {
      break;
    }
    sec rune = space[site];
    sec most = rune / 16;
    if(most <= 9) {
      most += 48;
    } else {
      most += 87;
    }
    sec least = rune % 16;
    if(least <= 9) {
      least += 48;
    } else {
      least += 87;
    }
    print_space[0] = most;
    print_space[1] = least;
    syscall(unix_write, 1, print_space, 2);
    if(site < et) {
      syscall(unix_write, 1, " ", 1);
    }
    site += 1;
  }
  syscall(unix_write, 1, "\n", 1);
  return;
}

vast see_encoded(source entree, quadrant naof_entree_secs, quadrant base) {
	//printf("naof-entree-secs | %lu\n", naof_entree_secs);
	//syscall(unix_write, 1, "i sim.\n", 7);
	//syscall(unix_write, 1, "[", 1);
	printf("[");
	sec base_vantage[100];
	quadrant naof_secs = 0;
	quad et = naof_entree_secs - 1;
	quadrant site = 0;
	while(true) {
		if(site == naof_entree_secs) {
			break;
		}
		//printf("site | %lu\n", site);
		sec sec0 = entree[site];
		//printf("sec0 | %u\n", sec0);
		naof_secs = number_to_entree(sec0, base_vantage, base);
		if(base == 2) {
			//syscall(unix_write, 1, "0b", 2);
			printf("0b");
		} else if(base == 8) {
			//syscall(unix_write, 1, "0", 1);
			printf("0");
		} else if(base == 16) {
			//syscall(unix_write, 1, "0x", 2);
			printf("0x");
		}
		if((base == 16) && (naof_secs == 1)) {
			//syscall(unix_write, 1, "0", 1);
			printf("0");
		}
		//syscall(unix_write, 1, base_vantage, naof_secs);
		printf(base_vantage);
		if(site != et) {
			//syscall(unix_write, 1, ", ", 2);
			printf(", ");
		}
		site += 1;
	}
	printf("]");
	//syscall(unix_write, 1, "]", 1);
	//printf("site | %lu\n", site);
	//syscall(unix_write, 1, "\n", 1);
	//aed = 1;
	return;
}

vast add_encoded(source encoded, quad naof_encoded_secs, source entree, writer entree_site, quadrant base, sec init_vec_sym, sec com_vec_sym) {
	sec init_vec_sym_entree[1];
	init_vec_sym_entree[0] = init_vec_sym;
	sec com_vec_sym_entree[1];
	com_vec_sym_entree[0] = com_vec_sym;
	//syscall(unix_write, 1, "i sim.\n", 7);
	add_to_entree(init_vec_sym_entree, 1, entree, entree_site);
	//syscall(unix_write, 1, entree, entree_site);
	//syscall(unix_write, 1, "\n", 1);
	quad et = naof_encoded_secs - 1;
	sec base_space[10000];
	quad naof_base_secs = 0;
	quadrant site = 0;
	while(true) {
		if(site == naof_encoded_secs) {
			break;
		}
		//printf("site | %lu\n", site);
		sec sec0 = encoded[site];
		//printf("sec0 | %u\n", sec0);
		naof_base_secs = number_to_entree(sec0, base_space, base);
		if(base == 2) {
			add_to_entree("0b", 2, entree, entree_site);
		} else if(base == 8) {
			add_to_entree("0", 1, entree, entree_site);
		} else if(base == 16) {
			add_to_entree("0x", 2, entree, entree_site);
		}
		if((base == 16) && (naof_base_secs == 1)) {
			add_to_entree("0", 1, entree, entree_site);
		}
		add_to_entree(base_space, naof_base_secs, entree, entree_site);
		if(site != et) {
			add_to_entree(", ", 2, entree, entree_site);
		}
		site += 1;
	}
	add_to_entree(com_vec_sym_entree, 1, entree, entree_site);
	return;
}

// grid-and-structures
/*
source get_grid_secs(writer grid, quadrant naof_secs, writer tab) {
	source grid_site = malloc(naof_secs);
	if(grid == 0) {
		grid[0] = grid_site;
	}
	tab[0] = grid_site;
	writer x = 0;
	x[0] = 0xaed;
	return grid_site;
}
*/
// ([clerk] || (clerkess)) | memory
// simpler and non quark impeded in regards to stack resign from gcc.
source get_grid_secs(writer grid, quadrant naof_secs, writer tab) {
	naof_secs += 1;
	//printf("at init in get-get-secs. | %lu\n", grid);
	quadrant stack_grid = 0;
	writer qgrid;
	quadrant is_new = false;
	if(grid[0] == 0) {
		//printf("creating new grid.\n");
		//printf("naof-igrid-secs | %lu\n", naof_igrid_secs);
		stack_grid = syscall(unix_mmap, non, naof_igrid_secs, map_rws, map_anon|map_console, non, 0);
		//getc(stdin);
		//perror("mmap");
		//printf("stack-grid | %lu\n", stack_grid);
		//printf("stack-grid | %lu\n", stack_grid);
		//perror("mmap");
		grid[0] = stack_grid;
		is_new = true;
	} else {
		stack_grid = grid[0];
	}
	//printf("is-new | %lu\n", is_new);
	qgrid = stack_grid;
	if(is_new) {
		qgrid[0] = naof_igrid_secs;
		qgrid[1] = 0;
	}
	//printf("stack-grid | %lu\n", stack_grid);
	//getc(stdin);
	//printf("naof-grid-secs | %lu\n", qgrid[0]);
	//printf("grid-site | %lu\n", qgrid[1]);
	quad grid_com_site = qgrid[1] + naof_secs;
	//printf("grid breadth | %lu\n", qgrid[0]);
	//printf("grid-com-site | %lu\n", grid_com_site);
	if(grid_com_site >= qgrid[0]) {
		//printf("expanding grid\n");
		quadrant naof_new_secs = naof_secs + (qgrid[0] * 2);
		stack_grid = syscall(unix_mmap, non, naof_new_secs, map_rws, map_anon|map_console, non, 0);
		//printf("stack-grid | %lu\n", stack_grid);
		//getc(stdin);
		grid[0] = stack_grid;
		qgrid = stack_grid;
		qgrid[0] = naof_new_secs;
		qgrid[1] = 0;
	}
	source grid_con = get_grid_console(qgrid); // es always mean-(t)
	//printf("grid-com | %lu\n", grid_con);
	tab[0] = grid_con;
	qgrid[1] += naof_secs;
	//printf("at com of get grid secs.\n");
	/*
	tab[0] = malloc(naof_secs);
	*/
  return;
}

vast create_vecter(writer grid, quadrant naof_secs, quadrant breadth, writer * vecter) {
  quadrant naof_data_secs = naof_vecter_meta_secs + (naof_secs * breadth);
	writer qgrid = 0;
	get_grid_secs(grid, naof_data_secs, &qgrid);
  vecter[0] = qgrid;
  qgrid[0] = naof_secs;
  qgrid[1] = breadth;
  qgrid[2] = 0;
  //printf("vecter | %lu\n", vecter[0]);
  return;
}

vast add_to_vecter(writer grid, source element, writer * vecter) {
	//printf("in add to vecter.\n");
	//printf("grid | %lu\n", grid[0]);
	writer qvec = vecter[0];
	//printf("naof-capacity | %lu\n", qvec[1]);
	//printf("naof-elements | %lu\n", qvec[2]);
	//printf("element | %lu\n", element);
  if(qvec[2] == qvec[1]) {
		//printf("expanding vecter.\n");
    reader last_qvec = qvec;
		//printf("last-qvec | %lu\n", last_qvec);
    quadrant last_naof_secs = naof_vecter_meta_secs + (qvec[0] * qvec[1]);
		//printf("last-naof-secs | %lu\n", last_naof_secs);
    quadrant last_breadth = qvec[1];
		qvec[1] *= 2;
    quadrant new_naof_secs = naof_vecter_meta_secs + (qvec[0] * qvec[1]);
		//printf("naof-new-secs | %lu\n", new_naof_secs);
		quadrant new_qvec = 0;
		get_grid_secs(grid, new_naof_secs, &new_qvec);
		qvec = new_qvec;
		//printf("new-qvec | %lu\n", qvec);
		//getc(stdin);
		vecter[0] = qvec;
    wide_com(last_qvec, qvec, last_naof_secs);
  }
	//printf("qvec | %lu\n", qvec);
	source vecter_com = get_vecter_site(qvec);
	//printf("vecter-com | %lu\n", vecter_com);
  wide_com(element, get_vecter_site(qvec), qvec[0]);
	//quad qquad = ((writer)(qvec + 3) + (qvec[0] * qvec[2]))[0];
	//printf("qquad | %lu\n", qquad);
  qvec[2] += 1;
	source new_vecter_com = get_vecter_site(qvec);
	//printf("new-vecter-com | %lu\n", vecter_com);
	//printf("vecter-com-distances | %lu\n", (new_vecter_com - vecter_com));
	//printf("naof-capacity | %lu\n", qvec[1]);
	//printf("naof-elements | %lu\n", qvec[2]);
  return;
}

vast replicate_to_sec_vecter(writer grid, sec reps, quadrant naof_rep_secs, writer * vecter) {
	quadrant string_site = vecter[0][2];
	quadrant naof_com_secs = (naof_rep_secs + 1);
	quadrant com_string_site = (string_site + naof_com_secs);
	quadrant capacity = vecter[0][1];
  if(com_string_site > capacity) {
		//printf("expanding string.\n");
		//printf("string | %s\n", (vecter[0] + 3));
    reader last_space = vecter[0];
		//printf("last-space | %lu\n", last_space);
		quadrant new_capacity = (capacity * 2) + naof_com_secs;
    quadrant new_distance = naof_vecter_meta_secs + (new_capacity);
		writer stack_vecter = vecter[0];
		//printf("stack-vecter | %lu\n", stack_vecter);
		get_grid_secs(grid, new_distance, &stack_vecter);
		//printf("stack-vecter | %lu\n", stack_vecter);
		//printf("last-space | %lu\n", last_space);
    wide_com(last_space, stack_vecter, (naof_vecter_meta_secs + vecter[0][2]));
		vecter[0] = stack_vecter;
    vecter[0][1] = (new_capacity);
		//see_space("meta", vecter[0], 0x18);
		//printf("string | %s\n", (vecter[0] + 3));
  }
	writer qvec = vecter[0];
	source vec_com = get_vecter_site(qvec);
	//printf("((((source)vecter[0])) | %lu\n", (((source)vecter[0])));
	quad rsite = 0;
	while(true) {
		if(rsite == naof_rep_secs) {
			break;
		}
		vec_com[rsite] = reps;
		rsite += 1;
	}
  vecter[0][2] += naof_rep_secs;
	//printf("string | %s\n", (vecter[0] + 3));
  return;
}

vast add_string_to_sec_vecter(writer grid, source string, quadrant naof_string_secs, writer * vecter) {
	//printf("naof-string-secs | %lu\n", naof_string_secs);
	quadrant string_site = vecter[0][2];
	quadrant naof_com_secs = (naof_string_secs + 1);
	quadrant com_string_site = (string_site + naof_com_secs);
	quadrant capacity = vecter[0][1];
  if(com_string_site > capacity) {
		//printf("expanding string.\n");
		//printf("string | %s\n", (vecter[0] + 3));
    reader last_space = vecter[0];
		//printf("last-space | %lu\n", last_space);
		quadrant new_capacity = (capacity * 2) + naof_com_secs;
    quadrant new_distance = naof_vecter_meta_secs + (new_capacity);
		writer stack_vecter = vecter[0];
		//printf("stack-vecter | %lu\n", stack_vecter);
		get_grid_secs(grid, new_distance, &stack_vecter);
		//printf("stack-vecter | %lu\n", stack_vecter);
		//printf("last-space | %lu\n", last_space);
    wide_com(last_space, stack_vecter, (naof_vecter_meta_secs + vecter[0][2]));
		vecter[0] = stack_vecter;
    vecter[0][1] = (new_capacity);
		//see_space("meta", vecter[0], 0x18);
		//printf("string | %s\n", (vecter[0] + 3));
  }
	writer qvec = vecter[0];
	source vec_con = get_vecter_site(qvec);
	//printf("((((source)vecter[0])) | %lu\n", (((source)vecter[0])));
	//see_space("string", string, naof_string_secs);
	//see_space("vec-con", vec_con, naof_string_secs);
  wide_com(string, vec_con, naof_string_secs);
  vecter[0][2] += naof_string_secs;
	//printf("string | %s\n", (vecter[0] + 3));
	//printf("naof-string-secs | %lu\n", vecter[0][2]);
  return;
}

vast com_string_to_sec_vecter(writer grid, source string, quadrant naof_string_secs, writer * vecter, quad sec_site) {
	writer qvec = vecter[0];
	source vec_com = (((source)(qvec + 3)) + sec_site);
  wide_com(string, vec_com, naof_string_secs);
	vecter[0] = qvec;
  return;
}
/*
*/

vast expand_for_string_to_sec_vecter(writer grid, quadrant naof_string_secs, writer * vecter) {
	quadrant string_site = vecter[0][2];
	quadrant naof_com_secs = (naof_string_secs + 1);
	quadrant com_string_site = (string_site + naof_com_secs);
	quadrant capacity = vecter[0][1];
  if(com_string_site > capacity) {
    reader last_space = vecter[0];
		quadrant new_capacity = (capacity * 2) + naof_com_secs;
    quadrant new_distance = naof_vecter_meta_secs + (new_capacity);
		writer stack_vecter = vecter[0];
		get_grid_secs(grid, new_distance, &stack_vecter);
    wide_com(last_space, stack_vecter, (naof_vecter_meta_secs + vecter[0][2]));
		vecter[0] = stack_vecter;
    vecter[0][1] = (new_capacity);
  }
  return;
}

vast add_file_string_to_sec_vecter(writer grid, source file_name, quad site, quad naof_string_secs, writer * vecter) {
	sec read_space[10000];
	ip_file file = syscall(unix_open, file_name, archive_read);
	printf("file | %lu\n", file);
	if(file == code_a) {
		syscall(unix_write, "<--> | add-file-string-to-sec-vecter file not found.\n", 0x35);
		return;
	}
	quad naof_file_secs = syscall(unix_lseek, file, 0, seek_completion);
	syscall(unix_lseek, file, site, seek_origin);
	//quad stack_grid = syscall(unix_mmap, non, naof_file_secs, map_read, 0x2, file, 0);
	//see_quad("stack-grid | ", stack_grid, 16);
	//add_string_to_sec_vecter(grid, (stack_grid + site), naof_string_secs, vecter);
	//syscall(unix_munmap, stack_grid, naof_file_secs);
	quad rsite = 0;
	while(true) {
		if(rsite == naof_string_secs) {
			break;
		}
		quad naof_read_secs = naof_string_secs;
		if(naof_read_secs > 10000) {
			naof_read_secs = 10000;
		}
		naof_read_secs = syscall(unix_read, file, read_space, naof_read_secs);
		if(naof_read_secs == 0) {
			break;
		}
		add_string_to_sec_vecter(grid, (read_space), naof_read_secs, vecter);
		rsite += naof_read_secs;
	}
	return;
}

// structures-auxillery
vast order_vecter(writer grid, writer vecter, quad naof_element_quads, quad entree_qsite, quad naof_entree_secs_qsite, writer ordered_vec) {
	writer sov = 0;
	create_vecter(grid, (naof_element_quads * 8), (vecter[1]), &sov);
	writer selectedv = 0;
	create_vecter(grid, 8, vecter[2], &selectedv);
	quad selection[1];
	while(true) {
		quad site = 0;
		quad elm0s = code_a;
		writer elm0;
		while(true) {
			if(site == vecter[2]) {
				break;
			}
			quad is_selected = false;
			quad selec_site = 0;
			while(true) {
				if(selec_site == selectedv[2]) {
					break;
				}
				writer selected = (selectedv + 3) + (selec_site);
				//printf("selected | %lu\n", selected[0]);
				if(selected[0] == site) {
					is_selected = true;
					break;
				}
				selec_site += 1;
			}
			if(is_selected == false) {
				elm0s = site;
				break;
			}
			site += 1;
		}
		//printf("elm0s | %lu\n", elm0s);
		if(elm0s == code_a) {
			break;
		}
		elm0 = (vecter + 3) + (elm0s * naof_element_quads);
		//printf("entree | %s\n", elm0[entree_qsite]);
		writer elm1;
		quad site2 = site + 1;
		while(true) {
			if(site2 == vecter[2]) {
				break;
			}
			elm1 = (vecter + 3) + (site2 * naof_element_quads);

			quad is_selected = false;
			quad selec_site = 0;
			while(true) {
				if(selec_site == selectedv[2]) {
					break;
				}
				writer selected = (selectedv + 3) + (selec_site);
				//printf("selected | %lu\n", selected[0]);
				if(selected[0] == site2) {
					is_selected = true;
					break;
				}
				selec_site += 1;
			}
			if(is_selected == true) {
				site2 += 1;
				continue;
			}

			squad ccomp = orderc_spaces(elm0[entree_qsite], elm0[naof_entree_secs_qsite], elm1[entree_qsite], elm1[naof_entree_secs_qsite]);
			//printf("ccomp | %ld\n", ccomp);
			if(ccomp == 1) {
				elm0s = site2;
				elm0 = (vecter + 3) + (elm0s * naof_element_quads);
				//printf("new-entree | %s\n", elm0[entree_qsite]);
				//printf("elm0s | %lu\n", elm0s);
			}
			site2 += 1;
		}
		//printf("lessist | %s\n", elm0[entree_qsite]);
		selection[0] = elm0s;
		//printf("selection | %lu\n", selection[0]);
		add_to_vecter(grid, selection, &selectedv);
		//printf("naof-selected | %lu\n", selectedv[2]);
		add_to_vecter(grid, elm0, &sov);
		//printf("added-elment | %s\n", ((sov + 3) + ((sov[2] - 1) * naof_element_quads))[entree_qsite]);
		//getc(stdin);
	}
	ordered_vec[0] = sov;
	return;
}

// structure-views
vast see_string(writer vec) {
	syscall(unix_write, 1, get_vecter_grid(vec), vec[2]);
	return;
}

// auxillery extras
vast scroll_to_then(source entree, writer entree_site) {
	quad site = entree_site[0];
	while(true) {
		sec con = entree[site];
		//printf("con | %u\n", con);
		if(con != ' ' && con != '\t' && con != '\n') {
			break;
		}
		site += 1;
	}
	entree_site[0] = site;
	return site;
}

vast noom_nodes(writer grid, source entree, quadrant naof_secs, writer nodes) {
	create_vecter(grid, 0x18, 100, nodes);
	sec section[1000];
	quadrant section_site = 0;
	quadrant noom_site = 0;
	quadrant site = 0;
	while(true) {
		sec rune = entree[site];
		//printf("rune | %c\n", rune);
		quadrant is_noom_com = false;
		quadrant is_com = false;
		if(rune == '(') {
			is_noom_com = true;
		} else if(rune == ')') {
			is_noom_com = true;
		} else {
			section[section_site] = rune;
			section_site += 1;
		}
		site += 1;
		if(site == naof_secs) {
			is_com = true;
			if(section_site > 0) {
				is_noom_com = true;
			}
		}
		if(is_noom_com && (section_site > 0)) {
			source section_entree = 0;
			get_grid_secs(grid, (section_site + 1), &section_entree);
			wide_com(section, section_entree, section_site);
			//printf("noom-site | %lu\n", noom_site);
			//printf("section-entree | %s\n", section_entree);
			//printf("section-site | %lu\n", section_site);
			quadrant record[3];
			record[0] = noom_site;
			record[1] = section_entree;
			record[2] = section_site;
			add_to_vecter(&grid, record, nodes);
			section_site = 0;
		}
		if(rune == '(') {
			noom_site += 1;
		} else if(rune == ')') {
			noom_site -= 1;
		}
		//if(section_site > 0) {
			//syscall(unix_write, 1, section, section_site);
			//syscall(unix_write, 1, "\n", 1);
		//}
		//printf("noom-site | %lu\n", noom_site);
		//printf("\n");
		if(is_com) {
			break;
		}
	}
}

vast statemint(source statemint, quadrant naof_secs, quadrant base, directional * number) {
	quadrant non_code = 0x8000000000000000;
	number[0] = 0;
	//printf("statemint | %s\n", statemint);
	//printf("naof-secs | %lu\n", naof_secs);
	sec number_entree[1000];
	quadrant number_entree_site = 0;
	quadrant site = 0;
	quadrant mode = 0;
	while(true) {
		sec rune = 0;
		quadrant is_number_com = false;
		quadrant is_com = false;
		if(site == naof_secs) {
			if(number_entree_site > 0) {
				is_number_com = true;
			}
			is_com = true;
		}
		//printf("site | %lu\n", site);
		//printf("is-com | %lu\n", is_com);
		if(is_com == false) {
			rune = statemint[site];
			//printf("rune | %c\n", rune);
			if((rune == '+') || (rune == '-') || (rune == '*') || (rune == '/')) {
				is_number_com = true;
			} else if((rune == ' ') || (rune == '\t')) {
				is_number_com = true;
			} else {
				number_entree[number_entree_site] = rune;
				number_entree_site += 1;
			}
			number_entree[number_entree_site] = 0;
		}
		//printf("is-number-com | %lu\n", is_number_com);
		//syscall(unix_write, 1, number_entree, number_entree_site);
		//syscall(unix_write, 1, "\n", 1);
		site += 1;
		if(is_number_com && (number_entree_site > 0)) {
			//printf("com-number\n");
			//printf("number before arithmatic | %lu\n", number[0]);
			//printf("number-entree | |%s|\n", number_entree);
			//printf("number-entree-site | %lu\n", number_entree_site);
			quadrant com_number = 0;
			entree_to_number(number_entree, number_entree_site, base, &com_number);
			//printf("com-number | %lu\n", com_number);
			//printf("mode | %lu\n", mode);
			number_entree_site = 0;
			if(mode == 0) {
				number[0] += com_number;
			} else if(mode == 1) {
				number[0] -= com_number;
			} else if(mode == 2) {
				number[0] *= com_number;
			} else if(mode == 3) {
				number[0] /= com_number;
			}
			//printf("number after arithmatic | %lu\n", number[0]);
			//printf("rune | %c\n", rune);
		}
		if(is_com) {
			break;
		}
		//if(is_number_com) {
		if((rune == '+') || (rune == '-') || (rune == '*') || (rune == '/')) {
			if(site != naof_secs) {
				if(rune == '+') {
					mode = 0;
				} else if(rune == '-') {
					mode = 1;
				} else if(rune == '*') {
					mode = 2;
				} else if(rune == '/') {
					mode = 3;
				}
			}
		}
		//printf("\n");
	}
	//if((naof_secs == 1) && (number == 0)) {
		//number = non_code;
	//}
	//printf("number | %lu\n", number[0]);
	return;
}

// clasicall 6 + 8 * 2 is different thant 6 + (8 * 2)
// but as you might more naturally expect than the standard russian salt of order of opps
vast statemints(writer grid, source statemints_source, quadrant naof_statemints_secs, directional * number, quadrant base) {
	quadrant non_code = 0xffffffffffffffff;
	number[0] = 0;
	writer math_que = 0;
	create_vecter(grid, 0x28, 100, &math_que);
	sec statemints[10000];
	naof_statemints_secs = strip(statemints_source, statemints, naof_statemints_secs);
	//syscall(unix_write, 1, statemints, naof_statemints_secs);
	//syscall(unix_write, 1, "\n", 1);
	writer nodes = 0;
	noom_nodes(grid, statemints, naof_statemints_secs, &nodes);
	//syscall(unix_write, 1, "\n", 1);
	quadrant nsite = 0;
	while(true) {
		if(nsite == nodes[2]) {
			break;
		}
		writer record = ((nodes + 3) + (nsite * 3));
		//printf("noom-site | %lu\n", record[0]);
		//syscall(unix_write, 1, (record[1]), (record[2]));
		//syscall(unix_write, 1, "\n", 1);
		quadrant mrecord[4];
		quadrant entree_site = 0;
		quadrant naof_entree_secs = record[2];
		//printf("naof-entree-secs | %lu\n", naof_entree_secs);
		quadrant bmode = non_code;
		sec rune = ((source)record[1])[0];
		if((rune == '+') || (rune == '-') || (rune == '*') || (rune == '/')) {
			if(rune == '+') {
				bmode = 0;
			} else if(rune == '-') {
				bmode = 1;
			} else if(rune == '*') {
				bmode = 2;
			} else if(rune == '/') {
				bmode = 3;
			}
			entree_site += 1;
			naof_entree_secs -= 1;
		}
		quadrant amode = non_code;
		quadrant et = (record[2] - 1);
		if(et != 0) {
			rune = ((source)record[1])[(et)];
			if((rune == '+') || (rune == '-') || (rune == '*') || (rune == '/')) {
				if(rune == '+') {
					amode = 0;
				} else if(rune == '-') {
					amode = 1;
				} else if(rune == '*') {
					amode = 2;
				} else if(rune == '/') {
					amode = 3;
				}
				naof_entree_secs -= 1;
			}
		}
		//syscall(unix_write, 1, (record[1] + entree_site), (naof_entree_secs));
		//syscall(unix_write, 1, "\n", 1);
		//printf("naof-entree-secs | %lu\n", naof_entree_secs);
		//getc(stdin);
		quadrant number = 0;
		statemint((record[1] + entree_site), naof_entree_secs, base, &number);
		mrecord[0] = record[0];
		mrecord[1] = bmode;
		mrecord[2] = number;
		mrecord[3] = amode;
		mrecord[4] = 0;
		add_to_vecter(&grid, mrecord, &math_que);
		nsite += 1;
	}
	quadrant vsite = 0;
	while(true) {
		if(vsite == math_que[2]) {
			break;
		}
		writer record = ((math_que + 3) + (vsite * 5));
		//see_space("record", record, 0x28);
		vsite += 1;
	}
	//syscall(unix_write, 1, "\n", 1);
	quadrant met = math_que[2] - 1;
	while(true) {
		quadrant net = 0;
		quadrant msite = 0;
		while(true) {
			if(msite == math_que[2]) {
				break;
			}
			writer nrecord = ((math_que + 3) + (msite * 5));
			//see_space("record", nrecord, 0x28);
			//printf("number | %lu\n", nrecord[2]);
			if((nrecord[0] > net) && (nrecord[2] != non_code)) {
				net = nrecord[0];
			}
			msite += 1;
		}
		//printf("net | %lu\n", net);
		writer record = 0;
		msite = 0;
		while(true) {
			if(msite == math_que[2]) {
				record = 0;
				break;
			}
			record = ((math_que + 3) + (msite * 5));
			//see_space("record", record, 0x28);
			if((record[0] == net) && (record[2] != non_code)) {
				break;
			}
			msite += 1;
		}
		quadrant msite2 = 0;
		quadrant msite3 = 0;
		writer record2 = 0;
		quadrant direction = 0;
		if(msite != 0) {
			msite2 = msite - 1;
			while(true) {
				//printf("msite2 | %lu\n", msite2);
				record2 = ((math_que + 3) + (msite2 * 5));
				if(record2[2] == non_code) {
					if(msite2 == 0) {
						record2 = 0;
						break;
					}
					msite2 -= 1;
				} else {
					//see_space("record2", record2, 0x28);
					break;
				}
			}
		}
		if(msite != met) {
			msite3 = msite + 1;
			while(true) {
				//printf("msite3 | %lu\n", msite3);
				writer record3 = ((math_que + 3) + (msite3 * 5));
				//see_space("record3", record3, 0x28);
				if(record3[2] != non_code) {
					if(record2 != 0) {
						if(record3[0] > record2[0]) {
							record2 = record3;
							direction = 1;
						}
					} else {
						record2 = record3;
						direction = 1;
					}
					break;
				} else {
					msite3 += 1;
					if(msite3 == nodes[2]) {
						break;
					}
				}
			}
			if(record2[2] == non_code) {
				record2 = 0;
			}
		}
		if(record2 != 0) {
			//printf("direction | %lu\n", direction);
			//printf("msite | %lu\n", msite);
			//see_space("record", record, 0x28);
			//printf("number | %lu\n", record[2]);
			//printf("msite2 | %lu\n", msite2);
			//see_space("record2", record2, 0x28);
			//printf("number2 | %lu\n", record2[2]);
			quadrant mode = 0;
			if(direction == 0) {
				if(record2[3] != non_code) {
					mode = record2[3];
				}
				//printf("mode | %lu\n", mode);
				if(mode == 0) {
					record[2] += record2[2];
				} else if(mode == 1) {
					record[2] = (record2[2] - record[2]);
				} else if(mode == 2) {
					record[2] = (record2[2] * record[2]);
				} else if(mode == 3) {
					record[2] = (record2[2] / record[2]);
				}
				record2[2] = non_code;
			} else {
				if(record2[1] != non_code) {
					mode = record2[1];
				}
				//printf("mode | %lu\n", mode);
				if(mode == 0) {
					record2[2] += record[2];
				} else if(mode == 1) {
					record2[2] = (record[2] - record2[2]);
				} else if(mode == 2) {
					record2[2] = (record[2] * record2[2]);
				} else if(mode == 3) {
					record2[2] = (record[2] / record2[2]);
				}
				record[2] = non_code;
			}
			//see_space("record", record, 0x28);
			//printf("number | %lu\n", record[2]);
			//see_space("record2", record2, 0x28);
			//printf("number2 | %lu\n", record2[2]);
		}
		quadrant naof_todos = 0;
		writer record3 = 0;
		quadrant com_number = 0;
		msite2 = 0;
		while(true) {
			if(msite2 == math_que[2]) {
				break;
			}
			record3 = ((math_que + 3) + (msite2 * 5));
			if(record3[2] != non_code) {
				com_number = record3[2];
				naof_todos += 1;
			}
			msite2 += 1;
		}
		//printf("naof-todos | %lu\n", naof_todos);
		if(naof_todos == 1) {
			number[0] = com_number;
			break;
		}
		//getc(stdin);
		//see_space("record", record3, 0x28);
		//break;
	}
	return;
}

// clerk-clericaL-es auxillery
vast view_header(source relay) {
	sec clerk_es_space[1000000];
	quad clerk_es_site = 0;
	quad naof_relay_secs = get_naof_secs(relay);
	quad naof_bar_secs = naof_relay_secs + 4;
	clerk_es_site += replicate('-', clerk_es_space, naof_bar_secs);
	add_to_entree("\n| ", 3, clerk_es_space, &clerk_es_site);
	add_to_entree(relay, naof_relay_secs, clerk_es_space, &clerk_es_site);
	add_to_entree(" |\n", 3, clerk_es_space, &clerk_es_site);
	clerk_es_site += replicate('-', (clerk_es_space + clerk_es_site), naof_bar_secs);
	clerk_es_space[clerk_es_site] = '\n';
	clerk_es_site += 1;
	syscall(unix_write, 1, clerk_es_space, clerk_es_site);
}


vast create_motion(writer grid, source name, quad naof_name_secs, quad type, quad breadth, quad naof_element_secs, writer rmotion) {
	//printf("at init in create-motion - grid | %lu\n", grid);
	if(grid == 0) {
		quadrant qtab = 0;
		//printf("grid | %lu\n", grid);
		get_grid_secs(grid, (100|10|1), &qtab);
		//printf("grid | %lu\n", grid);
	}
	source sname = 0;
	get_grid_secs(grid, (naof_name_secs + 1), &sname);
	wide_com(name, sname, naof_name_secs);
	//printf("sname | %lu\n", sname);

	quad stack_grid = grid[0];
	writer motion = 0;
	get_grid_secs(grid, naof_m_secs, &motion);
	writer motionv = 0;
	create_vecter(grid, naof_element_secs, breadth, &motionv);
	quad naof_motionv_secs = motionv[0] * motionv[2];
	motion[0] = type;
	motion[1] = sname;
	motion[2] = naof_name_secs;
	motion[3] = motionv;
	rmotion[0] = motion;
	quad vecter_breadth = motionv[0] * motionv[1];
	return vecter_breadth;
}

vast expand_for_motion_string(writer grid, quad naof_secs, writer rmotion) {
	writer stack_motion = rmotion[0];
	writer entree = stack_motion[3];
	expand_for_string_to_sec_vecter(grid, naof_secs, &entree);
	stack_motion[3] = entree;
	rmotion[0] = stack_motion;
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
		//syscall(unix_write, 1, non, 0);
		if(rack[0x11]) {
			return rack[0xa];
		}
		rack[0xa] += 1;
		sec_seek_site += 1;
	}

	asm("add $0x1000, %rsp");
	return -1;
}
