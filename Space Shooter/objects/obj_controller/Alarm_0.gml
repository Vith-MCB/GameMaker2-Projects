randomize();

// crating the enemy on a random spot of the screen
enemysNumber = random_range(1, 4);

global.isAlpha = random_range(1, 7);

if(global.isAlpha>5){
	instance_create_layer(random_range(50, 1900), random_range(0, -70), "Player", obj_enemyAlpha);
}

for(i=0; i <= enemysNumber; i++){ 
	instance_create_layer(random_range(50, 1900), random_range(0, -70), "Player", obj_enemy);
}

alarm[0] = room_speed * 5;