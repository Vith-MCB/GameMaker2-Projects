draw_self();

scale = 3;

if(enemyLife == 1){
	draw_sprite_ext(spr_life, image_index, x - 40, y+20, 1/scale, 1/scale, 90, image_blend,1);
}