state = "idle";

gridX = 0;
gridY = 0;

name = "Error";

// Character statistics
move = 4;
actions = 2;

// Pathing variables
movementPath = path_add();
path_set_kind(movementPath, 2);
path_set_closed(movementPath, false);

moveSpeed = 4;