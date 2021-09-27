event_inherited();

/*
//SHADOW
draw_shadow = true;
if (draw_shadow) my_shadow = instance_create_layer(x,y,"Player",oShadow);
*/

destroy = false;
draw_depth = 0;


sprite_index = sParticleWalk;
image_index	 = 0;

image_xscale = 1;
image_yscale = 1;
image_speed  = 1;
image_angle  = 0;


z = 0;
z_floor = 0;

xsp = 0;
ysp = 0;
zsp = 0;

deccel = 0.9;