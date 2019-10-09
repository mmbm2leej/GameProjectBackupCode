#region Box Variables
dboxsprite = spr_dialogboxph;
dboxWidth = sprite_get_width(dboxsprite);
dboxActive = false;
dboxReady = false;
dbox_yInactive = global.gameHeight*(1.5);
dbox_yActive = global.gameHeight - 64;
dboxalpha = 0;
currentdbox_y = dbox_yInactive;
#endregion

#region Portrait Variables
portraitleft = spr_dialoguespriteph;
portraitright = spr_dialoguespriteph;
portraitleftx = 150;
portraitrightx = global.gameWidth - 150;
portleftalpha = 0;
portrightalpha = 0;
portraitWidth = sprite_get_width(portraitleft);
portraitY = dbox_yActive - sprite_get_height(dboxsprite);
speakerLeftSound = noone;
speakerRightSound = noone;
activePortrait = 0;		//will be 0-none, 1-right, 2-left
#endregion

#region Typewriter Variables

messageSet = noone;
speakerSet = noone;
portraitSequence = noone;
message_current = 0; //0 is the first number in our array, and the message we are currently at
message_end = 0; //6 is the last number in our array
message_draw = ""; //this is what we 'write' out. It's blank right now
increase = 0.5; //the speed at which new characters are added
characters = 0; //how many characters have already been drawn
hold = 0; //if we hold 'Z', the text will render faster

dialogueComplete = false;

#endregion
