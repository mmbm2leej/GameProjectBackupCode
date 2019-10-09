 #region spawning the player

if ((gamestartspawn) && (!instance_exists(obj_player)) && (room == playareaAzaga)) {
	instance_create_layer(960,360,"characterlayer",obj_player);
} else {
	gamestartspawn = false;
}


#endregion


#region Objects regarding global variable bank

	if (!instance_exists(obj_globalvarbank)) {
		instance_create_layer(0,0,"managerlayer",obj_globalvarbank);
	} else {	//if the current game room is playable
		if (		(room != room0)			&&		(room != rm_mainmenu)		) {
			
			if (!instance_exists(obj_healthbar)) {
				instance_create_layer(0,0,"guilayer",obj_healthbar);	
			}
			
			if (!instance_exists(obj_powerbar)) {
				instance_create_layer(0,0,"guilayer",obj_powerbar);
			}
			
		}
		
	}


#endregion

if (!initloadok) {
	if (!instance_exists(obj_roomsequence)) instance_create_layer(0,0,"managerlayer",obj_roomsequence);
	if (!instance_exists(obj_globalvarbank)) instance_create_layer(0,0,"managerlayer",obj_globalvarbank);
	if (!instance_exists(obj_musicmanager)) instance_create_layer(0,0,"managerlayer",obj_musicmanager);
	if (!instance_exists(obj_debug)) instance_create_layer(0,0,"managerlayer",obj_debug);
	if (!instance_exists(obj_dialogmgr)) instance_create_layer(0,0,"managerlayer",obj_dialogmgr);
	if (!instance_exists(obj_xpmanager)) instance_create_layer(0,0,"managerlayer",obj_xpmanager);
	if (!instance_exists(obj_glovegui)) instance_create_layer(0,0,"managerlayer",obj_glovegui);
	if (!instance_exists(obj_combosys)) instance_create_layer(0,0,"managerlayer",obj_combosys);
	if (!instance_exists(obj_igmenu)) instance_create_layer(0,0,"managerlayer",obj_igmenu);
	if (!instance_exists(obj_damageIndicator)) instance_create_layer(0,0,"managerlayer",obj_damageIndicator);
	
	with (obj_roomsequence) initloadok = true;
	initloadok = true;
}

if (!instance_exists(obj_camera) && (!cutscene)) {
	instance_create_layer(0,0,"managerlayer",obj_camera);
}


	
#region Toggling the In Game Menu

//This might need a conditional based on the room is playable or not
if (keyboard_check_pressed(vk_escape)) {
	toggle_ig = !toggle_ig;
}

if (toggle_ig) {
	igmenu_on = !(igmenu_on);
	var igmenustate = igmenu_on;
	with (obj_igmenu) {
		thisState = igmenustate;
	}
	toggle_ig = false;
}

#endregion	
	
#region Toggling Fullscreen

if (keyboard_check_pressed(vk_f2)) {
   if (window_get_fullscreen()) window_set_fullscreen(false);
   else window_set_fullscreen(true);
}
   
#endregion

#region Game Over Sequence

	if (gameover) {
		if (gameovertimer > 0)	gameovertimer--;
		else gameoveralpha = approach(gameoveralpha,1,0.04);
		
		if (gameoveralpha >= 1) {
			with (obj_roomsequence) {
				targetRoom = rm_gameover;
				targetx = -1;
				targety = -1;
				doTransition = true;
			}
		}
		
	} else gameoveralpha = 0;


#endregion
