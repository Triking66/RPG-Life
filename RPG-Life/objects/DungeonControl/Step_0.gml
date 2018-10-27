/// @description Insert description here
// You can write your code in this editor
if !taking_turn{
	var tot_spd = 0;

	with(Player_PLR){
		tot_spd += Spd;
	}

	with(Enemy_ENM){
		tot_spd += Spd;
	}

	with(Player_PLR){
		Cmd_time += 100 * Spd / tot_spd;
		if Cmd_time >= 1000{
			DungeonControl.taking_turn = true;
			turn = true;
		}
	}
	
	with(Enemy_ENM){
		Cmd_time += 100 * Spd / tot_spd;
		if (Cmd_time >= 1000) {
			Cmd_time = 0;
			show_message("Enemy Turn");
			TakeTurn();
		}
	}
}