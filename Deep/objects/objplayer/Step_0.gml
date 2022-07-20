//Moviment
movePlayer();

pRecoil();

//Function to destroy gun after taking it
getGun();

//Mouse position
mouseXpos = sign(mouse_x-x);

//Drop gun
if(keyboard_check_pressed(vk_shift) && haveGun){
	if(facing = "right"){
		var dropGun = instance_create_layer(x+45,y-40,"Player",oGun);
		dropGun.vsp = -4;
		dropGun.hsp = 4;
	}
	if(facing = "left"){
		var dropGun = instance_create_layer(x-45,y-40,"Player",oGun);
		oGun.image_xscale = -3;
		dropGun.vsp = -4;
		dropGun.hsp = -4;
	}
	haveGun = false;
}

