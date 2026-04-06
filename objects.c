#include "./standard.h"

quad get_object_file_name(source binary_name, source object_name) {
	quad naof_binary_name_secs = get_naof_secs(binary_name);
	quad object_name_site = 0;
	add_to_entree(binary_name, naof_binary_name_secs, object_name, &object_name_site);
	add_to_entree(".obj", 4, object_name, &object_name_site);
	return object_name_site;
}

quad get_object_file(source binary_name, quad is_always) {
	quad naof_binary_name_secs = get_naof_secs(binary_name);
	sec object_name[10000];
	quad object_name_site = 0;
	add_to_entree(binary_name, naof_binary_name_secs, object_name, &object_name_site);
	add_to_entree(".obj", 4, object_name, &object_name_site);
	ip_file obj_file = syscall(unix_open, object_name, archive_read);
	if(is_always || (obj_file == code_a)) {
		sec comand[10000];
		quad comand_site = 0;
		add_to_entree("objdump -d ", 11, comand, &comand_site);
		add_to_entree(binary_name, naof_binary_name_secs, comand, &comand_site);
		add_to_entree(" > ", 3, comand, &comand_site);
		add_to_entree(object_name, object_name_site, comand, &comand_site);
		//syscall(unix_write, 1, comand, comand_site);
		//syscall(unix_write, 1, "\n", 1);
		system(comand);
	}
	if(obj_file != code_a) {
		syscall(unix_close, obj_file);
	}
	obj_file = syscall(unix_open, object_name, archive_read);
	return obj_file;
}

vast get_object(ip_file object_file, writer object, writer naof_object_secs) {
	naof_object_secs[0] = syscall(unix_lseek, object_file, 0, seek_com);
	object[0] = syscall(unix_mmap, non, naof_object_secs[0], map_rws, map_console, object_file, 0);
	syscall(unix_close, object_file);
	return;
}

quad is_aux_segment(source object, quad naof_object_secs, quad obj_site) {
	//syscall(unix_write, 1, "obj-at | ", 9);
	//syscall(unix_write, 1, (object + obj_site), 0x20);
	//syscall(unix_write, 1, "\n", 1);
	//see_space("obj-at", (object + obj_site), 0x20);
	squad naof_segment_secs = seek_space("\n", 1, (object + obj_site), (naof_object_secs - obj_site));
	//printf("naof-segment-secs | %lu\n", naof_segment_secs);
	squad t1_site = seek_space("\t", 1, (object + obj_site), (naof_object_secs - obj_site));
	//printf("t1-site | %lu\n", t1_site);
	quad obj_t1_com_site = t1_site + 1;
	squad t2_site = seek_space("\t", 1, (object + obj_site + obj_t1_com_site), (naof_object_secs - obj_site - obj_t1_com_site)) + obj_t1_com_site;
	//printf("t2-site | %lu\n", t2_site);
	return (t2_site > naof_segment_secs);
}

quad derive_machine_secs(source object, quad naof_object_secs, quad obj_site, source machine_secs, writer naof_machine_secs) {
	//printf("machine-secs | %lu\n", machine_secs);
	quad machine_sec = 0;
	while(true) {
		sec com_rune = object[(obj_site + 3)];
		entree_to_number((object + obj_site), 2, 16, &machine_sec);
		//printf("machine-sec | %u\n", machine_sec);
		machine_secs[naof_machine_secs[0]] = machine_sec;
		//printf("machine-secs-at | %u\n", machine_secs[naof_machine_secs[0]]);
		naof_machine_secs[0] += 1;
		obj_site += 3;
		if((com_rune == ' ') || (com_rune == '\t') || (com_rune == '\n')) {
			break;
		}
	}
	//syscall(unix_write, 1, "obj-at | ", 9);
	//syscall(unix_write, 1, (object + obj_site), 0x20);
	//syscall(unix_write, 1, "\n", 1);
	//see_space("obj-at", (object + obj_site), 0x20);
	return obj_site;
}

quad get_asm_secs_from_object(source object, quad naof_object_secs, quad binary_site, source machine_secs, writer naof_machine_secs) {
	//printf("machine-secs | %lu\n", machine_secs);
	sec bs_entree[1000];
	quad bs_entree_site = number_to_entree(binary_site, bs_entree, 16);
	add_to_entree(":", 1, bs_entree, &bs_entree_site);
	//syscall(unix_write, 1, bs_entree, bs_entree_site);
	//syscall(unix_write, 1, "\n", 1);

	quad obj_site = 0;
	// at-clerk-desk
	//squad seek = seek_space(bs_entree, bs_entree_site, object, naof_object_secs);
	// at-wide-desk
	//quad seek = wide_seek(bs_entree, bs_entree_site, object, naof_object_secs);
	// with-back
	source at_bs_entree = strstr(object, bs_entree);
	squad seek = at_bs_entree - object;
	obj_site = seek + bs_entree_site + 1;
	/*
	*/

	obj_site = derive_machine_secs(object, naof_object_secs, obj_site, machine_secs, naof_machine_secs);
	obj_site += seek_space("\n", 1, (object + obj_site), (naof_object_secs - obj_site)) + 1;
	quad ias = is_aux_segment(object, naof_object_secs, obj_site);
	//printf("ias | %lu\n", ias);
	if(ias) {
		obj_site += seek_space(":", 1, (object + obj_site), (naof_object_secs - obj_site)) + 2;
		//syscall(unix_write, 1, "|", 1);
		//syscall(unix_write, 1, (object + obj_site), 0x20);
		//syscall(unix_write, 1, "|", 1);
		//syscall(unix_write, 1, "\n", 1);
		obj_site = derive_machine_secs(object, naof_object_secs, obj_site, machine_secs, naof_machine_secs);
	}
	//syscall(unix_write, 1, (object + obj_site), 0x20);
	//syscall(unix_write, 1, "\n", 1);
	quad com_bs = binary_site + naof_machine_secs[0];
	return com_bs;
}
