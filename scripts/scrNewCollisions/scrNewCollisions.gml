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
function Collision(){
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
		xsp_push = 0; 
		
	}		
	
	//Y COLLISION
	var _ysp_final = ysp + ysp_push;
	if (place_meeting_3d(x, y + _ysp_final, z, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y + sign(_ysp_final), z, z_height,  oWallParent)) y += sign(_ysp_final);
		_ysp_final = 0;
		ysp = 0;
		ysp_push = 0; 
		
	}	

	//Z COLLISION
	var _zsp_final = zsp + zsp_push;
	if (place_meeting_3d(x, y, z + _zsp_final, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y, z + sign(_zsp_final), z_height,  oWallParent)) z += sign(_zsp_final);
		_zsp_final = 0;
		zsp = 0;
		zsp_push = 0; 
		
	}	
	
	//CHANGE COORDINATE VALUES
	x += _xsp_final;
	y += _ysp_final;
	z += _zsp_final;
}


function AntiStick(){
	if (place_meeting_3d(x, y, z, z_height, oWallParent))
	{
		for (var i = 0; i < 64; i++)
		{
			if (!place_meeting_3d(x + 1, y, z, z_height, oWallParent)) x+=1;
			if (!place_meeting_3d(x - 1, y, z, z_height, oWallParent)) x-=1;
			if (!place_meeting_3d(x, y + 1, z, z_height, oWallParent)) y+=1;
			if (!place_meeting_3d(x, y - 1, z, z_height, oWallParent)) y-=1;
			if (!place_meeting_3d(x, y, z + 1, z_height, oWallParent)) z+=1;
			if (!place_meeting_3d(x, y, z - 1, z_height, oWallParent)) z-=1;
		}
	}
}	


//FUNCTION USED TO PLACE PLAYER IN THE Z_AXIS
function CollisionGround(){
	//ON GROUND
	if ((z - z_floor) <= 0.2) on_ground = true;
	else on_ground = false;

	if (on_ground) 
	{
		z = z_floor;
		on_ground_timer = coyote_time;
	}

	// get on_ground_id
	if (xy_meeting)
	{
		if ((z - xy_meeting.z_top) <= 0.2) &&  (z+1 > xy_meeting.z_top)
		{
			on_ground_meeting = xy_meeting; 	
		} else on_ground_meeting = noone;
	} else on_ground_meeting = noone;


	//PUSH VARIABLES
	if (on_ground_meeting)
	{
		xsp_push = on_ground_meeting.xsp;	
		ysp_push = on_ground_meeting.ysp;	
		zsp_push = on_ground_meeting.zsp;	
	}
	else 
	{
		xsp_push = 0;
		ysp_push = 0;
		zsp_push = 0;
	}

	// set z_floor
	if (!on_ground) 
	{
		if (xy_meeting)
		{
			if (z > xy_meeting.z_top) z_floor = xy_meeting.z_top;	
			else z_floor = 0;
		} else z_floor = 0;
	}
	else if (on_ground)
	{
		if (on_ground_meeting)
		{
			z_floor = on_ground_meeting.z_top;	
		} else z_floor = 0
	}
}