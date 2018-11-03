mult_num = argument0;

draw_set_color(c_white);
draw_rectangle(10, 100 + 110*mult_num, 170, 200 + 110*mult_num, false);

draw_set_color(c_ltgray);
draw_rectangle(10, 100 + 110*mult_num + 100 * ((1000 - Cmd_time) / 1000), 170, 200 + 110*mult_num, false);

draw_healthbar(12, 119 + 110*mult_num, 168, 131 + 110*mult_num, 100*(HP/Max_HP), c_gray, c_red, c_green, 0, true, false)
draw_healthbar(12, 134 + 110*mult_num, 168, 146 + 110*mult_num, 100*(MP/Max_MP), c_gray, c_dkgray, c_purple, 0, true, false)
draw_healthbar(12, 149 + 110*mult_num, 168, 161 + 110*mult_num, Hunger/10, c_gray, c_orange, c_orange, 0, true, false)
draw_healthbar(12, 164 + 110*mult_num, 168, 176 + 110*mult_num, Thirst/10, c_gray, c_blue, c_blue, 0, true, false)
draw_healthbar(12, 179 + 110*mult_num, 168, 191 + 110*mult_num, 100*(xp/need_xp), c_gray, c_yellow, c_yellow, 0, true, false)

draw_set_color(c_black);
draw_text(10, 100 + 110*mult_num, Name);
draw_text(12, 115 + 110*mult_num, "HP: " + string(HP) + " / " + string(Max_HP));
draw_text(12, 130 + 110*mult_num, "MP: " + string(MP) + " / " + string(Max_MP));
draw_text(12, 145 + 110*mult_num, "Hunger: " + string(Hunger/10) + "%");
draw_text(12, 160 + 110*mult_num, "Thirst: " + string(Thirst/10) + "%");
draw_text(12, 175 + 110*mult_num, "XP: " + string(xp) + " / " + string(need_xp));

/*
draw_set_color(c_red);
draw_text(10, 190 + 160*mult_num, "Attack: " + string(Atk));

draw_set_color(c_fuchsia);
draw_text(100, 190 + 160*mult_num, "Magic: " + string(M_Atk));

draw_set_color(c_silver);
draw_text(10, 205 + 160*mult_num, "Defense: " + string(Def));

draw_set_color(c_teal);
draw_text(100, 205 + 160*mult_num, "Resist: " + string(M_Def));

draw_set_color(c_aqua);
draw_text(10, 220 + 160*mult_num, "Speed: " + string(Spd));

draw_set_color(c_yellow);
draw_text(100, 220 + 160*mult_num, "Move: " + string(Mvmt));
*/