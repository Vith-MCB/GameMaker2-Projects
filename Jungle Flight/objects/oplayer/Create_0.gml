//Creation of player
enableHit = true; //Enable hit again
flashAlpha = 0; //Making player flash
tookHit = false; //Player damage logic
global.playerOneLife = 1;//Life system
state = "Alive"; //Player is alive by default 

//Shaders (Flash)
flashAlpha = 0;
flashColor = c_white;

//Flight function
flight = function() 
{
	if(keyboard_check_pressed(vk_up)) // When player press up, the bird flies
	{
			vspeed = -4;
			instance_create_layer(x,y,"Player",oFeathers);
	}
}

///Basic damage function


damage = function(){
	if (enableHit){
		global.playerOneLife -= 1; //Player took damage
		
		flashAlpha = 1; //Making the player blink
	}
	enableHit = false;
	tookHit = true;
	
	//Checking life
	if(global.playerOneLife <= 0) //Checking if player life is less or equal to 0
	{
		state = "Dead"; //If so, player is dead
	} else {
		state = "Alive"; //Else, the player is alive
	}
	
}
