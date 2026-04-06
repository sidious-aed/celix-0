#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk, WebKit2} = imports.gi;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gdk = imports.gi.Gdk;

let read_file = function(name) {
	let file = Gio.File.new_for_path(name);
	let [ok, contents] = file.load_contents(null);
	if(ok) {
		//return "";
		return ("" + contents);
	}
	return false;
}

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

let directory = Gio.File.new_for_path("prints");
const fileMonitor = directory.monitor(Gio.FileMonitorFlags.WATCH_MOVES, null);
fileMonitor.connect('changed', (_fileMonitor, file, otherFile, eventType) => {
    switch (eventType) {
    case Gio.FileMonitorEvent.CHANGED:
				print("changed | " + file.get_basename());
        break;

    case Gio.FileMonitorEvent.DELETED:
				print("deleted | " + file.get_basename());
        break;

    case Gio.FileMonitorEvent.CREATED:
				print("created | " + file.get_basename());
        break;

    case Gio.FileMonitorEvent.MOVED_IN:
				print("moved-in | " + file.get_basename());
        break;

    case Gio.FileMonitorEvent.MOVED_OUT:
				print("moved-in | " + file.get_basename());
        break;
    }
});

Gtk.main();
