//VARIABLES
global.paused = false;
global.debug = false;
global.sound_buffer = 0;
room_main_menu = rmInit;
in_menu_room   = false;
destroy_menu   = false;

//ADD FONT
map_string = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
global.bitmap_font = font_add_sprite_ext(sBitmapFont, map_string, false, 0);


//GOTO NEXT ROOM
random_set_seed(randomize());
room_goto_next();
