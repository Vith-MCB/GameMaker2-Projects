randomize();

treeSize = random_range(0.78,0.82);
image_yscale = treeSize;
image_xscale = treeSize;

if(place_meeting(x,y,oPlayer)){oPlayer.damage();} //If player collides with the obstacle

var genTree = irandom_range(1,3); //this number is used to define the sprite index

image_index = genTree;