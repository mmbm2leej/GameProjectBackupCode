#region Shake test
//if (keyboard_check_pressed(ord("L"))) shakemagnitude = 10;

#endregion

x += (xTo - x)/12;
y += (yTo - y)/12;

if (follow != noone) {
	xTo = follow.x + camahead;
	yTo = follow.y-160;
}

if (instance_exists(obj_player)) {
	var player = instance_find(obj_player,0);
	var miniboss = instance_find(obj_miniboss01,0);
	if (obj_player.inBossFight)	{
			follow = noone;
			xTo = (obj_player.x + miniboss.x)/2;
			yTo = (obj_player.y + miniboss.y)/2;
	} else {
		follow = player;
	}
}

#region Parallax

#region Land Backgrounds
var bg0 = layer_get_id("bglayer0");
var bg1 = layer_get_id("bglayer1");
var bg2 = layer_get_id("bglayer2");
var bg3 = layer_get_id("bglayer3");

layer_x(bg0,obj_camera.x* 0.8);
layer_x(bg1,obj_camera.x* 0.9);
layer_x(bg2,obj_camera.x* 0.95);
layer_x(bg3,obj_camera.x);

#endregion 

#region Cloud Backgrounds

var cloudlow = layer_get_id("bglowcloud");
var cloudmid = layer_get_id("bgmidcloud");
var cloudhigh = layer_get_id("bghighcloud");


layer_x(cloudlow,obj_camera.x);
layer_x(cloudmid,obj_camera.x+500);
layer_x(cloudhigh,obj_camera.x+200);

#endregion

#region Zooms

if (instance_exists(obj_player)) {	
	if (	 (abs(obj_player.hsp) > 0)	 ||	 (abs(obj_player.vsp) > 0)	)  && (obj_player.movespd == obj_player.runspd) {
		camahead = -100 * obj_player.currentface;
		if (motionzoomrunx < motionzoomrunmax_x) {
			motionzoomrunx += 1.7;
		} else motionzoomrunx = motionzoomrunmax_x;
		
		if (motionzoomruny < motionzoomrunmax_y) {
			motionzoomruny++;
		} else motionzoomruny = motionzoomrunmax_y;
	
		//motionzoomrunmax = 200;
		//motionzoomrun = 0;
		
	} else {
		
		if (motionzoomrunx > 0) motionzoomrunx -= 1.7; else motionzoomrunx = 0;
		if (motionzoomruny > 0) motionzoomruny--; else motionzoomruny = 0;
		camahead = -40 * obj_player.currentface;
		
	}
}

camera_set_view_size(cam,960+motionzoomrunx,540+motionzoomruny);	

#endregion

#endregion

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(cam,vm);

id.x = clamp(x,540,room_width-540);
id.y = clamp(y,280,(room_height-270));



#region Shakes!
/*
if (shakemagnitude>0) {
	shake = irandom_range(-3,3);
	id.x += shake; id.y += shake;
	shakemagnitude = lerp(shakemagnitude,0,0.5);
} else {
	shake = 0;
}
*/

#endregion
