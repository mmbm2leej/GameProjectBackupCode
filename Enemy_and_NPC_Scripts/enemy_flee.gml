if (obj_player.mystate != PLAYERSTATE.death) {

	var player = playerid();
	var distplayer = abs(player.x - id.x);
	if (sprite_index != mywalksprite) sprite_index = mywalksprite; //change to run sprite later

	if (distplayer < mydisengagerange) {
	
		if (player.x < id.x) {
			//run right
			hsp = runspd;
			image_xscale = -1;
		}
	
		else if (player.x > id.x) {
			//run left
			hsp = -1 * runspd;
			image_xscale = 1;
		}
	
	} else {
		mystate = ENEMYSTATE.idle;
	}

#region Unless colliding with boundary, move
	if (place_meeting(x+hsp,y,obj_wallboundary)) {
		while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
			x += sign(hsp);	
		}
		hsp = 0;		//this is causing sprite to collide with the floor
	} else {
		x += hsp;
	}
#endregion

} else mystate = ENEMYSTATE.idle;
