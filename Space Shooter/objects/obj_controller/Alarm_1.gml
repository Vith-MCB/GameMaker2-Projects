randomize();

// crating the enemy on a random spot of the screen
smartEnemysNumber = irandom_range(1, 2 + global.level);

for(i=0; i <= smartEnemysNumber; i++){ 
	instance_create_layer(irandom_range(50, 1900), irandom_range(0, -270), "Player", obj_enemy2);
	instance_create_layer(irandom_range(50, 1900), irandom_range(0, -170), "Player", obj_enemy);
}

alarm[1] = room_speed * 8.37;