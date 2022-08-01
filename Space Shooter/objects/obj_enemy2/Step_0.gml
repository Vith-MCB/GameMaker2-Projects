if(instance_exists(obj_nave)){
	pathEnemyX = obj_nave.x;
	x = lerp(x, pathEnemyX, 0.008);
}

if(y > 1180){
	instance_destroy(id,false);
}
