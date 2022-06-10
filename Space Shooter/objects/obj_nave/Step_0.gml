//Movimentation

var up, down, left, right;

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

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