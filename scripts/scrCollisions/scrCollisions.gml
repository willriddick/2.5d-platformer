function place_meeting_3d(_x, _y, _z, _height, _obj)
{
	// check for multiple collisions with ds
	var _col_list = ds_list_create();
	col_amount = instance_place_list(_x, _y, _obj, _col_list, false);
	ds_grid_resize(col_grid,2,col_amount)
	
	//add list to grid, then add their z relative distance in second column
	for (var i = 0; i < col_amount; i++;)
	{
		var _inst = _col_list[| i];
		col_grid[# 0, i] = _inst;
			
		var _z_dist = abs(_z - _inst.z_top);
		col_grid[# 1, i] = _z_dist;
	}
		
	// sort the grid so that the shortest distance from the player is at the top, use this instance
	ds_grid_sort(col_grid,1,true);
	if (col_amount > 0) xy_meeting = col_grid[# 0, 0];
	else xy_meeting = noone;
	


	var _z_offset = 0.01;
	var _z_meeting = false;
	if (xy_meeting)
	{
		_z_meeting = rectangle_in_rectangle(0, xy_meeting.z, 1, xy_meeting.z + xy_meeting.z_height,	
						 0, _z + _z_offset, 1, _z + _height + _z_offset);
		
	
		if (!on_ground)
		{
			if (z_floor != xy_meeting.z_top)
			{
				if (_z > xy_meeting.z_top) z_floor = xy_meeting.z_top;
				else z_floor = 0;
			}
		}
		if (z_floor != xy_meeting.z_top)
		{
			on_ground = false;
		}
	}
	else z_floor = 0;
	

	return xy_meeting && _z_meeting;
}

/*
function place_meeting_3d(_x, _y, _obj)
{
	var _meeting = instance_place(_x, _y, _obj);
	
	if (_meeting == noone) or (z <= _meeting.z) or (z_height >= _meeting.z)
	{
		return false;	
	}
	
	return true;
}
*/