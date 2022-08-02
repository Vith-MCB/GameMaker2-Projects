//The coin should move at actual speed


//If player get coin, it sums to global coins
if(place_meeting(x,y,oPlayer)){global.gotCoins += 1;instance_destroy(id,false);}

//Stop warn to player
if(x < 1280){drawWarn = false;}

