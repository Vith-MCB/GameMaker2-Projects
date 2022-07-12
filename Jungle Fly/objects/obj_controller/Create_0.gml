randomize();

//Points system
pontos = 0;
global.level = 1;

//necessary points to the next lvl
proximo_level = 100;

var tempo_minimo = 1/(1+(global.level*0.1));
alarm[0] = room_speed * random_range(tempo_minimo,2);