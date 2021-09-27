event_inherited();

draw_shadow = true;
if (draw_shadow) my_shadow = instance_create_layer(x,y,"Player",oShadow);

draw_depth = 0;
z = 0;
z_height = 16;
z_floor = 0;
z_top = z + z_height;

xsp = 0;
ysp = 0;
zsp = 0;

xy_meeting = 0;
z_meeting = 0;
collision_amount = 0;
collision_grid = 0;