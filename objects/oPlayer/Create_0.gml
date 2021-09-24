event_inherited();

//SHADOW AND DEPTH
my_shadow = instance_create_layer(x,y,"Player",oShadow);
//my_shadow = -4;
draw_depth = 0;


//COORDINATE SPEEDS
xsp = 0;
ysp = 0;
zsp = 0;

xsp_push = 0;
ysp_push = 0;
zsp_push = 0;


//X/Y MOVEMENT
h_move = 0;
v_move = 0;
h_move_speed = 2;
v_move_speed = 1.5;
move_dir	 = 0;
move_speed_multiplier = 1;


//JUMPING
jumps_max		= 1;
jumps			= jumps_max;
jump_speed		= 4;
on_ground_timer = 0;
coyote_time		= 7;

jump_buffer_timer = 0;
jump_buffer		  = 10;
crouch = false;


//Z AXIS AND GRAVITY
grv_max	   = 7;
grv		   = 0.2;
z		   = 0;
z_floor    = 0;
on_ground  = false;
z_height   = 12;


//COLLISION
on_ground_meeting = -4;
//west_meeting = -4;
xy_meeting = -4;
z_meeting = false;

collision_grid    = ds_grid_create(2,1);
collision_amount  = 0;


//PARTICLES
int_particle_walk = 0;
int_particle_land = 0;