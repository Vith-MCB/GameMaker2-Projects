//Config player sprite
image_xscale = 4;
image_yscale = 4;

//Variables
hsp = 0;
vsp = 0;
walksp = 4;
grv = 0.3;

//Player Life
playerLife = 3;


//Movimentation function
movePlayer = function(){
	//Movimentation
	var left, right, move;

	//Key pressed (Player input)
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	
	//Movimentation Logic
	move = right - left;
	
	//Sprite for jumping
	if(place_meeting(x,y+1,objTile)){
		//Sprite of movimentation and animation
		if(move > 0){
			sprite_index = sPlayerWalk;
			image_xscale = 4;
		} 
		else if(move < 0){
			sprite_index = sPlayerWalk;
			image_xscale = -4;
		}
		else if(move == 0){
			sprite_index = sPlayerStill;
		}

	} else {
		//Sprite of movimentation and animation
		sprite_index = sPlayerJump;
		
		if(move > 0){
			sprite_index = sPlayerJump;
			image_xscale = 4;
		} 
		else if(move < 0){
			sprite_index = sPlayerJump;
			image_xscale = -4;
		}
	}
	
	//Horizontal speed
	hsp = move * walksp;
	
	//Horizontal colision
	if(place_meeting(x+hsp,y, objTile)){
		
		//Moves untill collision
		while(!place_meeting(x+sign(hsp),y,objTile)){
			x += sign(hsp);
		}
	
		hsp = 0;
	}
	x += hsp;

	//Vertical move
	var jump = keyboard_check_pressed(vk_space);
	
	//Vertical speed
	vsp += grv;
	
	//Vertical colision
	if(place_meeting(x,y+vsp, objTile)){
		
		//Moves untill collision
		while(!place_meeting(x,y+sign(vsp),objTile)){
			y += sign(vsp);
		}
	
		vsp = 0;
	}
	y += vsp;
	
	//Jump
	
	if(jump && place_meeting(x,y+1,objTile)){
		audio_play_sound(sndJump,1,false);
		vsp = -7;
	}
	
}
