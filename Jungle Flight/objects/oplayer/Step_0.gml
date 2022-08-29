flight();

//Gravity for the bird
if(vspeed < 5){
	vspeed += 0.1;
}

if(keyboard_check_pressed(vk_down)){vspeed += 2;}

//Top collision
if(y<36){y=36;}

//Reducing flash caused by taking damage 
if(flashAlpha > 0)
{
	flashAlpha -= 0.01;
	if(flashAlpha <= 0)//If the flash animation ends, the player will be able to take damage
	{enableHit = true;}
}

if(keyboard_check(vk_right)){damage();} // Test of shaders

if(keyboard_check(vk_left)){global.playerOneLife++;} // Test of shaders

