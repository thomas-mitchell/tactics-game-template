// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function movement_range(start, movement, actions) {
	// Reset all node data
	wipe_nodes();
	
	var range = movement * actions;
	
	// Create data structures
	var open = ds_priority_create();
	var closed = ds_list_create();
	
	// Add starting node to open list
	ds_priority_add(open, start, start.G);
	
	// While open queue is not empty, repeat until all nodes have been looked at
	while(ds_priority_size(open) > 0) {
		// Remove node with lowest G score from open and add to closed
		var current = ds_priority_delete_min(open);
		ds_list_add(closed, current);
		
		// Step through neighbours
		for (ii = 0; ii < ds_list_size(current.neighbours); ii++) {
			// Store current neighbour
			var neighbour = ds_list_find_value(current.neighbours, ii);
			
			// Add to open list if it qualifies
			if (
				ds_list_find_index(closed, neighbour) < 0 &&
				neighbour.passable &&
				neighbour.occupant == noone &&
				neighbour.movementCost + current.G <= range
			) {
				// Calculate new G score if not already calculated
				if (
					ds_priority_find_priority(open, neighbour) == 0 ||
					ds_priority_find_priority(open, neighbour) == undefined
				) {
					// Give neighour the appropriate parent
					neighbour.parent = current;
					
					var costMod = 1;
					
					// Diagonals cost extra
					if (
						neighbour.gridX != current.gridX &&
						neighbour.gridY != current.gridY
					) {
						costMod = 1.5;	
					}
					
					// Assign neighbour G score
					neighbour.G = current.G + (neighbour.movementCost * costMod);
					
					// Add neighbour to open list
					ds_priority_add(open, neighbour, neighbour.G);
				} else {
					// If neighbour score has already been calculated
					
					// Check if new score would be lower
					var costMod = 1;
					
					if (
						neighbour.gridX != current.gridX &&
						neighbour.gridY != current.gridY
					) {
						costMod = 1.5;	
					}
					var newG = current.G + (neighbour.movementCost * costMod);
					
					if (newG < neighbour.G) {
						neighbour.parent = current;
						neighbour.G = newG;
						ds_priority_change_priority(open, neighbour, neighbour.G);
					}
				}
			}
			
		}
	}
	
	// Round down all G scores
	with (oMapNode) {
		G = floor(G);	
	}
	
	// Color movement nodes
	for (ii = 0; ii < ds_list_size(closed); ii++) {
		current = ds_list_find_value(closed, ii);
		current.moveNode = true;
		color_move_node(current, movement, actions);
	}
	
	// Cleanup
	ds_priority_destroy(open);
	ds_list_destroy(closed);
}