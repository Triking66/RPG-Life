var range = argument0;
var range_type = argument1;

var plr = DungeonControl.turn_plr;

var lay_id = layer_get_id("Floor");
var map_id = layer_tilemap_get_id(lay_id);

if(range_type == "Adj" or range_type == "Wave"){
	for(var i = 1; i <= range; i++){
		if tilemap_get_at_pixel(map_id, plr.x + 64*i, plr.y) == 1 {
			instance_create_layer(plr.x + 64*i, plr.y, "Instances", SelectBox_OBJ);
		}
		if tilemap_get_at_pixel(map_id, plr.x - 64*i, plr.y) == 1 {
			instance_create_layer(plr.x - 64*i, plr.y, "Instances", SelectBox_OBJ);
		}
		if tilemap_get_at_pixel(map_id, plr.x, plr.y + 64*i) == 1 {
			instance_create_layer(plr.x, plr.y + 64*i, "Instances", SelectBox_OBJ);
		}
		if tilemap_get_at_pixel(map_id, plr.x, plr.y - 64*i) == 1 {
			instance_create_layer(plr.x, plr.y - 64*i, "Instances", SelectBox_OBJ);
		}
	}
}