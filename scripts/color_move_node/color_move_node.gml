// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function color_move_node(node, move, actions){
	if (actions > 1) {
		if (node.G > move) {
			node.color = c_yellow;	
		} else {
			node.color = c_aqua;
		}
	} else {
		node.color = c_yellow;	
	}
}