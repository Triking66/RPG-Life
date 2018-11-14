var job1 = argument0;
var job2 = argument1;

var lev1 = argument2;
var lev2 = argument3;

var inst;
var skill_id = 0;
var jlev = 0;

instance_destroy(Default_SKL);

inst = instance_create_layer(0, 0, "Instances", Default_SKL);
with(inst){
	skill_name = "Attack";
	skill_num = skill_id;
	range = [1, "Adj"];
	atk_mod = 1.5;
	def_mod = 1;
	type = 1;
	sprite_index = Physical_Skill_SPR;
}
skill_id += 1;
#region // Warrior
if(job1 == 0 or job2 == 0) {
	jlev = 0;
	if(job1 == 0) { jlev = lev1; }
	if(job2 == 0) { jlev = max(jlev, lev2); }
	switch((jlev+1) div 2){
		case 50:
		default:
		case 24:
		case 23:
		case 22:
		case 21:
		case 20:
		case 19:
		case 18:
		case 17:
		case 16:
		case 15:
		case 14:
		case 13:
		case 12:
		case 11:
		case 10:
		case 9:
		case 8:
		case 7:
		case 6:
		case 5:
		case 4:
		case 3:
		case 2:
		case 1:
		inst = instance_create_layer(0, 0, "Instances", Default_SKL);
			with(inst){
				skill_name = "Slash";
				skill_num = skill_id;
				range = [1, "Wave"];
				atk_mod = 1.5;
				def_mod = 1;
				type = 1;
				sprite_index = Physical_Skill_SPR;
			}
			skill_id += 1;
		case 0:
		break;
	}
}
#endregion
#region // Defender
if(job1 == 1 or job2 == 1) {
	jlev = 0;
	if(job1 == 1) { jlev = lev1; }
	if(job2 == 1) { jlev = max(jlev, lev2); }
	switch((jlev+1) div 2){
		case 50:
		default:
		case 24:
		case 23:
		case 22:
		case 21:
		case 20:
		case 19:
		case 18:
		case 17:
		case 16:
		case 15:
		case 14:
		case 13:
		case 12:
		case 11:
		case 10:
		case 9:
		case 8:
		case 7:
		case 6:
		case 5:
		case 4:
		case 3:
		case 2:
		case 1:
		inst = instance_create_layer(0, 0, "Instances", Default_SKL);
			with(inst){
				skill_name = "Defend";
				skill_num = skill_id;
				range = [0, "Self"];
				type = 1;
				sprite_index = Default_Skill_SPR;
			}
			skill_id += 1;
		case 0:
		case -1:
		break;
	}
}
#endregion
#region // Theif
if(job1 == 2 or job2 == 2) {
	jlev = 0;
	if(job1 == 2) { jlev = lev1; }
	if(job2 == 2) { jlev = max(jlev, lev2); }
}
#endregion
#region // Black Mage
if(job1 == 3 or job2 == 3) {
	jlev = 0;
	if(job1 == 3) { jlev = lev1; }
	if(job2 == 3) { jlev = max(jlev, lev2); }
}
#endregion
#region // White Mage
if(job1 == 4 or job2 == 4) {
	jlev = 0;
	if(job1 == 4) { jlev = lev1; }
	if(job2 == 4) { jlev = max(jlev, lev2); }
}
#endregion

#region // Paladin
if(job1 == 5 or job2 == 5) {
	jlev = 0;
	if(job1 == 5) { jlev = lev1; }
	if(job2 == 5) { jlev = max(jlev, lev2); }
}
#endregion
#region // Tank
if(job1 == 6 or job2 == 6) {
	jlev = 0;
	if(job1 == 6) { jlev = lev1; }
	if(job2 == 6) { jlev = max(jlev, lev2); }
}
#endregion
#region // Ninja
if(job1 == 7 or job2 == 7) {
	jlev = 0;
	if(job1 == 7) { jlev = lev1; }
	if(job2 == 7) { jlev = max(jlev, lev2); }
}
#endregion
#region // Summoner
if(job1 == 8 or job2 == 8) {
	jlev = 0;
	if(job1 == 8) { jlev = lev1; }
	if(job2 == 8) { jlev = max(jlev, lev2); }
}
#endregion
#region // Priest
if(job1 == 9 or job2 == 9) {
	jlev = 0;
	if(job1 == 9) { jlev = lev1; }
	if(job2 == 9) { jlev = max(jlev, lev2); }
}
#endregion