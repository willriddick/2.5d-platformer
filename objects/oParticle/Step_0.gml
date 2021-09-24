//MOVEMENT
xsp *= deccel;
ysp *= deccel;
zsp *= deccel;

x += xsp;
y += ysp;
z += zsp;


//KILL PARTICLE
if (image_index > image_number - 1) 
{
	instance_destroy(my_shadow);
	destroy = true;
}

if (destroy) instance_destroy();


//COLLISION
var _col = instance_place(x,y,oWallParent);
if (_col)
{
	if (_col.z_top < z)
	{
		z_floor = _col.z_top;	
	} else z_floor = 0;
} else z_floor = 0;


// particles sit on floor
if (z < z_floor) 
{
	z = z_floor;
	zsp = 0;
}

//SHADOW
if (z == z_floor) draw_shadow = false;

if (!draw_shadow) 
{
	instance_destroy(my_shadow);
}
else with (my_shadow)
{
	draw_depth = other.y + other.z_floor;
	draw_sprite_ = true;
	sprite_index = sParticleWalkShadow;
	image_alpha = 0.4;
	image_index = other.image_index;
	x = other.x;
	y = other.y;
	z = other.z_floor;
}
