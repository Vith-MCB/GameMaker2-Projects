randomize();

// crating the enemy on a random spot of the screen
smartEnemysNumber = irandom_range(1, 2 + global.level);

//Generating random y for the enemys
randomYenemy2 = irandom_range(0, -270);
randomYenemy1 = irandom_range(0, -170);

//Generating random x for the enemys
randomXenemy2 = irandom_range(50, 1900);
randomXenemy1 = irandom_range(50, 1900);

for(i=0; i <= smartEnemysNumber; i++){ 
	instance_create_layer(randomXenemy2, randomYenemy2, "Player", obj_enemy2);
	instance_create_layer(randomXenemy1, randomYenemy1, "Player", obj_enemy);
}

alarm[1] = room_speed * 8.37;