/// @description Insert description here
// You can write your code in this editor

if !global.inventory_open {
	if room == Castle_ROOM { // Allows free movement when not in dungeon
		if(keyboard_check_pressed(ord("A"))){
			if CastleMove(0) {
				Cur_MV += 1
				if Cur_MV >= Mvmt {
					ReduceHT();
					Cur_MV = 0;
				}
			}
		}
		else if(keyboard_check_pressed(ord("W"))){
			if CastleMove(1) {
				Cur_MV += 1
				if Cur_MV >= Mvmt {
					ReduceHT();
					Cur_MV = 0;
				}
			}
		}
		else if(keyboard_check_pressed(ord("D"))){
			if CastleMove(2) {
				Cur_MV += 1
				if Cur_MV >= Mvmt {
					ReduceHT();
					Cur_MV = 0;
				}
			}
		}
		else if(keyboard_check_pressed(ord("S"))){
			if CastleMove(3) {
				Cur_MV += 1
				if Cur_MV >= Mvmt {
					ReduceHT();
					Cur_MV = 0;
				}
			}
		}
	}
	else if turn and Cur_MV < Mvmt { 
		// Restricts movement to while it's your turn, and have movement left.
		if(keyboard_check_pressed(ord("A"))){
			if DungeonMove(0) {
				Cur_MV += 1
			}
		}
		else if(keyboard_check_pressed(ord("W"))){
			if DungeonMove(1) {
				Cur_MV += 1
			}
		}
		else if(keyboard_check_pressed(ord("D"))){
			if DungeonMove(2) {
				Cur_MV += 1
			}
		}
		else if(keyboard_check_pressed(ord("S"))){
			if DungeonMove(3) {
				Cur_MV += 1
			}
		}
	}

	if(mouse_check_button_pressed(mb_left)) and turn and room = Dungeon_ROOM{
		if (point_in_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 94, 42, sprite_get_width(EndTurn_SPR)/2)){
			turn = false;
			DungeonControl.taking_turn = false;
			Cmd_time = 0;
			Cur_MV = 0;
			ReduceHT();
		}
	}
}

if(keyboard_check_pressed(ord("H"))){
	HP -= irandom(40) + 10;
}
if(keyboard_check_pressed(ord("M"))){
	MP -= irandom(30) + 5;
}