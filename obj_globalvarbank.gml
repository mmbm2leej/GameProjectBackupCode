//CREATE


#region Player Stats
global.playermaxhp = 80;
global.playercurrenthp = global.playermaxhp;
global.playerhpregentimermax = 180;
global.playerhpregentimer = global.playerhpregentimermax;
global.playerhpregen = 0.5;
global.playerdamageresist = 0;
global.playerspdcoeff = 0;
global.playercandash = false;
global.playercandbljump = false;
global.playerattackspd = 0;
global.playerdmgoutputmax = 0;
global.playerdmgboostcoeff = 0;
global.playertenacity = 0;
global.playerluck = 0;
global.playerparrychance = 0;

#endregion



#region NPC stats and Behaviors

enum NPCSTATES {
	idle = 0,
	speaking = 1
}

/*
[		0,			1,					2,					3,				]
[		name,		spridle,			spr_walk,			spr_run/chase,	]	
[0		Tess		spr_tess_idle		spr_tess_walk						]	
[1		Waelen		spr_waelen_idle		spr_waelen_walk						]	
[2		Vashya		spr_vashya_idle		spr_vashya_walk						]		
[3		Elder		spr_villageldr_idle	spr_villageldr_walk					]
*/

//Create the NPC database
global.ds_NPCDB = ds_grid_create(4,4);

#endregion

#region Fill database with NPC info

//Tess
ds_grid_set(global.ds_NPCDB,0,0,"Tess");
ds_grid_set(global.ds_NPCDB,1,0,spr_tess_idle);
ds_grid_set(global.ds_NPCDB,2,0,spr_tess_walk);
ds_grid_set(global.ds_NPCDB,3,0,-1);		//update this when we get sprites for chasing/running

//Wahlen
ds_grid_set(global.ds_NPCDB,0,1,"Waelen");
ds_grid_set(global.ds_NPCDB,1,1,spr_waelen_idle);
ds_grid_set(global.ds_NPCDB,2,1,spr_waelen_walk);
ds_grid_set(global.ds_NPCDB,3,1,-1);		//update this when we get sprites for chasing/running

//Vashya
ds_grid_set(global.ds_NPCDB,0,2,"Vashya");
ds_grid_set(global.ds_NPCDB,1,2,spr_vashya_idle);
ds_grid_set(global.ds_NPCDB,2,2,spr_vashya_walk);
ds_grid_set(global.ds_NPCDB,3,2,-1);		//update this when we get sprites for chasing/running

//Elder
ds_grid_set(global.ds_NPCDB,0,3,"Elder");
ds_grid_set(global.ds_NPCDB,1,3,spr_villageldr_idle);
ds_grid_set(global.ds_NPCDB,2,3,spr_villageldr_walk);
ds_grid_set(global.ds_NPCDB,3,3,-1);		//update this when we get sprites for chasing/running




#endregion

#region General Enemy Stats and Behaviors
global.enemydifficultymodifier = 1;




enum ENEMYSTATE {
	idle = 0,	
	wander = 1,
	chase = 2,
	combat = 3,
	flee = 4
}

#endregion
/*
[		0,			1,					2,				3,						4,			5			6,			7]
[		name,		spridle,			spr_walk,		spr_run/chase,			hp,			damage,		walkspd,	runspd]
[0		hellbird	spr_hellbirdidle	spr_hellbirdwalk						20			5			3			8]
[1		spikehound	spr_shidle			spr_shwalk								40			10			4			9]
*/

//Create Enemy masterlist database
global.ds_ENEMYDB = ds_grid_create(8,2);	//Currently 8 aspects, 2 types

#region Fill the database with enemy info

//Hellbird Enemy
ds_grid_set(global.ds_ENEMYDB,0,0,"HellBird");
ds_grid_set(global.ds_ENEMYDB,1,0,spr_hellbirdidle);
ds_grid_set(global.ds_ENEMYDB,2,0,spr_hellbirdwalk);
ds_grid_set(global.ds_ENEMYDB,3,0,-1);		//update this when we get sprites for chasing/running
ds_grid_set(global.ds_ENEMYDB,4,0,20);
ds_grid_set(global.ds_ENEMYDB,5,0,5);
ds_grid_set(global.ds_ENEMYDB,6,0,3);
ds_grid_set(global.ds_ENEMYDB,7,0,8);


//SpikeHound Enemy
ds_grid_set(global.ds_ENEMYDB,0,1,"SpikeHound");
ds_grid_set(global.ds_ENEMYDB,1,1,spr_shidle);
ds_grid_set(global.ds_ENEMYDB,2,1,spr_shwalk);
ds_grid_set(global.ds_ENEMYDB,3,1,-1);		//update this when we get sprites for chasing/running
ds_grid_set(global.ds_ENEMYDB,4,1,40);
ds_grid_set(global.ds_ENEMYDB,5,1,10);
ds_grid_set(global.ds_ENEMYDB,6,1,4);
ds_grid_set(global.ds_ENEMYDB,7,1,9);

#endregion

if (!instance_exists(obj_enemyspawner)) instance_create_layer(x,y,"managerlayer",obj_enemyspawner);

//Game Window and Status










//CLEAN UP

ds_grid_destroy(global.ds_ENEMYDB);
ds_grid_destroy(global.ds_NPCDB);






