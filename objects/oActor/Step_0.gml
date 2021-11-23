
switch (state) {
	case "beginPath":
		path_start(movementPath, moveSpeed, 0, true);
		state = "moving";
		break;
}
