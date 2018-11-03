/// @description Insert description here
// You can write your code in this editor
inventory = ds_list_create();
// Inventory list
// Items: 0: Name, 1: Image, 2: Type, 3: HP / Att, 4: MP / M_Att, 
//        5: Hunger / Def, 6: Thirst / M_Def, 7: Status
// Types: 0: Consumable, 1: Weapon, 2: Armor, 3: Accessory

ds_list_add(inventory, ["Apple", Apple_Item_SPR, 0, 0, 0, 100, 150, 0]);

persistent = true;