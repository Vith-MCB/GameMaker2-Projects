image_xscale = 0.85;
image_yscale = 0.85;

vspeed = 3;

alarm[0] = room_speed;

enemyLife = 1;

//Destroy if collides with enemy 2 when generated
if(place_meeting(x,y,obj_enemy2)){
	instance_destroy(id,false);
}

//Destroy if collides with Alpha enemy when generated
if(place_meeting(x,y,obj_enemyAlpha)){
	instance_destroy(id,false);
}

///Enemy drop
eDrop = function(dropChance){
	chance = irandom_range(0,100);
	if((chance * dropChance)>75)//Base drop chance is equal to 25%
	{
		instance_create_layer(x,y,layer,obj_powerUp);
	}
}