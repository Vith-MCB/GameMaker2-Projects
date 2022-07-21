randomize();

//Shaders (Flash)
flashAlpha = 0;
flashColor = c_white;

//Config player sprite
image_xscale = 4;
image_yscale = 4;
depth = 0;

//Variables
hsp = 0;
vsp = 0;
walksp = 4;
grv = 0.3;

//Player Life
playerLife = 3;

//Facing
facing = "right";

//Player dont have gun at the start
haveGun = false;

//Mouse x position
mouseXpos = 0;

//Bad shot if shot backwards
badShot = false;

//Movimentation function
movePlayer = function(){
	//Movimentation
	var left, right, move;

	//Key pressed (Player input)
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	
	///Animation logic of move
	move = right - left;
	
	//Player looks to the mouse pos
	if(mouseXpos > 0) //If mouse is at the right of the player
	{	
		image_xscale = 4; //Player look to the right
	}
	if(mouseXpos < 0) //If mouse is ar the left of the player
	{
		image_xscale = -4; //Player look to the left
	}
	
	//Player animation
	if(!haveGun) //Sprite for player without gun
	{
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
	}
	else //Player have gun
	{
		if(place_meeting(x,y+1,objTile)){
			//Sprite of movimentation and animation
			if(move > 0 && mouseXpos > 0){
				sprite_index = sPlayerWalkGunNew;
				image_xscale = 4;
				facing = "right";
				badShot = false;
			} 
			if(move > 0 && mouseXpos < 0){
				sprite_index = sPlayerWalkGunBack;
				image_xscale = 4;
				facing = "right";
				badShot = true;
			}
			if(move < 0 && mouseXpos > 0){
				sprite_index = sPlayerWalkGunBack;
				image_xscale = -4;
				facing = "left";
				badShot = true;
			}
			if(move < 0 && mouseXpos < 0){
				sprite_index = sPlayerWalkGunNew;
				image_xscale = -4;
				facing = "left";
				badShot = false;
			}
			else if(move == 0){
				sprite_index = sPlayerStillGunNew;
			}
			

		} else {
			//Sprite of movimentation and animation
			sprite_index = sPlayerJumpGunNew;
		
			if(move > 0){
				sprite_index = sPlayerJumpGunNew;
				image_xscale = 4;
				facing = "right";
			} 
			else if(move < 0){
				sprite_index = sPlayerJumpGunNew;
				image_xscale = -4;
				facing = "left";
			}
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
	if (enableHit){
		playerLife -= 1; //Player took damage
		
		flashAlpha = 1; //Making the player blink
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
		if (tookHit && enableHit)//Time between hits taken by player
		{ 
			playerRecoil=10; // activates and controls how long the recoil effect lasts for, reduce this if they fly too far
			enableHit = false;
			alarm[0] = room_speed;
			
		}
		
		tookHit = false; //Set it back to false

		//Player recoil system
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

///Gun get System
getGun = function(){
	if(place_meeting(x,y,oGun) && haveGun == false &&
	   keyboard_check_pressed(ord("E"))){ 
		haveGun = true;
		instance_destroy(oGun,false);
	}
}

/*Shot function

bullets = 0;
if(instance_exists(oGun)) //If obj gun exists
{ bullets = oGun.bullets; }
*/
shot = function(){
	var shot = mouse_check_button_pressed(mb_left); // Check left click
	if(haveGun && shot /*&& bullets > 0*/) // If player have the gun and shots
	{
		//bullets -= 1;
		// Checking mouse position to shot
		if(mouseXpos > 0) 
		{
			var shoot = instance_create_layer(xPosR, yPos-5,"Player",oShot);
		}
		if(mouseXpos < 0){
			var shoot = instance_create_layer(xPosL, yPos-5,"Player",oShot);
		}
		shoot.image_angle = dir; // image angled at the right direction;
		
		// Determining the shot direction
		
		
		if(badShot)// If player is aiming at a different direction 
		{
			//Gap of error (7%) 
			error = random_range(1.07,0.93);
			shoot.direction = dir * error;
		} 
		else // if player is aiming to the same direction that it's running
		{
			shoot.direction = dir;
		}
	}
}
