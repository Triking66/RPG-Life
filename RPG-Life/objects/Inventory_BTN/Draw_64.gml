/// @description Insert description here
// You can write your code in this editor

if global.inventory_open {
	draw_set_color(c_aqua);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	draw_sprite(sprite_index, 0, 10, 10);
}
else {
	draw_sprite(sprite_index, 0, 10, 10);
}