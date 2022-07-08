//Creating a level
global.level = 1;

//Creating bigger enemies
global.isAlpha = 0;

// Randomizing enemies 
randomize();

//Creating the weakest enemies + alphas (stronger)
alarm[0] = room_speed;

//Creating smarter eneies
alarm[1] = room_speed * 1.7;