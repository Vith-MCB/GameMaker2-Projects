//Draw Life
Xlife = 30;
repeat(global.playerLife){
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

//Gun show system, it shows a gun that point at mouse direction
if(global.haveGun){
	yPos = y-35;
	xPosR = x+40;
	xPosL = x-40;
	xScale = 3;
	yScale = 3;
	
	//Bullets show system
	draw_sprite_ext(sGun,0,35,75,xScale,yScale, image_angle,image_blend,image_alpha);
	var actBullets = string(atualBullets) + "/" + string(global.Bullets);
	draw_text(80, 70, actBullets);
	

	if(dir < 90){
		draw_sprite_ext(sGun,0,xPosR,yPos,xScale,yScale,dir,image_blend,image_alpha);
	}
	if(dir >= 90 && dir <= 180){
		draw_sprite_ext(sGun,0,xPosL,yPos,xScale,-yScale,dir,image_blend,image_alpha);
	}
	if(dir >=180 && dir <= 270){
		draw_sprite_ext(sGun,0,xPosL,yPos,xScale,-yScale,dir,image_blend,image_alpha);
	}
	if(dir >=270 && dir <= 360){
		draw_sprite_ext(sGun,0,xPosR,yPos,xScale,yScale,dir,image_blend,image_alpha);
	}
}
