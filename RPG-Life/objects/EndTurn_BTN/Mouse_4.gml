/// @description Insert description here
// You can write your code in this editor
with(Player_PLR){
	if(turn) {
		turn = false;
		DungeonControl.taking_turn = false;
		instance_destroy(Default_SKL);
		instance_destroy(SelectBox_OBJ);
		Cmd_time = 0;
		Cur_MV = 0;
		ReduceHT();
	}
}