//DEBUG
if keyboard_check_pressed(vk_f3) global.debug = !global.debug;
if keyboard_check_pressed(ord("X")) game_end();
if keyboard_check_pressed(ord("R")) game_restart();
if keyboard_check_pressed(ord("F")) 
{
	if window_get_fullscreen() window_set_fullscreen(false);
	else window_set_fullscreen(true);
}