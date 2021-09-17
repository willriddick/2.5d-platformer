draw_depth = oPlayer.y + oPlayer.z_floor;

//DRAW SHAODW
draw_set_color(c_black);
draw_set_alpha(0.4);
with (oPlayer) draw_rectangle(bbox_left,bbox_top - z_floor,bbox_right,bbox_bottom - z_floor,false);
draw_set_color(c_white);
draw_set_alpha(1);
