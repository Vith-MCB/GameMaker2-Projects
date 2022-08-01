if(y > 1180){
	instance_destroy(id,false);
}

if(enemyLife = 0){
	instance_create_layer(x,y,"Player",obj_explosion);
	obj_controller.ganha_pontos(10);
	eDrop(1.3); // 1.3 * 25% = 32% chance of drop
	instance_destroy(id, false);
}
