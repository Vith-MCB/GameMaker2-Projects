//If player get life, it sums to global coins
if(place_meeting(x,y,oPlayer)){global.playerOneLife += 1;instance_destroy(id,false);}

//Stop warn to player
if(x < 1280){drawWarn = false;}