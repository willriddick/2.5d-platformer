event_inherited();

z_top = z + z_height;

if (timer >= time * 2) timer = 0;
else timer++;

if (timer < time) 
{
	if (move_x) xsp = move_speed;
	if (move_y) ysp = move_speed;
	if (move_z) zsp = move_speed;
}
else if (timer > time && timer < time*2) 
{
	if (move_x) xsp = -move_speed;	
	if (move_y) ysp = -move_speed;
	if (move_z) zsp = -move_speed;
}

/*
var _inst = instance_place(x,y,oPlayer);
if (_inst)
{
	if (_inst.z - z <= 0.2) && (_inst.z + 1 > z)
	{
		_inst.xsp_push = xsp;	
		_inst.ysp_push = ysp;	
		_inst.zsp_push = zsp;	
	}
	else 
	{
		_inst.xsp_push = 0;
		_inst.ysp_push = 0;
		_inst.zsp_push = 0;
	}
}
*/

x += xsp;
y += ysp;
z += zsp;