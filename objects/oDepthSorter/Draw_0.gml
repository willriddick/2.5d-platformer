//Resize grid
var _dgrid = ds_depth_grid;
var _inst_num = instance_number(oParentDepth);
ds_grid_resize(_dgrid,2,_inst_num);

//Loop through depth objects and add to ds_grid
for (var i = 0; i < _inst_num; i++)
{
	var _inst = instance_find(oParentDepth,i);
	_dgrid[# 0, i] = _inst.id;
	_dgrid[# 1, i] = _inst.draw_depth;
}

//Sort ds_grid by y value
ds_grid_sort(_dgrid,1,true);

//Draw isntances
for (var i = 0; i < _inst_num; i++)
{
	var _inst = _dgrid[# 0, i];
	//with (_inst) event_perform(ev_draw,0);
}