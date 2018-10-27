Hunger -= 3;
Thirst -= 5;

if Hunger < 0 {
	HP += Max_HP * Hunger / 100
}
if Thirst < 0 {
	HP += Max_HP * Thirst / 100
}