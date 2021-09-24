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

//NUDGE
if (oInput.pad_up) y--;
if (oInput.pad_down) y++;
if (oInput.pad_left) x--;
if (oInput.pad_right) x++;


//CROUCHING
if (oInput.punch_hold) crouch = true;
if (crouch) && (!oInput.punch_hold)
{
	z_height = 12;	
	
	// makes sure you do not get stuck in ceiling after uncrouching
	if (!place_meeting_3d(x, y, z+1, z_height, oWallParent)) 
	{
		crouch = false
	}
	else 
	{
		z_height = 6;	
		crouch = true;
	}
}

// sets sprite, height and speed for crouching
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
	

//JUMPING
if (on_ground_timer > 0) on_ground_timer--;
else on_ground_timer = 0;

if (jump_buffer_timer > 0) jump_buffer_timer--;
else jump_buffer_timer = 0;

if (on_ground) jumps = jumps_max;

// set jump buffer
if ((oInput.jump) && (jumps > 0) && (on_ground_timer > 0)) 
{	
	jump_buffer_timer = jump_buffer;
}

// jump
if (jump_buffer_timer > 0)
{
	zsp = jump_speed;	
	jumps--;
	jump_buffer_timer = 0;
}

// variable jump height
if (zsp > 0) && (!oInput.jump_hold) && (!oInput.kick_hold)
{
	zsp *= 0.75;
}



//JETPACK
if (oInput.kick_hold)
{
	if (zsp < 0.8)
	{
		if (zsp < 0.8) zsp += 0.3;	
		else zsp = 0.8;
	}
	
	if (!on_ground)
	{
		int_particle_walk++;
		if (int_particle_walk >= 2)
		{
			CreateParticle(sParticleWalk,0,0.5,1,"Player",x,y,z,-1,1,-1,1,-1,-4);
			int_particle_walk = 0;
		}
	}
}




//GRAVITY
if (!on_ground)
{		
	// cap the gravity to grv max
	if (zsp > -grv_max) zsp -= grv;	
	else zsp = -grv_max;
}


//COLLISIONS
Collision();
CollisionGround();
//AntiStick();

//SHADOW
with (my_shadow)
{	
	draw_depth = round(other.y + ((other.z_floor) * 8));
	draw_sprite_ = false;
	
	if (!other.on_ground) image_alpha = 0.4;
	else image_alpha = 0;
	
	x1 = other.bbox_left;
	x2 = other.bbox_right;
	y1 = other.bbox_top - other.z_floor;
	y2 = other.bbox_bottom - other.z_floor;
}


//PARTICLES
// create walk particle
if (on_ground && ((xsp != 0) or (ysp !=0)))
{
	int_particle_walk++;
	if (int_particle_walk >= 5)
	{
		CreateParticle(sParticleWalk,-1,1.5,2,"Player",x,y,z,0,0,0,0,0.1,0.5);
		int_particle_walk = 0;
	}
}

// create land particle
if (on_ground && int_particle_land == 0)
{
	repeat(10) CreateParticle(sParticleWalk,2,1.5,2.5,"Player",x,y,z,-1.5,1.5,-1.5,1.5,0,0);	
	int_particle_land = 1;
}
if (!on_ground) int_particle_land = 0;
