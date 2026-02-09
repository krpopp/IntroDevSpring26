/// @description Insert description here
// You can write your code in this editor

if(can_continue) { //if the dialogue is able to be progressed
	if(mouse_check_button_released(mb_left)) { //if the player presses the left mouse button
		c_index++; //increase the dialogue sequence index
		//if the index is longer than the number of lines in the dialogue array
		if(c_index >= array_length(c_sequence)){ 
			show_dialogue = false; //stop showing dialogue
		} else {
			Start_Line(); //otherwise start a new line of dialogue
		}
	}
}



