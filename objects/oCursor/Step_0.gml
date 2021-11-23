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
		if (hoverNode.occupant != selectedActor) {
			selectedActor = hoverNode.occupant;
			selectedActor.actions = 2;
			movement_range(global.map.cells[selectedActor.gridX][selectedActor.gridY], selectedActor.move, selectedActor.actions);
		}
	} else {
		selectedActor = noone;
		wipe_nodes();
	}
}

if (mouse_check_button_pressed(mb_right)) {
	if (selectedActor != noone && hoverNode.moveNode) {
		current = hoverNode;
		
		// Create priority queue of nodes on the path
		path = ds_priority_create()
		ds_priority_add(path, current, current.G);
		while (current.parent != noone) {
			ds_priority_add(path, current.parent, current.parent.G);
			current = current.parent;
		}
		
		// Add the nodes coordinates to the actors movement path
		do {
			current = ds_priority_delete_min(path);
			path_add_point(selectedActor.movementPath, current.x, current.y, 100);
		} until (ds_priority_empty(path))
		
		// Cleanup queue
		ds_priority_destroy(path);
		
		// Clear old node
		global.map.cells[selectedActor.gridX][selectedActor.gridY].occupant = noone;
		
		// Update selected actor
		var gridCoords = global.map.GetNodeIndicesForPosition(x, y);
		selectedActor.gridX = gridCoords.x;
		selectedActor.gridY = gridCoords.y;
		
		// Teleport actor instantly
		//selectedActor.x = hoverNode.x;
		//selectedActor.y = hoverNode.y;
		
		// Update new node
		hoverNode.occupant = selectedActor;
		
		// Send actor on its way
		selectedActor.state = "beginPath";
		
		// Decrement actions
		if (hoverNode.G > selectedActor.move) {
			selectedActor.actions -= 2;
			wipe_nodes();
		} else {
			selectedActor.actions--;
			wipe_nodes();
		}
		
		selectedActor = noone;
	} else {
		selectedActor = noone;
		wipe_nodes();
	}
}