#include "./standard.h"

// tyrel@fearsome:~/celix$ ./sequences-secsv libc.so.6 19234b 1923b2 moveups_shakes
// tyrel@fearsome:~/celix$ ./sequences-secsv asm/add-registers 606 903 add_registers_signs
quadrant main(quadrant naof_params, source_vecter ** params) {
  if(naof_params < 4) {
    printf("params | 3-4\n");
    printf("1 | binary-name\n");
    printf("2 | init-bs (base-16)\n");
    printf("3 | com-bs (base-16)\n");
		printf("(4) | vecter-name\n");
		printf("(5) | slice-motions (base-10) \"6|3|7|4\"\n");
    return 0;
  }
	//printf("naof-params | %lu\n", naof_params);
	quad naof_init_bs_secs = get_naof_secs(params[2]);
	quad init_bs = 0;
	entree_to_number(params[2], naof_init_bs_secs, 16, &init_bs);
	quad naof_com_bs_secs = get_naof_secs(params[3]);
	quad com_bs = 0;
	entree_to_number(params[3], naof_com_bs_secs, 16, &com_bs);
	source vecter_name = 0;
	quad naof_vecter_name_secs = 0;
	quad is_vecter_named = false;
	if(naof_params >= 5) {
		vecter_name = params[4];
		naof_vecter_name_secs = get_naof_secs(vecter_name);
		is_vecter_named = true;
	}

	// initialise
	source object = 0;
	quad naof_object_secs = 0;
	ip_file obj_file = get_object_file(params[1], true);
	get_object(obj_file, &object, &naof_object_secs);
	writer grid = 0;
	writer secsv = 0;
	create_vecter(&grid, 8, 100, &secsv);
	// slicers
	writer slicers = 0;
	quad slice_mode = false;
	quad slice_site = 0;
	if(naof_params >= 6) {
		slice_mode = true;
		create_vecter(&grid, 0x10, 100, &slicers);
		source slicer_entree = params[5];
		quad naof_slicer_entree_secs = get_naof_secs(slicer_entree);
		quad slice_site = 0;
		sec slice_entree[10000];
		quad slice_entree_site = 0;
		quad slice_record[2];
		quad slice_record_site = 0;
		while(true) {
			quad is_com = false;
			quad is_a_slice = false;
			sec slice_con = slicer_entree[slice_site];
			//printf("slice-con | %u | %c\n", slice_con, slice_con);
			slice_site += 1;
			if(slice_con == '|') {
				is_a_slice = true;
			} else {
				slice_entree[slice_entree_site] = slice_con;
				slice_entree_site += 1;
			}
			if(slice_site == naof_slicer_entree_secs) {
				is_a_slice = true;
				is_com = true;
			}
			if(is_a_slice) {
				quad squad = 0;
				entree_to_number(slice_entree, slice_entree_site, 10, &squad);
				//printf("squad | %lu\n", squad);
				slice_entree_site = 0;
				slice_record[slice_record_site] = squad;
				//printf("slice-record-site | %lu\n", slice_record_site);
				if(slice_record_site == 1) {
					//printf("creating slice-record.\n");
					//see_space("slice-record", slice_record, 0x10);
					add_to_vecter(&grid, slice_record, &slicers);
					slice_record_site = 0;
					//printf("slice-record-site | %lu\n", slice_record_site);
				} else {
					slice_record_site += 1;
				}
			}
			if(is_com) {
				break;
			}
			printf("\n");
		}
		printf("naof-slicers | %lu\n", slicers[2]);
	}
	if(slice_mode) {
		slice_site = 0;
		while(true) {
			if(slice_site == slicers[2]) {
				break;
			}
			writer slice = ((slicers + 3) + (2 * slice_site));
			//see_space("slice", slice, 0x10);
			//printf("when | %lu\n", slice[0]);
			//printf("naof-slice-secs | %lu\n", slice[1]);
			slice_site += 1;
		}
	}

	sec space[10000];
	quad space_site = 0;
	quad naof_ms = 0;
	sec ms[10000];
	quad bs = init_bs;
	while(true) {
		naof_ms = 0;
		bs = get_asm_secs_from_object(object, naof_object_secs, bs, ms, &naof_ms);
		writer secs = 0;
		create_vecter(&grid, 1, 100, &secs);
		add_string_to_sec_vecter(&grid, ms, naof_ms, &secs);
		//printf("secs | %lu\n", secs);

		writer selected_slice = 0;
		if(slice_mode) {
			slice_site = 0;
			while(true) {
				if(slice_site == slicers[2]) {
					break;
				}
				writer slice = ((slicers + 3) + (2 * slice_site));
				see_space("slice", slice, 0x10);
				if(slice[0] == secs[2]) {
					selected_slice = slice;
					break;
				}
				//printf("when | %lu\n", slice[0]);
				//printf("naof-slice-secs | %lu\n", slice[1]);
				slice_site += 1;
			}
		}
		if(selected_slice) {
			printf("selected-slice | %lu\n", selected_slice[1]);
			secs[2] = selected_slice[1];
		}

		add_to_vecter(&grid, &secs, &secsv);
		if(is_vecter_named == false) {
			space_site = 0;
			add_to_entree("libc.so.6 | ", 12, space, &space_site);
			space_site += number_to_entree(bs, (space + space_site), 16);
			log_heading(space);

			printf("naof-ms | %lu\n", naof_ms);
			see_space("machine-secs", ms, naof_ms);
			syscall(unix_write, 1, "machine-secs | ", 15); 
			see_encoded(ms, naof_ms, 16);
			syscall(unix_write, 1, "\n", 1); 
			space_site = 0;
			add_to_entree("com-bs | ", 9, space, &space_site);
			space_site += number_to_entree(com_bs, (space + space_site), 16);
			add_to_entree("\n", 1, space, &space_site);
			syscall(unix_write, 1, space, space_site);
		}
		if(bs > com_bs) {
			break;
		}
		//break;
	}
	if(is_vecter_named) {
		log_heading("asm sequences as c-chart constants");
		sec vecter_entree[1000000];
		quad vecter_entree_site = 0;
		add_to_entree("static const source ", 20, vecter_entree, &vecter_entree_site);
		add_to_entree(vecter_name, naof_vecter_name_secs, vecter_entree, &vecter_entree_site);
		add_to_entree("[", 1, vecter_entree, &vecter_entree_site);
		vecter_entree_site += number_to_entree(secsv[2], (vecter_entree + vecter_entree_site), 10);
		add_to_entree("] = {", 5, vecter_entree, &vecter_entree_site);
		sec naof_secs_entree[1000000];
		quad naof_secs_entree_site = 0;
		add_to_entree("static const quad ", 18, naof_secs_entree, &naof_secs_entree_site);
		add_to_entree(vecter_name, naof_vecter_name_secs, naof_secs_entree, &naof_secs_entree_site);
		add_to_entree("_naof_secs[", 11, naof_secs_entree, &naof_secs_entree_site);
		naof_secs_entree_site += number_to_entree(secsv[2], (naof_secs_entree + naof_secs_entree_site), 10);
		add_to_entree("] = {", 5, naof_secs_entree, &naof_secs_entree_site);
		sec encoded[10000];
		quad encoded_site = 0;
		quad et = secsv[2] - 1;
		quad site = 0;
		while(true) {
			if(site == secsv[2]) {
				break;
			}
			writer secsvr = (secsv + 3) + (site);
			writer secs = secsvr[0];
			//printf("secs | %lu\n", secs);
			//see_space("secs", (secs + 3), secs[2]);
			//see_encoded((secs + 3), secs[2], 16);
			//syscall(unix_write, 1, "\n", 1);
			encoded_site = 0;
			add_to_entree("static const sec ", 17, encoded, &encoded_site);
			add_to_entree(vecter_name, naof_vecter_name_secs, encoded, &encoded_site);
			add_to_entree("_", 1, encoded, &encoded_site);
			encoded_site += number_to_entree(site, (encoded + encoded_site), 16);
			add_to_entree("[", 1, encoded, &encoded_site);
			encoded_site += number_to_entree(secs[2], (encoded + encoded_site), 10);
			add_to_entree("]", 1, encoded, &encoded_site);
			add_to_entree(" = ", 3, encoded, &encoded_site);
			add_encoded((secs + 3), secs[2], encoded, &encoded_site, 16, '{', '}');
			add_to_entree(";\n", 2, encoded, &encoded_site);
			syscall(unix_write, 1, encoded, encoded_site);

			add_to_entree(vecter_name, naof_vecter_name_secs, vecter_entree, &vecter_entree_site);
			add_to_entree("_", 1, vecter_entree, &vecter_entree_site);
			vecter_entree_site += number_to_entree(site, (vecter_entree + vecter_entree_site), 16);
			if(site != et) {
				add_to_entree(", ", 2, vecter_entree, &vecter_entree_site);
			}

			naof_secs_entree_site += number_to_entree(secs[2], (naof_secs_entree + naof_secs_entree_site), 10);
			if(site != et) {
				add_to_entree(", ", 2, naof_secs_entree, &naof_secs_entree_site);
			}
			site += 1;
		}
		add_to_entree("};\n", 3, vecter_entree, &vecter_entree_site);
		syscall(unix_write, 1, vecter_entree, vecter_entree_site);
		add_to_entree("};\n", 3, naof_secs_entree, &naof_secs_entree_site);
		syscall(unix_write, 1, naof_secs_entree, naof_secs_entree_site);
	}
	printf("naof-secsv-vecters | %lu\n", secsv[2]);
  return 0;
}
