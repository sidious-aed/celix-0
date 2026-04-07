#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk, WebKit2} = imports.gi;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gdk = imports.gi.Gdk;
const Gst = imports.gi.Gst;
Gst.init(null);

let file_exists = function(name) {
	let file = Gio.File.new_for_path(name);
	return file.query_exists(null);
}

let read_file = function(name) {
	let file = Gio.File.new_for_path(name);
	let [ok, contents] = file.load_contents(null);
	if(ok) {
		//return "";
		return ("" + contents);
	}
	return false;
}

let write_to_file = function(fn, entree) {
	const file = Gio.File.new_for_path(fn);
	const bytes = new GLib.Bytes(entree);
	let byteArray = new Uint8Array(bytes.get_data());
	file.replace_contents(
		byteArray,
		null,   // No etag
		false,  // Don't make a backup
		Gio.FileCreateFlags.REPLACE_DESTINATION,
		null   // No cancellation object
	);
	print("complete.");
	return;
}

let play_sound = function(path_name) {
	//print("archives-status | " + file_exists(path_name));
	let uri = "file://" + path_name;
	//print("uri | " + uri);
	let pipeline = Gst.ElementFactory.make("playbin", "player");
	pipeline.set_property("uri", uri);
	let pr = pipeline.set_state(Gst.State.PLAYING);
	//print("pr | " + pr);
	let was_played = true;
	if(pr == 0) {
		was_played = false;
	}
	return was_played;
}

/*
let thresh = 7021;
let write_file_section = function(fn, write_type, entree, entree_site, naof_entree_secs) {
	let [success, pid, stdin, stdout, stderr] = GLib.spawn_sync(
		null, ["/home/tyrel/celix/caf", write_type, fn, entree.slice(entree_site, (entree_site + thresh))], null, GLib.SpawnFlags.SEARCH_PATH, null
	);
	print("naof-entree-secs | " + naof_entree_secs);
	print("entree-site | " + entree_site);
	entree_site += thresh;
	print("entree-site | " + entree_site);
	print("in thread watch.");
	GLib.spawn_close_pid(pid);
	if(entree_site < naof_entree_secs) {
		entree_site = write_file_section(fn, "append", entree, entree_site, naof_entree_secs);
	}
	return entree_site;
}
let write_to_file = function(fn, entree) {
	let naof_entree_secs = entree.length;
	let entree_site = 0;
	write_file_section(fn, "open", entree, entree_site, naof_entree_secs);
	return;
}
const bytes = new GLib.Bytes(entree);
let byteArray = new Uint8Array(bytes.get_data());
function write_to_file(path, content) {
	let file = Gio.File.new_for_path(path);
	let bytes = new GLib.Bytes(content);

	// Replace if exists, create if not
	file.replace_async(null, false, Gio.FileCreateFlags.NONE,
	GLib.PRIORITY_DEFAULT, null, (file, res) => {
		try {
			let stream = file.replace_finish(res);
			stream.write_bytes_async(bytes, GLib.PRIORITY_DEFAULT, null, (stream, res) => {
		try {
			stream.write_finish(res);
			stream.close(null);
			log('File written successfully');
		} catch (e) {
			logError(e, 'Error closing stream');
		}
		});
		} catch (e) {
			logError(e, 'Error writing file');
		}
	});
}
*/

/*
function listDirectory(path) {
	let directory = Gio.File.new_for_path(path);
	let enumerator = directory.enumerate_children("standard::name", Gio.FileQueryInfoFlags.NONE, null);
	const outputStream = directory.replace(null, false, Gio.FileCreateFlags.NONE, null);
	outputStream.close(null);
	let info;
	while (true) {
		info = enumerator.next_file(null);
		if(info == null) {
			break;
		}
		print(info.get_name());
		//log(info.get_name());
	}
}
let anew_jypsy_potentialages = function() {
	listDirectory("prints");
	//GLib.timeout_add(GLib.PRIORITY_DEFAULT, 0xaed, anew_jypsy_potentialages);
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 0xae, anew_jypsy_potentialages);
	return true;
}
anew_jypsy_potentialages();
*/

let lt = Date.now();
let nt = Date.now();
let print_space = "";
let aux_print_space = "";
let is_in_print = false;
let es_print_clerk = function() {
	nt = Date.now();
	//print("lt | " + lt);
	//print("nt | " + nt);
	let elapsed = nt - lt;
	//print("elapsed | " + elapsed);
	let print_space_site = print_space.length;
	if(elapsed > 775) {
		is_in_print = true;
		if(print_space_site > 0) {
			print("-------------------------------------------------------------------------------------------------------------");
			print("elapsed-bar | " + nt);
			print("-------------------------------------------------------------------------------------------------------------");
			print(print_space);
			print_space = "";
			let aux_print_space_site = aux_print_space.length;
			if(aux_print_space_site > 0) {
				print_space = aux_print_space;
				aux_print_space = "";
			}
		}
		lt = nt;
		is_in_print = false;
	}
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 0xae, es_print_clerk);
}
let es_print = function(fn, file) {
	//print("created | " + fn);
	//print("is-in-print | " + is_in_print);
	let p = read_file(fn);
	if(is_in_print) {
		aux_print_space += p;
	} else {
		print_space += p;
	}
	//print(print_space);
	/*
	let is_first = false;
	if(lt == 0) {
		lt = Date.now();
		is_first = true;
	}
	let elapsed = nt - lt;
	if(elapsed > 1000 || is_first) {
		if(is_first == false) {
			//print("");
		}
		//print("-------------------------------------------------------------------------------------------------------------");
		//print("elapsed-bar | " + nt);
		//print("-------------------------------------------------------------------------------------------------------------");
	}
	//print(p);
	*/
	file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
		source.delete_finish(result);
	});
	return;
}
/*
*/
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 0xae, es_print_clerk);
let es_system = function(fn, file, basen) {
	let command_entree = read_file(fn);
	let command_entree_site = command_entree.length;
	let et = command_entree_site - 1;
	let command = "";
	let comp = "";
	let params = []
	let mode = 1;
	let qsite = 0;
	let esite = 0;
	while(true) {
		let is_com = false;
		if(esite == et) {
			is_com = true;
		}
		let con = command_entree[esite];
		//print("con | " + con);
		//if(con == "\"") {
		//}
		if(mode == 0) {
			if(con == " ") {
				command = comp;
				comp = "";
				mode = 1;
			} else {
				comp += con;
			}
		} else if(mode == 1) {
			if(con == " " || is_com) {
				params.push(comp);
				comp = "";
			} else {
				comp += con;
			}
		}
		if(con == "\"") {
			qsite += 1;
		}
		esite += 1;
		if(esite == command_entree_site) {
			break;
		}
	}
	command = params;
	//print("command | " + command);
	//print("params  | " + params);
	let [success, pid, stdin, stdout, stderr] = GLib.spawn_async_with_pipes(
		null, command, null, GLib.SpawnFlags.SEARCH_PATH, null
	);
	let stdoutStream = new Gio.UnixInputStream({
		fd: stdout,
		close_fd: true
	});
	let dataInputStream = new Gio.DataInputStream({
		base_stream: stdoutStream
	});
	let result_name = "sysr/" + basen + ".sysr"
	let cresult = "";
	while(true) {
		let line = dataInputStream.read_line_utf8(null)[0];
		if(line == null) {
			break;
		}
		//print("line | " + line.toString());
		cresult += line;
		cresult += "\n";
	}
	let cresult_site = cresult.length;
	GLib.spawn_close_pid(pid);
	/*
	let line_site = 0;
	if(line_site > 0) {
		dataInputStream.read_line_async(0, null, (stream, result) => {
			let line = stream.read_line_finish(result);
			print("line | " + line.toString());
			//log(line.toString());
			cresult += line;
			GLib.spawn_close_pid(pid);
		});
	}
	*/
	print("result-name | " + result_name);
	if(cresult_site > 0) {
		write_to_file(result_name, cresult);
	}
	file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
		source.delete_finish(result);
	});
	//print("cresult | " + cresult);
	return;
}
let base0 = GLib.get_current_dir() + "/";
let es_convert = function(fn, file, basen) {
	let command_entree = read_file(fn);
	let command_entree_site = command_entree.length;
	let et = command_entree_site - 1;
	let command = "";
	let comp = "";
	let params = ["/home/tyrel/celix/convert"]
	let mode = 1;
	let qsite = 0;
	let esite = 0;
	while(true) {
		let is_com = false;
		if(esite == et) {
			is_com = true;
		}
		let con = command_entree[esite];
		//print("con | " + con);
		//if(con == "\"") {
		//}
		if(mode == 0) {
			if(con == " ") {
				command = comp;
				comp = "";
				mode = 1;
			} else {
				comp += con;
			}
		} else if(mode == 1) {
			if(con == " " || is_com) {
				params.push(comp);
				comp = "";
			} else {
				comp += con;
			}
		}
		if(con == "\"") {
			qsite += 1;
		}
		esite += 1;
		if(esite == command_entree_site) {
			break;
		}
	}
	let naof_params = params.length;
	let et_param = params[naof_params - 1];
	command = params;
	print("command | " + command);
	print("et-param | " + et_param);
	let result_name = "covr/" + basen + ".covr"
	print("result-name | " + result_name);
	//print("params  | " + params);
	let [success, pid, stdin, stdout, stderr] = GLib.spawn_async_with_pipes(
		null, command, null, GLib.SpawnFlags.SEARCH_PATH, null
	);
	let stdoutStream = new Gio.UnixInputStream({
		fd: stdout,
		close_fd: true
	});
	let dataInputStream = new Gio.DataInputStream({
		base_stream: stdoutStream
	});
	let cresult = "";
	while(true) {
		let line = dataInputStream.read_line_utf8(null)[0];
		if(line == null) {
			break;
		}
		print("line | " + line.toString());
		cresult += line;
		cresult += "\n";
	}
	let cresult_site = cresult.length;
	GLib.spawn_close_pid(pid);
	print(cresult);
	if(cresult_site > 0) {
		write_to_file(result_name, cresult);
	}
	/*
	*/
	/*
		<--> seems down 1 printing has modes and switches from the backer of things.
			<--> almost presidenting for some other things they say not of.
	*/
	/*
	let [success, pid, stdin, stdout, stderr] = GLib.spawn_async_with_pipes(
		null, ["/home/tyrel/celix/convert"], null, GLib.SpawnFlags.SEARCH_PATH, null
	);
	let gponder = cresult.indexOf("pcm_s16le")
	if(gponder == -1) {
		log("hmm, doesn't seem to involve the pcm-s16le chains.");
	} else {
		log("seems the pcm-s16le chains are engaged in this.");
	}
	*/
	/*
	*/
	let sfn = base0 + et_param;
	print("sfn | " + sfn);
	if(file_exists(sfn)) {
		print("a resulting sound file was found.");
		let pr = play_sound(sfn);
		if(pr) {
			write_to_file(result_name, "complete.\n");
		} else {
			write_to_file(result_name, "did not play.\n");
		}
	} else {
		write_to_file(result_name, "could not find.\n");
	}
	file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
		source.delete_finish(result);
	});
	//print("cresult | " + cresult);
	return;
}
let es_play = function(fn, file, basen) {
	let command_entree = read_file(fn);
	let command_entree_site = command_entree.length;
	let site = 0;
	while(true) {
		let con = command_entree[site];
		if(con == " ") {
			site += 1;
			break;
		}
		site += 1;
	}
	command_entree = command_entree.slice(site, command_entree_site);
	let result_name = "covr/" + basen + ".clkesg" // convertage|clerkessages
	print("result-name | " + result_name);
	let sfn = base0 + command_entree;
	let ef = file_exists(sfn);
	if(ef == false) {
		// <--> some times when a file existed.
		print("sfn | " + sfn);
		print("ef | " + ef);
		write_to_file(result_name, "could not find.\n");
		file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
			source.delete_finish(result);
		});
		return;
	}
	print("sfn | " + sfn);
	print("ef | " + ef);
	let pr = play_sound(sfn);
	print("pr | " + pr);
	if(pr) {
		write_to_file(result_name, "complete.\n");
	} else {
		// <--> ocured ago.
		write_to_file(result_name, "did not play.\n");
	}
	file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
		source.delete_finish(result);
	});
	return;
}
let [success0, pid0, stdin0, stdout0, stderr0] = GLib.spawn_async_with_pipes(
	null, ["/home/tyrel/celix/lstr", "covr/lstr.com", "prints/sstr.com"], null, GLib.SpawnFlags.SEARCH_PATH, null
);
print("lstr-success | " + success0);
let [success1, pid1, stdin1, stdout1, stderr1] = GLib.spawn_async_with_pipes(
	null, ["/home/tyrel/celix/dstr", "covr/dstr.com", "prints/dstr.com"], null, GLib.SpawnFlags.SEARCH_PATH, null
);
print("dstr-success | " + success1);
let es_seek = function(fn, file, basen, is_strstr) {
	let command_entree = read_file(fn);
	let command_entree_site = command_entree.length;
	let et = command_entree_site - 1;
	let command = "";
	let comp = "";
	let params = [];
	if(is_strstr) {
		params.push("/home/tyrel/celix/lstr");
	} else {
		params.push("/home/tyrel/celix/dstr");
	}
	let mode = 1;
	let qsite = 0;
	let esite = 0;
	while(true) {
		let is_com = false;
		if(esite == et) {
			is_com = true;
		}
		let con = command_entree[esite];
		//print("con | " + con);
		//if(con == "\"") {
		//}
		if(mode == 0) {
			if(con == " ") {
				command = comp;
				comp = "";
				mode = 1;
			} else {
				comp += con;
			}
		} else if(mode == 1) {
			if(con == " " || is_com) {
				params.push(comp);
				comp = "";
			} else {
				comp += con;
			}
		}
		if(con == "\"") {
			qsite += 1;
		}
		esite += 1;
		if(esite == command_entree_site) {
			break;
		}
	}
	let naof_params = params.length;
	let et_param = params[naof_params - 1];
	command = params;
	print("command | " + command);
	let con0 = "l";
	if(is_strstr == false) {
		con0 = "d";
	}
	let comfn = "covr/" + con0 + "str.com";
	print("comfn | " + comfn);
	let req_params = (params[1] + " " + params[2]);
	print("req-params | " + req_params);
	write_to_file(comfn, req_params);
	file.delete_async(GLib.PRIORITY_DEFAULT, null, function(source, result) {
		source.delete_finish(result);
	});
}

let directory = Gio.File.new_for_path("prints");
const fileMonitor = directory.monitor(Gio.FileMonitorFlags.WATCH_MOVES, null);
fileMonitor.connect('changed', (_fileMonitor, file, otherFile, eventType) => {
	let name = file.get_basename();
	//print("name | " + name);
	let name_site = name.length;
	//print("name-site | " + name_site);
	let extension = "";
	let extension_site = 0;
	let esite = name_site - 1;
	while(true) {
		//print("esite | " + esite);
		//print("name[esite] | " + name[esite]);
		if(name[esite] == ".") {
			esite += 1;
			break;
		}
		esite -= 1;
	}
	//print("esite | " + esite);
	extension_site = name_site - esite;
	extension = name.slice(esite, name_site);
	let basen = name.slice(0, (esite - 1));
	//print("basen | " + basen);
	//print("extension | " + extension);
	let fn = "prints/" + name;
	//print("event-type | " + eventType);
	//print("created-type | " + Gio.FileMonitorEvent.CREATED);
	if(eventType == 3) {
		print("name | " + name);
		print("extension | " + extension);
		if(extension == "print") {
			//print("is in print.");
			es_print(fn, file);
		}
		if(extension == "system") {
			print("is in system.");
			es_system(fn, file, basen);
		}
		if(extension == "convert") {
			print("is in convert.");
			es_convert(fn, file, basen);
		}
		if(extension == "play") {
			print("is in play.");
			es_play(fn, file, basen);
		}
		if(extension.slice(1, extension_site) == "seek") {
			print("is in seek.");
			let is_strstr = true;
			if(extension[0] == "d") {
				is_strstr = false;
			}
			es_seek(fn, file, basen, is_strstr);
		}
		//file.delete(null);
		//let [success, pid, stdin, stdout, stderr] = GLib.spawn_async_with_pipes(
			//null, ["/home/tyrel/ware/ul"], [fn], GLib.SpawnFlags.SEARCH_PATH, null
		//);
		//print("success | " + success);
	}
	lt = nt;
});
Gtk.main();
