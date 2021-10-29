// Draw mouse position
//var mousePositionTextX = 10;
//var mousePositionTextY = 10;
//var mousePositionText = "Mouse position: " + string(x) + "," + string(y);

//draw_set_color(c_black);
//draw_rectangle(mousePositionTextX, mousePositionTextY, string_width(mousePositionText) + mousePositionTextX, string_height(mousePositionText) + mousePositionTextY, false);
//draw_text_color(mousePositionTextX, mousePositionTextY, mousePositionText, c_green, c_green, c_green, c_green, 1);
//draw_set_color(c_white);


// Draw indices of hovered node
if (hoverNode != noone) {
	var hoverNodeIndicesX = 10;
	var hoverNodeIndicesY = 10;
	var indices = global.map.GetNodeIndicesForPosition(x, y);
	
	var hoverNodeIndicesText = "Hovernode: " + string(indices.x) + "," + string(indices.y);
	
	draw_set_color(c_black);
	draw_rectangle(hoverNodeIndicesX, hoverNodeIndicesY, string_width(hoverNodeIndicesText) + hoverNodeIndicesX, string_height(hoverNodeIndicesText) + hoverNodeIndicesY, false);
	draw_text_color(hoverNodeIndicesX, hoverNodeIndicesY, hoverNodeIndicesText, c_white, c_white, c_white, c_white, 1);
	draw_set_color(c_white);
}
