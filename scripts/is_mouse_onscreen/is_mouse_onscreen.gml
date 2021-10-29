// Checks to see if the mouse cursor is inside the game window
function is_mouse_onscreen() {
	// Find the position of the mouse relative to game window
	var mouseX = display_mouse_get_x() - window_get_x();
	var mouseY = display_mouse_get_y() - window_get_y();

	if (mouseX < 0 || mouseX > window_get_width() - 1) {
		return false;
	}
	if (mouseY < 0 || mouseY > window_get_height() - 1) {
		return false;
	}
	
	return true;
}