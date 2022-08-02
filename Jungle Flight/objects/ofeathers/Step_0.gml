///Effects for the feather
//It gets bigger, desapears and destroys itself
image_xscale += 0.01
image_yscale += 0.01

image_alpha -= 0.01

if(image_alpha <= 0){
	instance_destroy(id,false);
}

