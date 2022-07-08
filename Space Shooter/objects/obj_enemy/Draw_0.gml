draw_self();

scale = 3;

if(2 > enemyLife){
	draw_sprite_ext(spr_life, image_index, x - 40, y, 1/scale, 1/scale, 90, image_blend,1);
} else {
	draw_sprite_ext(spr_life, image_index, x - 40, y, 1/scale, 1/scale, 90, image_blend,1);
	draw_sprite_ext(spr_life, image_index, x - 40, y + (64/scale), 1/scale, 1/scale, 90, image_blend,1);
}

