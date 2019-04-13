#region Movement Variables
hsp = 0;
vsp = 0;
walkspd = 1;
runspd = 3;
movespd = walkspd;
gravdefault = 0.18;
grav = gravdefault;
jumpspd = -7;
currentface = 1;
idletimermax = 600;
idletimer = idletimermax;

enum PLAYERSTATE {
	free = 0,
	melee = 1,
	meleecombo = 2,
	ranged = 3,
	longidle = 4,
	death = 5,
	jumprise = 6,
	speaking = 7,
	fall = 8
}


didshoot = false;
shooting = false;
jumping = false;
landing = false;
outofcombat = true;

mystate = PLAYERSTATE.free;


#endregion


#region Player stats

myhealth = 30;
tookrecenthit = false;
laserpowercost = 8;


#endregion

#region Attack States
currentattack = 0;
currentattackrefreshtimermax = 60;
currentattackrefreshtimer = currentattackrefreshtimermax;


#endregion






//STEP
#region Inputs

input_left = (keyboard_check(ord("A")));
input_right = (keyboard_check(ord("D")));
input_jump = (keyboard_check_pressed(vk_space));
toggle_runwalk = (keyboard_check_pressed(vk_shift));
input_shoot = (mouse_check_button_pressed(mb_left));
input_melee = (mouse_check_button_pressed(mb_right) || (keyboard_check_pressed(ord("K"))));
input_interact = (keyboard_check_pressed(ord("E")));

#endregion

#region State system

	switch mystate {
		case PLAYERSTATE.free: playerfree(); break;
		case PLAYERSTATE.melee: playermeleeatk(); break;
		//case PLAYERSTATE.meleecombo: playermeleecombo(); break;
		case PLAYERSTATE.ranged: playerrangedatk(); break;
		case PLAYERSTATE.longidle: player_longidle(); break;
		case PLAYERSTATE.death: player_gameover(); break;
		case PLAYERSTATE.jumprise: player_jumprise(); break;
		case PLAYERSTATE.fall: player_fall(); break;
		case PLAYERSTATE.speaking: player_speak();
	}


#endregion


#region Gravity and Vertical Collision(below)

if (vsp <= 0) vsp += grav; else vsp += 2*grav;

if (place_meeting(x,y+vsp,obj_boundary)) {
	while (!place_meeting(x,y+sign(vsp),obj_boundary)) {
		y += sign(vsp);	
	}
	vsp = 0;		//this is causing sprite to collide with the floor
}


/*
if (!place_meeting(id.x,id.y+1,obj_boundary)) {
	if (vsp < 0) {
		vsp += grav;
	} else {
		vsp += 2*grav;
	}
} else {
	vsp = 0;
}
*/


#region Unsticking player object

if (place_meeting(x,y,obj_boundary)) {
	if (!place_meeting(x,id.bbox_top-1,obj_boundary)) {
		y--;	
	}
	
}


#endregion

#endregion




x += hsp;
y += vsp;

#region Taking damage

if (global.playercurrenthp < 0) global.playercurrenthp = 0;

if (keyboard_check_pressed(ord("O")) && (global.playercurrenthp > 0)) {		//Simulate taking damage
	global.playercurrenthp -= 10;
	tookrecenthit = true;
	global.playerhpregentimer = global.playerhpregentimermax;
}

if (mystate != PLAYERSTATE.death) {
	if ((outofcombat) && (tookrecenthit)) {
		global.playerhpregentimer--;
	
		if (global.playerhpregentimer < 0) {
			global.playercurrenthp = approach(global.playercurrenthp,global.playermaxhp,global.playerhpregen);
		
			if (global.playercurrenthp == global.playermaxhp) {
				tookrecenthit = false;	
			
			}
		}
	}
}



#endregion

#region Transitioning rooms

if (place_meeting(x,y, obj_transitionboundary)) {
	var partner = (instance_place(x,y,obj_transitionboundary));
	with (obj_roomsequence) {
		if (!doTransition) {
			targetRoom = partner.mytargetroom;
			targetx = partner.mytargetx;
			targety = partner.mytargety;
			doTransition = true;
		}
	}
	
}


#endregion


#region Death Sequence

if (global.playercurrenthp <= 0) {
	mystate = PLAYERSTATE.death;
	player_gameover();	
}

#endregion



