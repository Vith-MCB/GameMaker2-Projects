image_xscale = 0.85;
image_yscale = 0.85;

vspeed = 3;

alarm[0] = room_speed;

enemyLife = 2;

//Destroy if collides with enemy 1 when generated
if(place_meeting(x,y,obj_enemy)){
	instance_destroy(id,false);
}

//Destroy if collides with enemy 2 when generated
if(place_meeting(x,y,obj_enemy2)){
	instance_destroy(id,false);
}

//Destroy if collides with Alpha enemy when generated
if(place_meeting(x,y,obj_enemyAlpha)){
	instance_destroy(id,false);
}
