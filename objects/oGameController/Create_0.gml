#macro GRID_SIZE 32

state = "initialising";

// Create the map
global.map = new Map();

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(mouse_x, mouse_y, "CursorLayer", oCursor);

//with(instance_create_layer(5 * GRID_SIZE, 5 * GRID_SIZE, "ActorsLayer", oUltramarine)) {
//	gridX = 5;
//	gridY = 5;
//	name = "Ultramarine";
//	global.map.cells[gridX][gridY].occupant = id;
//}
