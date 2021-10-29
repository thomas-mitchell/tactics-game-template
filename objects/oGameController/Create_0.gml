#macro GRID_SIZE 32

global.map = new Map();

// Create the cursor
window_set_cursor(cr_none);
instance_create_layer(mouse_x, mouse_y, "CursorLayer", oCursor);