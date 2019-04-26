if (alert) {
	instance_create_layer(id.x,id.y-150,"guilayer",obj_alertnotice);
	soundchoice = choose(snd_alert0,snd_alert1,snd_alert2,snd_alert3,snd_alert4);
	audio_play_sound(soundchoice,-10,false);
	var player = noone;
	if (instance_exists(obj_player)) player = obj_player.id;
	else player = id;
	with (player) {
		if (outofcombat) outofcombat = false;
	}
	var playerdir = 1;
	var rawdir = point_direction(id.x,id.y,player.x,player.y);
	if ((rawdir <= 90) || (rawdir >= 270)) playerdir = 1; else playerdir = -1;
	hsp = -6 * playerdir;
	image_xscale = -1 * playerdir;
	
	vsp = -3;
	
	alert = false;
}

if (abs(hsp) > 0) hsp = approach(hsp,0,0.4);

alerttimer--;

if (alerttimer <= 0) {
	mystate = ENEMYSTATE.chase;
}
