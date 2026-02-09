/// @description Insert description here
// You can write your code in this editor

//current character portrait image to show
current_portrait = spr_player_p;

//origin point i want to place all the ui in relation to
//based on the viewport, since this is all UI
x = view_wport[0] * 0.15;
y = view_hport[0] * 0.8;

//set the font face and color
draw_set_font(fnt_dialogue);
draw_set_color(c_black);

//referencing the background UI images
box_spr = spr_portrait_box;
dia_spr = spr_dialogue_box;

//position for dialogue text
text_x = x + 60;
text_y = y - 40;

//position for continue icon
con_x = x + 360;
con_y = y + 20;

//tldr for how type writer text works:
//typed_line is what is currently showing on the screem
//typing_index increments through each char in the string
//typing_max is the time in frames between each letter we type
//typing_time counts frames to time our next letter to type
typed_line = "";
typing_index = -1;
typing_max = 3;
typing_time = 0;

//which frame of the portrait we should show
portrait_frame = 0;
//what sound plays each time a new letter is typed
letter_sound = noone;

//reset typewriter effect stuff
function Reset_Type(_char){
	portrait_frame = real(_char); //change the current portrait
	typed_line = ""; //clear the current line being shown
	typing_index = 0; //reset the index that counts chars to add to the shown dialogue
	//this also triggers the type writer effect to start
}
