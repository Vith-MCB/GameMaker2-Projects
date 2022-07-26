///Cursor Sprite
//Defining cursor if have gun

if(global.haveGun == true) //if player have gun
{
	cursor_sprite = sScopeGun;
} 

if(global.haveGun == false) //if player don't have gun
{
	cursor_sprite = sScope;
}

///Number of shots depending on the gun
bulletNumber();
