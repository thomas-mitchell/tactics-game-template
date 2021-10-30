function draw_label(x, y, text, fore_color, back_color) {
	draw_set_color(back_color);
	draw_rectangle(x, y, string_width(text) + x, string_height(text) + y, false);
	draw_text_color(x, y, text, fore_color, fore_color, fore_color, fore_color, 1);
	draw_set_color(c_white);
}