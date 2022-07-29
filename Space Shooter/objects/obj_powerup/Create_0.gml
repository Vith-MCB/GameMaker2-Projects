//Randomizer
choosePU = 0;

//Check collision with player
pCollision = function(){
	if(place_meeting(x,y-1,obj_nave)){
		choosePU = choose(1,2,3);
		instance_destroy(id,false);
		switch (choosePU)
		{
	    case 3:
	        obj_nave.vel += 1;
	    break;

	    case 2:
	        global.shotRate += 1;
	    break;

	    case 1:
	         global.playerLife += 1;
	    break;
		}
	}
}
