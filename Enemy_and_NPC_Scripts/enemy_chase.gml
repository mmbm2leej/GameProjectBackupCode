if (obj_player.mystate != PLAYERSTATE.death) {

	if (instance_exists(obj_player)) var player = obj_player.id;
	else { var player = noone; }
	if (player != noone) {
		with (player) {
			if (outofcombat) outofcombat = false;
		}
	}

	#region if the player is within the chase range
	var distToPlayer = distance_to_object(player);
	if ((distToPlayer < mydisengagerange) && (distToPlayer > mycombatrange)) {
		if (sprite_index != mywalksprite) sprite_index = mywalksprite; //change to run sprite later
		if (player.x < id.x) {
			image_xscale = 1;
			hsp = -1 * runspd;	
		} else if (player.x > id.x) {
			image_xscale = -1;
			hsp = runspd;	
		}

	
		x += hsp;
	} 

	#endregion



	else if ((distToPlayer > mydisengagerange) || (player == noone)) mystate = ENEMYSTATE.idle;
	else if (distToPlayer <= mycombatrange) {
	
		attacktimeron = true;
		mystate = ENEMYSTATE.combat;
	
	}
	
} else mystate = ENEMYSTATE.idle;
