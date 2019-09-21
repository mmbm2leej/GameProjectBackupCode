//CREATE

image_speed = 0;
image_index = 0;

boostdelaytimermax = 60;
boostdelaytimer = boostdelaytimermax;

boostvalue = -16;


//STEP

if (place_meeting(x,y,obj_player)) {
	boostdelaytimer--;
	if (!animation_end()) image_speed = 1; else image_speed = 0;
	if (boostdelaytimer <= 0) {
		var boost = boostvalue;
		with (obj_player) {
			vsp = boost;
		}
	}

}
else {
	boostdelaytimer = boostdelaytimermax;
	
	//change to sleep animation
	image_speed = 0;
	image_index = 0;
}

