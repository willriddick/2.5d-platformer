//COLLISION FUNCTION
function place_meeting_3d2(_x, _y, _z, _height, _obj)
{
	// check for multiple collisions with a ds_list
	var _col_list = ds_list_create();
	collision_amount = instance_place_list(_x, _y, _obj, _col_list, false);
	
	// create grid to store collisions
	ds_grid_resize(collision_grid,2,collision_amount)
	for (var i = 0; i < collision_amount; i++;)
	{
		// gets the instance and distance from player of that instance
		var _inst = _col_list[| i];
		var _dist = point_distance(0,_z + _height/2,0,_inst.z + _inst.z_height/2);
		
		// stores the above data to the grid
		collision_grid[# 0, i] = _inst;
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
		z_meeting = rectangle_in_rectangle(0, xy_meeting.z + xy_meeting.zsp, 
						 1, xy_meeting.z + xy_meeting.z_height + xy_meeting.zsp,	
						 0, _z + _z_offset + zsp, 1, _z + _height + _z_offset + zsp);	
	} 
	else 
	{
		z_meeting = false;
	}
	
	
	// returns true or false based on these criteria
	return xy_meeting && z_meeting;
}


//FUNCTION USED TO STORE THE COLLISION CODE AND CHANGE THE COORDINATE VALUES 
function Collision2(){
	// push variables
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
	//xsp_final = round(xsp + xsp_push);
	xsp_final = xsp + xsp_push;
	if (place_meeting_3d(x + xsp_final, y, z, z_height, oWallParent))
	{
		while (!place_meeting_3d(x + sign(xsp_final), y, z, z_height, oWallParent)) x += sign(xsp_final);
		xsp_final = 0;
		xsp_push = 0;
		xsp = 0;
	}		
	
	//Y COLLISION
	//ysp_final = round(ysp + ysp_push);
	ysp_final = ysp + ysp_push;
	if (place_meeting_3d(x, y + ysp_final, z, z_height, oWallParent))
	{
		while (!place_meeting_3d(x, y + sign(ysp_final), z, z_height, oWallParent)) y += sign(ysp_final);
		ysp_final = 0;
		ysp_push = 0;
		ysp = 0;
	}	

	//Z COLLISION
	//zsp_final = round(zsp + zsp_push);
	zsp_final = zsp + zsp_push;
	if (place_meeting_3d(x, y, z + zsp_final, z_height, oWallParent))
	{
		//while (!place_meeting_3d(x, y, z + sign(zsp_final), z_height, oWallParent)) z += sign(zsp_final);
		zsp_final = 0;
		zsp_push = 0;
		zsp = 0;
	}	
	
	//CHANGE COORDINATE VALUES
	x += xsp_final;
	y += ysp_final;
	z += zsp_final;
} 

function AntiStick2(){
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
function CollisionGround2(){
	// get on_ground_id
	if (xy_meeting) && (on_ground)
	{
		if ((z - xy_meeting.z_top) <= 0.3) && (z >= xy_meeting.z_top)
		{
			on_ground_meeting = xy_meeting; 
		}
		else on_ground_meeting = noone;
	}
	else on_ground_meeting = noone;
	
	
	// get z_floor value
	if (on_ground)
	{
		if (on_ground_meeting)
		{
			z_floor = on_ground_meeting.z_top;	
		} 
		else z_floor = 0;
	}
	else
	{
		if (xy_meeting)
		{
			if (z > xy_meeting.z_top) z_floor = xy_meeting.z_top;	
			else z_floor = 0;
		} 
		else z_floor = 0;
	}
	
	
	// on ground
	if ((z - 1) <= z_floor) 
	{
		on_ground = true;
		z = z_floor;
		on_ground_timer = coyote_time;
		
	}
	else on_ground = false;
	
	
	if (on_ground) 
	{
		z = z_floor;
		on_ground_timer = coyote_time;
	}
	
	
	// gravity
	if (!on_ground)
	{		
		// cap the gravity to grv max
		if (zsp > -grv_max) zsp -= grv;	
		else zsp = -grv_max;
	} 
			
	
	// snap to ground
	if ((z + zsp_final) <= z_floor)
	{
		z = z_floor;
		zsp_final = 0;
		zsp = 0;
	}
}
