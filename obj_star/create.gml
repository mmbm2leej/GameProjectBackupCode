alpha = 0;
clr = choose(c_blue,c_aqua,c_red,c_yellow,c_green,c_lime,c_white,c_fuchsia,c_orange);
flickertimer = irandom_range(120,300);
sizerandom = random_range(0.1,1);
rando_culltime = irandom_range(120,500);
born = true;

camx = 0;
bornx = id.x;

if (instance_exists(obj_camera)) {
camx = obj_camera.x;
camy = obj_camera.y;
}
differencex = id.x - camx;
differencey = id.y - camy;
