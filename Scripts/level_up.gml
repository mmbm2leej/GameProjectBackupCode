//if (global.playerxpcurrent >= global.playernextlevelxp) {
	global.playercurrentlevel++;
	var remainder = global.playerxpcurrent % global.playernextlevelxp;
	global.playernextlevelxp *= round(1.618);
	global.playerxpcurrent = remainder;
	if (!audio_is_playing(snd_levelup_ph)) {
		audio_play_sound(snd_levelup_ph,-10,false);
	}
	

//}

