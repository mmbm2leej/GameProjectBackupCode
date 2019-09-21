if (obj_player.mystate != PLAYERSTATE.death) {

	hsp = 0;

	if (attacktimeron) {
		alarm[1] = myattacktimer;
		attacktimeron = false;
	}

	if (instance_exists(obj_player)) var player = obj_player.id;
	else { var player = noone; }
	if (player != noone) {
		with (player) {
			if (outofcombat) outofcombat = false;
		}
	}

	var distToPlayer = distance_to_object(player);
	if (	(distToPlayer < mycombatdisengage)		&&		((distToPlayer - mycombatrange) <= 0)	) {
	
		if (canattack) {
			if (!(obj_player.invincible)) {
				//Attack animation
				//Calculate damage to player
				global.playercurrenthp -= mydamage;
				var hspmodifier = 0.4;
				var knockback = myknockback;
				var knockup = myknockup;
				if (id.x >= obj_player.x) hspmodifier = -0.4; 
				with (obj_player) {
					hsp += (hspmodifier * knockback);
					vsp += ( -1 * (knockup) );
					outofcombat = false;
					tookrecenthit = true;
					invincible = true;
					mystate = PLAYERSTATE.tookdmg;
					alarm[0] = 30;
				}
			}
			alarm[1] = myattacktimer;
			canattack = false;
	
		}
	
	
	}

	if ( (distToPlayer > mycombatdisengage) && (distToPlayer < mydisengagerange) ) mystate = ENEMYSTATE.chase;
	else if (distToPlayer > mydisengagerange) mystate = ENEMYSTATE.idle;
	
} else mystate = ENEMYSTATE.idle;
