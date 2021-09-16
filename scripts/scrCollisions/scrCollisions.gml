
//THIS FUNCTION DEALS WITH COLLISION ON THE X AND Y AXES
//		(collision with the sides of the player and sides of objects)
function place_meeting_2d(_x, _y, _z, _height, _obj){
	// check for multiple collisions with a ds_list
	var _col_list = ds_list_create();
	col_amount_xy = instance_place_list(_x, _y, _obj, _col_list, false);
	ds_grid_resize(col_grid_xy,2,col_amount_xy)

	// adds ds_list of instances to the grid
	// then adds their relative z distance to the second column 
	//		the distance is from the center of the z, imagine a cubes center value in height
	for (var i = 0; i < col_amount_xy; i++;)
	{
		var _inst = _col_list[| i];
		col_grid_xy[# 0, i] = _inst;
			
		var _dist = point_distance(0,_z + _height/2,0,_inst.z + _inst.z_height/2);
		col_grid_xy[# 1, i] = _dist;
	}
		
	// sort the grid by distance so that the shortest distance 
	// from the player is at the top, then use this instance for collision checks
	ds_grid_sort(col_grid_xy,1,true);
	if (col_amount_xy > 0) var _xy_meeting = col_grid_xy[# 0, 0];
	else var _xy_meeting = noone;
	
	// this value is required to prevent the player from being stuck in the object
	var _z_offset = 0.01;
	
	// check for z axis collision
	var _z_meeting = false;
	if (_xy_meeting)
	{
		_z_meeting = rectangle_in_rectangle(0, _xy_meeting.z, 1, _xy_meeting.z + _xy_meeting.z_height,	
						 0, _z + _z_offset, 1, _z + _height + _z_offset);
						 
		// makes sure we do not float around
		if (z_floor != _xy_meeting.z_top)
		{
			on_ground = false;
		}
	}
	else z_floor = 0;
	
	// returns true or false based on these criteria
	return _xy_meeting && _z_meeting;
}


//THIS FUNCTION DEALS WITH COLLISION ON THE Z AXIS
//		(collision with the top of the player and the bottom of an object)
//		(collision with the bottom of the player and the top of an object)
function place_meeting_3d(_x, _y, _z, _height, _obj)
{
	// check for multiple collisions with a ds_list
	var _col_list = ds_list_create();
	col_amount_z = instance_place_list(_x, _y, _obj, _col_list, false);
	ds_grid_resize(col_grid_z,2,col_amount_z)
	
	// adds ds_list of instances to the grid
	// then adds their relative z distance to the second column 
	//		the distance is from the center of the z, imagine a cubes center value in height
	for (var i = 0; i < col_amount_z; i++;)
	{
		var _inst = _col_list[| i];
		col_grid_z[# 0, i] = _inst;
		
		var _dist = point_distance(0,_z + _height/2,0,_inst.z + _inst.z_height/2)
		col_grid_z[# 1, i] = _dist;
	}
		
	// sort the grid by distance so that the shortest distance 
	// from the player is at the top, then use this instance for collision checks
	ds_grid_sort(col_grid_z,1,true);
	if (col_amount_z > 0) xy_meeting = col_grid_z[# 0, 0];
	else xy_meeting = noone;
	
	// this value is required to prevent the player from being stuck in the object
	var _z_offset = 0.01;
	
	// check for z axis collisions
	var _z_meeting = false;
	if (xy_meeting)
	{
		_z_meeting = rectangle_in_rectangle(0, xy_meeting.z, 1, xy_meeting.z + xy_meeting.z_height,	
						 0, _z + _z_offset, 1, _z + _height + _z_offset);
		

		// resets the our z_floor variable
		if (!on_ground)
		{
			if (z_floor != xy_meeting.z_top)
			{
				if (_z > xy_meeting.z_top) z_floor = xy_meeting.z_top;
				else z_floor = 0;
			}
		}
		
		// makes sure we do not float around
		if (z_floor != xy_meeting.z_top)
		{
			on_ground = false;
		}
	}
	else z_floor = 0;

	// returns true or false based on these criteria
	return xy_meeting && _z_meeting;
}


//FUNCTION USED TO STORE THE COLLISION CODE AND CHANGE THE COORDINATE VALUES 
function collision(){
	//X COLLISION
	if (place_meeting_2d(x + xsp, y, z, z_height, oWallParent))
	{
		while (!place_meeting_2d(x + sign(xsp), y, z, z_height,  oWallParent)) x += sign(xsp);
		xsp = 0;
	}	

	//Y COLLISION
	if (place_meeting_2d(x, y + ysp, z, z_height, oWallParent))
	{
		while (!place_meeting_2d(x, y + sign(ysp), z, z_height,  oWallParent)) y += sign(ysp);
		ysp = 0;
	}	

	//Z COLLISION
	if (place_meeting_3d(x, y, z + zsp, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y, z + sign(zsp), z_height,  oWallParent)) z += sign(zsp);
		zsp = 0;
	}	
	
	//CHANGE COORDINATE VALUES
	x += xsp;
	y += ysp;
	z += zsp;
}
