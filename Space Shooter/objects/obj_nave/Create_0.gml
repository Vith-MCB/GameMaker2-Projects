//Movimentation system

velh = 0;
velv = 0;
vel = 5;

move = function(){
	//Movimentation
	var up, down, left, right;

	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));

	if(up || down || left || right){
		dir = point_direction(0, 0, (right-left), (down-up));
		velh = lengthdir_x(vel, dir);
		velv = lengthdir_y(vel, dir);
	}
	else{
		velh = 0;
		velv = 0;
	}

	x += velh;
	y += velv;
}
atirando = function(){
	fire = keyboard_check_pressed(vk_space);
	if (fire) {
		instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
	}
}


//Life system

globalvar playerLife;
playerLife = 3;

pLife = function(){
	if(playerLife = 0){
		instance_create_layer(x,y,"Player",obj_explosion);
		instance_destroy();
	}
}
