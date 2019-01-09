//CREATE

#region Movement Variables
hsp = 0;
vsp = 0;
walkspd = 4;
runspd = 7;
movespd = walkspd;
gravdefault = 0.2;
grav = gravdefault;
jumpspd = 8;
currentface = 1;
idletimermax = 600;
idletimer = idletimermax;

enum PLAYERSTATE {
	free = 0,
	melee = 1,
	ranged = 2,
	jump = 3,
	fall = 4
}


didshoot = false;
shooting = false;
jumping = false;
landing = false;

mystate = PLAYERSTATE.free;


#endregion


#region Player stats

myhealth = 30;
tookrecenthit = false;


#endregion




//STEP

#region All user inputs
input_left = (keyboard_check(ord("A")));
input_right = (keyboard_check(ord("D")));
input_jump = (keyboard_check_pressed(vk_space));
toggle_runwalk = (keyboard_check_pressed(vk_shift));
input_shoot = (mouse_check_button_pressed(mb_left));

input_interact = (keyboard_check_pressed(ord("E")));
#endregion


#region Toggling
//Toggling run and walk
if (toggle_runwalk) {
	if (movespd == walkspd) movespd = runspd; else movespd = walkspd;
}
#endregion


#region Horizontal Movement

if (mystate == PLAYERSTATE.free) {
	playerfree();
}

//Horizontal Movement
/*
if (!place_meeting(x+hsp,y,obj_boundary)) {
*/

/*
} else if (!place_meeting(x+(sign(hsp)),y,obj_boundary)) x += sign(hsp);	
*/
	
#endregion


#region Horizontal Collision(commented out)
/*
if (place_meeting(x + hsp,y, obj_obstacle)) {	//need to create an obj_obstacle
	while (!place_meeting(x+sign(hsp),y,obj_obstacle)) {
		x += sign(hsp);
	}
}

*/
#endregion


#region Gravity and Vertical Collision(below)

if (!place_meeting(id.x,id.y+1,obj_boundary)) {
	vsp += grav;
} else {
	vsp = 0;
	image_xscale = currentface;
}

#endregion


#region Jump & Fall

if (mystate == PLAYERSTATE.jump) {
	playerjump(); 
}

if (mystate == PLAYERSTATE.fall) {
	playerfall();
}

#endregion


#region Things that Happen regardless of state
idletimer--;

if ((input_jump) || (input_left) || (input_right)) {
	idletimer = idletimermax;	
}

if (idletimer < 0) {
	sprite_index = spr_codalongidle;
	image_xscale = currentface;
	if (image_index < 84) {
		image_speed = 1;	
	} else {
		image_speed = 0;
		image_index = 85;
	}
}

//Footstep sound loop
if (place_meeting(x,y+1,obj_boundary) && (abs(hsp) > 0)) {
	if (!audio_is_playing(snd_footstep_ph)) {
		audio_play_sound(snd_footstep_ph,10,true);
	}
} else {
	if (audio_is_playing(snd_footstep_ph)) {
		audio_stop_sound(snd_footstep_ph);	
	}
	
}


//Put up the health bar HUD if there isnt one
if (!instance_exists(obj_healthbar)) instance_create_layer(0,0, "managerlayer",obj_healthbar);


#endregion


#region Interacting with NPCs

if ((place_meeting(x,y,obj_npc)) && (input_interact)) {
	var partner = instance_place(x,y,obj_npc);
	with (partner) mystate = NPCSTATES.speaking;
	
}


#endregion


#region Attacking Enemies

if (mystate == PLAYERSTATE.melee) {
	playermeleeatk();
}

if (mystate == PLAYERSTATE.ranged) {
	playerrangedatk();
}



#endregion


#region Taking on the true hp

if (instance_exists(obj_globalvarbank)) {

myhealth = global.playercurrenthp;
	
}


#endregion


#region Take Damage

if (keyboard_check_pressed(ord("O"))) {
	global.playercurrenthp -= 10;		//simulate taking damage
	tookrecenthit = true;
}

if (tookrecenthit) {
	global.playerhpregentimer--;
	
	if (global.playerhpregentimer < 0) {
		tookrecenthit = false;
	}
	
}

if (!tookrecenthit) {
	global.playerhpregentimer = global.playerhpregentimermax;
	global.playercurrenthp = approach(global.playercurrenthp, global.playermaxhp, global.playerhpregen);
}

#endregion




