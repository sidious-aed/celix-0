#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk, WebKit2} = imports.gi;
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;
const Gdk = imports.gi.Gdk;
let read_file = function(name) {
	if(name[0] != "/") {
		name = "/home/tyrel/celix/vshell/tsc/" + name;
	}
	let file = Gio.File.new_for_path(name);
	let [ok, contents] = file.load_contents(null);
	if(ok) {
		//return "";
		return ("" + contents);
	}
	return false;
}

let gsub = function(seek, replace, string) {
	let naof_seek_secs = seek.length;
	let naof_replace_secs = replace.length;
	let nstring = "";
	let naof_string_secs = string.length;
	let site = 0;
	while(true) {
		if(site == naof_string_secs) {
			break;
		}
		if(string.slice(site, (site + naof_seek_secs)) == seek) {
			nstring += replace;
			site += naof_seek_secs;
		} else {
			nstring += string[site];
			site += 1;
		}
	}
	return nstring;
}

let seek_string = function(seek, string) {
	let naof_seek_secs = seek.length;
	let naof_string_secs = string.length;
	let naof_seeks = naof_string_secs - naof_seek_secs + 1;
	if(naof_seeks <= 0) {
		return undefined;
	}
	let site = 0;
	while(true) {
		if(site == naof_seeks) {
			site = undefined;
			break;
		}
		let cmps = string.slice(site, (site + naof_seek_secs));
		if(cmps == seek) {
			break;
		}
		site += 1;
	}
	return site;
}

let regcom = function(string) {
	let nstring = "";
	let naof_string_secs = string.length;
	let site = 0;
	while(true) {
		if(site == naof_string_secs) {
			break;
		}
		let con = string[site];
		if(con == "\\") {
			site += 1;
			let ncon = string[site];
			if(ncon == "n") {
				nstring += "\n";
				site += 1;
			} else if(ncon == "t") {
				nstring += "\t";
				site += 1;
			} else {
				nstring += "\\";
			}
		} else {
			nstring += con;
			site += 1;
		}
	}
	return nstring;
}

let nzeta = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
let lzeta = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
let uzeta = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
let szeta = [" ", "\t", "\n", "\\", "/", "<", ">", ",", ".", "?", "!", ";", ":", "{", "}", "[", "]", "-", "_", "+", "=", "@", "#", "$", "%", "^", "&", "*", "(", ")", "`", "~"]
let szeta_secs = [32, 9, 10, 92, 47, 60, 62, 44, 46, 63, 33, 59, 58, 123, 125, 91, 93, 45, 95, 43, 61, 64, 35, 36, 37, 94, 38, 42, 40, 41, 96, 126]

let index = function(vecter, seek) {
	let naof_elements = vecter.length;
	let site = 0;
	while(true) {
		if(site == naof_elements) {
			break;
		}
		let element = vecter[site];
		if(element == seek) {
			return site;
		}
		site += 1;
	}
	return undefined;
}

/*
let string_to_secs = function(string) {
	const secse = new GLib.Bytes(string);
	let secs = new Uint8Array(secse.get_data());
	return secs;
}
*/
		/*
			<--> * soot child ... never ash ... always soot. - the malitia princess
		*/
/*
let string0 = "\"abc\nabc\n\"";
let seek_site = seek_string("\n", string0);
log("seek-site | " + seek_site);
string0 = "\"abc\"";
log("gsub | " + gsub("\"", "\\\"", string0));
*/

let string_to_secs = function(string) {
	let secs = [];
	let naof_secs = string.length;
	let site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		let sec = string[site]
		site += 1;
		let i = nzeta.indexOf(sec);
		if(i != -1) {
			secs.push(48 + i);
			continue;
		}
		i = lzeta.indexOf(sec);
		if(i != -1) {
			secs.push(97 + i)
			continue;
		}
		i = uzeta.indexOf(sec);
		if(i != -1) {
			secs.push(65 + i);
			continue;
		}
		i = szeta.indexOf(sec);
		if(i != -1) {
			secs.push(szeta_secs[i]);
			continue;
		}
	}
	return secs;
}

let type_staved_clerkesses = {
	init: function(naof_pad_entrees, window, webv) {
		let tsc = {
			init: function() {
				let display = Gdk.Display.get_default();
				this.clipboard = Gtk.Clipboard.get_default(display);
				this.clipboard.connect("owner-change", this.on_type_staved_update);
				this.clipboard.tsc = this;
				this.pad = [];
				this.com_pad_site = naof_pad_entrees;
				this.window = window;
				this.webv = webv;
				this.is_in_set = false;
			},
			set_clipboard_text: function(text) {
				this.is_in_set = true;
				this.clipboard.set_text(text, -1);
				this.clipboard.store();
				this.is_in_set = false;
			},
			get_clipboard_text: function() {
				return this.clipboard.wait_for_text();
			},
			on_type_staved_update: function(clipboard, event) {
				let tsc = clipboard.tsc
				//log("is-in-set | " + tsc.is_in_set);
				if(tsc.is_in_set) {
					return;
				}
				let new_entree = tsc.get_clipboard_text();
				let pad_site = tsc.pad.length;
				if(pad_site >= tsc.com_pad_site) {
					let naof_lets = pad_site - tsc.com_pad_site + 1;
					tsc.pad = tsc.pad.slice(naof_lets, pad_site)
				}
				log("new-entree | " + new_entree);
				if(new_entree == "") {
					return;
				}
				let is_new = true;
				let psite = pad_site - 1;
				while(true) {
					if(psite == pad_site) {
						break;
					}
					if(new_entree == tsc.pad[psite]) {
						is_new = false;
						break;
					}
					psite += 1;
				}
				if(is_new == false) {
					return;
				}
				tsc.pad.push(new_entree);
				log("tsc.pad | " + tsc.pad);
				pad_site = tsc.pad.length;
				//log("pad-site | " + pad_site);
				let sjs = "";
				sjs += "update_dom();";
				//log("sjs | " + sjs);
				webv.run_javascript(sjs, null, (view, result) => {});
				//webView.run_javascript("alert(simv);", null, (view, result) => {});
				//webView.run_javascript("alert(window.simv);", null, null);
				sjs = "tsc_pad = [];"
				if(pad_site > 0) {
					let pet = pad_site - 1;
					psite = pet;
					while(true) {
						sjs += "tsc0 = [];";
						//let at_string = gsub("\"", "\\\"", tsc.pad[psite]);
						//at_string = gsub("\\", "", tsc.pad[psite]);
						let at_string = string_to_secs(tsc.pad[psite]);
						log("at-string | " + string_to_secs(at_string));
						let naof_esecs = at_string.length;
						log("noaf-esecs | " + naof_esecs);
						let seek_site = 0;
						while(true) {
							//log("seek-site | " + seek_site);
							let str0 = at_string.slice(seek_site, (naof_esecs));
							log("str0 | " + str0);
							log("str0 | " + string_to_secs(str0));
							//let seek_site0 = seek_string("\n", str0);
							let seek_site0 = str0.indexOf(10);
							//log("seek-site0 | " + seek_site0);
							if(seek_site0 != -1) {
								let slstr = str0.slice(0, seek_site0);
								//log("slstr | " + slstr);
								sjs += "tsc_s0 = \"[" + slstr + "]\";";
								seek_site += (seek_site0 + 1);
								sjs += "tsc0.push(tsc_s0);"
							} else {
								//log("str0 | " + str0);
								sjs += "tsc_s0 = \"[" + str0 + "]\"" + ";"
								sjs += "tsc0.push(tsc_s0);"
								break;
							}
						}
						sjs += "tsc_pad.push(tsc0);"
						if(psite == 0) {
							break;
						}
						psite -= 1;
					}
				}
				sjs += "update_tsc_pad();"
				log("sjs | " + sjs);
				webv.run_javascript(sjs, null, (view, result) => {});
			}
			/*
			*/
		}
		tsc.init();
		return tsc;
	},
}

Gtk.init(null);
let provider = new Gtk.CssProvider();
provider.load_from_data(".generalp {background-color: #000000;}");
Gtk.StyleContext.add_provider_for_screen(
	Gdk.Screen.get_default(),
	provider,
	Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
);

let window = new Gtk.Window({title: "Type Staving CLerkess"});
window.get_style_context().add_class("generalp");
window.set_default_size(800, 600);
window.connect("destroy", Gtk.main_quit);

//let webView = new WebKit2.WebView();
let css = read_file("tsc.css");
let userStyleSheet = new WebKit2.UserStyleSheet(
    css,
    WebKit2.UserContentInjectedFrames.ALL_FRAMES,
    WebKit2.UserStyleLevel.USER,
    null,
    null
);

let js = read_file("jypsy.js");
js += read_file("tsc.js");
//log("js | " + js);
let js_manager = new WebKit2.UserContentManager();
js_manager.add_script(new WebKit2.UserScript(js, WebKit2.UserContentInjectedFrames.ALL_FRAMES, WebKit2.UserScriptInjectionTime.END, null, null));
let webView = WebKit2.WebView.new_with_user_content_manager(js_manager);
//GLib.timeout_add(GLib.PRIORITY_DEFAULT, 511, function() {
	//webView.run_javascript("alert(filter_nodes);", null, null);
//});

let manager = webView.get_user_content_manager();
manager.add_style_sheet(userStyleSheet);
window.add(webView);
let html = read_file("tsc.html");
webView.load_html(html, null);
let tsc = type_staved_clerkesses.init(11, window, webView);

let get_text_attribute = function(html, name) {
	if((html == undefined) || (html == " ")) {
		return undefined;
	}
	//alert("html | " + html);
	let mode = 0;
	let symbol = "";
	let site = 0;
	while(true) {
		let add_to_symbol = true;
		let sec = html[site];
		//alert("site | " + site);
		//alert("sec | " + sec);
		if(sec == undefined) {
			return undefined;
		}
		if(sec == "<") {
			symbol = "";
			add_to_symbol = false;
		}
		if(sec == " ") {
			//alert("symbol-at-space | " + symbol);
			add_to_symbol = false;
			if(name == "node-type") {
				return symbol;
			}
			symbol = "";
		}
		if(sec == "=") {
			//alert("symbol | " + symbol);
			add_to_symbol = false;
			if(symbol == name) {
				mode = 1;
				symbol = "";
				site += 1;
			}
		}
		if(sec == "\"") {
			if(mode == 0) {
				symbol = "";
			} else {
				add_to_symbol = false;
			}
		}
		if(sec == ">") {
			if(name == "node-type") {
				return symbol;
			}
			return undefined;
		}
		if(add_to_symbol) {
			symbol += sec;
		} else if(mode == 1) {
			mode = 2;
		} else if(mode == 2) {
			return symbol;
		}
		site += 1;
	}
}

let read_com = function(html, attributes) {
	let naof_secs = html.length;
	//log("naof-secs | " + naof_secs);
	let naof_attrs = attributes.length;
	let mode = 0;
	let comh = "";
	let site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		let sec = html[site];
		//log("sec | " + sec);
		if(mode == 0) {
			if(sec == "<") {
				let is_in = true;
				let asite = 0;
				while(true) {
					if(asite == naof_attrs) {
						break;
					}
					let cattr = attributes[asite];
					if(cattr.value != get_text_attribute(html.slice(site, naof_secs), cattr.name)) {
						is_in = false;
						break;
					}
					asite += 1;
				}
				if(is_in) {
					mode = 1;
				}
			}
		} else if(mode == 1) {
			if(sec == ">") {
				mode = 2;
			}
		} else if(mode == 2) {
			if(sec == "<") {
				break;
			} else {
				comh += sec;
			}
		}
		site += 1;
	}
	return comh;
}

let click_com_html = ""
let click_com = function() {
	webView.run_javascript('document.documentElement.outerHTML;', null, (view, result) => {
		let jsResult = view.run_javascript_finish(result);
		let jsValue = jsResult.get_js_value();
		click_com_html = jsValue.to_string();
	});
	/*
	*/
	//log("click-com-html | " + click_com_html);
	let click_comh = read_com(click_com_html, [{name: "id", value: "clerk-com"}]);
	//log("click-comh | " + click_comh);
	if(click_comh != "") {
		//log("click-comh | " + click_comh);
		let pad_id = parseInt(click_comh);
		let pe = tsc.pad[pad_id];
		//log("pe | " + pe);
		tsc.set_clipboard_text(tsc.pad[pad_id]);
		webView.run_javascript("reset_click_com();", null, (view, result) => {});
	}
	GLib.timeout_add(GLib.PRIORITY_DEFAULT, 111, click_com);
	/*
	*/
}
GLib.timeout_add(GLib.PRIORITY_DEFAULT, 111, click_com);

window.connect("key-press-event", (widget, event) => {
    let [, keyval] = event.get_keyval();
    if (keyval == Gdk.KEY_Escape) {
        log("thank you for engaging my type-\"staving\".");
        window.close();
        return true;
    }
    return false;
});
window.show_all();
Gtk.main();
