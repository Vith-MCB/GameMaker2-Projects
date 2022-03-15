if(automatico){
	//Obtendo o Y da bola
	y_bola = (obj_bola.y)/2;
	
	//Aproximando ao valor da bola
	y = lerp(y, y_bola, 0.8);
	
	// Limitando a raquete
	if (y < -64){
		y = -64;
	}

	if(y > 256){
		y = 256;
	}
}

