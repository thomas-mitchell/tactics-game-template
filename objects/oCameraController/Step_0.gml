// Update camera
var camera_move_speed = 3;

var _viewX = camera_get_view_x(view_camera[0]);
var _viewY = camera_get_view_y(view_camera[0]);
var _viewWidth = camera_get_view_width(view_camera[0]);
var _viewHeight = camera_get_view_height(view_camera[0]);

// Check for horizontal movement
var _hor = keyboard_check(cameraRightKey) - keyboard_check(cameraLeftKey);
if (_hor == -1 && _viewX <= 0) {
	_hor = 0;	
} else if (_hor == 1 && (_viewX + _viewWidth) > room_width - 1) {
	_hor = 0;
}

// Check for vertical movement
var _ver = keyboard_check(cameraDownKey) - keyboard_check(cameraUpKey);
if (_ver == -1 && _viewY <= 0) {
	_ver = 0;	
} else if (_ver == 1 && (_viewY + _viewHeight) > room_height - 1) {
	_ver = 0;
}

// Move camera to new position
var _gotoX = _viewX + (_hor * camera_move_speed);
var _gotoY = _viewY + (_ver * camera_move_speed);

camera_set_view_pos(view_camera[0], _gotoX, _gotoY);