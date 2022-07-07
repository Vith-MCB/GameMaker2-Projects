draw_self();

lifeXscale = 0.75 * actLife;
draw_sprite_ext(spr_life, image_index, x, y + 90, lifeXscale, 1, 180, image_blend,1);

var actLifeStr = string(actLife);
var totalLife = string(staticLife);

draw_set_font(fnt_8bits);
draw_text(x-17, y + 90, actLifeStr + "/" + totalLife);