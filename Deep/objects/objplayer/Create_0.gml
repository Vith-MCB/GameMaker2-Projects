randomize(); // Function used to ensure random values

//Shaders (Flash)
flashAlpha = 0;
flashColor = c_white;

//Config player sprite
image_xscale = 4;
image_yscale = 4;

///Variables
hsp = 0; // Horizontal Speed
vsp = 0; // Vertical Speed
walksp = 4; // Walk Speed
grv = 0.3; // Gravity
playerLife = 3; // Player Life
facing = "right"; // Direction that the player is facing
haveGun = false; // Player dont have gun at the start
mouseXpos = 0; // Mouse x position
badShot = false; // Bad shot if shot backwards
enableHit = true; // Variable used to determine if player can take damage
tookHit = false; // Player took damage
playerRecoil = -1; // Player recoil
recoilSpeed = 5; // Velocity of the recoil that will be applied to player
drawE = false; // Variable used to draw the "E" button sprite
gotPistol = false; // Used to determine if player got the pistol objects
atualBullets = 0; // Bullets ammount that player have
reloadRecomended = false; // Variable used to determine if player needs to reload
buttonImageIndex = 0; ///Gun get System


///Movimentation function
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
		facing = "right";
		image_xscale = 4; //Player look to the right
	}
	if(mouseXpos < 0) //If mouse is ar the left of the player
	{
		facing = "left";
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
				running = true;
			} 
			if(move > 0 && mouseXpos < 0){
				sprite_index = sPlayerWalkGunBack;
				image_xscale = 4;
				facing = "right";
				badShot = true;
				running = true;
			}
			if(move < 0 && mouseXpos > 0){
				sprite_index = sPlayerWalkGunBack;
				image_xscale = -4;
				facing = "left";
				badShot = true;
				running = true;
			}
			if(move < 0 && mouseXpos < 0){
				sprite_index = sPlayerWalkGunNew;
				image_xscale = -4;
				facing = "left";
				badShot = false;
				running = true;
			}
			else if(move == 0){
				sprite_index = sPlayerStillGunNew;
				running = false;
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

//Basic damage function
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
pRecoil = function(){
		if (tookHit && enableHit)//Time between hits taken by player
		{ 
			playerRecoil=10; // activates and controls how long the recoil effect lasts for, reduce this if they fly too far
			enableHit = false;
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


//Get gun
getGunPistol = function(){
	if(place_meeting(x,y,oGun) && haveGun == false &&
	   keyboard_check_pressed(ord("E"))){ 
		haveGun = true;
		oControl.gotPistol = true;
		instance_destroy(oGun,false);
	}
}
//Gun related buttons
buttonsDisplay = function(){
	if(reloadRecomended || drawE){
			if(alarm[1] = -1){alarm[1]= room_speed;}
		}
}
	
///Reload function
reload = function(){
	if(keyboard_check_pressed(ord("R")) && haveGun && atualBullets < global.Bullets){
		audio_play_sound(sndReload,1,0);
		alarm[2] = 5;
		
	}
	
	//Reload recomendation
	if(atualBullets < (global.Bullets/2) && haveGun){
			reloadRecomended = true;
			//Buttons display
			buttonsDisplay();
	} 
	else if(atualBullets > (global.Bullets/2) && haveGun){
		reloadRecomended = false;
		alarm[1]=-1;
	}

}

//Shot function
shot = function(){
	var shot = mouse_check_button_pressed(mb_left); // Check left click
	
	if(haveGun && shot && atualBullets > 0) // If player have the gun and shots
	{
		atualBullets -= 1;
		
		/// Checking mouse position to shot
		if(mouseXpos > 0) //Creating shot and the bullet shell to the right.
		{
			var shoot = instance_create_layer(xPosR, yPos-5,"Player",oShot);
			
			//Creating the bullet shell
			var bShell = instance_create_layer(xPosR,yPos-5,"Player",oBulletShell);
			bShell.vsp = choose(-8,-6,-8.5,-7);
			bShell.hsp = choose(-6,-5,-4,-3,-2,-1,0,1,2,3);
		}
		if(mouseXpos < 0)//Creating shot and the bullet shell to the left.
		{
			var shoot = instance_create_layer(xPosL, yPos-5,"Player",oShot);
			
			//Creating the bullet shell
			var bShell = instance_create_layer(xPosL,yPos-5,"Player",oBulletShell);
			bShell.vsp = choose(-8,-6,-8.5,-7);
			bShell.hsp = choose(6,5,4,3,2,1,0,-1,-2,-3);
		}
		shoot.image_angle = dir; // image angled at the right direction;
		
		// Determining the shot direction
		if(badShot == true)// If player is aiming at a different direction 
		{
			//Gap of error (3%) 
			error = random_range(1.03,0.97);
			if(dir>=35){shoot.direction = dir * error;}
			else if (dir<35){shoot.direction = dir * (error+choose(0.5,-0.5));}
		} 
		else if (badShot == false && running == true) // if player is aiming to the same direction that it's running
		{
			//Gap of error (1% up) (3% down)
			error = random_range(1.01,0.97);
			if(dir>=35){shoot.direction = dir * error;}
			else if (dir<35){shoot.direction = dir * (error+choose(0.5,-0.5));}
		}
		else if (!badShot && running == false) // if the player is still
		{
			///Adjusting the direction of the shot angle
			if(dir < 45){shoot.direction = dir - 5;}
			if(dir >= 45 && dir <= 90){shoot.direction = dir + 5;}
			if(dir >= 90 && dir <= 135){shoot.direction = dir - 5;}
			if(dir >= 135 && dir <= 180){shoot.direction = dir + 5;}
			if(dir >=180 && dir <= 225){shoot.direction = dir + 5;}
			if(dir >=225 && dir <= 270){shoot.direction = dir + 5;}
			if(dir >=270 && dir <= 360){shoot.direction = dir - 5;}
			//The angles can be changed to better directions
		}
	}
}
