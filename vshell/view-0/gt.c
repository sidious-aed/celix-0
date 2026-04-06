#include "./standard.h"

quadrant main(quadrant naof_params, source_vecter params) {
	ip_file op = syscall(unix_open, "gt.html", archive_create|archive_write, archive_jypsy);
	writer grid = 0;
	writer opv = 0;
	create_vecter(&grid, 1, 1000, &opv);
	source hinit = "<!html><head><title>i-sim</title><link rel=\"stylesheet\" href=\"view-0.css\"></head><body><p id=\"intent-speak\">Talkei talkei, aigo vah nah goo trim brader.</p><p id=\"ideas-speak\">Relays in receiving. Moving more to heart, i can give a good hair cut.</p>";
	add_string_to_sec_vecter(&grid, hinit, 0xfa, &opv);
	quad time[2];
	time[0] = 0;
	time[1] = 0;
	quad zones[2];
	syscall(unix_gettimeofday, time, zones);
	sec base[100];
	quad naof_secs = number_to_entree(time[0], base, 16);
	add_string_to_sec_vecter(&grid, base, naof_secs, &opv);
	add_string_to_sec_vecter(&grid, ".", 1, &opv);
	naof_secs = number_to_entree(time[1], base, 16);
	add_string_to_sec_vecter(&grid, base, naof_secs, &opv);
	source hcom = "</body></html>";
	add_string_to_sec_vecter(&grid, hcom, 0xe, &opv);
	//syscall(unix_write, 1, (opv + 3), opv[2]);
	syscall(unix_write, op, (opv + 3), opv[2]);
	syscall(unix_close, op);
  return 0;
}
