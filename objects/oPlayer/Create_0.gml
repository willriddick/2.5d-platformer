event_inherited();

//SHADOW AND DEPTH
my_shadow = instance_create_layer(x,y,"Player",oShadow);
//my_shadow = -4;
draw_depth = 0;


//STATES
states = {
	idle:		 new State("idle",StateNormal,sPlayer,false),
	walk:		 new State("walk",StateNormal,sPlayer,false),
	air:		 new State("air",StateNormal,sPlayer,false),
	crouch:		 new State("crouch",StateCrouch,sPlayerCrouch,false),
	jetpack:     new State("jetpack",StateJetpack,sPlayer,false)
}
state = states.idle;
state_timer = 0;

//COORDINATE SPEEDS
xsp = 0;
ysp = 0;
zsp = 0;

xsp_push = 0;
ysp_push = 0;
zsp_push = 0;

xsp_final = 0;
ysp_final = 0;
zsp_final = 0;


//X AND Y MOVEMENT
h_move = 0;
v_move = 0;
move_dir = 0;

h_move_speed_default = 2;
v_move_speed_default = 1.5;
h_move_speed = h_move_speed_default;
v_move_speed = v_move_speed_default;


//JUMPING
jumps_max		= 1;
jumps			= jumps_max;
jump_speed		= 4;
on_ground_timer = 0;
coyote_time		= 7;

jump_buffer_timer = 0;
jump_buffer		  = 15;


//CROUCH
crouch = false;
h_move_speed_crouch = 1;
v_move_speed_crouch = 0.75;


//Z AXIS AND GRAVITY
grv_max	   = 7;
grv		   = 0.25;
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
int_particle_walk	 = 0;
int_particle_land	 = 0;
int_particle_jetpack = 0;