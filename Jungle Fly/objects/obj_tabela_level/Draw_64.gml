var level_atual = string(global.level);
draw_set_font(fnt_8bits);

if(y > 640){
	draw_text(80, y + 45, "LEVEL: " + level_atual);
	
}