// Position cursor
x = mouse_x;
y = mouse_y;

if (!is_mouse_onscreen()) {
	hoverNode = noone;	
} else {
	hoverNode = global.map.GetNodeForPosition(x, y);
}
