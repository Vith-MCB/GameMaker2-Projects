if(playerLife > 0){
	pathEnemyX = obj_nave.x;
	x = lerp(x, pathEnemyX, 0.008);
}

if(y > 1180){
	instance_destroy(id,false);
}