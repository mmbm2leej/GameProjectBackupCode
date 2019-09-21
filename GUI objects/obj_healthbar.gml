#region Updating Stat


if (hpnew != global.playercurrenthp) {
	hpnew += (global.playercurrenthp - hpnew)/5;
} 

if (hpold != hpnew) {
	hpold += (hpnew - hpold)/40;
}


#endregion

/*

#region Setting up alpha

//(may not even need this)


if (instance_exists(obj_player)) {
	if (!(obj_player.outofcombat)) hpbaralpha = approach(hpbaralpha,1,0.1);
	else hpbaralpha = approach(hpbaralpha,0,0.1);
} else if (hpbaralpha > 0) hpbaralpha = approach(hpbaralpha,0,0.1);


hpbaralpha = 1;

#endregion

*/


#region Stats and Frames
hpold = global.playercurrenthp;
hpnew = global.playercurrenthp;
hpmax = global.playermaxhp;
nodecount = hpmax/nodehealth;

#endregion

#region Current HP 

/*
There should be fullnodes, and the last node with ANY health is the lead node

*/
nodecount = hpmax/nodehealth;
var nodenumb = (hpold/nodehealth);
fullnodes = floor(nodenumb);


if ((nodenumb - fullnodes) == 0) //If hp is an integer
{
	leadnode = fullnodes - 1;
	leadnodehp = nodehealth;
} else {	//If one of the nodes is partial
	leadnode = fullnodes;	
	leadnodehp = frac(nodenumb)*(nodehealth);
}

if (visualleadnodehp != leadnodehp){
	if (leadnodehp == nodehealth) visualleadnodehp = nodehealth;
	else {
		visualleadnodehp += (leadnodehp - visualleadnodehp)/10;
	}
}

#endregion
