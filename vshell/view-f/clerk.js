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
		let i = index(nzeta, sec);
		if(i != undefined) {
			secs.push(48 + i);
			continue;
		}
		i = index(lzeta, sec);
		if(i != undefined) {
			secs.push(97 + i)
			continue;
		}
		i = index(uzeta, sec);
		if(i != undefined) {
			secs.push(65 + i);
			continue;
		}
		i = index(szeta, sec);
		if(i != undefined) {
			secs.push(szeta_secs[i]);
			continue;
		}
		/*
		*/
	}
	return secs;
}

let secs_to_string = function(secs) {
	let string = "";
	let naof_secs = secs.length;
	let site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		let sec = secs[site]
		site += 1;
		if((sec >= 48) && (sec <= 57)) {
			string += nzeta[(sec - 48)];
			continue;
		}
		if((sec >= 97) && (sec <= 122)) {
			string += lzeta[(sec - 97)];
			continue;
		}
		if((sec >= 65) && (sec <= 90)) {
			string += uzeta[(sec - 65)];
			continue;
		}
		let i = index(szeta_secs, sec);
		if(i != undefined) {
			string += szeta[i];
		}
	}
	return string;
}

let vecter_compair = function(v1, v2) {
	let naof_v1_secs = v1.length;
	let naof_v2_secs = v2.length;
	if(naof_v1_secs != naof_v2_secs) {
		return false;
	}
	let site = 0;
	while(true) {
		if(site == naof_v1_secs) {
			break;
		}
		let s1 = v1[site];
		let s2 = v2[site];
		if(s1 != s2) {
			return false;
		}
		site += 1;
	}
	return true;
}

let simple_sig = function(entree) {
	let secs = string_to_secs(entree);
	let naof_secs = secs.length;
	let checksum = 0;
	let seed = [20, 129, 74, 137, 174, 235, 21, 233, 166, 167, 106, 178, 227, 2, 18, 138, 183, 51, 165, 230, 151, 227, 194, 91, 237, 128, 204, 123, 204, 138, 199, 142, 214, 47, 174, 124, 154, 93, 71, 41, 92, 8, 123, 240, 69, 73, 54, 168, 91, 34, 255, 246, 28, 139, 68, 36, 145, 141, 57, 201, 138, 15, 207, 76, 229, 233, 144, 209, 118, 57, 75, 202, 173, 55, 44, 19, 149, 130, 43, 3, 144, 22, 238, 101, 104, 57, 63, 249, 213, 58, 125, 48, 251, 127, 50, 19, 176, 28, 83, 249, 13, 140, 216, 110, 162, 175, 135, 27, 95, 45, 22, 21, 152, 160, 79, 118, 191, 103, 233, 200, 151, 244, 186, 10, 17, 14, 56, 153, 80, 30, 122, 80, 92, 176, 147, 199, 216, 239, 93, 175, 179, 135, 10, 130, 127, 213, 149, 162, 186, 41, 70, 89, 113, 92, 179, 141, 188, 173, 63, 187, 183, 46, 164, 68, 117, 42, 93, 183, 229, 64, 207, 129, 174, 113, 42, 218, 224, 61, 17, 153, 182, 39, 181, 168, 94, 246, 34, 207, 142, 86, 114, 220, 43, 6, 103, 215, 51, 12, 5, 21, 73, 48, 9, 2, 254, 101, 142, 71, 217, 130, 39, 240, 132, 85, 141, 151, 185, 32, 122, 55, 155, 106, 47, 132, 63, 64, 38, 216, 174, 137, 225, 158, 102, 148, 169, 125, 145, 204, 223, 38, 72, 65, 173, 50, 60, 52, 40, 50, 214, 206, 229, 213, 68, 218, 6, 56];
	let naof_seed_secs = seed.length; // 256
	let site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		let sec = secs[site];
		checksum += sec;
		site += 1;
	}
	let base = [30, 236, 94, 229, 226, 26, 181, 227, 58, 205, 234, 93, 59, 73, 191, 97, 140, 28, 127, 20, 8, 199, 125, 244, 35, 125, 93, 102, 104, 72, 23, 9, 221];
	let naof_base_secs = base.length; // 33
	site = 0;
	while(true) {
		if(site == naof_base_secs) {
			break;
		}
		let sec = base[site];
		base[site] = (sec + checksum) % 256;
		site += 1;
	}
	site = 0;
	while(true) {
		if(site == naof_secs) {
			break;
		}
		let sec = secs[site];
		let base_site = (site) % naof_base_secs;
		let seed_site = (site + checksum) % naof_seed_secs;
		let seed_elm = seed[seed_site];
		let elm = ((sec ^ site ^ checksum ^ seed_elm) % 256);
		base[base_site] = elm;
		checksum += elm;
		checksum %= 256;
		site += 1;
	}
	return base;
}
