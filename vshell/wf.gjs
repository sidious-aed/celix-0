#!/usr/bin/env gjs
imports.gi.versions.Gtk = "3.0";
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;

// 1. Create a file object for the target path
const file = Gio.File.new_for_path('gjs0.i-sim');

// 2. Convert your string to a GLib.Bytes object
const contentString = "Hello, GNOME Shell!";
const bytes = new GLib.Bytes(contentString);
let byteArray = new Uint8Array(bytes.get_data());

// 3. Write the file asynchronously (Best practice for extensions)
file.replace_contents(
    byteArray,
    null,   // No etag
    false,  // Don't make a backup
    Gio.FileCreateFlags.REPLACE_DESTINATION,
    null   // No cancellation object
);

