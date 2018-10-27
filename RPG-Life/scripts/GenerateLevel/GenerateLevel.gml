#region // tilePos information
var tilePos = []; // 1: Left, 2: Up, 3: Right, 4: Down 
tilePos[0, 0] = 0; // [0,0,0,0]; // -
tilePos[0, 1] = 0;
tilePos[0, 2] = 0;
tilePos[0, 3] = 0;
tilePos[1, 0] = 1; // [1,0,0,0];	// Left
tilePos[1, 1] = 0;
tilePos[1, 2] = 0;
tilePos[1, 3] = 0;
tilePos[2, 0] = 0; // [0,2,0,0];	//      Up
tilePos[2, 1] = 2;
tilePos[2, 2] = 0;
tilePos[2, 3] = 0;
tilePos[3, 0] = 0; // [0,0,3,0];	//         Right
tilePos[3, 1] = 0;
tilePos[3, 2] = 3;
tilePos[3, 3] = 0;
tilePos[4, 0] = 0; // [0,0,0,4];	//               Down
tilePos[4, 1] = 0;
tilePos[4, 2] = 0;
tilePos[4, 3] = 4;
tilePos[5, 0] = 0; // [0,0,3,4];	//         Right Down
tilePos[5, 1] = 0;
tilePos[5, 2] = 3;
tilePos[5, 3] = 4;
tilePos[6, 0] = 1; // [1,0,3,4];	// Left    Right Down
tilePos[6, 1] = 0;
tilePos[6, 2] = 3;
tilePos[6, 3] = 4;
tilePos[7, 0] = 1; // [1,0,0,4];	// Left          Down
tilePos[7, 1] = 0;
tilePos[7, 2] = 0;
tilePos[7, 3] = 4;
tilePos[8, 0] = 1; // [1,0,3,0];	// Left    Right
tilePos[8, 1] = 0;
tilePos[8, 2] = 3;
tilePos[8, 3] = 0;
tilePos[9, 0] = 0; // [0,2,3,4];	//      Up Right Down
tilePos[9, 1] = 2;
tilePos[9, 2] = 3;
tilePos[9, 3] = 4;
tilePos[10, 0] = 1; // [1,2,3,4];	// Left Up Right Down
tilePos[10, 1] = 2;
tilePos[10, 2] = 3;
tilePos[10, 3] = 4;
tilePos[11, 0] = 1; // [1,2,0,4];	// Left Up       Down
tilePos[11, 1] = 2;
tilePos[11, 2] = 0;
tilePos[11, 3] = 4;
tilePos[12, 0] = 0; // [0,2,0,4];	//      Up       Down
tilePos[12, 1] = 2;
tilePos[12, 2] = 0;
tilePos[12, 3] = 4;
tilePos[13, 0] = 0; // [0,2,3,0];	//      Up Right
tilePos[13, 1] = 2;
tilePos[13, 2] = 3;
tilePos[13, 3] = 0;
tilePos[14, 0] = 1; // [1,2,3,0];	// Left Up Right
tilePos[14, 1] = 2;
tilePos[14, 2] = 3;
tilePos[14, 3] = 0;
tilePos[15, 0] = 1; // [1,2,0,0];	// Left Up
tilePos[15, 1] = 2;
tilePos[15, 2] = 0;
tilePos[15, 3] = 0;
#endregion
randomize();
var possibilities = ds_list_create(); // Possible tiles to place at location
var done = false; // Set to true when level generation is completed.
var doneNum = 0; // Set to 1 if a tile was able to be placed (generation not completed)
var last = -1; // Set to x position of the exit tile when placed.
var remIndex = 0; // Used to find the index to remove at in list.
var maxH; // Max floor height
var maxW; // Max floor width
var randTile = 0;
var randInt;
var chanceOfDE = 2; // Out of 10

var tiles = ds_grid_create(10, 10); // Tiles to be placed on the Dungeon_ROOM

maxH = ds_grid_height(tiles);
maxW = ds_grid_width(tiles);

// Set all dungeon tiles to 0 (unset)
for (var a = maxW - 1; a > -1; a--){
	for (var b = maxH - 1; b > -1; b--){
		ds_grid_set(tiles, a, b, 0);
	}
}

var randStart = irandom(9); // Place starting room
ds_grid_set(tiles, randStart, 0, 4);

while !done {
	doneNum = 0;
	for (a = maxW - 1; a > -1; a--){
		for (b = maxH - 1; b > -1; b--){
			if (tilePos[ds_grid_get(tiles, a, b), 0]) == 1 {
				ds_list_clear(possibilities); // Reset possibilities.
				if ds_grid_get(tiles, a-1, b) == 0 {
					// Add Possibilites
					randInt = irandom(9);
					if randInt < chanceOfDE {
						ds_list_add(possibilities, 3);
					}
					doneNum = 1;
					if a-1 > 0 {										// Left
						ds_list_add(possibilities, 8); 
						if b > 0 {										// Left Up
							ds_list_add(possibilities, 14); 
							if b < maxH-1 {	// Left Up Down
								ds_list_add(possibilities, 10);
							}
						}
						if b < maxH-1 {		// Left Down
							ds_list_add(possibilities, 6);
						}
					}
					if b > 0 {											// Up
						ds_list_add(possibilities, 13); 
						if b < maxH-1 {		// Up Down
							ds_list_add(possibilities, 9);
						}
					}
					if b < maxH-1 {			// Down
						ds_list_add(possibilities, 5);
					}
					// Remove Possibilities
					if a-1 > 0 and ds_grid_get(tiles, a-2, b) != 0{
						if tilePos[ds_grid_get(tiles, a-2, b), 2] == 3 {
							remIndex = ds_list_find_index(possibilities, 3);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if b > 0 and ds_grid_get(tiles, a-1, b-1) != 0{
						if tilePos[ds_grid_get(tiles, a-1, b-1), 3] == 4 {
							remIndex = ds_list_find_index(possibilities, 3);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if b < maxH-1 and ds_grid_get(tiles, a-1, b+1) != 0{
						if tilePos[ds_grid_get(tiles, a-1, b+1), 1] == 2 {
							remIndex = ds_list_find_index(possibilities, 3);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if ds_list_size(possibilities) == 0 {
						ds_list_add(possibilities, 3);
					}
					randTile = irandom(ds_list_size(possibilities)-1);
					ds_grid_set(tiles, a-1, b, ds_list_find_value(possibilities, randTile));
				}
			}
			
			if tilePos[ds_grid_get(tiles, a, b), 1] == 2 {
				ds_list_clear(possibilities); // Reset possibilities.
				if ds_grid_get(tiles, a, b-1) == 0 {
					doneNum = 1;
					// Add Possibilites
					randInt = irandom(9);
					if randInt < chanceOfDE{
						ds_list_add(possibilities, 4);
					}
					if b-1 > 0 {										// Up
						ds_list_add(possibilities, 12); 
						if a > 0 {										// Left Up
							ds_list_add(possibilities, 11); 
							if a < maxW-1 {								// Left Up Right
								ds_list_add(possibilities, 10);
							}
						}
						if a < maxW-1 {									// Up Right
							ds_list_add(possibilities, 9);
						}
					}
					if a > 0 {											// Left
						ds_list_add(possibilities, 7); 
						if a < maxW-1 {									// Left Right
							ds_list_add(possibilities, 6);
						}
					}
					if a < maxW-1 {										// Right
						ds_list_add(possibilities, 5);
					}
					// Remove Possibilities
					if b-1 > 0 and ds_grid_get(tiles, a, b-2) != 0{
						if tilePos[ds_grid_get(tiles, a, b-2), 3] == 4 {
							remIndex = ds_list_find_index(possibilities, 4);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if a > 0 and ds_grid_get(tiles, a-1, b-1) != 0{
						if tilePos[ds_grid_get(tiles, a-1, b-1), 2] == 3 {
							remIndex = ds_list_find_index(possibilities, 4);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if a < maxW-1 and ds_grid_get(tiles, a+1, b-1) != 0{
						if tilePos[ds_grid_get(tiles, a+1, b-1), 0] == 1 {
							remIndex = ds_list_find_index(possibilities, 4);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 5);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if ds_list_size(possibilities) == 0 {
						ds_list_add(possibilities, 4);
					}
					randTile = irandom(ds_list_size(possibilities)-1);
					ds_grid_set(tiles, a, b-1, ds_list_find_value(possibilities, randTile));
				}
			}
			
			if tilePos[ds_grid_get(tiles, a, b), 2] == 3 {
				ds_list_clear(possibilities); // Reset possibilities.
				if ds_grid_get(tiles, a+1, b) == 0 {
					doneNum = 1;
					// Add Possibilites
					randInt = irandom(9);
					if randInt < chanceOfDE{
						ds_list_add(possibilities, 1);
					}
					if a+1 < maxW-1 {										// Right
						ds_list_add(possibilities, 8); 
						if b > 0 {										// Right Up
							ds_list_add(possibilities, 14); 
							if b < maxH-1 {	// Right Up Down
								ds_list_add(possibilities, 10);
							}
						}
						if b < maxH-1 {		// Right Down
							ds_list_add(possibilities, 6);
						}
					}
					if b > 0 {											// Up
						ds_list_add(possibilities, 15); 
						if b < maxH-1 {		// Up Down
							ds_list_add(possibilities, 11);
						}
					}
					if b < maxH-1 {			// Down
						ds_list_add(possibilities, 7);
					}
					// Remove Possibilities
					if a+1 < maxW-1 and ds_grid_get(tiles, a+2, b) != 0{
						if tilePos[ds_grid_get(tiles, a+2, b), 0] == 1 {
							remIndex = ds_list_find_index(possibilities, 1);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if b > 0 and ds_grid_get(tiles, a+1, b-1) != 0{
						if tilePos[ds_grid_get(tiles, a+1, b-1), 3] == 4 {
							remIndex = ds_list_find_index(possibilities, 1);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if b < maxH-1 and ds_grid_get(tiles, a+1, b+1) != 0{
						if tilePos[ds_grid_get(tiles, a+1, b+1), 1] == 2 {
							remIndex = ds_list_find_index(possibilities, 1);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 8);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 6);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 7);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if ds_list_size(possibilities) == 0{
						ds_list_add(possibilities, 1);
					}
					randTile = irandom(ds_list_size(possibilities)-1);
					ds_grid_set(tiles, a+1, b, ds_list_find_value(possibilities, randTile));
				}
			}
			
			if tilePos[ds_grid_get(tiles, a, b), 3] == 4 {
				ds_list_clear(possibilities); // Reset possibilities.
				if ds_grid_get(tiles, a, b+1) == 0 {
					doneNum = 1;
					// Add Possibilites
					randInt = irandom(9);
					if randInt < chanceOfDE {
						ds_list_add(possibilities, 2);
					}
					if b+1 < maxH - 1 {										// Down
						ds_list_add(possibilities, 12); 
						if a > 0 {										// Left Down
							ds_list_add(possibilities, 11); 
							if a < maxW-1 {								// Left Down Right
								ds_list_add(possibilities, 10);
							}
						}
						if a < maxW-1 {									// Down Right
							ds_list_add(possibilities, 9);
						}
					}
					if a > 0 {											// Left
						ds_list_add(possibilities, 15); 
						if a < maxW-1 {									// Left Right
							ds_list_add(possibilities, 14);
						}
					}
					if a < maxW-1 {										// Right
						ds_list_add(possibilities, 13);
					}
					// Remove Possibilities
					if b+1 < maxH-1 and ds_grid_get(tiles, a, b+2) != 0{
						if tilePos[ds_grid_get(tiles, a, b+2), 1] == 2 {
							remIndex = ds_list_find_index(possibilities, 2);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if a > 0 and ds_grid_get(tiles, a-1, b+1) != 0{
						if tilePos[ds_grid_get(tiles, a-1, b+1), 2] == 3 {
							remIndex = ds_list_find_index(possibilities, 2);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if a < maxW-1 and ds_grid_get(tiles, a+1, b+1) != 0{
						if tilePos[ds_grid_get(tiles, a+1, b+1), 0] == 1 {
							remIndex = ds_list_find_index(possibilities, 2);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 11);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 12);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 15);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
						else {
							remIndex = ds_list_find_index(possibilities, 9);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 10);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 13);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
							remIndex = ds_list_find_index(possibilities, 14);
							if remIndex != -1 {ds_list_delete(possibilities, remIndex)};
						}
					}
					if ds_list_size(possibilities) == 0{
						ds_list_add(possibilities, 2);
					}
					if b+1 == maxH-1 and last == -1 {
						last = a;
						ds_grid_set(tiles, a, b+1, 2);
					}
					else {
						randTile = irandom(ds_list_size(possibilities)-1);
						ds_grid_set(tiles, a, b+1, ds_list_find_value(possibilities, randTile));
					}
				}
			}
		}
	}
	if doneNum == 0 { // If no tiles were able to be placed in the last run
		if last == -1 { // If the ending tile has not been placed, retry generation
			for (a = maxW - 1; a > -1; a--){
				for (b = maxH - 1; b > -1; b--){
					ds_grid_set(tiles, a, b, 0); // Reset all tiles to 0
				}
			}
			randStart = irandom(9); // replace starting room
			ds_grid_set(tiles, randStart, 0, 4);
		}
		else {
			done = true; // If the ending tile was placed, level generation completed.
		}
	}
}

ds_list_destroy(possibilities);

for (a = maxW - 1; a > -1; a--){
	for (b = maxH - 1; b > -1; b--){
		PlaceTile(a+1, b+1, ds_grid_get(tiles, a, b), randStart, last);
	}
}

ds_grid_destroy(tiles);

PlaceEnemies(20, 1);