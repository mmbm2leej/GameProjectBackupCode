//CREATE

mydamage = 8;
hitonce = false;


//STEP

if (image_index >= 6) {
	instance_destroy();
}



//collision w obj_enemy

var partner = instance_place(x,y,obj_enemy);
var currentmydmg = mydamage;

if (!hitonce) {
	with (partner) {
		myhp -= currentmydmg;
	}
	hitonce = true;
}
