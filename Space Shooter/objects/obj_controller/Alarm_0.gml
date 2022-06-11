randomize();

// crating the enemy on a random spot of the screen
enemysNumber = random_range(1, 3);

for(i=0; i <= enemysNumber; i++){ 
	instance_create_layer(random_range(0, 1920), random_range(0, -70), "Player", obj_enemy);
}

alarm[0] = room_speed * 5;