//DRAW SHAODW
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
draw_set_color(c_white);
draw_set_alpha(1);


//SET Z TOP
z_top = z + z_height;


//SET DRAW DEPTH
draw_depth = y + z;


//DRAW OURSELVES
draw_sprite_ext(sprite_index, image_index, x, y - z, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);


//DRAW BBOX
draw_set_color(c_red);
draw_rectangle(bbox_left,bbox_top - z,bbox_right,bbox_bottom - z,true);
draw_set_color(c_white);


/*
//DEBUG
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(global.bitmap_font);
draw_text(x,y - z_top, "t:" + string(z_top) + "\n" +
					   "z:" + string(z) + "\n" +
					   "dd:" + string(draw_depth));
draw_set_halign(fa_left);
draw_set_valign(fa_top);