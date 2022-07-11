if(instance_exists(obj_nave))
{	
	dirShoot = obj_nave.x;
	x = lerp(x, dirShoot, 0.008);
}