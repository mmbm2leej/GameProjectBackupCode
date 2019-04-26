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

x += hsp;
