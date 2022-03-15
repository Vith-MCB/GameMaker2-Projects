//Definindo gravidade p/ passaro e limitando a 5
if(vspeed < 5){
	vspeed += 0.1;
}


// Colisao com o teto
if(y < 36){
	y = 36;
}