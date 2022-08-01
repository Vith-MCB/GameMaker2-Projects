//Randomizer
randomize();
choosePU = 0;
const = 0;

//Giving random moviment
speed = 2;
direction = irandom(359);

//Check collision with player
pCollision = function() //Choosing the upgrades randomly
{
	if(place_meeting(x,y-1,obj_nave)){
		audio_play_sound(snd_upgrade,1,0);
		choosePU = irandom_range(0,100); // ramdom chance
		instance_destroy(id,false);
		
		//If statements to switch function
		if(choosePU <= 10){const = 1;} //10% chance for shot speed up.
		if(choosePU > 10 && choosePU <= 30){const = 2;} //20% chance for shot lvl up.
		if(choosePU > 30 && choosePU <= 60){const = 3;} //30% chance for life up. 
		if(choosePU > 60 && choosePU <= 100){const = 4;} //40% chance for velocity up.
		
		switch (const) //Upgrade
		{
			case 1:
				if(global.shotSpeed < 5){global.shotSpeed++;} // Shot speed will increase untill 5x
			break;
			
			case 2: 
		        if(global.shotRate <= 6){global.shotRate++;} //Shot rate will increase untill lvl 5
		    break;
			
		    case 3: 
				if(playerLife < 7) // Max. life = 7
				{
			         global.playerLife++;
					 staticLife++;
					 actLife++;
				}
		    break;
			case 4: 
		        if(obj_nave.vel < 8){obj_nave.vel++;} //Player vel. will increase untill 8
		    break;
			
		}
	}
}
