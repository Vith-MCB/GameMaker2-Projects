/// @description Trees Generation
/*
if(room != rm_perdeu){
	randomize();
	i = random(1);
	j = random(1);
	y_arvores_cima = random_range(-32, 0);

	// Depending of the tree, it raises the gap between the obstacles of the top
	if(j>0.5){
		y_arvores_cima = random_range(-40, -5);
	}else{
		y_arvores_cima = random_range(-32, 0);
	}

	//Obstacle procedural generation
	if(i>0.5){
		instance_create_layer(1380, y_arvores_cima, "Instances", obj_arvores);
	} else{
		instance_create_layer(1380, y_arvores_cima, "Instances", obj_arvores3);
	}
	
	// Depending of the tree, it raises the gap between the obstacles of the botton
	if(j>0.5){
		y_arvores_baixo =  random_range(718, 770);
		instance_create_layer(1400, y_arvores_baixo, "Instances", obj_arvores2);
	} else{
		y_arvores_baixo =  random_range(730, 790);
		instance_create_layer(1400, y_arvores_baixo, "Instances", obj_arvores4);
	}

	// Creating the obstacles recursively
	alarm[1] = room_speed * 2;
}
*/
show_debug_message(xTeste);
xTeste++;
//Defining the time to generate trees again
var tempo_minimo = 1/(1+(global.level*0.1));
alarm[1] = room_speed * random_range(tempo_minimo,3);