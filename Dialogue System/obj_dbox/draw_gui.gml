var horizontalCenter = display_get_gui_width()/2;
var textStartX = horizontalCenter - (dboxWidth/2) + 32;
var boxTopY = currentdbox_y - 180;

//draw box
draw_sprite_ext(	dboxsprite,		0,	horizontalCenter,	currentdbox_y,	1,	1, 0, c_white, dboxalpha);

//draw left portrait
draw_sprite_ext(	portraitleft,	0,	portraitleftx,		portraitY,		1,	1, 0, c_white, portleftalpha);

//draw right portrait
draw_sprite_ext(	portraitright,	0,	portraitrightx,		portraitY,		-1,	1, 0, c_white, portrightalpha);



if (dboxReady) {
	draw_set_font(fnt_pixelfont);
	//draw speaker name
	draw_text_color(textStartX, boxTopY+16, speakerSet[message_current],c_white,c_white,c_white,c_white,1);

	//draw text
	draw_text_color(textStartX, boxTopY+48, message_draw,c_white,c_white,c_white,c_white,1); //draw the text at the coordinates
	
	draw_set_font(fnt_default);
}
