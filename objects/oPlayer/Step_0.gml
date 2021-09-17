         //MOVEMENT
h_move = oInput.right - oInput.left;
v_move = oInput.down - oInput.up;
move_dir = point_direction(0,0,h_move,v_move);

// verify we are trying to move
if ((h_move != 0) or (v_move != 0))
{
	xsp = lengthdir_x(h_move_speed * move_speed_multiplier,move_dir);
	ysp = lengthdir_y(v_move_speed * move_speed_multiplier,move_dir);
}
else
{
	xsp = 0;
	ysp = 0;
}


//CROUCHING
if (oInput.punch_hold) crouch = true;
else 
{
	z_height = 12;	
	
	if (!place_meeting_3d(x, y, z, z_height, oWallParent)) 
	{
		crouch = false
	}
	else
	{
		z_height = 6;	
		crouch = true;
	}
}

if (crouch)
{
	sprite_index = sPlayerCrouch;
	z_height = 6;	
	move_speed_multiplier = 0.5;
}
else 
{
	sprite_index = sPlayer;
	z_height = 12;		
	move_speed_multiplier = 1;
}
	
	
//ON GROUND
if ((z - z_floor) <= 0.1) on_ground = true;
else on_ground = false;
if (on_ground) z = z_floor;

// create walk particle
if (on_ground && ((xsp != 0) or (ysp !=0)))
{
	int_particle_walk++;
	if (int_particle_walk >= 5)
	{
		create_particle(sParticleWalk,-1,1.5,2,"Player",x,y,z,0,0,0,0,0.1,0.5);
		int_particle_walk = 0;
	}
}

// create land particle
if (on_ground && int_particle_land == 0)
{
	repeat(10) create_particle(sParticleWalk,2,1.5,2.5,"Player",x,y,z,-1.5,1.5,-1.5,1.5,0,0);	
	int_particle_land = 1;
}
if (!on_ground) int_particle_land = 0;

	

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
collision();
