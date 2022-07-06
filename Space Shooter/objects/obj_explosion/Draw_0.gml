draw_self();

gpu_set_blendmode(bm_add);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*1.2, image_yscale * 1.2, image_angle, cores,0.5);

gpu_set_blendmode(bm_normal);