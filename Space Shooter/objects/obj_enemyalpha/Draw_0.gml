draw_self();

scale = 3;

if(enemyLife == 1){
	draw_sprite_ext(spr_life, image_index, x - 40, y, 1/scale, 1/scale, 90, guardablend,1);
}
if (enemyLife == 2) {
	draw_sprite_ext(spr_life, image_index, x - 40, y, 1/scale, 1/scale, 90, guardablend,1);
	draw_sprite_ext(spr_life, image_index, x - 40, y + (64/scale), 1/scale, 1/scale, 90, guardablend,1);
} 
if (enemyLife == 3){
	draw_sprite_ext(spr_life, image_index, x - 40, y, 1/scale, 1/scale, 90, guardablend,1);
	draw_sprite_ext(spr_life, image_index, x - 40, y + (64/scale), 1/scale, 1/scale, 90, guardablend,1);
	draw_sprite_ext(spr_life, image_index, x - 40, y + (128/scale), 1/scale, 1/scale, 90, guardablend,1);
}

