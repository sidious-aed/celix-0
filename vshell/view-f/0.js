//let x = 0xaed;
alert("i sim.");
let a = [1, 2, 3, 4];
let b = simv(a);
a[2] = 7;
alert(b);
let nodes = all_nodes();
let naof_nodes = nodes.length;
alert("naof-nodes | " + naof_nodes);
let snodes = simnodes(nodes);
let naof_snodes = snodes.length;
let para_nodes = filter_nodes(snodes, [{"name": "node-type", "value": "p"}]);
alert("naof-snodes | " + naof_snodes);
let naof_para_nodes = para_nodes.length
alert("naof-para-nodes | " + naof_para_nodes);
para_nodes[0].onclick = function() {
	alert("i sim.");
}
alert("para-0 | " + para_nodes[0]);
let fnode = filter_nodes(snodes, [{"name": "node-type", "value": "input"}])[0];
let ffeild = ""
fnode.onchange = function() {
	ffeild = this.value;
}
fnode.onblur = function() {
	alert("ffeild | " + ffeild);
}
//x0 = 0xaedaed;
//see_x0();
/*
let nsite = 0;
while(true) {
	if(nsite == naof_para_nodes) {
		break;
	}
	let node = para_nodes[nsite];
	//alert("node | " + node);
	alert("hype | " + node.outerHTML);
	//alert("node-type | " + get_attribute(node[1], "node-type"));
	//alert("id | " + get_attribute(node[1], "id"));
	nsite += 1;
}
*/
