//movimentation
move();

//Crating fire

atirando();

//Player life system

pLife();

//Life display system
if(actLife > playerLife){
	audio_play_sound(snd_damage,1,0);
	actLife = playerLife;
}