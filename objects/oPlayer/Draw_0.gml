//SET DRAW DEPTH
draw_depth = y + z + z_height/2;


//DRAW OURSELVES
draw_sprite_ext(sprite_index, image_index, x, y - z, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);

/*
//DRAW BBOX
draw_set_color(c_red);
draw_rectangle(bbox_left,bbox_top - z,bbox_right,bbox_bottom - z,true);
draw_set_color(c_white);
*/



//DRAW DEBUG
var _w = display_get_gui_width();
var _h = display_get_gui_height();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.bitmap_font);
var _debug = "";
_debug += "draw_depth: " + string(draw_depth) + "\n";
_debug += "z: " + string(z) + "\n";
_debug += "zsp: " + string(zsp) + "\n"; 
_debug += "z_floor: " + string(z_floor) + "\n";
_debug += "on_ground: " + string(on_ground) + "\n";
_debug += "jumps: " + string(jumps) + "\n";
_debug += "xy_meeting: " + string(xy_meeting) + "\n";
_debug += "on_ground_id: " + string(on_ground_id) + "\n";
draw_text(x - _w/2 + 16,y - _h/2,_debug);
