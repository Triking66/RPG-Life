/// @description Insert description here
// You can write your code in this editor
if(selected){
	instance_destroy(SelectBox_OBJ);
	selected = false;
}
else{
	with(Default_SKL){
		selected = false;
	}
	selected = true;
	instance_destroy(SelectBox_OBJ);
	SetTargets(range[0], range[1]);
}