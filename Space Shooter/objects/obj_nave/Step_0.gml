//Movimentation

var up, down, left, right, fire;

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
fire = keyboard_check_pressed(vk_space);

if(up || down || left || right){
	dir = point_direction(0, 0, (right-left), (down-up));
	velh = lengthdir_x(vel, dir);
	velv = lengthdir_y(vel, dir);
}
else{
	velh = 0;
	velv = 0;
}

x += velh;
y += velv;

//Crating fire

if (fire) {
	instance_create_layer(x, y - (sprite_height/4), "fire", obj_tiroplayer);
}