#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
  if(naof_params != 2) {
    printf("params | 1\n");
    printf("1 | vecters\n");
    return;
  }
	sec vecter_inits[3] = {'{', '(', '['};
	quad naof_vecter_inits = 3;
	sec vecter_coms[3] = {'}', ')', ']'};
	quad naof_vecter_coms = 3;
	sec element_coms[2] = {',', ' '};
	quad naof_element_coms = 2;
	sec nao_signs[3] = {'\t', ' ', '\n'};
	quad naof_nao_signs = 3;
	source vecters_secs = params[1];
	quad naof_vecters_secs = get_naof_secs(vecters_secs);
	writer grid = 0;
	writer vecters = 0;
	create_vecter(&grid, 8, 100, &vecters);
	sec element[0x3d0900];
	quad element_site = 0;
	writer vecter = 0;
	quad site = 0;
	while(true) {
		source acom = (vecters_secs + site);
		sec acon = vecters_secs[site];
		//printf("acon | %u | %c\n", acon, acon);
		squad nao_site = seek_space(acom, 1, nao_signs, naof_nao_signs);
		site += 1;
		if(nao_site == -1) {
			break;
		}
	}
	while(true) {
		quad is_element_com = false;
		quad is_vecter_com = false;
		quad is_aux = true;
		source acom = (vecters_secs + site);
		sec acon = vecters_secs[site];
		//printf("acon | %u | %c\n", acon, acon);
		site += 1;
		squad vinit_site = seek_space(acom, 1, vecter_inits, naof_vecter_inits);
		if(vinit_site >= 0) {
			//printf("at init vecter-init\n");
			create_vecter(&grid, 0x10, 100, &vecter);
			is_aux = false;
		}
		squad vcom_site = seek_space(acom, 1, vecter_coms, naof_vecter_coms);
		//printf("vcom-site | %lu\n", vcom_site);
		if(vcom_site >= 0) {
			if(element_site > 0) {
				is_element_com = true;
			}
			if(vecter && vecter[2] > 0) {
				is_vecter_com = true;
			}
			is_aux = false;
		}
		squad ecom_site = seek_space(acom, 1, element_coms, naof_element_coms);
		if(ecom_site >= 0) {
			if(element_site > 0) {
				is_element_com = true;
			}
			is_aux = false;
		}
		if(is_aux) {
			element[element_site] = acon;
			element_site += 1;
			element[element_site] = 0;
			//printf("in-aux-at | %s\n", element);
		}
		if(is_element_com) {
			//printf("at init element-com\n");
			source entree = 0;
			get_grid_secs(&grid, (element_site + 1), &entree);
			wide_com(element, entree, element_site);
			quad entreer[2];
			entreer[0] = entree;
			entreer[1] = element_site;
			add_to_vecter(&grid, entreer, &vecter);
			element_site = 0;
		}
		if(is_vecter_com) {
			//printf("at init vecter-com\n");
			//printf("naof-elements | %lu\n", vecter[2]);
			add_to_vecter(&grid, &vecter, &vecters);
			//printf("naof-vecters | %lu\n", vecters[2]);
			vecter = 0;
		}
		if(site == naof_vecters_secs) {
			break;
		}
	}
	writer static_def = 0;
	create_vecter(&grid, 1, 0x3d0900, &static_def);
	//printf("naof-vecters | %lu\n", vecters[2]);
	add_string_to_sec_vecter(&grid, "static-vecter -|- = {", 21, &static_def);
	sec naof_secs_entree[10000];
	quad naof_secs_entree_site = 0;
	writer static_naof_secs = 0;
	create_vecter(&grid, 1, 0x3d0900, &static_naof_secs);
	add_string_to_sec_vecter(&grid, "static-naof-secs -|- = {", 0x18, &static_naof_secs);
	quad naof_pairs = 0;
	quad vet = vecters[2] - 2;
	site = 0;
	while(true) {
		if(site == vecters[2]) {
			break;
		}
		writer vecter = ((vecters + 3) + (site))[0];
		//see_space("vecter", vecter, 0x8);
		//printf("naof-entrees in vecter-|%lu|- | %lu\n", site, vecter[2]);

		quad vet2 = vecters[2] - 1;
		quad et = vecter[2] - 1;
		quad esite = 0;
		while(true) {
			if(esite == vecter[2]) {
				break;
			}
			writer element = (vecter + 3) + (2 * esite);
			//printf("entree2 | %s\n", element[0]);
			//quad site2 = site + 1;
			quad site2 = site + 1;
			while(true) {
				if(site2 == vecters[2]) {
					break;
				}
				writer vecter2 = ((vecters + 3) + (site2))[0];
				//see_space("vecter", vecter, 0x8);
				//printf("naof-entrees in vecter2-|%lu|- | %lu\n", site2, vecter2[2]);
				quad et2 = vecter2[2] - 1;
				quad esite2 = 0;
				while(true) {
					if(esite2 == vecter2[2]) {
						break;
					}
					writer element2 = (vecter2 + 3) + (2 * esite2);
					//printf("entree2 | %s\n", element2[0]);
					add_string_to_sec_vecter(&grid, "\"", 1, &static_def);
					add_string_to_sec_vecter(&grid, element[0], element[1], &static_def);
					add_string_to_sec_vecter(&grid, "-", 1, &static_def);
					add_string_to_sec_vecter(&grid, element2[0], element2[1], &static_def);
					add_string_to_sec_vecter(&grid, "\"", 1, &static_def);
					naof_secs_entree_site = number_to_entree((element[1] + element2[1] + 1), naof_secs_entree, 10);
					add_string_to_sec_vecter(&grid, naof_secs_entree, naof_secs_entree_site, &static_naof_secs);
					if((site == vet && site2 == vet2 && esite == et && esite2 == et2) == false) {
						add_string_to_sec_vecter(&grid, ", ", 2, &static_def);
						add_string_to_sec_vecter(&grid, ", ", 2, &static_naof_secs);
					}
					naof_pairs += 1;
					esite2 += 1;
				}
				site2 += 1;
			}
			esite += 1;
		}
		site += 1;
	}
	add_string_to_sec_vecter(&grid, "};\n", 3, &static_def);
	syscall(unix_write, 1, (static_def + 3), static_def[2]);
	add_string_to_sec_vecter(&grid, "};\n", 3, &static_naof_secs);
	syscall(unix_write, 1, (static_naof_secs + 3), static_def[2]);
	sec naof_pairs_entree[10000];
	quadrant naof_pairs_site = 0;
	add_to_entree("naof-pairs | ", 13, naof_pairs_entree, &naof_pairs_site);
	naof_pairs_site += number_to_entree(naof_pairs, (naof_pairs_entree + naof_pairs_site), 10);
	add_to_entree("\n", 1, naof_pairs_entree, &naof_pairs_site);
	syscall(unix_write, 1, naof_pairs_entree, naof_pairs_site);
	return 0;
}
