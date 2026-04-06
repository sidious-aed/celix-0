//alert("i sim.");
//alert(Object.keys(window.console));
window.console.debug("i sim.");
let nodes = document.childNodes[1].childNodes[2].childNodes[1].childNodes;
//element.style.color = "red";
let naof_nodes = nodes.length;
alert("naof-nodes | " + naof_nodes);
let nsite = 0;
while(true) {
	if(nsite == naof_nodes) {
		break;
	}
	let node = nodes[nsite];
	alert("node | " + node);
	nsite += 1;
}
let element = document.childNodes[1].childNodes[2].childNodes[1];
//element.style.color = "red";
element.innerText = "i sim.";
//alert("element | " + element);

//alert("i sim.");
//alert(Object.keys(window.console));
window.console.debug("i sim.");
let nodes = document.childNodes[1].childNodes[2].childNodes[1].childNodes;
//element.style.color = "red";
let naof_nodes = nodes.length;
//alert("naof-nodes | " + naof_nodes);
let nsite = 0;
while(true) {
	if(nsite == naof_nodes) {
		break;
	}
	let node = nodes[nsite];
	//alert("node | " + node);
	nsite += 1;
}
let element = document.childNodes[1].childNodes[2].childNodes[1];
element.style.color = "red";
//alert("element | " + element);
