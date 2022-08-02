//Display Player lifes
if(instance_exists(oPlayer)) //Checks if player exists
{
	//Draw Life
	Xlife = 30;
	repeat(global.playerOneLife){
		Ylife = 35; //Y position of the life
		
		draw_sprite(sP1Life,0,Xlife, Ylife);//It draws feather image
	
		Xlife += 45;//Space between hearts 
	}
}

