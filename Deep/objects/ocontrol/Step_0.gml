///Cursor Sprite
//Defining cursor if have gun

if(objPlayer.haveGun == true) //if player have gun
{
	cursor_sprite = sScopeGun;
} 

if(objPlayer.haveGun == false) //if player don't have gun
{
	cursor_sprite = sScope;
}

///Number of shots depending on the gun
bulletNumber();

show_debug_message(gotPistol);