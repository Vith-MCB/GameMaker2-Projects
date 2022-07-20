function scrSlimeAttack(){
	///Attack
	//Jump
	vsp = -6;

	if(objPlayer.x < x) //If the player is to the left of the player
	{
		hsp = -2; //Slime will jump tp the left
	}
	else //The player is to the right of the slime
	{
		hsp = 2;
	}
	
	if(hsp < 0)//Slime looks to the left
	{
		image_xscale = -3;
		facing = "left";
	}
	
	else if(hsp > 0)//Slime looks to the right
	{
		image_xscale = 3;
		facing = "right";
	}
}