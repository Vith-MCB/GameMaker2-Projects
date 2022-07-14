///@method ganha_pontos(pontos)
ganha_pontos = function(pontos){
	global.points += pontos;
}

//Level system
nextLvl = 100;

levelUp = function(){
	if(global.points >= nextLvl){
		global.level++;
		nextLvl *= 2;
	}
}

global.points = 0;

global.level = 0;

//Creating bigger enemies
global.isAlpha = 0;

// Randomizing enemies 
randomize();

//Creating the weakest enemies + alphas (stronger)
alarm[0] = room_speed;