/// @description Insert description here
// You can write your code in this editor
//if we're dealing


//if(dealing) {
switch(state){
	case STATES.DEALING:
		//find how many cards are in the player's hand
		var _player_num = ds_list_size(player_hand);
		//if there are fewer than 4 cards in the hand and the move timer is 0
		if(_player_num < 4 && move_timer <= 0) {
			//grab a card from the deck
			//remove it from the deck, put it in the hand
			//set its position to the hand area
			//tell the card it's in the hand
			var _dealt_card = ds_list_find_value(deck, ds_list_size(deck)-1);
			ds_list_delete(deck, ds_list_size(deck)-1);
			ds_list_add(player_hand, _dealt_card);
			_dealt_card.target_x = 200 + _player_num * 100;
			_dealt_card.target_y = room_height - 200;
			//_dealt_card.x = 200 + _player_num * 100;
			//_dealt_card.y = room_height - 200;
			_dealt_card.in_hand = true;
		} else if(_player_num == 4){
			//if we have 4 cards we're no longer dealing
			state = STATES.SELECTING;
			//dealing = false;
		}
		break;
	case STATES.SELECTING:
		//if we're not resolving a match or cleaning up the board
		//} else if(!resolve && !clean_up){
		//if the player has selected 2 cards, move to the resolve state
		if(select_one != noone && select_two != noone && move_timer <= 0) state = STATES.COMPARING;
		break;
	case STATES.COMPARING:
		//} else if(resolve){
			//if we're resolving, check if the cards match
			if(select_one.face_index == select_two.face_index) show_debug_message("you matched");
			else show_debug_message("you are a loser");
			//stop resolving and move on to clean up the board
			//resolve = false;
			//clean_up = true;
			state = STATES.RESOLVING;
		break;
	case STATES.RESOLVING:
	//} else if(clean_up){
		//if we're cleaning up
		//check the number of cards in the player's hand
		var _player_num = ds_list_size(player_hand);
		//if there are still cards in the hand and the timer is 0
		if(_player_num > 0 && move_timer <= 0){
			//get a card from the hand
			//remove it from the hand, add it to the discard
			//set it's new position and reset its hand-related vars
			var _hand_card = ds_list_find_value(player_hand, ds_list_size(player_hand)-1);
			ds_list_delete(player_hand, ds_list_size(player_hand)-1);
			ds_list_add(discard, _hand_card);
			_hand_card.target_x = room_width - 200;
			_hand_card.target_y = y;
			//_hand_card.x = room_width - 200;
			//_hand_card.y = y;
			_hand_card.in_hand = false;
			_hand_card.face_up = false;
			//if the player's hand is empty
		} else if(_player_num == 0) {
			//if the deck isn't empty, deal cards starting next frame
			if(ds_list_size(deck) > 0) {
				state = STATES.DEALING;
				//dealing = true;
			} else {
				state = STATES.RESHUFFLING;
			}
			//reset all the other vars
			//resolve = false;
			//clean_up = false;
			select_one = noone;
			select_two = noone;
		}
		break;
	case STATES.RESHUFFLING:
		break; 
}

//counts when we should move a card
move_timer++;
if(move_timer > 16){
	move_timer = 0;
}






