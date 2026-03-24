/// @description Insert description here
// You can write your code in this editor

//set the face sprite based on the index we assigned
//in obj_dealer's create
if(face_index==0) sprite_index = spr_blue;
else if(face_index==1) sprite_index = spr_red;
else if(face_index==2) sprite_index = spr_yellow;

//if it's not face up, set the sprite to the card back
if(!face_up) sprite_index = spr_card;

//draw the sprite
draw_sprite(sprite_index, image_index, x, y);




