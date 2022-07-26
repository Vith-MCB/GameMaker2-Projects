///Player variables
global.playerLife = 3; // Player Life
global.haveGun = false; // Player dont have gun at the start
global.mouseXpos = 0; // Mouse x position

//Making windows cursor invisible
window_set_cursor(cr_none);

gotPistol = false;


global.Bullets = 0;

///Number of shots depending on the gun
bulletNumber = function(){
	if(gotPistol){global.Bullets = 6;}//Pistol bullets
}

