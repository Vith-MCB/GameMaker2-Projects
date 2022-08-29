/// @description Trees Generation
randomize();

randomize();
	skyTreeRandomizer = random(1);
	floorTreeRandomizer = random(1);
	yUpperTree = random_range(-32, 0);

	// Depending of the tree, it raises the gap between the obstacles of the top
	if(floorTreeRandomizer>0.5){
		yUpperTree = random_range(-40, -5);
	}else{
		yUpperTree = random_range(-32, 0);
	}

	//Obstacle procedural generation
	if(skyTreeRandomizer>0.5){
		var upTree = instance_create_layer(1380, yUpperTree, "Obstacles", oObstacle);
		upTree.image_angle = 180;
	} else{
		var upTree = instance_create_layer(1380, yUpperTree, "Obstacles", oObstacle);
		upTree.image_angle = 180;
	}
	
	// Depending of the tree, it raises the gap between the obstacles of the botton
	if(floorTreeRandomizer>0.5){
		yFloorTree =  random_range(718, 770);
		instance_create_layer(1400, yFloorTree, "Obstacles", oObstacle);
	} else{
		yFloorTree =  random_range(730, 790);
		instance_create_layer(1400, yFloorTree, "Obstacles", oObstacle);
	}

//Defining the time to generate trees again
var tempo_minimo = 1/(1+(global.level*0.1));
alarm[1] = room_speed * random_range(tempo_minimo,3);