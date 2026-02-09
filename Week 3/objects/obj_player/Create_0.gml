/// @description Insert description here
// You can write your code in this editor

//speed
vel = 1;

//current speed
x_v = 0;
y_v = 0;

//direction player is facing for animation 
dir = -1;

//animation frames for each walk cycle
down_walk = [1, 2, 3, 4];
side_walk = [6, 7, 8, 9];
up_walk = [11, 12, 13, 14];

//animation frames for idle
down_idle = [0];
side_idle = [5];
up_idle = [10];

//which animation should play and how fast
current_anim = down_idle;
image_index = current_anim[0];
image_speed = 0;

//checks if audio for bumping into stuff has played
played_bump = false;


dialogue = [
	"11jvjoi andnd anfdkndak",
	"00aad alsdffdk pmjpj kgmkg dd",
	"21adsm m qwdasd qfvnv"
]

event_sounds = [
	noone,
	snd_event
]

//start the game story
obj_story_manager.Start_Dialogue(self);