//MOVEMENT
xsp *= deccel;
ysp *= deccel;
zsp *= deccel;

x += xsp;
y += ysp;
z += zsp;


//DRAW PARTICLES
draw_depth = y + z;

draw_sprite_ext(sprite_index, image_index, x, y - z, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	
	
//KILL PARTICLE
if (image_index > image_number - 1) destroy = true;
if (destroy) instance_destroy();
