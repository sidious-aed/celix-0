#!/usr/bin/env gjs
imports.gi.versions.Gtk = '3.0';
const Gtk = imports.gi.Gtk;
const Gdk = imports.gi.Gdk;
const GLib = imports.gi.GLib;
const kmod_sr = imports.byteArray;
const node_name = "/home/tyrel/gjs/tsc/"
//const {Gdk Gtk} = imports.gi;

Gtk.init(null);
// Initialize GTK (required)
const builder = new Gtk.Builder();
builder.add_from_file(node_name + "tsc.ui");
let cssc = new Gtk.CssProvider();
cssc.load_from_path(node_name + "tsc.css");
const win = builder.get_object("main");
sc = win.get_style_context();
sc.add_class("main")
sc.add_provider(cssc, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
const list = builder.get_object("list");
sc = list.get_style_context();
sc.add_class("list")
sc.add_provider(cssc, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
let type_staved_clerkesses = {
	init: function(naof_pad_entrees, win, list) {
		let tsc = {
			init: function() {
				//let screen = Gdk.Screen.get_default();
				//log("screen | " + screen);
				let display = Gdk.Display.get_default();
				//log("display | " + display);
				this.clipboard = Gtk.Clipboard.get_default(display);
				//log("clipboard | " + this.clipboard);
				this.is_update_mode = true;
				this.clipboard.connect("owner-change", this.on_type_staved_update);
				this.clipboard.tsc = this;
				this.pad = [];
				this.com_pad_site = naof_pad_entrees;
				this.win = win;
				this.list = list;
				/*
				let buffer = new Gtk.TextBuffer();
				this.colors = {
				}
				*/
				// <--> everything is vast vast. many isatoaps.
				this.current = 0xaed;
				//log("Object.keys(this) | " + Object.keys(this));
			},
			vantage_bracin_666: function(entree) {
				let entree_secs = kmod_sr.fromString(entree);
				let naof_entree_secs = entree_secs.length;
				let hash_666 = (this.current^0xaedaed);
				let et = naof_entree_secs - 1;
				let inversios = [];
				let esite = et;
				while(true) {
					let sec = entree_secs[esite];
					let rough = ((sec)|(sec<<8)|(sec<<0x16)|(sec<<0x24)|(sec<<32)|(sec<<40)|(sec<<48)|(sec<<56))
					hash_666 = (hash_666^rough^esite^(esite*naof_entree_secs));
					inversios.push(sec);
					esite -= 1;
					if(esite == 0) {
						break;
					}
				}
				this.current = hash_666;
				return [inversios, hash_666]
			},
			set_clipboard_text: function(text) {
					this.clipboard.set_text(text, -1);
					this.clipboard.store();
			},
			get_clipboard_text: function() {
				return this.clipboard.wait_for_text();
			},
			on_type_staved_update: function(clipboard, event) {
				let tsc = clipboard.tsc
				//log("tsc.is_update_mode | " + tsc.is_update_mode);
				if(tsc.is_update_mode == false) {
					return;
				}
				//log("event | " + event);
				//log("Object.keys(this) | " + Object.keys(this));
				//let new_entree = clipboard.wait_for_text();
				let new_entree = tsc.get_clipboard_text();
				log("new-entree | " + new_entree);
				let pad_site = tsc.pad.length;
				//log("pad-site | " + pad_site);
				//log("com-pad-site | " + tsc.com_pad_site);
				if(pad_site >= tsc.com_pad_site) {
					let naof_lets = pad_site - tsc.com_pad_site + 1;
					//log("noaf-lets | " + naof_lets);
					tsc.pad = tsc.pad.slice(naof_lets, pad_site)
				}
				if(new_entree == "") {
					return;
				}
				tsc.pad.push(new_entree);
				//log("pad | " + tsc.pad);
				let types = tsc.list.get_children();
				let naof_types = types.length;
				let tsite = 0;
				while(true) {
					if(tsite == naof_types) {
						break;
					}
					let type = types[tsite];
					// destroy us ... you did not destroy us.
					// destroy is in regards to through the ais and who in the nower is cutting the other down.
					// the creedists leviest are crackin onto at their most over not destroy of others.
					// in prose of could we for bolder nominclature seize.
					log("they all speak the same aon aouts | " + type.arg);
					type.destroy();
					tsite += 1;
				}

				naof_types = tsc.pad.length;
				let et = naof_types - 1;
				tsite = et;
				while(true) {
					let entree = tsc.pad[tsite]
					let type = new Gtk.TextView();
					let buffer = type.get_buffer();
					//let iter = buffer.get_start_iter();
					log("type | " + type);
					log("type-keys | " + Object.keys(type));
					buffer.set_text("" + (et - tsite) + ". " + entree.slice(0, 111), -1);
					//let tag = new Gtk.TextTag({
						//foreground: "green"
					//});
					//buffer.get_tag_table().add(tag);
					//let start = buffer.get_start_iter();
					//let end = buffer.get_start_iter();
					//buffer.apply_tag(tag, start, end);
					type.set_editable(false);
					type.set_cursor_visible(false);
					type.set_accepts_tab(false); 
					type.set_size_request(500, 21);
					type.tsite = tsite;
					//sc = type.get_style_context();
					log("sc | " + sc);
					log("sc-keys | " + Object.keys(sc));
					//sc.add_class("type")
					//sc.add_provider(cssc, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
					type.arg = 0xaed;
					type.now_site = tsite; // as in then-nao
					type.add_events(Gdk.EventMask.BUTTON_PRESS_MASK);
					type.connect("button-press-event", (tv, event) => {
						log("event | " + event);
						tsc.is_update_mode = false;
						//let selected_entree = tv.get_buffer().text;
						let selected_entree = tsc.pad[tv.tsite];
						log("clerkess is setting your then pad to | " + selected_entree);
						tsc.set_clipboard_text(selected_entree);
						tsc.is_update_mode = true;
						[inversios,hash] = tsc.vantage_bracin_666(selected_entree);
						log("inversios | " + inversios);
						log("hash | " + hash);
						log("opacity-from-vantage | " + tsc.current%256);
						let mix = (tsc.current * tsc.current) / (tsc.current * tsc.current * tsc.current);
						log("mix | " + mix);
						while(true) {
							let next_mix = mix * 2;
							log("next-mix | " + next_mix);
							if((next_mix) > 1) {
								break;
							}
							if((mix) >= 0.2) {
								if(mix >= 0.5) {
									mix *= 10;
								} else {
									mix *= 2;
								}
							}
							mix = next_mix;
						}
						log("mix | " + mix);
						// engage-mix-to-insane-opacity-slight-law
						//tsc.win.set_opacity(mix);
					})
					sc = type.get_style_context();
					sc.add_class("type-staved")
					let cssp = new Gtk.CssProvider();
					//cssp.load_from_data(".type { background-color: rgba(0, 0, 0, 255); color: rgba(0, 220, 0, 255); }");
					sc.add_provider(cssc, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
					tsc.list.add(type);
					if(tsite == 0) {
						break;
					}
					tsite -= 1;
				}
				tsc.win.show_all();
			}
			/*
			*/
		}
		tsc.init();
		return tsc;
	},
}

// key response
win.connect("key-press-event", (widget, event) => {
    // Get key value
    let [, keyval] = event.get_keyval();

    // Check for specific key (e.g., Escape)
    if (keyval == Gdk.KEY_Escape) {
        log("weary ... and [(mint)|(meant)] warm maybe even.");
        win.close();
        return true; // Event handled
    }

    log(`Key pressed: ${keyval}`);
    return false; // Propagate event
});
win.connect('configure-event', (widget, event) => {
	let [width, height] = widget.get_size();
	//print("configure-event-(resize) | [" + width + ", ", height + "]");
	return false;
});
/*
let site = 0;
while(true) {
	if(site == 111) {
		break;
	}
	log("site | " + site);
	let text_view = new Gtk.TextView();
	text_view.get_buffer().set_text("Talkei talkie. Airgo vah nah goo trim brader.", -1);
	text_view.set_editable(false);
	text_view.set_cursor_visible(false);
	text_view.set_accepts_tab(false); 
	text_view.set_size_request(500, 21);
	list.add(text_view);
	sc = text_view.get_style_context();
	sc.add_class("type")
	sc.add_provider(cssc, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
	site += 1
}
*/
//let tsc = type_staved_clerkesses.init(3, win, list);
let tsc = type_staved_clerkesses.init(21, win, list);
//tsc.set_clipboard_text("I sim.");
log("tsc | " + tsc);
win.connect("destroy", function() {
	log("cancell is much in trends.");
	Gtk.main_quit();
});
win.show_all();
Gtk.main();
/*
*/
