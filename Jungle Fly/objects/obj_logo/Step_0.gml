if(isFading){
	image_alpha -= 0.008;
}

if(isFading == true && image_alpha == 0){
	room_goto(rm_telaInicial);
}

if(global.aumentando == true){
	image_xscale += 0.004;
	image_yscale += 0.004;
} else {
	image_xscale -= 0.004;
	image_yscale -= 0.004;
}