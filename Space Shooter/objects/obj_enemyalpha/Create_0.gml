image_xscale = 1.15;
image_yscale = 1.15;

guardablend = image_blend;	

image_blend = c_red;

vspeed = 2.2;

alarm[1] = room_speed;

enemyLife = 3;

///Enemy drop
eDrop = function(dropChance){
	chance = irandom_range(0,100);
	if((chance * dropChance)>75)//Base drop chance is equal to 25%
	{
		instance_create_layer(x,y,layer,obj_powerUp);
	}
}