/*
//DRAW DEBUG
var _w = display_get_gui_width();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(global.bitmap_font);
var _debug = "";
_debug += "draw_depth: " + string(draw_depth) + "\n";
_debug += "z: " + string(z) + "\n";
_debug += "zsp: " + string(zsp) + "\n"; 
_debug += "z_floor: " + string(z_floor) + "\n";
_debug += "on_ground: " + string(on_ground) + "\n";
_debug += "jumps: " + string(jumps) + "\n";
_debug += "xy_meeting: " + string(xy_meeting) + "\n";
draw_text(16,16,_debug);

for (var i = 0; i < ds_grid_height(col_grid_z); i++)
{
	draw_set_halign(fa_right);
	draw_text(_w - 16,16 + 10*i, string(col_grid_z[# 0, i]) + " : " + string(col_grid_z[# 1, i]));
	draw_set_halign(fa_left);
}

for (var i = 0; i < ds_grid_height(col_grid_xy); i++)
{
	draw_set_halign(fa_right);
	draw_text(_w - 16,64 + 10*i, string(col_grid_xy[# 0, i]) + " : " + string(col_grid_xy[# 1, i]));
	draw_set_halign(fa_left);
}
*/