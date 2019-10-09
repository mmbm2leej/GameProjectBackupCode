var interactkey = keyboard_check_pressed(ord("E"));

#region Update Coordinates based on view
dbox_yInactive = global.gameHeight*(1.5);
dbox_yActive = global.gameHeight - 32;
portraitY = dbox_yActive - sprite_get_height(dboxsprite);

#endregion

#region Active and Ready States

if (dboxActive) {
	if (!dboxReady) {
		//become ready (set everything up)
		
		#region The box
		currentdbox_y += (dbox_yActive - currentdbox_y)/10;
		dboxalpha = approach(dboxalpha,1, 0.1);
		
		#endregion
		

		if	(	 (abs(dbox_yActive - currentdbox_y) < 1) && (dboxalpha == 1)		) {
			dboxReady = true;
		}
	}
} else {
	portleftalpha = approach(portleftalpha,0,0.1);
	portrightalpha = approach(portrightalpha,0,0.1);
	if (dboxReady) {
		//become not ready	(shut everything away)
		
		#region The box
		currentdbox_y += (dbox_yInactive-currentdbox_y)/10;
		dboxalpha = approach(dboxalpha,0, 0.1);
		
		#endregion
		
		#region The Portraits

		
		#endregion
		
		if (	(currentdbox_y == dbox_yInactive) && (dboxalpha == 0) && (portleftalpha == 0) && (portrightalpha == 0)	) {

			dboxReady = false;
			instance_destroy();
		}
		
	}
}

#endregion


#region Typewriter 

if (dboxReady) {
	#region Portraits
	activePortrait = portraitSequence[message_current];
	if (!dialogueComplete) {
		if (activePortrait == 1) {	//right active
			portleftalpha = approach(portleftalpha,0,0.1);
			portrightalpha = approach(portrightalpha,1,0.1);	
		
		} else if (activePortrait == 2) {	//left active
			portleftalpha = approach(portleftalpha,1,0.1);
			portrightalpha = approach(portrightalpha,0,0.1);
		
		} else {	//if (activePortrait == 0) {
			portleftalpha = approach(portleftalpha,0,0.1);
			portrightalpha = approach(portrightalpha,0,0.1);
		}
	} else {
		portleftalpha = approach(portleftalpha,0,0.1);
		portrightalpha = approach(portrightalpha,0,0.1);
	}

	#endregion
	
	var message_length = string_length(messageSet[message_current]); //get the number of characters in the first message
	if (characters < message_length) { //if current character count is less than the amount in current message* 
	    hold = keyboard_check(ord("Z")) * 5; //hold is true or false if we hold 'Z' or not
		
		#region Play Voice Sound
		
		if (speakerSet[message_current] == "Coda") {
			if (!audio_is_playing(snd_coda_text)) audio_play_sound(snd_coda_text,0,false);			
		}
		if (speakerSet[message_current] == "Tess") {
			if (!audio_is_playing(snd_tess_text)) audio_play_sound(snd_tess_text,0,false);			
		}
		if (speakerSet[message_current] == "Elder") || (speakerSet[message_current] == "Mom") {
			if (!audio_is_playing(snd_elder_text)) audio_play_sound(snd_elder_text,0,false);
		}
		
		#endregion
		
	    characters += increase * (1 + hold); //increase speed based on hold
	    message_draw = string_copy(messageSet[message_current], 0, characters); //copy string to current character
	} else { //if current character is more than the amount in the current message
	    if (interactkey) { //if we press E
	        if (message_current < message_end) { //if there are more messages left to show (0 -> 6, in our case)
	            message_current++; //increase the message by 1
	            message_length = string_length(messageSet[message_current]);  //get the new character length for message
	            characters = 0; //set the characters back to 0
	            message_draw = ""; //clear the drawn text
	        } else { //if our messages are done (we reach 10, in our case)...
				message_draw = "";
	            dialogueComplete = true;
	        }
	    }
	}
}


#endregion

#region Interacting with the dialogmgr
if (dialogueComplete) {
	if (!obj_dialogmgr.dialoguestate) dboxActive = false;
}


#endregion
