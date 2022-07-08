if(y>0)
{	
	instance_create_layer(x, y + (sprite_height/2), "Player", obj_tiroInimigo);
}

alarm[1] = room_speed*1.3;
