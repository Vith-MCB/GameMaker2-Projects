//Moviment
movePlayer();

pRecoil();

//Reducing flash caused by taking damage
if(flashAlpha > 0){
	flashAlpha -= 0.05;
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
	oGun.create(atualBullets);
	haveGun = false;
}

//Check if player is next to the gun
if(place_meeting(x,y,oGun)){
	drawE = true;
} else {
	drawE = false;
}

//Pointing to mouse
dir = point_direction(x,y,mouse_x, mouse_y);

///Shot system
shot();
reload();


//show_debug_message(global.Bullets);

