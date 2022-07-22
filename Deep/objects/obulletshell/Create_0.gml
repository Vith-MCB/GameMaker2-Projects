///Gravity and collisions
//Variables
hsp = 0;
vsp = 0;
grv = 0.3;

alarm[0] = room_speed*2; 

collisions = function(){
	///Horizontal colision
	if(place_meeting(x+hsp,y, objTile)){
		
		//Moves untill collision
		while(!place_meeting(x+sign(hsp),y,objTile)){
			x += sign(hsp);
		}
	
		hsp = 0;
	}
	x += hsp;

	///Vertical colision
	
	vsp += grv; //Vertical speed
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

