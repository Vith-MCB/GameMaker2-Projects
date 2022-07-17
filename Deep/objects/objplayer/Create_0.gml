//Config player sprite
image_xscale = 3;
image_yscale = 3;

//Variables
hsp = 0;
vsp = 0;
walksp = 4;
grv = 0.3;

//Movimentation function
movePlayer = function(){
	//Movimentation
	var left, right, move;

	//Key pressed (Player input)
	left = keyboard_check(ord("A"));
	right = keyboard_check(ord("D"));
	
	//Movimentation Logic
	move = right - left;
	
	//Sprite rotation
	while(left){
		sprite_index = sPlayerWalk;
		image_xscale *= -1;
	} 
	while (right){
		sprite_index = sPlayerWalk;
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
}

//Vertical move
verticalMove = function(){
	var jump = keyboard_check(vk_space);
	
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
		vsp = -7;
	}
}