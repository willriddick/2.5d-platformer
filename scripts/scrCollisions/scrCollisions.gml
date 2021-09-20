/*
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
*/

//COLLISION FUNCTION
function place_meeting_3d(_x, _y, _z, _height, _obj)
{
	// check for multiple collisions with a ds_list
	var _col_list = ds_list_create();
	collision_amount = instance_place_list(_x, _y, _obj, _col_list, false);
	
	// create grid to store collisions
	ds_grid_resize(collision_grid,2,collision_amount)
	for (var i = 0; i < collision_amount; i++;)
	{
		// adds the ds_list of instances to the grid
		var _inst = _col_list[| i];
		collision_grid[# 0, i] = _inst;
		
		// adds their relative z distance to the second column 
		var _dist = point_distance(0,_z + _height/2,0,_inst.z + _inst.z_height/2);
		collision_grid[# 1, i] = _dist;
	}
		
	// sort the grid by distance, shortest to longest
	// use the closest collision
	ds_grid_sort(collision_grid,1,true);
	if (collision_amount > 0) xy_meeting = collision_grid[# 0, 0];
	else xy_meeting = noone;
	

	// check for z axis collisions
	var _z_offset = 0.01; // required to prevent the player from being stuck in objects
	if (xy_meeting)
	{
		z_meeting = rectangle_in_rectangle(0, xy_meeting.z, 1, xy_meeting.z + xy_meeting.z_height,	
						 0, _z + _z_offset, 1, _z + _height + _z_offset);	
	}
	
	
	// returns true or false based on these criteria
	return xy_meeting && z_meeting;
}


//FUNCTION USED TO STORE THE COLLISION CODE AND CHANGE THE COORDINATE VALUES 
function collision(){
	/*
	//X SLOPE COLLISION
	if (place_meeting_2d(x + xsp, y, z, z_height, oWallDiagonal)) 
	{
		if (!place_meeting_2d(x + sign(xsp), y + 1, z, z_height, oWallDiagonal)) y++;
	}
	if (place_meeting_2d(x + xsp, y, z, z_height, oWallDiagonal)) 
	{
		if (!place_meeting_2d(x + sign(xsp), y - 1, z, z_height, oWallDiagonal)) y--;
	}
	//Y SLOPE COLLISION
	if (place_meeting_2d(x, y + ysp, z, z_height, oWallDiagonal)) 
	{
		if (!place_meeting_2d(x + 1, y + sign(ysp), z, z_height, oWallDiagonal)) x++;
	}
	if (place_meeting_2d(x, y + ysp, z, z_height, oWallDiagonal)) 
	{
		if (!place_meeting_2d(x - 1, y + sign(ysp), z, z_height, oWallDiagonal)) x--;
	}
	*/
		
	
	//X COLLISION
	var _xsp_final = xsp + xsp_push;
	if (place_meeting_3d(x + _xsp_final, y, z, z_height, oWallParent))
	{
		while (!place_meeting_3d(x + sign(_xsp_final), y, z, z_height,  oWallParent)) x += sign(_xsp_final);
		_xsp_final = 0;
		xsp = 0;
	}		
	
	//Y COLLISION
	var _ysp_final = ysp + ysp_push;
	if (place_meeting_3d(x, y + _ysp_final, z, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y + sign(_ysp_final), z, z_height,  oWallParent)) y += sign(_ysp_final);
		_ysp_final = 0;
		ysp = 0;
	}	

	//Z COLLISION
	var _zsp_final = zsp + zsp_push;
	if (place_meeting_3d(x, y, z + _zsp_final, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y, z + sign(_zsp_final), z_height,  oWallParent)) z += sign(_zsp_final);
		_zsp_final = 0;
		zsp = 0;
	}	
	
	//CHANGE COORDINATE VALUES
	x += _xsp_final;
	y += _ysp_final;
	z += _zsp_final;
}


