/// @description Insert description here
// You can write your code in this editor

//if dialogue is not showing
if(!obj_story_manager.show_dialogue){
	//velocity from the previous frame
	var _prev_x_v = x_v;
	var _prev_y_v = y_v;
	
	//WASD controller
	if(keyboard_check(ord("W"))){
		x_v = 0;
		y_v = -vel;
		dir = 2;
	} else if(keyboard_check(ord("S"))){
		x_v = 0;
		y_v = vel;
		dir = 0;
	} else if(keyboard_check(ord("A"))){
		x_v = -vel;
		y_v = 0;
		dir = 3;
	} else if(keyboard_check(ord("D"))){
		x_v = vel;
		y_v = 0;
		dir = 1;
	} else {
		x_v = 0;
		y_v = 0;
	}

	var _can_move = true;
	if(x_v != 0){ //if the x velocity is not 0
		_can_move = true; //reset can_move
		for(var _x_c = 0; _x_c < abs(x_v); _x_c++){ //for each pixel we may move this frame
			//check if there is something solid in the next position
			var _hit_obj = instance_place(x + sign(x_v), y, obj_solid); 
			//if there is something in that position
			if(_hit_obj != noone){
				//if that thing has dialogue
				if(variable_instance_exists(_hit_obj,"dialogue")){
					//stop the player's animation
					image_speed = 0;
					//start that object's dialogue
					obj_story_manager.Start_Dialogue(_hit_obj);
				} else {
					//if we haven't played the bump sound
					//play the bump sound
					if(!played_bump)audio_play_sound(bump_sound, 1, 0);
					played_bump = true;
				}
				//do not allow the player to move
				_can_move = false;
			} else {
				//if we didn't hit anything
				//reset the bump audio bool and let the player move
				played_bump = false;
				_can_move = true;	
			}
			//if the player can move, move
			if(_can_move) {
				x += sign(x_v);
			}
		}
	}

	//same code as x, but for the y
	if(y_v != 0){
		_can_move = true;
		for(var _y_c = 0; _y_c < abs(y_v); _y_c++){
			var _hit_obj = instance_place(x, y + sign(y_v), obj_solid);
			if(_hit_obj != noone){
				if(variable_instance_exists(_hit_obj,"dialogue")){
					image_speed = 0;
					obj_story_manager.Start_Dialogue(_hit_obj);
				} else {
					if(!played_bump)audio_play_sound(bump_sound, 1, 0);
					played_bump = true;
				}
				_can_move = false;
			} else {
				played_bump = false;
				_can_move = true;	
			}
			if(_can_move) {
				y += sign(y_v);
			}
		}
	}

	//if the current velocity is different from the last frame's vel
	if(x_v != _prev_x_v || y_v != _prev_y_v) {
		//check the direction we're moving
		//change the cooresponding animation
		switch(dir){
			case 0:
				if(y_v > 0) current_anim = down_walk; 
				else current_anim = down_idle;
				break;
			case 1:
				if(abs(x_v) > 0) current_anim = side_walk;
				else current_anim = side_idle;
				image_xscale = 1;
				break;
			case 3:
				if(abs(x_v) > 0) current_anim = side_walk;
				else current_anim = side_idle;
				image_xscale = -1;
				break;
			case 2:
				if(y_v < 0) current_anim = up_walk;
				else current_anim = up_idle;
				break;
		}
		image_index = current_anim[0];
		if(abs(x_v) > 0 || abs(y_v) > 0) image_speed = 1;
		else image_speed = 0;
	}


	if(array_length(current_anim) > 1){
		if(image_index > current_anim[3]){
			image_index = current_anim[0];
		}
	}
}