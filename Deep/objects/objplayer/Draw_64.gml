//Draw Life
Xlife = 30;
repeat(playerLife){
	//Y position of the life
	Ylife = 35;
	
	draw_sprite(sLife,0,Xlife, Ylife);
	
	//Space between hearts 
	Xlife += 45;
}

if(haveGun){
	dir = point_direction(x,y,mouse_x, mouse_y);
	draw_sprite_ext(sGun,0,x+15,y-30,3,3,dir,image_blend,image_alpha);
	
	show_debug_message(dir);
	if(dir < 90){
		draw_sprite_ext(sGun,0,x+15,y-30,3,3,dir,image_blend,image_alpha);
	}
	if(dir >= 90 && dir <= 180){
		draw_sprite_ext(sGun,0,x+15,y-30,3,-3,dir,image_blend,image_alpha);
	}

}