//Initializing gravity

global.isFalling = true;

playerGravity = function(){
	if(global.isFalling){
		vspeed = 5;
	} else {
		vspeed = 0;
	}
}

//Movimentation function

velh = 0;
vel = 5;

movePlayer = function(){
	//Movimentation
	var left, right;

	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));

	if(left || right){
		dir = point_direction(0, 0, (right-left), 0);
		velh = lengthdir_x(vel, dir);
	}
	else{
		velh = 0;
	}

	x += velh;
}