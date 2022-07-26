///Camera folowing player

if(instance_exists(target)) // if player dont exist, the program wont run
{
	x = lerp(x, target.x,0.5); //Camera follows the player at X axis
	y = lerp(y, target.y-height/4,0.5); //Camera follows the player at X axis

	//Setting camera
	camera_set_view_pos(view_camera[0], x-width/2, y-height/2);
}
