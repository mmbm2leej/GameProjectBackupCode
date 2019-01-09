//CREATE

#region For Azaga Set
azagasetready = false;
azagaset = [ 0, 1, 2, 3] // current four NPCs that belong in Azaga


#endregion




//STEP

var currentroom = room_get_name(room);

if (currentroom == "playareaAzaga") {
	if (azagasetready == false) {
		for(i = 0; i < array_length_1d(azagaset); ++i) {
			var current = i;
			var npc = instance_create_layer(random_range(100,1800),450,"characterlayer",obj_npc);
			with npc {
				myname = ds_grid_get(global.ds_NPCDB,0,current);
				myidlesprite = ds_grid_get(global.ds_NPCDB,1,current);
				mywalksprite = ds_grid_get(global.ds_NPCDB,2,current);
				myrunsprite = ds_grid_get(global.ds_NPCDB,3,current);
			}
		} azagasetready = true;		
	} 
	
	
}
