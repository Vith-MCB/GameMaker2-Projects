camera_set_view_pos(camera, x, y);

if(global.level == 1){
	x = lerp(x, x+50, 0.08);
}else{
	x = lerp(x, x+50, 0.08*(global.level/1.7));
}