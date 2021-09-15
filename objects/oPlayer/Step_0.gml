//MOVEMENT
h_move = oInput.right - oInput.left;
v_move = oInput.down - oInput.up;
move_dir = point_direction(0,0,h_move,v_move);

// verify we are trying to move
if ((h_move != 0) or (v_move != 0))
{
	xsp = lengthdir_x(h_move_speed,move_dir);
	ysp = lengthdir_y(v_move_speed,move_dir);
}
else
{
	xsp = 0;
	ysp = 0;
}


//CROUCHING
if (oInput.punch_hold)
{
	sprite_index = sPlayerCrouch;
	z_height = 6;	
}
else 
{
	sprite_index = sPlayer;
	z_height = 12;		
}
	
	
//ON GROUND
if ((z - z_floor) <= 0.3) on_ground = true;
else on_ground = false;
if (on_ground) z = z_floor;


//JUMPING
if (on_ground)  jumps = jumps_max;
if ((oInput.jump) && (jumps > 0))
{
	zsp = jump_speed;	
	jumps--;
}
if (zsp > 0) && (!oInput.jump_hold) zsp *= 0.75;


//GRAVITY
if (!on_ground)
{
	// cap the gravity to grv max
	if (zsp > -grv_max)  zsp -= grv;	
	else zsp = grv_max;
}

//Z FLOOR
if (z + zsp < z_floor) 
{
	z = z_floor;
	zsp = 0;
}


//COLLISIONS
if (place_meeting_3d(x + xsp, y, z, z_height, oWallParent))
{
	while (!place_meeting_3d(x + sign(xsp), y, z, z_height,  oWallParent)) x += sign(xsp);
	xsp = 0;
}	

if (place_meeting_3d(x, y + ysp, z, z_height,  oWallParent))
{
	while (!place_meeting_3d(x, y + sign(ysp), z, z_height,  oWallParent)) y += sign(ysp);
	ysp = 0;
}	

//Z COLLISION
if (place_meeting_3d(x, y, z + zsp, z_height,  oWallParent))
{
	while (!place_meeting_3d(x, y, z + sign(zsp), z_height,  oWallParent)) z += sign(zsp);
	zsp = 0;
}	

	
//CHANGE COORDINATE VALUES
x += xsp;
y += ysp;
z += zsp;