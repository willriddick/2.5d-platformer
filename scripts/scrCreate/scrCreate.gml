function create_particle(
	_sprite_index,_image_index,_image_speed_min,_image_speed_max,_layer,
	_x,_y,_z,
	_xsp_min,_xsp_max,
	_ysp_min,_ysp_max,
	_zsp_min,_zsp_max
)
{
	with (instance_create_layer(_x,_y,_layer,oParticle))
	{	
		sprite_index = _sprite_index;
		if (_image_index == -1) image_index = choose(0,(floor(image_number/3)));
		else image_index = _image_index;
		image_speed  = random_range(_image_speed_min,_image_speed_max);
		image_angle  = choose(0,90,180,270);
		image_xscale = choose(-1,1);
		image_yscale = choose(-1,1);
		
		z = _z;
		
		xsp = irandom_range(_xsp_min,_xsp_max);
		ysp = irandom_range(_ysp_min,_ysp_max);
		zsp = irandom_range(_zsp_min,_zsp_max);
	}
}