
#region Player Stats
global.playermaxhp = 60;
global.playercurrenthp = global.playermaxhp;
global.playerhpregentimermax = 180;
global.playerhpregentimer = global.playerhpregentimermax;
global.playerhpregen = 0.2;
global.playerdamageresist = 0;
global.playerspdcoeff = 0;
global.playercandash = false;
global.playercandbljump = false;
global.playerattackspd = 1;	//should think of a cap, might work as a multiple of the melee animation speed, as long as it shortens the duration of melee state.
global.playermeleedamage = 10; // ballance this later
global.playerdmgoutputmax = 0;
global.playerdmgboostcoeff = 0;
global.playertenacity = 0;
global.playerluck = 0;
global.playerparrychance = 0;
global.playerpowermax = 50;
global.playerpowercurrent = global.playerpowermax;
global.playerxpcurrent = 0;
global.playernextlevelxp = 100;
global.playercurrentlevel = 1;
global.playerMoney = 0;

#endregion

#region Player Glove Node Types
enum NODETYPE {
	none = 0,
	attack = 1,
	heal = 2,
	comboup = 3,
	decaystop = 4,
	defense = 5
}

#endregion

#region NPC stats and Behaviors

enum NPCSTATES {
	idle = 0,
	speaking = 1
}

/*
[		0,			1,					2,					3,					4,					]
[		name,		spridle,			spr_walk,			spr_run/chase,							]	
[0		Tess		spr_tess_idle		spr_tess_walk							spr_tessdialogue	]	
[1		Waelen		spr_waelen_idle		spr_waelen_walk												]	
[2		Vashya		spr_vashya_idle		spr_vashya_walk												]		
[3		Elder		spr_villageldr_idle	spr_villageldr_walk											]
*/

//Create the NPC database
global.ds_NPCDB = ds_grid_create(5,5);

#endregion

#region Fill database with NPC info

//Tess
ds_grid_set(global.ds_NPCDB,0,0,"Tess");
ds_grid_set(global.ds_NPCDB,1,0,spr_tess_idle);
ds_grid_set(global.ds_NPCDB,2,0,spr_tess_walk);
ds_grid_set(global.ds_NPCDB,3,0,-1);		//update this when we get sprites for chasing/running
ds_grid_set(global.ds_NPCDB,4,0,spr_tessdialogue);

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

//LootboxNPC
ds_grid_set(global.ds_NPCDB,0,4,"Scumbag");
ds_grid_set(global.ds_NPCDB,1,4,spr_scumbag);
ds_grid_set(global.ds_NPCDB,2,4,spr_scumbag);
ds_grid_set(global.ds_NPCDB,3,4,-1);		//update this when we get sprites for chasing/running



#endregion

#region General Enemy Stats and Behaviors
global.enemydifficultymodifier = 1;
global.playable = false;

enum ENEMYSTATE {
	idle = 0,	
	chase = 1,
	combat = 2,
	flee = 3,
	takingdmg = 4,
	death = 5,
	alert = 6
}

#endregion
/*
[		0,			1,					2,				3,						4,			5			6,			7			8			]
[		name,		spridle,			spr_walk,		spr_run/chase,			hp,			damage,		walkspd,	runspd		xpworth		]
[0		hellbird	spr_hellbirdidle	spr_hellbirdwalk						20			5			1.4			3			15			]
[1		spikehound	spr_shidle			spr_shwalk								40			10			1.5			4			20			]
*/

//Create Enemy masterlist database
global.ds_ENEMYDB = ds_grid_create(9,2);	//Currently 8 aspects, 2 types

#region Fill the database with enemy info

#region Hellbird Data
ds_grid_set(global.ds_ENEMYDB, 0, 0, "Hellbird");
ds_grid_set(global.ds_ENEMYDB, 1, 0, spr_hellbirdidle);
ds_grid_set(global.ds_ENEMYDB, 2, 0, spr_hellbirdwalk);
ds_grid_set(global.ds_ENEMYDB, 3, 0, spr_hellbirdwalk); // change this to a run later
ds_grid_set(global.ds_ENEMYDB, 4, 0, 20);
ds_grid_set(global.ds_ENEMYDB, 5, 0, 5);
ds_grid_set(global.ds_ENEMYDB, 6, 0, 1);
ds_grid_set(global.ds_ENEMYDB, 7, 0, 3);
ds_grid_set(global.ds_ENEMYDB, 8, 0, 15);
#endregion

#region Spikehound Data
ds_grid_set(global.ds_ENEMYDB, 0, 1, "Spike Hound");
ds_grid_set(global.ds_ENEMYDB, 1, 1, spr_shidle);
ds_grid_set(global.ds_ENEMYDB, 2, 1, spr_shwalk);
ds_grid_set(global.ds_ENEMYDB, 3, 1, spr_shwalk); // change this to a run later
ds_grid_set(global.ds_ENEMYDB, 4, 1, 40);
ds_grid_set(global.ds_ENEMYDB, 5, 1, 10);
ds_grid_set(global.ds_ENEMYDB, 6, 1, 1.5);
ds_grid_set(global.ds_ENEMYDB, 7, 1, 4);
ds_grid_set(global.ds_ENEMYDB, 8, 1, 20);
#endregion

#endregion

if (!instance_exists(obj_enemyspawner)) instance_create_layer(x,y,"managerlayer",obj_enemyspawner);

//Game Window and Status

#region Player Inventory

global.InvWidth = 5;
global.playerInventory = ds_grid_create(global.InvWidth, 1);


#endregion

#region Cutscene DB

#region Cave Entrance Cutscenes

caveentrance_cutsceneplayed = 
[false,		//When character enters the cave for the first time
false,		//Remarks fruit is scarce
false,		//Notice Miniboss in room
false,		//After defeating Miniboss
false,		//Finding the fruit
false];		//Right before exiting the cave




#endregion

#endregion
