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


//Shot rate
global.shotRate = 2;



//Shot level upgrade

upgradeShot = function(){
	if(keyboard_check_pressed(vk_up) && global.shotRate <= 5){
		global.shotRate += 1;
	}
	if(keyboard_check_pressed(vk_down) && global.shotRate >= 2){
		global.shotRate -= 1;
	}
}


//Life system

globalvar playerLife, actLife, staticLife;
playerLife = 3;
staticLife = 3;
actLife = playerLife;

pLife = function(){
	if(playerLife = 0){
		instance_create_layer(x,y,"Player",obj_explosion);
		instance_destroy();
	}
}

//Player damage
damage = function(){
	global.guardaBlend = image_blend;
	image_blend = c_red;
	image_alpha = 0;
	alarm[0] = 5;
}

//Life display system
lifeDisplay = function(){
	if(actLife > playerLife){
		audio_play_sound(snd_damage,1,0);
		damage();
		actLife = playerLife;
	}
}

//Lvl 2 shot
shot2 = function(){
	leftWingY = y - ((sprite_height/4)-25);
	leftWingX = x - 50;
	rightWingX = x + 50;
			
	var leftShot = instance_create_layer(leftWingX, leftWingY, "fire", obj_tiro2);
	leftShot.hspeed = 1;
			
	var rightShot = instance_create_layer(rightWingX, leftWingY, "fire", obj_tiro2);
	rightShot.hspeed = -1;
}

//Creating the lvl. 4 shot
shot4 = function(){
	//Level 1 shot
	var primeShot = instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
	primeShot.image_blend = c_red;
	
	//Creating 2 sideshots (lvl 1)
	var leftShot = instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
	var rightShot = instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
	leftShot.image_blend = c_red;
	rightShot.image_blend = c_red;
	
	//Giving horizontal speed for the sideshots
	leftShot.hspeed = -4;
	rightShot.hspeed = 4;
	
}

//Shooting function
atirando = function(){
	if(keyboard_check(vk_space) && alarm[1] == -1){
		//Initializin the alarm for the shot
		alarm[1] = room_speed/global.shotRate;
		
		//Shot level
		if(global.shotRate == 2){
			//Generating the shot level 1
			instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
		}
		else if(global.shotRate == 3){
			//Generating the shot level 2
			shot2();
		}
		else if(global.shotRate == 4){
			//Generating the shot level 3 (2 lvl.2 shots + 1 lvl.1)
			
			//Generating the shot level 1
			var primeShot = instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
			primeShot.image_blend = c_yellow;
			
			//Generating the shot level 2
			shot2();
		}
		else if(global.shotRate == 5){
			shot4();
		}
	}
}
