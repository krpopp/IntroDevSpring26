/// @description Insert description here
// You can write your code in this editor

//if the card is in the hand and is not face up
if(in_hand && !face_up){
	//if the player hasn't selected 2 cards
	if(obj_dealer.select_one == noone || obj_dealer.select_two == noone){
		//if the mouse is on the card and the left mouse button is pressed
		if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
			//set the card as having been selected
			//and flip it over
			if(obj_dealer.select_one == noone) obj_dealer.select_one = id;
			else if(obj_dealer.select_two == noone) obj_dealer.select_two = id;
			face_up = true;
		}
	}
}





