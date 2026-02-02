/// @description runs every frame while an instance of this object exists

var _prev_x_vel = x_vel;
var _prev_y_vel = y_vel;

var _clear_text = false;

if(keyboard_check(ord("A"))){
	x_vel = -1;
	if(x_walk_count == 0) sprite_index = spr_player_ad_walk;
	image_xscale = -1;
	x_walk_count +=1;
}else if(keyboard_check(ord("D"))){
	x_vel = 1;
	if(x_walk_count == 0) sprite_index = spr_player_ad_walk;
	image_xscale = 1;
	x_walk_count += 1;
} else {
	x_vel = 0;
	x_walk_count = 0;
	y_walk_count = 0;
}


if(keyboard_check(ord("W"))){
	y_vel = -1;
	if(y_walk_count == 0) sprite_index = spr_player_w_walk;
	y_walk_count += 1;
} else if(keyboard_check(ord("S"))){
	y_vel = 1;
	if(y_walk_count == 0) sprite_index = spr_player_s_walk;
	y_walk_count += 1;	
} else {
	y_vel = 0;
	x_walk_count = 0;
	y_walk_count = 0;
}

if (x_vel == 0) && (y_vel == 0) {
	if (_prev_y_vel > 0) {
		sprite_index = spr_player_s_idle;
	}
	else if (_prev_y_vel < 0){
		sprite_index = spr_player_w_idle;
	}
	else if (abs(_prev_x_vel)>0) {
		sprite_index = spr_player_ad_idle;	
	}
}

var _can_move = true;

if(abs(x_vel) > 0) {
	_can_move = true;
	if(instance_place(x + sign(x_vel), y, obj_collide)) _can_move = false;
	var _npc = instance_place(x + sign(x_vel), y, obj_npc);
	if(instance_exists(_npc)){
		if(_npc.sprite_index = spr_npc_kid) {
			hit_kid = true;
		}
		_can_move = false;
	}
	if(_can_move) x += x_vel;
}
if(abs(y_vel) > 0) {
	_can_move = true;
	if(instance_place(x, y + sign(y_vel), obj_collide)) _can_move = false;
	var _npc = instance_place(x, y + sign(y_vel), obj_npc);
	if(instance_exists(_npc)){
		if(_npc.sprite_index = spr_npc_kid) {
			hit_kid = true;
		}
		_can_move = false;
	}
	if(_can_move) y += y_vel;
}

if (showing_text && distance_to_point(text_start_x, text_start_y) > 20) {
	_clear_text = true
}

if(keyboard_check_pressed(vk_space)){
	if(hit_kid) {
		instance_activate_object(text_box);
		text_box.x = x - sprite_get_width(spr_box)/2;
		text_box.y = y;
		text_box.show_text = kid_dialogue;
		text_start_x = x;
		text_start_y = y;
		audio_play_sound(snd_talk, 1, 0);
		_clear_text = false;
		showing_text = true;
	}
}

if(_clear_text){
	hit_kid = false;
	showing_text = false;
	instance_deactivate_object(text_box);
}