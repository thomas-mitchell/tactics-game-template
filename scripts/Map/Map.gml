function Map() constructor {
	width = room_width / GRID_SIZE;
	height = room_height / GRID_SIZE;

	// Create nodes
	for (xx=0; xx < width; xx++) {
		for (yy = 0; yy < height; yy++) {
			cells[xx][yy] = instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE, "MapNodesLayer", oMapNode);
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
}