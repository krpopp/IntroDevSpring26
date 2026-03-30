/// @description Insert description here
// You can write your code in this editor

if(abs(x - target_x) > 1){
	x = lerp(x, target_x, 0.1);
	depth = -1000;
} else {
	x = target_x;
	depth = target_depth;
}

if(abs(y - target_y) > 1){
	y = lerp(y, target_y, 0.1);
	depth = -1000;
} else {
	y = target_y;
	depth = target_depth;
}



//set the face sprite based on the index we assigned
//in obj_dealer's create
if(face_index==0) sprite_index = spr_blue;
else if(face_index==1) sprite_index = spr_red;
else if(face_index==2) sprite_index = spr_yellow;

//if it's not face up, set the sprite to the card back
if(!face_up) sprite_index = spr_card;

//draw the sprite
draw_sprite(sprite_index, image_index, x, y);




