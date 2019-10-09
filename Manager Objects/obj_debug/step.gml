if (keyboard_check_pressed(vk_f1)) {
	debugmode = !debugmode;
}

if (keyboard_check_pressed(vk_f3)) {
	debugpage2mode = !debugpage2mode;
}

if (instance_exists(obj_player)) {
	playerexists = true;
} else playerexists = false;

if (fpsinterval > 0) fpsinterval--;
else { 
	trackedfps = fps_real;
	fpsinterval = fpsintervalmax;
}

if (debugmode) show_debug_overlay(true); else show_debug_overlay(false);
	
