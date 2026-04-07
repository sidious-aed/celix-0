#include "./standard.h"

quadrant main() {
	// libs
	system("gcc -c standard.c -o standard.lib");
	system("gcc -c standard.lib clerk.c -o clerk.lib");
	//system("gcc -c standard.lib objects.c -o objects.lib");
	system("gcc -c standard.lib machine.c -o machine.lib");
	system("gcc -c standard.lib sound.c -o sound.lib");
	system("gcc standard.lib sound.lib sound-main.c -o sound-main");

	// lib mains
	system("gcc standard.lib standard-main.c -o standard-main");
	//system("gcc standard.lib objects.lib objects-main.c -o objects-main");
	//system("gcc standard.lib clerk.lib clerk-main.c -o clerk-main");
	system("gcc standard.lib machine.lib machine-main.c -o machine-main");
	//system("./non-cltqs clerk-main");

	// exec-ware
	//system("gcc mf.c -o mf");
	//system("gcc cn.c -o cn");
	//system("gcc rn.c -o rn");
	//system("gcc standard.lib stay.c -o stay");
	system("gcc standard.lib naof-secs.c -o naof-secs");
	//system("gcc standard.lib naof-entrees-secs.c -o naof-entrees-secs");
	//system("gcc standard.lib naof-elements.c -o naof-elements");
	//system("gcc standard.lib base.c -o base");
	//system("gcc standard.lib b16-as-entree.c -o b16-as-entree");
	//system("gcc standard.lib spiro-dyno.c -o spiro-dyno");
	//system("gcc standard.lib is-base.c -o is-base");
	//system("gcc standard.lib vecter-entree.c -o vecter-entree");
	//system("gcc standard.lib entrees-meta.c -o entrees-meta");
	//system("gcc standard.lib statemints.c -o statemints");
	//system("gcc standard.lib get-bin-calls-chart.c -o get-bin-calls-chart");

	// archives-ware
	system("gcc standard.lib view-space.c -o view-space");
	system("gcc standard.lib view-space-file.c -o view-space-file");
	system("gcc standard.lib clerk.lib clear-desk.c -o clear-desk");
	system("gcc standard.lib clerk.lib list-files.c -o list-files");
	//system("gcc standard.lib clerk.lib ngrep.c -o ngrep");
	//system("gcc standard.lib seek-file-site.c -o seek-file-site");
	//system("gcc standard.lib file-secs-sites.c -o file-secs-sites");

	// clerk-wide-ware (es always mean-(t))
	//system("gcc standard.lib objects.lib get-object-file.c -o get-object-file");
	system("gcc standard.lib objects.lib sequences-secsv.c -o sequences-secsv");
	//system("gcc standard.lib c-pairs.c -o c-pairs");
	//system("gcc standard.lib abstract.c -o abstract");
	//system("gcc standard.lib abstract-pairs.c -o abstract-pairs");
	system("gcc standard.lib machine.lib seqs.c -o seqs");
	//system("./non-cltqs base");
	//system("gcc standard.lib asm-secs.c -o asm-secs");
	//system("gcc standard.lib clerk.lib equations.c -o equations");
	system("gcc standard.lib machine.lib sequences.c -o sequences");
	system("gcc standard.lib clerk.lib build-equations.c -o build-equations");
	system("gcc standard.lib build-shell.c -o build-shell");
	system("gcc standard.lib build-mshell.c -o build-mshell");
	system("gcc standard.lib build-msh.c -o build-msh");
	system("gcc standard.lib clerk.lib log-terminal.c -o log-terminal");
	//system("gcc standard.lib view-assembly.c -o view-assembly");
	// all respects to the awesome spec fulfilling dinasaurs.
	// be to the spec demanders the non (in a prose of trends) of their docket issuances goes to.
	//system("gcc standard.lib clerk.lib non-cltqs.c -o non-cltqs");

	// main-shells
	//system("gcc standard.lib equations-main.c -o equations-main");
	//system("./sequences procs/i-sim.asm procs/i-sim.proc 0");
	//system("./build-shell procs/i-sim.proc i-sim.c");
	//system("gcc i-sim.c -o i-sim");
	//system("./sequences assemblies/equations.asm secs/equations.secs 0");
	//system("./sequences procs/equations-main.asm procs/equations-main.proc 0");
	//system("./build-shell procs/equations-main.proc equations-main.c");
	system("gcc standard.lib statents.c -o statents");
  return 0;
}
