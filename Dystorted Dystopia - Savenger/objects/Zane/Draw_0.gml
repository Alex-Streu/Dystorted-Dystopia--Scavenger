/// @description Draw debug
draw_self();

show_debug_mode_message(x, y-39, fa_center, c_white, "State: " + string(state_string));
show_debug_mode_message(x, y-32, fa_center, c_white, "HSPD: " + string(hspd));
show_debug_mode_message(x, y-25, fa_center, c_white, "VSPD: " + string(vspd));
show_debug_mode_message(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 0, c_white, dash_combo);
show_debug_mode_message(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0])+7, 0, c_white, string(right_pressed));

	
if (debug_on) {
	draw_set_color(c_red);
	var dir = point_direction(x, y, x+hspd, y+vspd);
	var xx = lengthdir_x(40, dir);
	var yy = lengthdir_y(40, dir);
	draw_arrow(x, y, x+xx, y+yy, 5);
}