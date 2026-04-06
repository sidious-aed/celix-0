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
let css = read_file("view-f.css");
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
let html = read_file("view-f.html");
webView.load_html(html, null);

let js = read_file("libs.js");
js += read_file("0.js");
//js += read_file("1.js");
log("js | " + js);
let sjs = function() {
	webView.run_javascript(js, null, (view, result) => {
		log("in trys shell.");
		log("view | " + view);
		log("result | " + result);
	});
}
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 327, sjs);

webView.connect('button-press-event', (widget, event) => {
	let [isOver, x, y] = event.get_coords();
	let button = event.get_button();
	log("click-registers | " + x + " " + y + "with button " + button + " with " + event);
	return false;
});

/*
let js = read_file("view-f.js");

let seek_dom = function() {
	webView.run_javascript(js, null, (view, result) => {
		let jsResult = view.run_javascript_finish(result);
		let value = jsResult.get_js_value();
		//log("" + Object.keys(jsResult));
		log("input-0 | " + value.to_string());
	});
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, seek_dom);
}
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 327, seek_dom);
*/

/*
let read_input = function() {
	webView.run_javascript("document.getElementById(\"input-0\").value;", null, (view, result) => {
		let jsResult = view.run_javascript_finish(result);
		let value = jsResult.get_js_value();
		//log("" + Object.keys(jsResult));
		log("input-0 | " + value.to_string());
	});
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, read_input);
}
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 127, read_input);
*/

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
