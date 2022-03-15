//Checando se a bola saiu pela esquerda
if(x < 0){
	audio_play_sound(snd_game_over, 0, false);
	game_restart();
}

//Checando se a bola saiu pela direita
if(x>640){
	audio_play_sound(snd_game_over, 0,false);
	game_restart();
}