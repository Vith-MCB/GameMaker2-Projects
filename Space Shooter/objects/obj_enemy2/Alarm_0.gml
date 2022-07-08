if(y>0 && playerLife > 0)
{	
	pathEnemyX = obj_nave.x;
	instance_create_layer(x, y + (sprite_height/2), "Player", obj_tiroInimigo2);
	
}

alarm[0] = room_speed * 2;
