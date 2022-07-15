if(isFading){
	image_alpha -= 0.008;
}

if(isFading == true && image_alpha == 0){
	room_goto(rm_telaInicial);
}
