//CREATE

#region Type determination
//will have to make this conditional depending on the environment/room
myspawnchoice = choose(0,1);

myname = ds_grid_get(global.ds_ENEMYDB,0,myspawnchoice);
myidlesprite = ds_grid_get(global.ds_ENEMYDB,1,myspawnchoice);
mywalksprite = ds_grid_get(global.ds_ENEMYDB,2,myspawnchoice);
myrunsprite = noone;	//update this when we get running/chase sprites
myhp = ds_grid_get(global.ds_ENEMYDB,4,myspawnchoice);
mydamage = ds_grid_get(global.ds_ENEMYDB,5,myspawnchoice);
mywalkspd = ds_grid_get(global.ds_ENEMYDB,6,myspawnchoice);
myrunspd = ds_grid_get(global.ds_ENEMYDB,7,myspawnchoice);

#endregion


#region State Machine
mystate = ENEMYSTATE.idle;



#endregion



//STEP

#region Always happens
if (!place_meeting(x,y+1, obj_boundary)) {
	y++;	
}





#endregion

#region State Commands

if (mystate == ENEMYSTATE.idle) {
	sprite_index = myidlesprite;
	
}

if (mystate == ENEMYSTATE.wander) {
	sprite_index = mywalksprite;
	
}

if (mystate == ENEMYSTATE.chase) {
	sprite_index = mywalksprite;		//change this to a running/chase sprite once received
	
	
}

if (mystate == ENEMYSTATE.combat) {
	
}

if (mystate == ENEMYSTATE.flee) {
	var player = (instance_nearest(x,y,obj_player));
	if (player.x < id.x) {
		;//run right 
	}
	
	else if (player.x > id.x) {
		;//run left
	}
	
	
}

#endregion

#region Taking damage

if (myhp <= 0) {
	//gotta add something for dropping xp and loot
	
	instance_destroy();	
}


#endregion





//OUTSIDE ROOM (for now)

instance_destroy();
