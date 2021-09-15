//DRAW SHAODW
draw_set_color(c_black);
draw_set_alpha(0.4);

/*
// change size of shadow depend upon height
var _height = bbox_bottom - bbox_top;
var _size = ( _height/2 * (1 - (z/256)) )
draw_rectangle(bbox_left,y-_size ,bbox_right,y+_size ,false);
*/

draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
draw_set_color(c_white);
draw_set_alpha(1);


//DRAW OURSELVES
draw_sprite_ext(sprite_index, image_index, x, y - z, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);

/*
//DEBUG
draw_set_font(global.bitmap_font);
var _debug = "";
_debug += "z: " + string(z) + "\n";
_debug += "z+height: " + string(z + z_height) + "\n";
draw_text(x,y,_debug);