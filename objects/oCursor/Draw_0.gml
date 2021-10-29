// Draw selected indicator over hovered node
if (hoverNode != noone) {
	draw_sprite(sSelected, -1, hoverNode.x, hoverNode.y);
}

draw_self();