event_inherited();

/*
//DRAW BBOX
draw_set_color(c_red);
draw_rectangle(bbox_left,bbox_top - z,bbox_right,bbox_bottom - z,true);
draw_set_color(c_white);

//DEBUG
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(global.bitmap_font);

var _debug_text = "";
_debug_text += "z:" + string(z) + "\n";
_debug_text += "t:" + string(z_top) + "\n"; 
_debug_text += "dd:" + string(draw_depth) + "\n";

var _length = abs(bbox_top - bbox_bottom) + 1; 
_debug_text += "L:" + string(_length) + "\n";

draw_text(x,y - z_top,_debug_text);							   
draw_set_halign(fa_left);
draw_set_valign(fa_top);