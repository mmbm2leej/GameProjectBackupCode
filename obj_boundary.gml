//CREATE

image_alpha = 0;




//STEP

if (instance_exists(obj_debug)) {
	if (obj_debug.debugmode) {
		image_alpha = 1;	
	} else image_alpha = 0;
}
