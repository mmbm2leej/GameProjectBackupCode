///@description playerid()

if (instance_exists(obj_player)) {
	
	var player = instance_find(obj_player,0);

	return player;
} else {
	return noone;
}
