/// @description Insert description here
// You can write your code in this editor

//if we should be typing new text
if(typing_index >= 0){
	typing_time++; //increment the frame counter
	if(typing_time > typing_max){ //if we've waited enough frames
		typing_index++; //increase the letter index to show
		//find the next char to show and add it to the currently visible dialogue line
		typed_line += string_char_at(obj_story_manager.c_line, typing_index);
		audio_play_sound(letter_sound, 1, 0); //play the type writer sound
		typing_time = 0; //reset the timer
	}
	//if the typed line has shown the whole dialogue line
	if(typing_index >= string_length(obj_story_manager.c_line)){ 
		//turn off the typing effect
		typing_index = -1;
		//allow the dialogue to be progressed
		obj_story_manager.can_continue = true;
	}
}



