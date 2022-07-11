//Creating a level

/*
globalvar hard, medium, easy;

hard = 3;
medium = 2;
easy = 1;
*/

///@method ganha_pontos(pontos)
ganha_pontos = function(pontos){
	global.points += pontos;
}

global.points = 0;

global.level = 0;

//Creating bigger enemies
global.isAlpha = 0;

// Randomizing enemies 
randomize();

//Creating the weakest enemies + alphas (stronger)
alarm[0] = room_speed;
