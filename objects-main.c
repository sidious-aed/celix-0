#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	log_heading("clerk and objects");
	source binary_name = "asm/set-register";
	ip_file obj_file = get_object_file(binary_name, true);
	printf("obj-file | %lu\n", obj_file);
	get_object_file(binary_name, true);
	sec object_name[10000];
	source object = 0;
	quad naof_object_secs = 0;
	get_object(obj_file, &object, &naof_object_secs);
	//syscall(unix_close, obj_file);
	printf("object | %lu\n", object);
	printf("naof-object-secs | %lu\n", naof_object_secs);
	//syscall(unix_write, 1, object, naof_object_secs);
	quad naof_object_name_secs = get_object_file_name(binary_name, object_name);
	syscall(unix_write, 1, object_name, naof_object_name_secs);
	syscall(unix_write, 1, "\n", 1);
	log_heading("getting assembly sequences machine-secs");
	sec space[10000];
	quad space_site = 0;
	sec ms[10000];
	quad naof_ms = 0;

	log_heading("asm/set-register 5fb");
	quad com_bs = get_asm_secs_from_object(object, naof_object_secs, 0x5fb, ms, &naof_ms);
	printf("naof-ms | %lu\n", naof_ms);
	//see_space("machine-secs", ms, naof_ms);
	syscall(unix_write, 1, "machine-secs | ", 15); 
	see_encoded(ms, naof_ms, 16);
	syscall(unix_write, 1, "\n", 1); 
	space_site = 0;
	add_to_entree("com-bs | ", 9, space, &space_site);
	space_site += number_to_entree(com_bs, (space + space_site), 16);
	add_to_entree("\n", 1, space, &space_site);
	syscall(unix_write, 1, space, space_site);

	log_heading("asm/set-register 606");
	naof_ms = 0;
	com_bs = get_asm_secs_from_object(object, naof_object_secs, 0x606, ms, &naof_ms);
	printf("naof-ms | %lu\n", naof_ms);
	//see_space("machine-secs", ms, naof_ms);
	syscall(unix_write, 1, "machine-secs | ", 15); 
	see_encoded(ms, naof_ms, 16);
	syscall(unix_write, 1, "\n", 1); 
	space_site = 0;
	add_to_entree("com-bs | ", 9, space, &space_site);
	space_site += number_to_entree(com_bs, (space + space_site), 16);
	add_to_entree("\n", 1, space, &space_site);
	syscall(unix_write, 1, space, space_site);

	// shift to libc
	obj_file = get_object_file("libc.so.6", false);
	printf("obj-file | %lu\n", obj_file);
	get_object(obj_file, &object, &naof_object_secs);

	log_heading("libc.so.6 1927fc");
	naof_ms = 0;
	com_bs = get_asm_secs_from_object(object, naof_object_secs, 0x1927fc, ms, &naof_ms);
	printf("naof-ms | %lu\n", naof_ms);
	//see_space("machine-secs", ms, naof_ms);
	syscall(unix_write, 1, "machine-secs | ", 15); 
	see_encoded(ms, naof_ms, 16);
	syscall(unix_write, 1, "\n", 1); 
	space_site = 0;
	add_to_entree("com-bs | ", 9, space, &space_site);
	space_site += number_to_entree(com_bs, (space + space_site), 16);
	add_to_entree("\n", 1, space, &space_site);
	syscall(unix_write, 1, space, space_site);

	log_heading("libc.so.6 1936c6");
	naof_ms = 0;
	com_bs = get_asm_secs_from_object(object, naof_object_secs, 0x1936c6, ms, &naof_ms);
	printf("naof-ms | %lu\n", naof_ms);
	//see_space("machine-secs", ms, naof_ms);
	syscall(unix_write, 1, "machine-secs | ", 15); 
	see_encoded(ms, naof_ms, 16);
	syscall(unix_write, 1, "\n", 1); 
	space_site = 0;
	add_to_entree("com-bs | ", 9, space, &space_site);
	space_site += number_to_entree(com_bs, (space + space_site), 16);
	add_to_entree("\n", 1, space, &space_site);
	syscall(unix_write, 1, space, space_site);
	return 0;
}
