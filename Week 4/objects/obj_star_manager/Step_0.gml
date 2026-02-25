/// @description Insert description here
// You can write your code in this editor

//gets the number of stars in the room
var num_stars = instance_number(obj_star);

//timer to make a new star
frames_since_star += 1;

//if the star timer is up OR there are less than 8 stars
if(frames_since_star > frames_bt_star || num_stars < 8) {
	//if we have less than the max number of stars
	if(num_stars < max_stars) {
		var new_star = instance_create_layer(
			random_range(10, room_width - 10),
			random_range(100, room_height - 50),
			"Instances",
			obj_star
		);
		
		with(new_star) {
			var tries = 0;
			while(tries < 3000 && collision_rectangle(
				x-12, y-12,
				x+12, y+12,
				obj_star,
				false, true) != noone){
					x = random_range(10, room_width - 10);
					y = random_range(100, room_height - 50);
					tries += 1;
			}
		}
	}
	frames_since_star = 0;
}
