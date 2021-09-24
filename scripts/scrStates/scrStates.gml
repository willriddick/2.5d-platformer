function State(_name,_sprite, _end_on_animation) constructor {
	name = _name;
	sprite = _sprite;
	
	end_on_animation = _end_on_animation;
	on_end_state = undefined;
	
	function OnEndState(_state) {
		on_end_state = _state;
	}
}

function StateSet(_state,_time) {
	if (state == _state) return;
	
	state = _state;
	state_timer = _time;
	
	sprite_index = state.sprite;
	image_index = 0;
}