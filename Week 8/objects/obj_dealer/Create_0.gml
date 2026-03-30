/// @description Insert description here
// You can write your code in this editor

//number of cards in our deck
num_cards =  12;

//counter to wait between moving cards
move_timer = 0;

//lists to store cards depending on their status
deck = ds_list_create();
player_hand = ds_list_create();
discard = ds_list_create();

enum STATES {
	DEALING,
	SELECTING,
	COMPARING,
	RESOLVING,
	RESHUFFLING
}

state = STATES.DEALING;

//CHANGE LATER: booleans to track game state
dealing = true;
resolve = false;
clean_up = false;

//vars to track which cards the player has selected
select_one = noone;
select_two = noone;

//loop through to make the cards in the deck
for(var _i = 0; _i < num_cards; _i++) {
	//make a card, set it up, add it to the deck
	var _new_card = instance_create_layer(x, y, "Instances", obj_card);
	_new_card.target_x = x;
	_new_card.target_y = y;
	_new_card.target_depth = 0;
	_new_card.in_hand = false;
	_new_card.face_up = false;
	//% means modulo
	//it calculates the remained of the equation
	//this allows us to iterate through 0,1, and 2
	_new_card.face_index = _i % 3;
	ds_list_add(deck, _new_card);
}

//randomize the game seed and shuffle the deck
randomize();
ds_list_shuffle(deck);

//loop through and place the cards in the correct position
//staggered to look like a deck
for(var _i = 0; _i < num_cards; _i++){
	deck[| _i].target_y = y - 2 * _i;
	deck[| _i].target_depth = num_cards - _i;
	//deck[| _i].y = y - 2 * _i;
	//deck[| _i].depth = num_cards - _i;
}





