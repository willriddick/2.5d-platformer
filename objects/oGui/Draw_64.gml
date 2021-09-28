with (oPlayer)
{
	//SET UP TEXT
	var _w = display_get_gui_width();
	var _h = display_get_gui_height();

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(global.bitmap_font);
	
	
	//DEFINE TEXT
	var _debug = "";
	_debug += "state: " + string(state.name) + "\n";
	_debug += "draw_depth: " + string(draw_depth) + "\n";
	_debug += "z: " + string(z) + "\n";
	_debug += "zsp_final: " + string(zsp_final) + "\n"; 
	_debug += "z_floor: " + string(z_floor) + "\n";
	_debug += "xy_meeting: " + string(xy_meeting) + "\n";
	_debug += "on_ground: " + string(on_ground) + "\n";
	_debug += "on_ground_meeting: " + string(on_ground_meeting) + "\n";
	_debug += "jumps: " + string(jumps) + "\n";

	//_debug += "n_meeting: " + string(north_meeting) + "\n";

	
	if (on_ground_meeting)
	{
		_debug += "g.dd: " + string(on_ground_meeting.draw_depth) + "\n";
		_debug += "g.z: " + string(on_ground_meeting.z) + "\n";
		_debug += "g.z_height: " + string(on_ground_meeting.z_height) + "\n";
		var _length = abs(on_ground_meeting.bbox_top - on_ground_meeting.bbox_bottom) + 1;
		_debug += "g.length: " + string(_length) + "\n";
	}

	
	//DRAW TEXT
	draw_text(16,16,_debug);	
}