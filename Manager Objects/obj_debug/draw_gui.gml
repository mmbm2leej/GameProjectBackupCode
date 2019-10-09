#region Debug Display via F1

if (debugmode) {
	draw_set_colour(c_red);


	draw_text(32,	linesep,		"Current room: ");
	draw_text(192,	linesep,		room_get_name(room));
	
	if (playerexists) {
		draw_text(32,	linesep * 2,	"Player State: ");
		switch (obj_player.mystate) {
			case 0: draw_text(192,	linesep * 2,	"Free"); break; 
			case 1: draw_text(192,	linesep * 2,	"Melee"); break; 
			case 2: draw_text(192,	linesep * 2,	"MeleeCombo"); break; 
			case 3: draw_text(192,	linesep * 2,	"Ranged"); break; 
			case 4: draw_text(192,	linesep * 2,	"Longidle"); break; 
			case 5: draw_text(192,	linesep * 2,	"Death"); break;
			case 6:	draw_text(192,	linesep * 2,	"jumprise"); break;
			case 7:	draw_text(192,	linesep * 2,	"speaking"); break;
			case 8:	draw_text(192,	linesep * 2,	"fall"); break;
			case 9:	draw_text(192,	linesep * 2,	"tookdmg"); 
		}
		
	
		draw_text(32,	linesep * 3,	"Player X:");
		draw_text(160,	linesep * 3,	obj_player.x);
	
		draw_text(32,	linesep * 4,	"Player Y:");
		draw_text(160,	linesep * 4,	obj_player.y);
	
		draw_text(32,	linesep * 5,	"Player HP:");
		draw_text(160,	linesep * 5,	global.playercurrenthp);
	
		draw_text(32,	linesep * 6,	"Player sprite:");
		draw_text(160,	linesep * 6,	obj_player.sprite_index);
	
		draw_text(32,	linesep * 7,	"Player hsp:");
		draw_text(160,	linesep * 7,	obj_player.hsp);
	
		draw_text(32,	linesep * 8,	"Player vsp:");
		draw_text(160,	linesep * 8,	obj_player.vsp);
		
		draw_text(32,	linesep * 10,	"Player currentatk:");
		draw_text(190,	linesep * 10,	obj_player.currentattack);

		draw_text(500,  linesep * 6,	"obj_player.mask_index :");
		draw_text(700,  linesep * 6,	obj_player.mask_index);
		
		draw_text(32,	linesep * 11,	"Real FPS:");
		draw_text(190,	linesep * 11,	trackedfps);
		
		draw_text(32,	linesep * 12,	"dialoguemgr.cs_dialoguetext:");
		draw_text(260,	linesep * 12,	obj_dialogmgr.cs_dialoguetext);
		
		draw_text(32,	linesep * 13,	"dialoguemgr.playerpartner:");
		draw_text(280,	linesep * 13,	obj_dialogmgr.cs_source);
	
	}
	
	draw_text(32,	linesep * 9,	"obj_roomsequence.doTransition:");
	draw_text(300,	linesep * 9,	obj_roomsequence.doTransition);
	
	draw_text(500,	linesep * 2,	"obj_camera.x and .y :");
	if (instance_exists(obj_camera)) {
		draw_text(500,	linesep * 3,	obj_camera.x);
		draw_text(600,	linesep * 3,	obj_camera.y);
	}
	
	
	draw_text(500,	linesep * 4,	"obj_musicmanager.sync :");
	if (instance_exists(obj_musicmanager)) {
		draw_text(700,	linesep * 4,	obj_musicmanager.sync);
	}
	
	
	draw_text(500,	linesep * 5,	"obj_combosys.combocurrent :");
	if (instance_exists(obj_combosys)) {
		draw_text(740,	linesep * 5,	obj_combosys.combocurrent);
	}


	
	draw_text(500,  linesep * 7,	"Current XP :");
	draw_text(500,  linesep * 8,	"Next level XP :");
	if (instance_exists(obj_globalvarbank))	{
		draw_text(700,  linesep * 8,	global.playernextlevelxp);
		draw_text(700,  linesep * 7,	global.playerxpcurrent);
	}
	
	
}

#endregion 

#region Debug Display via F3 (F2 is fullscreen)
if (debugpage2mode) {
	draw_set_colour(c_red);
	if (playerexists) {
		draw_text(32,	linesep,		"Obj_player.outofcombat: ");
		draw_text(230,	linesep,		obj_player.outofcombat);
		draw_text(32,	linesep * 10,	"Obj_player.invincible: ");
		draw_text(230,	linesep * 10,	obj_player.invincible);
	}
	
	if (instance_exists(obj_dbox)) {
		draw_text(32,	linesep	* 2,	"Obj_dbox.message_current: ");
		draw_text(248,	linesep * 2,	obj_dbox.message_current);
		draw_text(32,	linesep	* 3,	"Obj_dbox.message_end: ");
		draw_text(248,	linesep * 3,	obj_dbox.message_end);
		draw_text(32,	linesep	* 4,	"Obj_dbox.dialogueComplete: ");
		draw_text(248,	linesep * 4,	obj_dbox.dialogueComplete);
		draw_text(32,	linesep	* 5,	"Obj_dbox.activePortrait: ");
		draw_text(248,	linesep * 5,	obj_dbox.activePortrait);
		draw_text(32,	linesep	* 6,	"obj_dialogmgr.cs_portSequence: ");
		draw_text(248,	linesep * 6,	obj_dialogmgr.cs_portSequence);
		draw_text(32,	linesep	* 7,	"obj_dialogmgr.dialoguestate: ");
		draw_text(248,	linesep * 7,	obj_dialogmgr.dialoguestate);
		draw_text(32,	linesep	* 8,	"obj_dbox.dboxActive: ");
		draw_text(248,	linesep * 8,	obj_dbox.dboxActive);
		draw_text(32,	linesep	* 9,	"obj_dbox.dboxReady: ");
		draw_text(248,	linesep * 9,	obj_dbox.dboxReady);
		
	}
	


	draw_set_colour(c_white);
}


#endregion
