/// @description runs when an instance of this object is made
text_box = instance_create_layer(x - sprite_get_width(spr_box), y, "Instances", obj_box);
instance_deactivate_object(text_box);

text_start_x = -1;
text_start_y = -1;

x_vel = 0;
y_vel = 0;

x_walk_count = 0;
y_walk_count = 0;

showing_text = false;

hit_kid = false;

kid_dialogue = "AH AN ALIEN!!!";