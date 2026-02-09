/// @description Insert description here
// You can write your code in this editor

//if we should show dialogue
if(obj_story_manager.show_dialogue){
	//draw the background UI
	draw_sprite_ext(box_spr, 0, x, y, 3, 3, 0, c_white, 1);
	draw_sprite_ext(dia_spr, 0, text_x - 10, y, 3, 3, 0, c_white, 1);
	//if there's a portrait to show, draw that
	if(current_portrait != noone) draw_sprite_ext(current_portrait, portrait_frame, x, y, 3, 3, 0, c_white, 1);

	//draw the dialogue text
	draw_text_ext(text_x, text_y, typed_line, 20, 300);

	//if the player is able to progress the dialogue, show the continue icon
	if(obj_story_manager.can_continue) draw_sprite_ext(spr_continue, -1, con_x, con_y, 3, 3, 0, c_white, 1);
}