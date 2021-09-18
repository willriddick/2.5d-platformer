zoom_amount = ideal_room_width / ideal_width;
var _width = ideal_width * zoom_amount;
var _height = ideal_height * zoom_amount;

// Follow target
if instance_exists(target) 
{
	var _x = floor(clamp(target.x - (_width/2),  0, room_width  - _width));
	var _y = floor(clamp(target.y - target.z - (_height/2), 0, room_height - _height));
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
		
	if distance_to_object(target) < 500 { var _spd = 0.2; }
	else var _spd = 1;
	
	x = clamp(lerp(_cur_x, _x, _spd), 0, room_width  - _width);
	y = clamp(lerp(_cur_y, _y, _spd), 0, room_height - _height);
}

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Application surface
if window_get_fullscreen() {
	surface_resize(application_surface, _width * 4, _height * 4);
} else {
	surface_resize(application_surface, _width * 2, _height * 2);
}	

// Set camera
camera_set_view_size(view, _width, _height);
camera_set_view_pos(view, floor(x), floor(y));
display_set_gui_size(ideal_width, ideal_height);