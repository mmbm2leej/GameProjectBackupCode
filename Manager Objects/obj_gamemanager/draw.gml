if (obj_debug.debugmode) {
	
	draw_set_alpha(0.7);
	draw_rectangle_color(obj_player.bbox_left,obj_player.bbox_top,obj_player.bbox_right,obj_player.bbox_bottom,c_aqua,c_aqua,c_aqua,c_aqua,false);   
	draw_set_alpha(1);
	
}




//DRAW GUI

draw_sprite_ext(spr_black, 0,0,0, view_get_wport(view_camera[0]), view_get_hport(view_camera[0]),0,c_white,gameoveralpha);

