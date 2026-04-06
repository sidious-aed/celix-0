import GLib from 'gi://GLib';
import Gio from 'gi://Gio';

function writeToFile(path, content) {
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

// Example Usage
writeToFile('/home/user/test.txt', 'Hello GNOME Shell!');
