//Randomizer
randomize();
choosePU = 0;
const = 0;

//Giving random moviment
speed = 2;
direction = irandom(359);

//Creating random upgrade
choosePU = irandom_range(0,100); // ramdom chance
//If statements to switch function
if(choosePU <= 10){const = 1;} //10% chance for shot speed up.
else if(choosePU > 10 && choosePU <= 30){const = 2;} //20% chance for shot lvl up.
else if(choosePU > 30 && choosePU <= 60){const = 3;} //30% chance for life up. 
else{const = 4;} //40% chance for velocity up.

switch (const) //Upgrade
		{
			case 1: //Shot spd
				collor = c_red;
			break;
			
			case 2: //shot lvl up
		        collor = c_yellow;
		    break;
			
		    case 3: //life up
				collor = c_green;
		    break;
			case 4: //velocity up
		      collor = c_aqua;
		    break;
			
		}

//Check collision with player
pCollision = function(const) //Choosing the upgrades randomly
{
	if(place_meeting(x,y-1,obj_nave)){
		audio_play_sound(snd_upgrade,1,0);
		
		instance_destroy(id,false);

		
		switch (const) //Upgrade
		{
			case 1:
				if(global.shotSpeed < 5){
					show_debug_message("shotSp");
					global.shotSpeed++;
					} // Shot speed will increase untill 5x
			break;
			
			case 2: 
		        if(global.shotRate <= 6){
					show_debug_message("shot");
					global.shotRate++;
					} //Shot rate will increase untill lvl 5
		    break;
			
		    case 3: 
				if(playerLife < 7) // Max. life = 7
				{
					show_debug_message("life");
			         global.playerLife++;
					 staticLife++;
					 actLife++;
				}
		    break;
			case 4: 
		        if(obj_nave.vel < 8){
					show_debug_message("vel");
					obj_nave.vel++;
					} //Player vel. will increase untill 8
		    break;
			
		}
	}
}
