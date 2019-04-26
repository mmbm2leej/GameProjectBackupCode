///@description enemy_takedmg(damage_value, combo_multiplier)
///@arg damage_value
///@arg combo_multiplier

var dmgToTake = argument0;
if (argument1 > 0) {
	dmgToTake *= (1 + (argument1 / 72));
}

hsp = 0;
vsp = 0;



myhp -= dmgToTake;

if (myhp > 0) mystate = ENEMYSTATE.takingdmg;
else mystate = ENEMYSTATE.death;


