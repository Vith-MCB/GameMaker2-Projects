//Life System
enemyLife -= 1;

if(enemyLife = 0){
	instance_create_layer(x,y,"Player",obj_explosion);
	obj_controller.ganha_pontos(5);
	instance_destroy();
}
