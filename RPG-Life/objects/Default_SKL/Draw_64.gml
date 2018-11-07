/// @description Insert description here
// You can write your code in this editor
draw_sprite(AbilityBack_SPR, 0, display_get_gui_width() - 192, display_get_gui_height() - 32 - 70 * skill_num);
draw_set_color(c_black);
draw_text(display_get_gui_width()-180, display_get_gui_height()-27-70 * skill_num, skill_name);
draw_sprite(sprite_index, 0, display_get_gui_width() - 64, display_get_gui_height() - 64 - 70 * skill_num);

if(selected){
	draw_sprite(SelectBox_SPR, 0, display_get_gui_width() - 64, display_get_gui_height() - 64 - 70 * skill_num);
}