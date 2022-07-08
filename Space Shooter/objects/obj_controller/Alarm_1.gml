randomize();

// crating the enemy on a random spot of the screen
smartEnemysNumber = random_range(1, 2);

for(i=0; i <= smartEnemysNumber; i++){ 
	instance_create_layer(random_range(50, 1900), random_range(0, -70), "Player", obj_enemy2);
	instance_create_layer(random_range(50, 1900), random_range(0, -70), "Player", obj_enemy);
}

alarm[1] = room_speed * 8.37;