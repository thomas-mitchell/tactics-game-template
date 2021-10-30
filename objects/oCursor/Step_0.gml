// Position cursor
x = mouse_x;
y = mouse_y;

if (!is_mouse_onscreen()) {
	hoverNode = noone;	
} else {
	hoverNode = global.map.GetNodeForPosition(x, y);
}

if (mouse_check_button_pressed(mb_left)) {
	if (hoverNode.occupant != noone) {
		selectedActor = hoverNode.occupant;	
	} else {
		selectedActor = noone;	
	}
}

if (mouse_check_button_pressed(mb_right)) {
	if (selectedActor != noone && hoverNode.occupant == noone && hoverNode.passable) {
		// Clear old node
		global.map.cells[selectedActor.gridX][selectedActor.gridY].occupant = noone;
		
		// Update selected actor
		var gridCoords = global.map.GetNodeIndicesForPosition(x, y);
		selectedActor.gridX = gridCoords.x;
		selectedActor.gridY = gridCoords.y;
		selectedActor.x = hoverNode.x;
		selectedActor.y = hoverNode.y;
		
		// Update new node
		hoverNode.occupant = selectedActor;
		
		// Deselect actor
		selectedActor = noone;
	} else {
		selectedActor = noone;	
	}
}