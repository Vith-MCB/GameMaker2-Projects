randomize();

//Shaders (Flash)
flashAlpha = 0;
flashColor = c_white;

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

tookHit = false;
damage = function(){
	life -= 1; //Took damage
	flashAlpha = 1; //Making the enemy blink red
	
	tookHit = true;
	
	//Checking life
	if(life <= 0) //Checking if slime life is less or equal to 0
	{
		state = "Dead"; //If so is dead
	} else {
		state = "Alive"; //Else is alive
	}
}

//Recoil system (if player is hit)
enemyRecoil = -1;
recoilSpeed = 5;

eRecoil = function(){
		if (tookHit)//Time between hits taken by player
		{ 
			enemyRecoil=10; // activates and controls how long the recoil effect lasts for, reduce this if they fly too far
			
		}
		
		tookHit = false; //Set it back to false

		//Player recoil system
		if(enemyRecoil>-1){
		    enemyRecoil-=1;
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
