function Map() constructor {
	width = room_width / GRID_SIZE;
	height = room_height / GRID_SIZE;

	// Create nodes
	for (xx=0; xx < width; xx++) {
		for (yy = 0; yy < height; yy++) {
			cells[xx][yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "MapNodesLayer", oMapNode);
			cells[xx][yy].gridX = xx;
			cells[xx][yy].gridY = yy;
		}
	}

	// Populate neighbours
	for (xx=0; xx < width; xx++) {
		for (yy = 0; yy < height; yy++) {
			node = cells[xx, yy];
		
			// Add left neighbour
			if (xx > 0) {
				ds_list_add(node.neighbours, cells[xx - 1][yy]);
			}
		
			// Add right neighbour
			if (xx < width - 1) {
				ds_list_add(node.neighbours, cells[xx + 1][yy]);
			}
		
			// Add top neighbour
			if (yy > 0) {
				ds_list_add(node.neighbours, cells[xx][yy - 1]);
			}
		
			// Add bottom neighbour
			if (yy < height - 1) {
				ds_list_add(node.neighbours, cells[xx][yy + 1]);
			}
		
			// Add top left neighbour
			if (xx > 0 && yy > 0) {
				ds_list_add(node.neighbours, cells[xx - 1][yy - 1]);	
			}
		
			// Add top right neighbour
			if (xx < width - 1 && yy > 0) {
				ds_list_add(node.neighbours, cells[xx + 1][yy - 1]);	
			}
		
			// Add bottom left neighbour
			if (xx > 0 && yy < height - 1) {
				ds_list_add(node.neighbours, cells[xx - 1][yy + 1]);	
			}
		
			// Add bottom right neighbour
			if (xx < width - 1 && yy < height - 1) {
				ds_list_add(node.neighbours, cells[xx + 1][yy + 1]);	
			}
		}
	}
	
	static GetNodeForPosition = function(_x, _y) {
		return instance_position(_x, _y, oMapNode);
	}
	
	static GetNodeIndicesForPosition = function(_x, _y) {
		var xpos = floor(_x / GRID_SIZE);
		var ypos = floor(_y / GRID_SIZE);
		
		return {
			x: xpos,
			y: ypos,
		}
	}
}