event_inherited();

draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(global.bitmap_font);
draw_text(x,y - z_top, string(draw_depth));
draw_set_halign(fa_left);
draw_set_valign(fa_top);