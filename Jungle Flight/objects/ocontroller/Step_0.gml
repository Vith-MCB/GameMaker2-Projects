//Point system
if(room = rGame){
	if(global.level < 3){
		points += 0.1;
	}
	if(global.level = 3){
		points += 0.15
	}
	if(global.level >= 4) && (global.level < 5){
		points += 0.2;
	}
	if(global.level >= 5){
		points += ((global.level/10) - 0.2);
	}

	if(points > nextLevel){
		global.level++;
	
		/*Playing the lvl up sound
		audio_play_sound(snd_lvl_up,1,false);
		*/
	
		//Doubles the next lvl necessary points
		nextLevel *= 2;
	}

		//Storing the highscore 
	if(global.level > global.highestLevel){
		global.highestLevel = global.level;
	}
	
	//Storing the highest amount of points
	if(points>global.highestPoints){
		global.highestPoints = points;
	}
}
