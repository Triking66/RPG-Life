/// @description Insert description here
// You can write your code in this editor
Name = "Enemy";

Max_HP = irandom(70) + 300;
HP = Max_HP;

Max_MP = irandom(100) + 600;
MP = Max_MP;

Atk = irandom(7) + 5;
M_Atk = irandom(7) + 5;

Def = irandom(7) + 5;
M_Def = irandom(7) + 5;

Spd = irandom(7) + 7;
Cmd_time = 0;

Mvmt = irandom(2) + 3;
Cur_MV = 0;

Hunger = 1000;
Thirst = 1000;