//Draw Life
Xlife = 30;
repeat(playerLife){
	//Y position of the life
	Ylife = 35;
	
	draw_sprite(sLife,0,Xlife, Ylife);
	
	//Space between hearts 
	Xlife += 45;
}