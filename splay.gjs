#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk} = imports.gi;
const Gio = imports.gi.Gio;
const Gst = imports.gi.Gst;
const GLib = imports.gi.GLib;
Gst.init(null);

let file_exists = function(name) {
	let file = Gio.File.new_for_path(name);
	return file.query_exists(null);
}

let play_sound = function(path_name) {
	//print("archives-status | " + file_exists(path_name));
	let uri = "file://" + path_name;
	//print("uri | " + uri);
	let player = Gst.ElementFactory.make("playbin", "player");
	player.set_property("uri", uri);
	player.set_state(Gst.State.PAUSED);
	player.get_state(1000 * 1000 * 100);
	let [res, duration] = player.query_duration(Gst.Format.TIME);
	print("res | " + res);
	player.set_state(Gst.State.NULL);
	if(res) {
		duration /= 1000000000;
		print("duration | " + duration);
	}
	let pr = player.set_state(Gst.State.PLAYING);
	//print("pr | " + pr);
	let was_played = true;
	if(pr == 0) {
		was_played = false;
	}
	return [was_played, duration];
}

let naof_params = ARGV.length;
let acfn = "";
let sns;
let initt;
let post_init_glance = function(sns) {
	let elapsed = Date.now() - initt;
	if(elapsed < 0) {
		GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, post_init_glance);
	}
	print("elapsed | " + elapsed);
	print("sns | " + sns);
	if(sns != -1 && ((elapsed / 1000) >= sns)) {
		let acfn_site = acfn.length;
		if(acfn_site > 0) {
			let file = Gio.File.new_for_path(acfn);
			file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
				source.delete_finish(result);
			});
			print("<--> in post-init-glance. clearing out pass cache and exiting.");
			Gtk.main_quit();
		}
	}
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, function() {
		post_init_glance(sns)
	});
}

if(naof_params != 1) {
	print("<--> just need a sound-file-name is all.");
} else {
	print("params | " + ARGV);
	let fn = ARGV[0];
	if(fn[0] != "/") {
		let base0 = GLib.get_current_dir() + "/";
		fn = base0 + fn;
	}
	print("seeking for sound-file-name | " + fn);
	let ef = file_exists(fn);
	if(ef) {
		let file_name_site = fn.length;
		let es = file_name_site - 1;
		while(true) {
			//print("fn[es] | " + fn[es]);
			if(fn[es] == ".") {
				//es += 1;
				break;
			}
			es -= 1;
			//break;
		}
		//let extension = fn.slice(es, file_name_site);
		//print("extension | " + extension);
		let basen = fn.slice(0, es);;
		//print("basen | " + basen);
		acfn = basen + "." + Date.now() + ".wav"; // <--> anewly-converted-file-name
		print("acfn | " + acfn);
		let comand = ["ffmpeg", "-i", fn, acfn]
		print("comand | " + comand);
		let [success, pid, stdin, stdout, stderr] = GLib.spawn_sync(
			null, comand, null, GLib.SpawnFlags.SEARCH_PATH, null
		);
		print("success | " + success);
		GLib.spawn_close_pid(pid);
		initt = Date.now();
		let [wpd,sns] = play_sound(acfn);
		print("was-played | " + wpd);
		print("sns | " + sns);
		post_init_glance(sns);
		/*
		await();
		*/
		Gtk.main();
	} else {
		print("<--> could not find " + fn + ".");
	}
}
