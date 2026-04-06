#!/usr/bin/env gjs
const Gio = imports.gi.Gio;
const GLib = imports.gi.GLib;

function saveStringToFile(text, filename) {
    // 1. Define file path (e.g., in user config dir)
    let file = Gio.File.new_for_path(GLib.get_home_dir() + '/' + filename);

    // 2. Convert string to byte array
    let contents = new TextEncoder().encode(text);

    // 3. Save atomically (async)
    file.replace_contents_async(
        contents,
        null, // etag
        false, // make_backup
        Gio.FileCreateFlags.NONE,
        null, // cancellable
        (file, res) => {
            try {
                file.replace_contents_finish(res);
                log('File saved successfully');
            } catch (e) {
                logError(e, 'Error saving file');
            }
        }
    );
}

// Usage
saveStringToFile("Hello World", ".my_output_file.txt");

