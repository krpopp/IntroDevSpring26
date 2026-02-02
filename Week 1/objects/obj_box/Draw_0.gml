/// @description runs every frame
draw_sprite(spr_box,0,x,y)
draw_set_font(fnt_dialogue)
draw_text_ext(x+20,y+20,show_text,-1,sprite_get_width(spr_box)-12)

