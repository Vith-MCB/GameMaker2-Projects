randomize();

//Changing the scale of the slime
image_xscale = 3;
image_yscale = 3;

//Life system
life = 2;

//Movimentation system
hsp = 0;
vsp = 0;
walksp = 4;
grv = 0.3;

//State
state = "Roam";

//Collisions function
slimeCollision = function(){
	//Set if the slime is grounded
	if(place_meeting(x,y+1,objTile)){ 
		grounded = true;
	} else { 
		grounded = false;
	} 

	//Horizontal colision
	if(place_meeting(x+hsp,y, objTile)){
		
		//Moves untill collision
		while(!place_meeting(x+sign(hsp),y,objTile)){
			x += sign(hsp);
		}
	
		hsp = 0;
	}
	x += hsp;

	//Vertical speed
	vsp += grv;
	
	//Vertical colision
	if(place_meeting(x,y+vsp, objTile)){
		
		//Moves untill collision
		while(!place_meeting(x,y+sign(vsp),objTile)){
			y += sign(vsp);
		}
		
		if(vsp>0) // if the slime is landing
		{
			hsp = 0; //Prevents sliding
		}
	
		vsp = 0;
	}
	y += vsp;
}

/*

	var left, right, move;
	
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
	
	

	//Vertical move
	var jump = keyboard_check_pressed(vk_space);
	
	//Vertical speed
	vsp += grv;
	
	
	
	//Jump
	
	if(jump && place_meeting(x,y+1,objTile)){
		audio_play_sound(sndJump,1,false);
		vsp = -7;
	}
*/