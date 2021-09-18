if (draw_sprite_) 
{
	//DRAW SPRITE
	draw_sprite_ext(sprite_index, image_index, x, y - z, 
		 image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
	//DRAW RECTANGLE
	draw_set_color(c_black);
	draw_set_alpha(image_alpha);
	draw_rectangle(x1,y1,x2,y2,false);
}

draw_set_color(c_white);
draw_set_alpha(1);

if (destroy) instance_destroy();