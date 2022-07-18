///Roam

if irandom(3) < 3 //75% chance of the slime do the following
{
	//Jump
	vsp = -5;
	
	//Choose and move
	hsp = choose(-2,2,-2,2);
	
	if(hsp < 0)//Slime looks to the left
	{
		image_xscale = -3;
	}
	
	else if(hsp > 0)//Slime looks to the right
	{
		image_xscale = 3;
	}
	
}