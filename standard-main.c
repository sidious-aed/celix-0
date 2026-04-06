#include "./clerk.h"

quadrant main(quadrant naof_params, source_vecter params) {
	//ip_file nao_file = get_nao_file(1000000);
	//printf("nao-file | %lu\n", nao_file);
	writer grid = 0;
	printf("grid | %lu\n", grid);
	source entree = 0;
	printf("entree | %lu\n", entree);
	get_grid_secs(&grid, 0x1000, &entree);
	printf("grid | %lu\n", grid);
	printf("entree | %lu\n", entree);
	source russian_poem_console = "nai. aht set two law. aht fitty nah. bra of a broom today.\n";
	quadrant russian_poem_site = 0x3b;
	//entree[0] = 0xed;
	wide_com(russian_poem_console, entree, russian_poem_site);
	syscall(unix_write, 1, entree, russian_poem_site);
	writer quads_vecter = 0;
	create_vecter(&grid, 0x18, 0x100, &quads_vecter);
	printf("quads-vecter | %lu\n", quads_vecter);
	printf("naof-secs | %lu\n", quads_vecter[0]);
	printf("naof-breadth | %lu\n", quads_vecter[1]);
	printf("vecter-site | %lu\n", quads_vecter[2]);
	quad site = 0;
	while(true) {
		if(site == 0x200) {
			break;
		}
		//printf("site | %lu\n", site);
		quad record[3];
		record[0] = site;
		record[1] = site + 1;
		record[2] = site + 2;
		add_to_vecter(&grid, record, &quads_vecter);
		site += 1;
	}
	printf("naof-elements | %lu\n", quads_vecter[2]);
	/*
	site = 0;
	while(true) {
		if(site == quads_vecter[2]) {
			break;
		}
		//quad stack_quad = get_vecter_element(quads_vecter, site);
		quad stack_quad = ((reader)(get_vecter_element(quads_vecter, site)))[0];
		//printf("stack-quad | %lu\n", stack_quad);
		site += 1;
	}
	*/
	site = 0;
	while(true) {
		if(site == 100000) {
			break;
		}
		//printf("site | %lu\n", site);
		quad record[3];
		record[0] = site;
		record[1] = site + 1;
		record[2] = site + 2;
		add_to_vecter(&grid, record, &quads_vecter);
		//printf("\n");
		site += 1;
	}
	/*
	site = 0;
	while(true) {
		if(site == quads_vecter[2]) {
			break;
		}
		reader record = get_vecter_element(quads_vecter, site);
		see_space("record", record, 0x18);
		site += 1;
	}
	*/
	printf("naof-elements | %lu\n", quads_vecter[2]);
	//quadrant naof_lines = get_naof_lines("standard.c");
	//printf("naof-lines | %lu\n", naof_lines);
	//clear_clerk_bin();
	syscall(unix_write, 1, entree, russian_poem_site);
	writer vec_entree = 0;
	create_string(&grid, 10, &vec_entree);
	see_quad("vec-entree | ", vec_entree, 16);
	site = 0;
	while(true) {
		if(site == 10) {
			break;
		}
		add_string_to_sec_vecter(&grid, "i sim.\n", 7, &vec_entree);
		site += 1;
	}
	see_string(vec_entree);

	// motions
	ip_file alpha_grid_quad_seader = syscall(unix_open, "/dev/random", archive_read);
	log_heading("aon-motions");
	writer motion = 0;
	printf("grid | %lu\n", &grid);
	printf("creating motion alpha ...\n");
	create_motion(&grid, "motion-alpha", 12, 1, 8, 8, &motion);
	printf("motion | %lu\n", motion);
	log_heading("aon-motions");
	source mname = get_m_name(motion);
	quad naof_mname_secs = get_m_naof_name_secs(motion);
	syscall(unix_write, 1, mname, naof_mname_secs);
	syscall(unix_write, 1, "\n", 1);
	printf("seading 27 quads ....\n");
	writer motionv = get_m_vec(motion);
	site = 0;
	while(true) {
		if(site == 27) {
			break;
		}
		// alpha-motions in -|- alpha-grid
		quad agsq = 0;
		syscall(unix_read, alpha_grid_quad_seader, &agsq, 8);
		//agsq = site;
		//printf("agsq-name | %lu\n", &agsq);
		printf("agsq | %lu\n", agsq);
		add_to_vecter(&grid, &agsq, &motionv);
		writer stack_motionv = motionv;
		/*
		asm("nop");
		asm("nop");
		asm("nop");
		agsq = ((quad)(((stack_motionv + 3) + ((stack_motionv[2]-1)))[0]));
		asm("nop");
		asm("nop");
		asm("nop");
		// seirious slight recal
		agss_site = 0;
		add_to_entree("does gccs stack dance have much to learn persay from for a pacular noticed while alpha-motion was in besetage-becoming.\n", 120, agss, &agss_site);
		syscall(unix_write, 1, agss, agss_site);
		// no -|- (twas our zit-zit at this ocurance); instead, ymm seek-space is at one case, faster than clerk-desk, and a bit slower than the libc-ymm-front-drop (bracin to paraphrase ganger)
		// - see entrees/benchmarks-to-see-from.entree
		// instead from an off in conjurance ganger ... * even.
		*/
		printf("agsq | %lu\n", agsq);
		site += 1;
	}
	syscall(unix_close, alpha_grid_quad_seader);
	printf("seaded.\n");     // <--> # paraphrasing mighter not be a gaugh with them.
		// <--> * braisin for con--ection
												// <--> do the creadists leviests have their go fours at all in their come abouts?
	writer motionv_quads = motionv + 3;
	sec agss[10000];
	quad agss_site = 0;
	site = 0;
	while(true) {
		if(site == 27) {
			break;
		}
		quad agsq = motionv_quads[site];
		printf("alpha-grid-stack-quad | %lu\n", agsq);
		agss_site = 0;
		add_to_entree("agsq | ", 0x7, agss, &agss_site);
		agss_site += number_to_entree(agsq, (agss + agss_site), 16);
		add_to_entree("\n", 1, agss, &agss_site);
		syscall(unix_write, 1, agss, agss_site);
		agss_site = 0;
		add_to_entree("agsq -|- as | ", 14, agss, &agss_site);
		add_encoded(&agsq, 8, agss, &agss_site, 16, '<', '>');
		add_to_entree("\n", 1, agss, &agss_site);
		syscall(unix_write, 1, agss, agss_site);
		site += 1;
	}
	/*
	// experimental-wide
	// seems mm and repz is much to kernel and syscalls reset in a way that that is the key to shake discovery in part to it.
	writer libc_snipit = 0;
	create_string(&grid, 10, &libc_snipit);
	add_file_string_to_sec_vecter(&grid, "libc.so.6", 0x19234b, 0x6e, &libc_snipit);
	see_encoded(get_vecter_grid(libc_snipit), libc_snipit[2], 16);
	syscall(unix_write, 1, "\n", 1);

	// hello decomisa; (segwaing (<--> degwaying) in heart speak spectras) i can be a good thin hair style-ist.
	source i_sim = "talkei talkei. airgo vah nah goo-trim brader.\n";
	quad naof_i_sim_secs = 46;
	quad seek_site = wide_seek("vah", 3, i_sim, naof_i_sim_secs);
	printf("seek-site | %lu\n", seek_site);
	printf("from-seek | %s\n", (i_sim + seek_site));
	seek_site = wide_seek("ei.", 3, i_sim, naof_i_sim_secs);
	printf("seek-site | %lu\n", seek_site);
	printf("from-seek | %s\n", (i_sim + seek_site));
	seek_site = wide_seek("brader", 6, i_sim, naof_i_sim_secs);
	printf("seek-site | %lu\n", seek_site);
	printf("from-seek | %s\n", (i_sim + seek_site));
	*/

	log_heading("orderc-spaces");
	source mareine0 = "ripply";
	source mareine1 = "weirzbeskei";
	squad ccomp = orderc_spaces(mareine0, 6, mareine1, 0xb);
	printf("ccomp | %ld\n", ccomp);
	ccomp = orderc_spaces(mareine1, 0xb, mareine0, 0x6);
	printf("ccomp | %ld\n", ccomp);
	ccomp = orderc_spaces("arfg-123", 8, "arcg-156", 8);
	printf("ccomp | %ld\n", ccomp);
	ccomp = orderc_spaces("arfg-123", 8, "arfg-123", 8);
	printf("ccomp | %ld\n", ccomp);

	log_heading("orderc-vecter");
	quad mr[2];
	writer mareine_aliases = 0;
	create_vecter(&grid, 0x10, 51, &mareine_aliases);
	source m0n = 0;
	get_grid_secs(&grid, 1000, &m0n);
	wide_com("hfudo-7382hd7", m0n, 0xd);
	mr[0] = m0n;
	mr[1] = 0xd;
	add_to_vecter(&grid, mr, &mareine_aliases);
	source m1n = 0;
	get_grid_secs(&grid, 1000, &m1n);
	wide_com("efudo-7382hd7", m1n, 0xd);
	mr[0] = m1n;
	mr[1] = 0xd;
	add_to_vecter(&grid, mr, &mareine_aliases);
	source m2n = 0;
	get_grid_secs(&grid, 1000, &m2n);
	wide_com("efudo-7382hd", m2n, 0xc);
	mr[0] = m2n;
	mr[1] = 0xc;
	add_to_vecter(&grid, mr, &mareine_aliases);
	source m3n = 0;
	get_grid_secs(&grid, 1000, &m3n);
	wide_com("efudo-7382hd77", m3n, 0xe);
	mr[0] = m3n;
	mr[1] = 0xe;
	add_to_vecter(&grid, mr, &mareine_aliases);
	source m4n = 0;
	get_grid_secs(&grid, 1000, &m4n);
	wide_com("afud 87382hd77", m4n, 0xe);
	mr[0] = m4n;
	mr[1] = 0xe;
	add_to_vecter(&grid, mr, &mareine_aliases);
	source m5n = 0;
	get_grid_secs(&grid, 1000, &m5n);
	wide_com("afu  87382hd77", m5n, 0xe);
	mr[0] = m5n;
	mr[1] = 0xe;
	add_to_vecter(&grid, mr, &mareine_aliases);
	/*
	*/
	printf("naof-mareine-aliases | %lu\n", mareine_aliases[2]);
	writer oms = 0;
	order_vecter(&grid, mareine_aliases, 2, 0, 1, &oms);
	printf("naof-ordered-mareines | %lu\n", oms[2]);
	site = 0;
	while(true) {
		if(site == oms[2]) {
			break;
		}
		writer ma = (oms + 3) + (site * 2);
		printf("ma o#%lu | %s\n", site, ma[0]);
		site += 1;
	}
	return 0;
}
