// CODIGO PARA DIRECAO ALEATORIA
	// Randomizando seed
	randomize();
	direcao_bola = random_range(0, 359);

	//Impossivel da bola ficar presa no meio
	if(direcao_bola==90) || (direcao_bola == 270){
		direcao_bola /= 2;
	}

	//Bola sai em uma tragetória mais reta (correção p/ todos os quadrantes)
	//primeiro quadrante
	if(direcao_bola > 75) && (direcao_bola < 90){
		direcao_bola /= 2;
	}
	//segundo quadrante
	if(direcao_bola > 90) && (direcao_bola < 105){
		direcao_bola /= 2;
	}
	//terceiro quadrante
	if(direcao_bola > 255) && (direcao_bola < 270){
		direcao_bola /= 2;
	}
	//quarto quadrante
	if(direcao_bola > 270) && (direcao_bola < 285){
		direcao_bola /= 2;
	}

	//Direçao já randomizada
	direction = direcao_bola;

/* Direções predefinidas
direction = choose(5, 45, 135, 175, 195, 225, 315, 355);
*/

//Iniciando Alarme
alarm[0] = room_speed;