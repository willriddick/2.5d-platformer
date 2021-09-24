//ZTOP
z_top = z + z_height;


///COLLISION
// check for multiple collisions with a ds_list
var _col_list = ds_list_create();
var _col_list_below = [];
collision_amount = instance_place_list(x, y, oWallParent, _col_list, false);
	
// create grid to store collisions
ds_grid_resize(collision_grid,2,collision_amount)
for (var i = 0; i < collision_amount; i++;)
{
	// gets instances and their relative distances
	var _inst = _col_list[| i];
	var _dist = (z + z_height/2) - (_inst.z + _inst.z_height/2);
	
	if (_dist > 0) array_push(_col_list_below, _inst)
}

for (var i = 0; i < array_length(_col_list_below); i++;)
{
	var _inst = _col_list_below[i];
	var _dist = (z + z_height/2) - (_inst.z + _inst.z_height/2);
	
	collision_grid[# 0, i] = _inst;
	collision_grid[# 1, i] = _dist;
}
		
// sort the grid by distance, shortest to longest
// use the closest collision
ds_list_destroy(_col_list);
ds_grid_sort(collision_grid,1,true);
if (collision_amount > 0) xy_meeting = collision_grid[# 0, 0];
else xy_meeting = noone;


if (xy_meeting)
{
	if (xy_meeting.z_top < z_top)
	{
		if (xy_meeting.z_top == z) draw_shadow = false;
		else z_floor = xy_meeting.z_top;	
	} else z_floor = 0;
} else z_floor = 0;



//SHADOW
if (z == 0) draw_shadow = false;

if (!draw_shadow) 
{
	instance_destroy(my_shadow);
}
else with (my_shadow)
{
	draw_depth = other.y + other.z_floor;
	draw_sprite_ = false;
	x1 = other.bbox_left;
	x2 = other.bbox_right;
	y1 = other.bbox_top - other.z_floor;
	y2 = other.bbox_bottom - other.z_floor;
	image_alpha = 0.4;
}
