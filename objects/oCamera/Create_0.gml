//Display Properties
ideal_width = 512;
ideal_height = 288;

aspect_ratio = display_get_width() / display_get_height();

ideal_height = round(ideal_width / aspect_ratio);
if (ideal_height & 1) {
	ideal_height++;
}

window_set_size(ideal_width * 4, ideal_height * 4);
alarm[0] = 1;
display_set_gui_size(ideal_width, ideal_height);

//Zooming
ideal_room_width = ideal_width;
zoom_amount = 1;

//Screenshake
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

target = oPlayer;

view = view_camera[0];