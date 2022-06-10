if(room != rm_perdeu){
	//sistema de pontos
	if(global.level < 3){
		pontos += 0.1;
	}
	if(global.level = 3){
		pontos += 0.15
	}
	if(global.level >= 4) && (global.level < 5){
		pontos += 0.2;
	}
	if(global.level >= 5){
		pontos += ((global.level/10) - 0.2);
	}

	if(pontos > proximo_level){
		global.level++;
	
		//tocando som de level up
		audio_play_sound(snd_lvl_up,1,false);
	
		//aumentando pontos necessários
		proximo_level *= 2;
	}

	if(global.level > global.maiorLevel){
		global.maiorLevel = global.level;
	}
}