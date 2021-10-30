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
	var hoverNodeTextX = 10;
	var hoverNodeTextY = 10;
	var indices = global.map.GetNodeIndicesForPosition(x, y);
	
	var hoverNodeText = "Hovernode: " + string(indices.x) + "," + string(indices.y) + ": ";
	if (hoverNode.occupant != noone) {
		hoverNodeText += hoverNode.occupant.name;
	} else {
		hoverNodeText += "noone";	
	}
	
	draw_label(hoverNodeTextX, hoverNodeTextY, hoverNodeText, c_white, c_black);
}

// Draw name of selected actor
if (selectedActor != noone) {
	var actorText = selectedActor.name;
	
	draw_label(10, room_height - 30, actorText, c_white, c_black);
}











