/// @description Upgrades for the Player
//Randomizer
randomize();
upgrade = 0;

//Chance of upgrade randomize
chance = irandom_range(0,100);
if(chance > 95) 
{upgrade = 2;}//5% chance to generate life upgrade
else{upgrade = 1;} //95% chance to generate coin

//upgrade generation
upgradeX = room_width + 400;
upgradeY = irandom_range(120,620);

switch (upgrade){
	case 1:
		var up = instance_create_layer(upgradeX,upgradeY,"Player",oCoin);
		up.hspeed = -(irandom_range(3,6));
	break;
	case 2:
		var up = instance_create_layer(upgradeX,upgradeY,"Player",oLife);
		up.hspeed = -(irandom_range(3,6));
	break;
	}


//Recursive call
alarm[0] = room_speed * 10;