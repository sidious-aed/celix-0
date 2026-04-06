let simv = function(vec) {
	let newv = [];
	let naof_elements = vec.length;
	let site = 0;
	while(true) {
		if(site == naof_elements) {
			break;
		}
		newv.push(vec[site]);
		site += 1;
	}
	return newv;
}

let all_nodes = function() {
	let code_a = 0xffffffffffffffff;
	let nodes = [];
	let node_site = 0;
	let que = [];
	let que_pids = [];
	while(true) {
		//alert("que | " + que);
		let node = document;
		let at = que[0];
		if(node_site == 0) {
			at = [];
		} else if(at == undefined) {
			break;
		}
		let pid = que_pids[0];
		if(pid == undefined) {
			pid = code_a;
		}
		//alert("at | " + at);
		let naof_ins = at.length;
		//alert("naof-ins | " + naof_ins);
		let nsite = 0;
		while(true) {
			if(nsite == naof_ins) {
				break;
			}
			node = node.childNodes[at[nsite]];
			nsite += 1;
		}
		//alert("node | " + node);
		nodes.push([pid, node]);
		let naof_nodes = node.childNodes.length;
		//alert("naof-nodes | " + naof_nodes);
		let n2site = 0;
		while(true) {
			if(n2site == naof_nodes) {
				break;
			}
			let new_daur = simv(at);
			new_daur.push(n2site);
			//alert("new-daur | " + new_daur);
			que.push(new_daur);
			que_pids.push(node_site);
			n2site += 1;
		}
		let naof_ats = que.length
		que = que.slice(1, naof_ats);
		que_pids = que_pids.slice(1, naof_ats);
		node_site += 1;
	}
	return nodes;
}

let simnodes = function(nodes) {
	let naof_nodes = nodes.length;
	let snodes = [];
	let site = 0;
	while(true) {
		if(site == naof_nodes) {
			break;
		}
		let node = nodes[site];
		snodes.push(node[1]);
		site += 1;
	}
	return snodes;
}

let get_attribute = function(element, name) {
	let html = element.outerHTML;
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

let filter_nodes = function(nodes, attributes) {
	let fnodes = [];
	//alert("attributes | " + attributes);
	let naof_attributes = attributes.length;
	//alert("naof-attribute | " + naof_attributes);
	let naof_nodes = nodes.length;
	let site = 0;
	while(true) {
		if(site == naof_nodes) {
			break;
		}
		let element = nodes[site];
		//alert("element | " + element);
		let is_in_scope = true;
		let asite = 0;
		while(true) {
			if(asite == naof_attributes) {
				break;
			}
			let attribute = attributes[asite];
			//alert("attribute | " + attribute);
			let value = get_attribute(element, attribute.name);
			if(value != attribute.value) {
				is_in_scope = false;
				break;
			}
			asite += 1;
		}
		if(is_in_scope) {
			fnodes.push(element);
		}
		site += 1;
	}
	/*
	*/
	return fnodes;
}

/*
let x0 = 0xaed;
let see_x0 = function() {
	alert("x0 | " + x0);
}
*/
