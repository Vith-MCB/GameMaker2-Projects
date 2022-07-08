//Life System
enemyLife -= 1;

if(enemyLife = 0){
	instance_create_layer(x,y,"Player",obj_explosion);
	instance_destroy();
}
