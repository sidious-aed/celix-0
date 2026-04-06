//alert("i sim.");
window.nodes = [];
window.naof_nodes = 0;
window.tsc_pad = [];
window.tsc0 = [];
window.tsc_s0 = "";
window.update_dom = function() {
	nodes = simnodes(all_nodes());
	naof_nodes = nodes.length;
	//alert("naof-nodes | " + naof_nodes);Gjs-Message
}
window.update_tsc_pad = function() {
	//alert("i sim.");
	//alert("tsc-pad | " + tsc_pad);
	let tsc_node = filter_nodes(nodes, [{name: "id", value: "tsc-0shell"}])[0];
	//alert("tsc-node | " + tsc_node);
	let paras_html = ""
	let naof_types = tsc_pad.length;
	//alert("naof-types | " + naof_types);
	let et_id = naof_types - 1;
	let psite = 0;
	while(true) {
		if(psite == naof_types) {
			break;
		}
		//alert("psite | " + psite);
		let para = "<div class=\"tsc-type\" id=\"type-" + (et_id - psite) + "\">"
		let pad = tsc_pad[psite];
		//alert("pad | " + pad);
		let naof_elements = pad.length;
		let esite = 0;
		while(true) {
			if(esite == naof_elements) {
				break;
			}
			para += "<div class=\"para\">"
			if(esite == 0) {
				para += psite;
				para += " | ";
			}
			let parae = secs_entree_to_secs(pad[esite]);
			parae = secs_to_string(parae);
			//alert("parae | " + parae);
			para += parae;
			para += "</div>"
			esite += 1;
		}
		para += "</div>";
		//alert("para | " + para);
		paras_html += para;
		//alert("para-html | " + para_html);
		psite += 1;
	}
	//alert("para-html | " + paras_html);
	tsc_node.innerHTML = paras_html;
	//alert("i sim.");
	update_dom();
	let type_nodes = filter_nodes(nodes, [{name: "class", value: "tsc-type"}]);
	let naof_type_nodes = type_nodes.length;
	//alert("naof-type-nodes | " + naof_type_nodes);
	let tsite = 0;
	while(true) {
		if(tsite == naof_type_nodes) {
			break;
		}
		let typen = type_nodes[tsite];
		//alert("typen | " + typen);
		typen.onclick = function() {
			//alert("i sim.");
			//alert("clicked | " + this.innerHTML);
			let id = get_attribute(this, "id");
			let naof_id_secs = id.length;
			let hyph_site = 0;
			while(true) {
				let con = id[hyph_site];
				hyph_site += 1;
				if(con == "-") {
					break;
				}
			}
			id = parseInt(id.slice(hyph_site, naof_id_secs));
			//alert("id | " + id);
			let click_com = filter_nodes(nodes, [{name: "id", value: "clerk-com"}])[0];
			click_com.innerText = "" + id;
		}
		tsite += 1;
	}
}
window.reset_click_com = function() {
	let click_com = filter_nodes(nodes, [{name: "id", value: "clerk-com"}])[0];
	click_com.innerHTML = "";
}
window.update_dom();
