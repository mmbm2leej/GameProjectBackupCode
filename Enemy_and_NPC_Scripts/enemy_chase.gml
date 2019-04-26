
var player = playerid();
if (player == noone) {
	hsp = 0;
	vsp = 0;
}

with (player) {
	if (outofcombat) outofcombat = false;
}

#region if the player is within the chase range

if ((distance_to_object(player) < mydisengagerange) && (distance_to_object(player) > mycombatrange)) {
	if (player.x < id.x) {
		if (sprite_index != mywalksprite) sprite_index = mywalksprite; //change to run sprite later
		hsp = runspd;	
	}
	
} 

#endregion

else if ((distance_to_object(player) > mydisengagerange) || (player == noone)) mystate = ENEMYSTATE.idle;
else if (distance_to_object(player) <= mycombatrange) mystate = ENEMYSTATE.combat;
