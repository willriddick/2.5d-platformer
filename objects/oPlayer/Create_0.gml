event_inherited();

xsp = 0;
ysp = 0;
zsp = 0;

h_move = 0;
v_move = 0;
h_move_speed = 3;
v_move_speed = 2;
move_dir = 0;

jumps_max = 2;
jumps = jumps_max;
jump_speed = 5;
grv = 0.3;
grv_max = 10;

draw_depth = 0;
z = 0;
z_floor = 0;
on_ground = true;
z_height = 12;

xy_meeting = -4;
col_grid = ds_grid_create(2,1);
col_amount = 0;