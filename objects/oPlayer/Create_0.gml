event_inherited();

xsp = 0;
ysp = 0;
zsp = 0;

h_move = 0;
v_move = 0;

h_move_speed = 2;
v_move_speed = 1.5;
move_dir	 = 0;
jumps_max	 = 2;
jumps		 = jumps_max;
jump_speed	 = 4;
grv			 = 0.2;
grv_max		 = 7;

crouch = false;

draw_depth = 0;
z		   = 0;
z_floor    = 0;
on_ground  = false;
z_height   = 12;

xy_meeting = -4;
col_grid_xy   = ds_grid_create(2,1);
col_amount_xy = 0;
col_grid_z    = ds_grid_create(2,1);
col_amount_z  = 0;
