#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk, WebKit2} = imports.gi;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gdk = imports.gi.Gdk;
imports.searchPath.push(".");
const clerk = imports.clerk;
let read_file = function(name) {
	let file = Gio.File.new_for_path(name);
	let [ok, contents] = file.load_contents(null);
	if(ok) {
		//return "";
		return ("" + contents);
	}
	return false;
}
Gtk.init(null);
let provider = new Gtk.CssProvider();
provider.load_from_data(".generalp {background-color: #000000;}");
Gtk.StyleContext.add_provider_for_screen(
	Gdk.Screen.get_default(),
	provider,
	Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
);

let window = new Gtk.Window({title: "I Sim."});
window.get_style_context().add_class("generalp");
window.set_default_size(800, 600);
window.connect("destroy", Gtk.main_quit);

let webView = new WebKit2.WebView();
let css = read_file("view-0.css");
let userStyleSheet = new WebKit2.UserStyleSheet(
    css,
    WebKit2.UserContentInjectedFrames.ALL_FRAMES,
    WebKit2.UserStyleLevel.USER,
    null,
    null
);
let manager = webView.get_user_content_manager();
manager.add_style_sheet(userStyleSheet);
window.add(webView);

let for_a_jypsy_pause_time = function() {
	let [success, pid, stdin, stdout, stderr] = GLib.spawn_async_with_pipes(
		null, ["/home/tyrel/celix/vshell/view-0/gt"], null, GLib.SpawnFlags.SEARCH_PATH, null
	);
	GLib.close(stdin); 
	GLib.close(stdout);
	GLib.close(stderr);
	GLib.child_watch_add(GLib.PRIORITY_DEFAULT, pid, (pid, status) => {
		GLib.spawn_close_pid(pid);
	});
	let html = read_file("gt.html");
	webView.load_html(html, null);
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, for_a_jypsy_pause_time);
}
for_a_jypsy_pause_time();

window.connect("key-press-event", (widget, event) => {
    let [, keyval] = event.get_keyval();
    if (keyval == Gdk.KEY_Escape) {
        log("weary ... and [(mint)|(meant)] warm maybe even.");
        window.close();
        return true; // Event handled
    }
    //log(`Key pressed: ${keyval}`);
    return false; // Propagate event
});
window.show_all();
Gtk.main();
