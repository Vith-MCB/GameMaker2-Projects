speed = 3;
direction = 270;
y += speed;
if(y>840){
	instance_destroy(id, false);
}