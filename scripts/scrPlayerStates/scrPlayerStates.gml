function StateNormal(){
	//MOVEMENT SPEED
	h_move_speed = h_move_speed_default;
	v_move_speed = v_move_speed_default;
	
	
	//CHANGE STATES
	if (on_ground)
	{
		if (xsp != 0) || (ysp != 0) || (zsp != 0) StateSet(states.walk,0);
		else StateSet(states.idle,0);
	} 
	else 
	{
		StateSet(states.air,0);
	}
	
	
	//CROUCHING
	if (oInput.punch_hold) StateSet(states.crouch,0);
	
	
	//JETPACK
	if (oInput.kick_hold) StateSet(states.jetpack,0);


	//JUMPING
	if (on_ground_timer > 0) on_ground_timer--;
	else on_ground_timer = 0;

	if (jump_buffer_timer > 0) jump_buffer_timer--;
	else jump_buffer_timer = 0;

	if (on_ground)
	{
		jumps = jumps_max;
		on_ground_timer = coyote_time;	
	}


	//SET JUMP BUFFER
	if ((oInput.jump) && (jumps > 0) && (on_ground_timer > 0)) 
	{	
		jump_buffer_timer = jump_buffer;
	}


	//JUMP
	if (jump_buffer_timer > 0)
	{
		zsp = jump_speed;	
		jumps--;
		jump_buffer_timer = 0;	
	}


	//VARIABLE JUMP HEIGHT
	if ((zsp > 0) && (!oInput.jump_hold) && (!on_ground)) zsp *= 0.75;
}


function StateCrouch(){
	//CROUCHING
	sprite_index = sPlayerCrouch;
	z_height = 6;	
	
	
	//MOVEMENT SPEED
	h_move_speed = h_move_speed_crouch;
	v_move_speed = v_move_speed_crouch;
	
	
	//UNCROUCHING
	if (!oInput.punch_hold)
	{
		// makes sure you do not get stuck in ceiling after uncrouching
		z_height = 12;
		
		if (!place_meeting_3d(x, y, z+1, z_height, oWallParent)) 
		{	
			StateSet(states.idle,0);
			z_height = 12;
		} 
		else 
		{
			z_height = 6;	
		}
	}
}

function StateJetpack(){
	//NOT JETPACK
	if (!oInput.kick_hold) StateSet(states.idle,0);
	
	
	//MOVEMENT SPEED
	h_move_speed = h_move_speed_crouch;
	v_move_speed = v_move_speed_crouch;
	
	
	//VERTICAL MOVEMENT
	if (zsp < 0.8)
	{
		if (zsp < 0.8) zsp += 0.3;	
		else zsp = 0.8;
	}
	
	
	//PARTICLES
	int_particle_jetpack++;
	if (int_particle_jetpack >= 2)
	{
		CreateParticle(sParticleWalk,0,0.5,1,"Player",x,y,z,-1,1,-1,1,-1,-4);
		int_particle_jetpack = 0;
	}
}