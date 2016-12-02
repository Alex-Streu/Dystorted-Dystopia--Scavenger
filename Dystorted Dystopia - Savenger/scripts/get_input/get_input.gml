///get_input()

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
right_pressed = keyboard_check_pressed(ord("D"));
left_pressed = keyboard_check_pressed(ord("A"));
jump = keyboard_check_pressed(ord("W"));
jump_released = keyboard_check_released(ord("W"));
left_action = keyboard_check_pressed(ord("J"));
right_action = keyboard_check_pressed(ord("L"));
up_action = keyboard_check_pressed(ord("I"));
dash_charge = keyboard_check(ord("K"));

// Check if programming
programming = keyboard_check(vk_rshift);
if (programming) {
	prog_left = left_action;
	prog_right = right_action;
	prog_up = up_action;
}

// Override controls for gamepad
var gp_id = 0;
var thresh = 0.5;

if (gamepad_is_connected(0)) {
	right = gamepad_axis_value(gp_id, gp_axislh) > thresh;
	left = gamepad_axis_value(gp_id, gp_axislh) < -thresh;
	jump = gamepad_button_check_pressed(gp_id, gp_face1);
	jump_released = gamepad_button_check_released(gp_id, gp_face1);
	left_action = gamepad_button_check_pressed(gp_id, gp_face3);
	right_action = gamepad_button_check_pressed(gp_id, gp_face2);
	up_action = gamepad_button_check_pressed(gp_id, gp_face4);
	dash_charge = gamepad_button_check(gp_id, gp_shoulderrb);
	
	// Check if programming
	programming = gamepad_button_check(gp_id, gp_shoulderlb);
	if (programming) {
		prog_left = left_action;
		prog_right = right_action;
		prog_up = up_action;
	}
}

// Handle program combo
if (programming) {
	if (prog_left) prog_combo += "L";
	if (prog_right) prog_combo += "R";
	if (prog_up) prog_combo += "U";

	var length = string_length(prog_combo);
	if (length > 0) {
		prog_time_total += prog_time_step;
	}

	if (prog_time_total >= prog_time_removal) {
		prog_combo = string_copy(prog_combo, 2, length-1);
		prog_time_total = 0;
	}

	length = string_length(prog_combo);
	prog_last_three = string_copy(prog_combo, length-3+1, 3);
}
else {
	reset_prog();
}

// Set action button if not programming
left_action = left_action && !programming;
right_action = right_action && !programming;
up_action = up_action && !programming;

// Set dash
dash_left = dash_charge && left_pressed;
dash_right = dash_charge && right_pressed;
dash_up = dash_charge && jump;