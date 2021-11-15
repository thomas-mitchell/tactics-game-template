function initialise_nodes(){
	with (oMapNode) {
		if (instance_position(x + GRID_SIZE/2, y + GRID_SIZE/2, oTerrain)) {
			var terrain = instance_position(x + GRID_SIZE/2, y + GRID_SIZE/2, oTerrain);
	
			// TODO - Remove switch?
			switch (terrain.terrainType) {
				case "wall":
					terrainType = terrain.terrainType;
					sprite_index = terrain.sprite_index;
					movementCost = terrain.movementCost;
					passable = terrain.passable;
					break;
			
				case "rubble":
					terrainType = terrain.terrainType;
					sprite_index = terrain.sprite_index;
					movementCost = terrain.movementCost;
					passable = terrain.passable;
					break;
			}
	
			with(terrain) {
				instance_destroy();	
			}
		}
		
		// Initialize actors - Might want to move this
		if (instance_position(x + GRID_SIZE/2, y + GRID_SIZE/2, oActor)) {
			occupant = instance_position(x + GRID_SIZE/2, y + GRID_SIZE/2, oActor);
			occupant.gridX = gridX;
			occupant.gridY = gridY;
		}
	}
}