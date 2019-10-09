if (instance_exists(obj_debug)) {
	if (obj_debug.debugmode) {
		image_alpha = 1;	
	} else image_alpha = 0;
}


if (watched) {
	
	if (amBossTrigger) {
		alarm[0] = 240;
		amBossTrigger = false;		//it used up the trigger ONCE
	}
}
if (place_meeting(x,y,obj_player)) {
	if (id == inst_1602145D) {
		with (obj_player) inBossFight = true;
	}
}
