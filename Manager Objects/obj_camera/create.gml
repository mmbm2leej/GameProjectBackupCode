cam = camera_create();

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(960,540,1,10000);

camera_set_view_mat(cam,vm);
camera_set_proj_mat(cam,pm);

view_camera[0] = cam;

follow = noone;
xTo = x;
yTo = y;

shakemagnitude = 0;
shake = 0;
motionzoomrunmax_x = 100;
motionzoomrunmax_y = 60;
motionzoomrunx = 0;
motionzoomruny = 0;
camaheaddefault = -40;
camahead = camaheaddefault;
