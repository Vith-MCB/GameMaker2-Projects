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

//Facing
facing = "right";

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
			facing = "right";
			
		} 
		else if(move < 0){
			sprite_index = sPlayerWalk;
			image_xscale = -4;
			facing = "left";
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
			facing = "right";
		} 
		else if(move < 0){
			sprite_index = sPlayerJump;
			image_xscale = -4;
			facing = "left";
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

///Taking Damage

//Basic damage function
tookHit = false;

enableHit = true;

damage = function(){
	if(enableHit) //Time between hits taken by player
	{
		playerLife -= 1; //Player took damage
		enableHit = false;
		alarm[0] = room_speed/2;
	}
	tookHit = true;
	
	//Checking life
	if(playerLife <= 0) //Checking if player life is less or equal to 0
	{
		state = "Dead"; //If so, player is dead
	} else {
		state = "Alive"; //Else, the player is alive
	}
	
}

//Recoil system (if player is hit)
playerRecoil = -1;
recoilSpeed = 5;

pRecoil = function(){
		if (tookHit){ 
			playerRecoil=10; // activates and controls how long the recoil effect lasts for, reduce this if they fly too far
			tookHit = false;
		}

		if(playerRecoil>-1){
		    playerRecoil-=1;
			if(facing = "right")//Check if the player is looking to the right
			{
				x -= 4; //Player goes to the left
			} else if (facing = "left") /*Player is looking to the left*/{
				x += 4;
			}
			vspeed -= 3;
			speed = recoilSpeed;
		}
		else {
			speed = 0;
		}
}