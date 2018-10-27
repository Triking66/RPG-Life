var c = argument0; // X coordinate
var d = argument1; // Y coordinate
var n = argument2; // Tile ID
var f = argument3; // First room
var l = argument4; // Last room
var d; // Placed door, used to change dest
var ground_layer = layer_tilemap_get_id(layer_get_id("Floor"));
var fow_layer = layer_tilemap_get_id(layer_get_id("FOW"));

tilemap_set(ground_layer, 1, 1 + c*5, 1 + d*5); // Set central 3x3 squares to walkable bricks
tilemap_set(ground_layer, 1, 2 + c*5, 1 + d*5);
tilemap_set(ground_layer, 1, 3 + c*5, 1 + d*5);
tilemap_set(ground_layer, 1, 1 + c*5, 2 + d*5);
tilemap_set(ground_layer, 1, 2 + c*5, 2 + d*5);
tilemap_set(ground_layer, 1, 3 + c*5, 2 + d*5);
tilemap_set(ground_layer, 1, 1 + c*5, 3 + d*5);
tilemap_set(ground_layer, 1, 2 + c*5, 3 + d*5);
tilemap_set(ground_layer, 1, 3 + c*5, 3 + d*5);

switch(n)
{
	case 0:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 2, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		// Set central bricks to solid walls
		tilemap_set(ground_layer, 2, 1 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 1 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 1 + c*5, 3 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 3 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 3 + d*5);
		break;
	case 1:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		
		// Add chest
		instance_create_layer((2+c*5)*64, (2+d*5)*64,"Instances", Chest_OBJ);
		break;
	case 2:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		
		// Add chest
		if(c-1 == l and d-1 == 9){
			d = instance_create_layer((2+c*5)*64, (3+d*5)*64,"instances", Door_OBJ);
			d.dest = Castle_ROOM;
		}
		else {
			instance_create_layer((2+c*5)*64, (2+d*5)*64,"Instances", Chest_OBJ);
		}
		break;
	case 3:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		
		// Add chest
		instance_create_layer((2+c*5)*64, (2+d*5)*64,"Instances", Chest_OBJ);
		break;
	case 4:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		
		// Add chest
		if(c-1 == f and d-1 = 0){
			d = instance_create_layer((2+c*5)*64, (1+d*5)*64,"instances", Door_OBJ);
			d.dest = Castle_ROOM;
		}
		else{
			instance_create_layer((2+c*5)*64, (2+d*5)*64,"Instances", Chest_OBJ);
		}
		break;
	case 5:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 6:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 7:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 8:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 3, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 3, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		break;
	case 9:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 10:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 11:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 12:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
	case 13:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 2, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 2, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		break;
	case 14:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 3, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		break;
	case 15:
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 3, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 2, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 2, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 2, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 2, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 2, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 2, 3 + c*5, 4 + d*5);
		break;
	default: // Error check, a tile not implemented is created. This tile has no walls, obviously wrong.
		// Set outer squares of tile to walls/walkable areas
		tilemap_set(ground_layer, 1, 0 + c*5, 0 + d*5); // Top Left Corner
		tilemap_set(ground_layer, 1, 4 + c*5, 0 + d*5); // Top Right Corner
		tilemap_set(ground_layer, 1, 4 + c*5, 4 + d*5); // Bottom Right Corner
		tilemap_set(ground_layer, 1, 0 + c*5, 4 + d*5); // Bottom Left Corner
		// Left Side
		tilemap_set(ground_layer, 1, 0 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 0 + c*5, 3 + d*5);
		// Top Side
		tilemap_set(ground_layer, 1, 1 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 0 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 0 + d*5);
		// Right Side
		tilemap_set(ground_layer, 1, 4 + c*5, 1 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 2 + d*5);
		tilemap_set(ground_layer, 1, 4 + c*5, 3 + d*5);
		// Bottom Side
		tilemap_set(ground_layer, 1, 1 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 2 + c*5, 4 + d*5);
		tilemap_set(ground_layer, 1, 3 + c*5, 4 + d*5);
		break;
}