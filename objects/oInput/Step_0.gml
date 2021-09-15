//TEMPORARY INPUTS
up = keyboard_check(ord("W"))				 or (gamepad_axis_value(0,gp_axislv) < -deadzone);
down = keyboard_check(ord("S"))				 or (gamepad_axis_value(0,gp_axislv) >  deadzone);
left = keyboard_check(ord("A"))				 or (gamepad_axis_value(0,gp_axislh) < -deadzone);
right = keyboard_check(ord("D"))			 or (gamepad_axis_value(0,gp_axislh) >  deadzone);
jump = keyboard_check_pressed(vk_space)	     or gamepad_button_check_pressed(0,gp_face1);
jump_hold = keyboard_check(vk_space)	     or gamepad_button_check(0,gp_face1);
punch = keyboard_check_pressed(ord("E"))     or gamepad_button_check_pressed(0,gp_shoulderrb);
punch_hold = keyboard_check(ord("E"))        or gamepad_button_check(0,gp_shoulderrb);
kick = keyboard_check_pressed(ord("Q"))      or gamepad_button_check_pressed(0,gp_shoulderlb);
kick_hold = keyboard_check(ord("Q"))		 or gamepad_button_check(0,gp_shoulderlb);
