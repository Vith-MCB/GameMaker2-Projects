randomize();
i = random(1);
j = random(1);
y_arvores_cima = random_range(-32, 0);

// Dando um pouco mais de espaço de acordo com a árvore
if(j>0.5){
	y_arvores_cima = random_range(-40, -5);
}else{
	y_arvores_cima = random_range(-32, 0);
}


if(i>0.5){
	instance_create_layer(1380, y_arvores_cima, "Instances", obj_arvores);
} else{
	instance_create_layer(1380, y_arvores_cima, "Instances", obj_arvores3);
}

//criando arvores de baixo de forma randomizada

if(j>0.5){
	y_arvores_baixo =  random_range(718, 770);
	instance_create_layer(1400, y_arvores_baixo, "Instances", obj_arvores2);
} else{
	y_arvores_baixo =  random_range(730, 790);
	instance_create_layer(1400, y_arvores_baixo, "Instances", obj_arvores4);
}

//criando montanha
alarm[0] = room_speed * 2;