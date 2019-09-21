
if (myidlechoice == 0) {
	sprite_index = myidlesprite;
	image_xscale = myidledirection;
	hsp = 0;
	
} else { //if the myidlechoice is 1
	if (sprite_index != mywalksprite) {
		sprite_index = mywalksprite;
	}
	
}
#region Horizontal Collision

if (place_meeting(x+hsp,y,obj_wallboundary)) {
	while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
		x += sign(hsp);	
	}
	hsp = 0;		//this is causing sprite to collide with the floor
} else {

	hsp = movespd * myidledirection;
	image_xscale = -1 * myidledirection;
	
}

#endregion

if	(	(instance_exists(obj_player))	&&		(obj_player.mystate != PLAYERSTATE.death)		) {
	var player = instance_find(obj_player,0);
	if (distance_to_object(player) < mydetectionrange) {
		alert = true;
		mystate = ENEMYSTATE.alert;	
	}


}
