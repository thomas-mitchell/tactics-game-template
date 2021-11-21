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
		
		selectedActor.actions = 2;
		movement_range(global.map.cells[selectedActor.gridX][selectedActor.gridY], selectedActor.move, selectedActor.actions);
	} else {
		selectedActor = noone;
		wipe_nodes();
	}
}

if (mouse_check_button_pressed(mb_right)) {
	if (selectedActor != noone && hoverNode.moveNode) {
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
		
		// Decrement actions
		if (hoverNode.G > selectedActor.move) {
			selectedActor = noone;
			wipe_nodes();
		} else {
			selectedActor.actions--;
			
			if (selectedActor.actions > 0) {
				movement_range(hoverNode, selectedActor.move, selectedActor.actions);	
			} else {
				selectedActor = noone;
				wipe_nodes();
			}
		}
	} else {
		selectedActor = noone;
		wipe_nodes();
	}
}