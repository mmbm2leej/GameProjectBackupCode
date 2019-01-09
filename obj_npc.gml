//CREATE

myname = noone;
mywalksprite = noone;
myrunsprite = noone;
myidlesprite = noone;
mystate = NPCSTATES.idle;

vsp = 0;
hsp = 0;
grav = 0.1;
currentface = 1;
idlechoice = 0;
walkdirchoice = -1;
walkspd = 3;


myleftboundary = id.x-100;
myrightboundary = id.x+100;

alarm[0] = 120;




//STEP

if (mystate == NPCSTATES.idle) {
	if (idlechoice < 2) {	//stand still
		sprite_index = myidlesprite;
	} else {	//walk
			sprite_index = mywalksprite;
			currentface = walkdirchoice;
			hsp = (walkspd * walkdirchoice);		
	}
}

	

#region Gravity and Vertical Collision

if (!place_meeting(id.x,id.y+1,obj_boundary)) {
	vsp += grav;
} else {
	vsp = 0;
	image_xscale = currentface;
}



#endregion

x += hsp;
y += vsp;





//ALARM[0]

hsp = 0;

if (id.x < myleftboundary) walkdirchoice = 1;
else if (id.x > myrightboundary) walkdirchoice = -1;
else walkdirchoice = choose(-1,1);
idlechoice = choose(0,1,2);

alarm[0] = 300;
