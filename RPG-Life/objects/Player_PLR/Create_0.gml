/// @description Insert description here
// You can write your code in this editor
randomize();
Name = "Player 1";

Max_HP = irandom(100) + 450;
HP = Max_HP;

Max_MP = irandom(50) + 225;
MP = Max_MP;

Atk = irandom(8) + 7;
M_Atk = irandom(8) + 7;

Def = irandom(8) + 7;
M_Def = irandom(8) + 7;

Spd = irandom(8) + 7;
Cmd_time = 0;

Mvmt = irandom(2) + 3;
Cur_MV = 0;

Hunger = 1000;
Thirst = 1000;

turn = false;

xp = 0;
need_xp = 10;

Lvl = 1;
job_lvl = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
// 0: Warrior, 1: Defender, 2: Theif, 3: Black Mage, 4: White Mage
// 5: Paladin, 6: Tank, 7: Ninja, 8: Summoner, 9: Spellsword

persistent = true;