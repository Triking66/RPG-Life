/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, 0, x, y);

var pch = (HP / Max_HP) * 100;
draw_healthbar(x, y, x+5, y+sprite_height, pch, c_black, c_maroon, c_green, 3, true, false);

var pcm = (MP / Max_MP) * 100;
draw_healthbar(x + sprite_width - 5, y, x+sprite_width, y+sprite_height, pch, c_black, c_dkgray, c_purple, 3, true, false);
