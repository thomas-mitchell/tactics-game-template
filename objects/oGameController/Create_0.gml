#macro GRID_SIZE 32

// Create the map
global.map = new Map();

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(mouse_x, mouse_y, "CursorLayer", oCursor);

with(instance_create_layer(5 * GRID_SIZE, 5 * GRID_SIZE, "ActorsLayer", oUltramarine)) {
	gridX = 5;
	gridY = 5;
	name = "Ultramarine";
	global.map.cells[gridX][gridY].occupant = id;
}

with(instance_create_layer(8 * GRID_SIZE, 5 * GRID_SIZE, "ActorsLayer", oUltramarineSarg)) {
	gridX = 8;
	gridY = 5;
	name = "Ultramarine Sergeant";
	global.map.cells[gridX][gridY].occupant = id;
}

with(instance_create_layer(5 * GRID_SIZE, 7 * GRID_SIZE, "ActorsLayer", oGretchin)) {
	gridX = 5;
	gridY = 7;
	name = "Gretchin";
	global.map.cells[gridX][gridY].occupant = id;
}

with(instance_create_layer(8 * GRID_SIZE, 7 * GRID_SIZE, "ActorsLayer", oOrk)) {
	gridX = 8;
	gridY = 7;
	name = "Ork";
	global.map.cells[gridX][gridY].occupant = id;
}