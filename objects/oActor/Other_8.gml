path_clear_points(movementPath);
state = "idle";

if (actions > 0) {
	oCursor.selectedActor = id;
	movement_range(global.map.cells[gridX][gridY], move, actions);
}
