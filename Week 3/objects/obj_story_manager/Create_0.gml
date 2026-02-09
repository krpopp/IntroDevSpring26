/// @description Insert description here
// You can write your code in this editor

//current array of dialogue that the player is in
c_sequence = [""];

//current index in the dialogue sequence that the player is reading right now
c_index = 0;
//current line that the player is reading
c_line = c_sequence[c_index];

//checks if the player is able to progress dialogue
can_continue = false;

//checks if the dialogue should shown 
show_dialogue = true;

//tracks which character is speaking
speaking_obj = noone;

//start a new dialogue sequence
function Start_Dialogue(_obj) {
	c_sequence = _obj.dialogue; //set the dialogue sequence
	obj_gui.current_portrait = _obj.portrait; //set the starting portrait in the UI
	obj_gui.letter_sound = _obj.type_sound; //set the typing sound
	speaking_obj = _obj; //set which character is currently speaking
	c_index = 0; //reset the index of which line is currently showing
	show_dialogue = true; //set that the dialogue ui should be visible (and stop the player from moving)
	Start_Line(); //start a new line
}

//set up and begin typing a new line of dialogue
function Start_Line(){
	c_line = c_sequence[c_index]; //set which line in the dialogue array we're reading
	can_continue = false; //stop the player from progress dialogue
	var _port_char = string_char_at(c_line, 1); //find the first delimiter in the line
	var _line_sound = string_char_at(c_line, 2); //find the second delimiter in the line
	//if the starting line sound isn't 0, play this line's event sound
	if(_line_sound > 0) audio_play_sound(speaking_obj.event_sounds[_line_sound], 1, 0);
	//remove the delimiters from the line of dialogue
	c_line = string_replace(c_line, _port_char, "");
	c_line = string_replace(c_line, _line_sound, "");
	//reset vars in the gui manager needs to do the typewriter text effect
	obj_gui.Reset_Type(_port_char);
}

