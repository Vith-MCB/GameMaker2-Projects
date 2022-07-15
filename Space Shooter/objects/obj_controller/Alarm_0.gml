//Generating random y for the enemys
randomYenemyAlpha = irandom_range(0, -270);
randomYenemy1 = irandom_range(0, -170);

//Generating random x for the enemys
randomXenemyAlpha = irandom_range(50, 1900);
randomXenemy1 = irandom_range(50, 1900);

if(instance_exists(obj_nave)){
	randomize();

	// crating the enemy on a random spot of the screen
	enemysNumber = irandom_range(1, 3 + global.level);

	global.isAlpha = irandom_range(1, 7);

	if(global.isAlpha>5){
		instance_create_layer(randomXenemyAlpha, randomYenemyAlpha, "Player", obj_enemyAlpha);
	}

	for(i=0; i <= enemysNumber; i++){ 
		instance_create_layer(randomXenemy1, randomYenemy1, "Player", obj_enemy);
	}

	alarm[0] = room_speed * 5;

	if(global.points > 70){
		//Creating smarter enemies
		alarm[1] = room_speed * 2.4;
	}
}