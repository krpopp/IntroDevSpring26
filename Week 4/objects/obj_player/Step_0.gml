y_vel += grav; //add gravity to the y velocity (push the player down)

//add this frame's velocity to our remainder counters
r_x += x_vel; 
r_y += y_vel;

//round our remainder counters to find how many whole pixels we can move this frame
var to_move_x = round(r_x);
var to_move_y = round(r_y);

//find the decimal remainder of our velocities
r_x -= to_move_x;
r_y -= to_move_y;

//slow down our x velocity
x_vel *= 0.9;

//find the direction we're moving on the y axis
var dir = sign(to_move_y);

//while we have pixels to move on the y axis
while(to_move_y != 0) {
	//track if we're colliding and what we're colliding with
	var colliding = false;
	var collide_with = noone;
	
	//if we're going down
	if(dir >= 0) {
		//find the burger we would collide with in the next pixel to move
		collide_with = instance_place(x, y + dir, obj_burger);
		//if we did find a burger
		if(collide_with != noone) {
			//if we're not already overlapping with the burger
			if(place_meeting(x, y, collide_with) == false) {
				//set colliding to true
				colliding = true;
			}
		}
	}
	//if we're not colliding
	if(!colliding){
		//move on the y axis
		y += dir;
		//reduce how many pixels we need to move this frame
		to_move_y -= dir;
	//if we are colliding
	} else {
		//move on the y axis
		y = y + dir;
		//set our velocity to the bounce velocity
		y_vel = bounce_vel;
		//reset our remainder counter
		r_y = 0;
		//break from this for loop
		break;
	}
}

//move on the x axis
x += to_move_x;


//if we press the movement keys
//accelerate the x velocity in the appropriate direction
if(keyboard_check(vk_left)){
	x_vel -= accel;	
}
if(keyboard_check(vk_right)){
	x_vel += accel;
}