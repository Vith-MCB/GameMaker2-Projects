//Moviment
movePlayer();

//Recoil
pRecoil();

//Reducing flash caused by taking damage 
//If the flash animation ends, the player will be able to take damage
if(flashAlpha > 0){
	flashAlpha -= 0.03;
	if(flashAlpha <= 0){enableHit = true;}
}

///Gun system
//Function to destroy gun after taking it
getGunPistol();

//Mouse position
mouseXpos = sign(mouse_x-x);

//Drop gun
if(keyboard_check_pressed(ord("Q")) && haveGun){
	if(mouseXpos > 0){
		var dropGun = instance_create_layer(x+45,y-40,"Player",oGun);
		dropGun.vsp = -4;
		dropGun.hsp = 4;
	}
	if(mouseXpos < 0){
		var dropGun = instance_create_layer(x-45,y-40,"Player",oGun);
		oGun.image_xscale = -3;
		dropGun.vsp = -4;
		dropGun.hsp = -4;
	}
	oGun.create(atualBullets); // making sure the gun dropped will have the same number of bullets tha
	haveGun = false;
}


//Check if player is next to the gun (if the instance exists)
if(instance_exists(oGun)){
	if(place_meeting(x,y,oGun)){
		drawE = true;
		//Buttons display
		buttonsDisplay();
	} else {drawE = false; alarm[1]=-1;}
}


if(alarm[1] <= room_speed/2){buttonImageIndex = 0};

//Pointing to mouse
dir = point_direction(x,y,mouse_x, mouse_y);

///Shot system
shot();
reload();

show_debug_message(alarm[1]);
