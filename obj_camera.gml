//CREATE

cam = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(960,540,1,10000);

camera_set_view_mat(cam,vm);
camera_set_proj_mat(cam,pm);

view_camera[0] = cam;

follow = obj_player;
xTo = x;
yTo = y;





//STEP

x += (xTo - x)/12;
y += (yTo - y)/12;

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y-160;
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


#endregion



var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(cam,vm);

id.y = clamp(y,280,(room_height-270));
