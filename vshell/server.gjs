#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const {Gtk} = imports.gi;
const Gio = imports.gi.Gio;
const Gst = imports.gi.Gst;
const GLib = imports.gi.GLib;
const Soup = imports.gi.Soup;
Gst.init(null);

let server = new Soup.Server();
server.add_handler("/et", (server, msg, path, query) => {
    msg.set_status(200);
    msg.set_response("text/plain", Soup.MemoryUse.COPY, "talkei talkei. airgo vah nah goo trim brader. est time is " + Date.now() + ".");
});
server.listen_all(2797, Soup.ServerListenOptions.IPV4_ONLY);
//server.listen_all(8080, Soup.ServerListenOptions.HTTPS);
Gtk.main();
