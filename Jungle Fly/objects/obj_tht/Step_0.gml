if(isFading){
	image_alpha -= 0.008;
}

if(isFading == true && image_alpha == 0){
	room_goto(rm_telaInicial);
}

if(global.aumentando == true){
	image_xscale += 0.0015;
	image_yscale += 0.0015;
} else {
	image_xscale -= 0.0015;
	image_yscale -= 0.0015;
}