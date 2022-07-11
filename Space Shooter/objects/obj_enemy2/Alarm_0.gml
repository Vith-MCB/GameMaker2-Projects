if(y>0 && instance_exists(obj_nave))
{	
	pathEnemyX = obj_nave.x;
	instance_create_layer(x, y + (sprite_height/2), "Player", obj_tiroInimigo2);
	
}

alarm[0] = room_speed * 2;
