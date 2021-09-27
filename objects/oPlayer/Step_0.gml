//STATE MACHINE
switch (state)
{
	case states.idle:		StateNormal();	break;
	case states.walk:		StateNormal();	break;
	case states.air:		StateNormal();	break;
	case states.crouch:     StateCrouch();	break;
	case states.jetpack:	StateJetpack();	break;
}
if (state_timer < 0) state_timer--;
else state_timer = 0;


//SPRITE
sprite_index = state.sprite;


//MOVEMENT
h_move = oInput.right - oInput.left;
v_move = oInput.down - oInput.up;
move_dir = point_direction(0,0,h_move,v_move);

// verify we are trying to move
if ((h_move != 0) or (v_move != 0))
{
	xsp = lengthdir_x(h_move_speed, move_dir);
	ysp = lengthdir_y(v_move_speed, move_dir);
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


//COLLISIONS
Collision();
CollisionGround();
AntiStick();


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
