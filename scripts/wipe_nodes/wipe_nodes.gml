// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wipe_nodes(){
	with (oMapNode) {
		moveNode = false;
		G = 0;
		parent = noone;
		color = c_white;
	}
}