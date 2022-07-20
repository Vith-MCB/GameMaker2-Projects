//Draw Life
Xlife = 30;
repeat(playerLife){
	//Y position of the life
	Ylife = 35;
	
	draw_sprite(sLife,0,Xlife, Ylife);
	
	//Space between hearts 
	Xlife += 45;
}


//Flash by took damage
draw_self();

if(flashAlpha > 0){
	shader_set(shFlash); //Shader
	
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,
					flashColor,flashAlpha);
					
	shader_reset();
}


/* 
* Gun show system, it shows a gun that point at mouse direction
if(haveGun){
	yPos = y-30;
	xScale = 3;
	yScale = 3;
	
	dir = point_direction(x,y,mouse_x, mouse_y);	

	if(dir < 90){
		draw_sprite_ext(sGun,0,x,yPos,xScale,yScale,dir,image_blend,image_alpha);
	}
	if(dir >= 90 && dir <= 180){
		draw_sprite_ext(sGun,0,x,yPos,xScale,-yScale,dir,image_blend,image_alpha);
	}
	if(dir >=180 && dir <= 270){
		draw_sprite_ext(sGun,0,x,yPos,xScale,-yScale,dir,image_blend,image_alpha);
	}
	if(dir >=270 && dir <= 360){
		draw_sprite_ext(sGun,0,x,yPos,xScale,yScale,dir,image_blend,image_alpha);
	}
}
*/