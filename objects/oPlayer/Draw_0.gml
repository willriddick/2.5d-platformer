//DRAW SHAODW
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(bbox_left,bbox_top - z_floor,bbox_right,bbox_bottom - z_floor,false);
draw_set_color(c_white);
draw_set_alpha(1);


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

draw_text(x,y-z_height,string(draw_depth));

