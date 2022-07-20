//Collisions
slimeCollision();

///Animation

//Image Speed
switch (sprite_index){
	case sSlimeIdle: image_speed = 1; break;
	case sSlimeJump: image_speed = 1; break;
	case sSlimeFall: image_speed = 1; break;
}


if(grounded)//Ground animation
{
	image_index = sSlime;
}


else //Air animation
{
	if(vsp >= 0)//Falling animation
	{
		image_index = sSlimeFall;
	}
	
	else //Jumping animation
	{
		image_index = sSlimeJump;
	}
}

///AI

playerDistance = distance_to_object(objPlayer); //Calculates the distance between the object and the player

if(playerDistance > 150)//Set the slime as roam
{
	state = "Roam";
} else //set the attack
{
	if(grounded && state = "Roam"){
		scrSlimeAttack();
	}
	state = "Attack";
}

//Set the state alarms

if(grounded) // If the slime is grounded
{
	if(state = "Roam"){
		alarm[1] = -1; // Set attack alarm to -1
		if(alarm[0] = -1) //If the alarm isn't counting down
		{
			alarm[0] = room_speed * irandom_range(1.2,1.5);
		}
	}
	
	if(state = "Attack"){
		alarm[0] = -1; // Set roam alarm to -1
		if(alarm[1] = -1) //If the alarm isn't counting down
		{
			alarm[1] = room_speed * 0.9;
		}
	}
}

//Recoil system
eRecoil();

//Reducing flash caused by taking damage
if(flashAlpha > 0){
	flashAlpha -= 0.05;
}