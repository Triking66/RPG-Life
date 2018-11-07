/// @description Insert description here
// You can write your code in this editor
skill_num = 0; // Where to display/be clickable.

skill_name = "???"; // Display name
base_hit = 0; // Hit chance without modifiers

atk_mod = 0; // Modifier to user's attack
m_atk_mod = 0; // Modifier to user's magic attack

def_mod = 0; // Modifier to target's defense
m_def_mod = 0; // Modifier to target's magic defense

type = 0;
// 0: No damage, 1: Physical damage, 2: Magic damage, 3: Healing

range = [1, "Adj"];
// Range of attack, and area of effect

status_turn = 0; // How many turns to give status
status = [];
// 0: Poison, 1: Paralysis, 2: Weak, 3: Mute, 4: Sleep, 5: Stop, 6: Blind, 7: Hunger, 8: Thirst, 9: Doom
// 10: Regen, 11: Move+, 12: Protect, 13: Shell, 14: Immune, 15: , 19: AutoLife

stat_change = [0, 0, 0, 0, 0] // modifier to target stats on hit
// Atk, M_Atk, Def, M_Def, Spd

selected = false;

