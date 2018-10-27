var numEn = argument0;
var Lvl = argument1;
var xx = -1;
var yy = -1;
var ground_layer = layer_tilemap_get_id(layer_get_id("Floor"));

while(numEn > 0) {
	xx = irandom(49) + 1;
	yy = irandom(49) + 1;
	if (tilemap_get(ground_layer, xx, yy) == 1) and !position_meeting(xx*64, yy*64, Enemy_ENM) {
		instance_create_layer(xx*64, yy*64, "Instances", Enemy_ENM);
		numEn -= 1;
		//show_message("Placed Enemy");
	}
}