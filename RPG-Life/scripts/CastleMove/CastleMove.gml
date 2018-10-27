var lay_id = layer_get_id("Floor");
var map_id = layer_tilemap_get_id(lay_id);
if(argument0 == 0){ // Left
	var check = tilemap_get_at_pixel(map_id, x-64, y);
	if(check == 1){
		x -= 64;
		return true;
	}
}
else if argument0 == 1 { // Up
	var check = tilemap_get_at_pixel(map_id, x, y-64);
	if(check == 1){
		y -= 64;
		return true;
	}
}
else if argument0 == 2 { // Right
	var check = tilemap_get_at_pixel(map_id, x+64, y);
	if(check == 1){
		x += 64;
		return true;
	}
}
else { // Down
	var check = tilemap_get_at_pixel(map_id, x, y+64);
	if(check == 1){
		y += 64;
		return true;
	}
}
return false;