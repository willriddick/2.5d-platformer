//DRAW SHAODW
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(bbox_left,bbox_top - z_floor,bbox_right,bbox_bottom - z_floor,false);
draw_set_color(c_white);
draw_set_alpha(1);


//DRAW OURSELVES
draw_sprite_ext(sprite_index, image_index, x, y - z, 
	image_xscale, image_yscale, image_angle, image_blend, image_alpha);


//DRAW DEBUG
draw_set_font(global.bitmap_font);
var _debug = "";
_debug += "z: " + string(z) + "\n";
_debug += "zsp: " + string(zsp) + "\n"; 
_debug += "z_floor: " + string(z_floor) + "\n";
_debug += "on_ground: " + string(on_ground) + "\n";
_debug += "jumps: " + string(jumps) + "\n";
_debug += "xy_meeting: " + string(xy_meeting) + "\n";
draw_text(16,16,_debug);

draw_set_halign(fa_right);
draw_text(room_width-16,16,"col_amount: " + string(col_amount));
draw_set_halign(fa_left);

for (var i = 0; i < ds_grid_height(col_grid); i++)
{
	draw_set_halign(fa_right);
	draw_text(room_width-16,32 + 10*i, string(col_grid[# 0, i]) + " : " + string(col_grid[# 1, i]));
	draw_set_halign(fa_left);
}
