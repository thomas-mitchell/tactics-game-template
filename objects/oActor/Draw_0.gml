
if (oCursor.hoverNode != noone && oCursor.hoverNode != global.map.cells[gridX, gridY]) {
	current = oCursor.hoverNode;
	
	// Step through nodes in chain until parent reached
	while (current.parent != noone) {
		draw_line_width_color(current.x + GRID_SIZE/2, current.y + GRID_SIZE/2, current.parent.x + GRID_SIZE/2, current.parent.y + GRID_SIZE/2, 4, c_lime, c_lime);	

		current = current.parent;
	}
}

draw_self();