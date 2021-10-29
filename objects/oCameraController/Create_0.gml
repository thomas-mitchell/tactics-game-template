#macro VIEWPORT_WIDTH 1344
#macro VIEWPORT_HEIGHT 768

#macro CAMERA_WIDTH 672
#macro CAMERA_HEIGHT 384

// Define camera controls
cameraUpKey = ord("W");
cameraDownKey = ord("S");
cameraLeftKey = ord("A");
cameraRightKey = ord("D");

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = VIEWPORT_WIDTH;
view_hport[0] = VIEWPORT_HEIGHT;

view_camera[0] = camera_create_view(0, 0, CAMERA_WIDTH, CAMERA_HEIGHT, 0, noone, -1, -1, -1, -1);
