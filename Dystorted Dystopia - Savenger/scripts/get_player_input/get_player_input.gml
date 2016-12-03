///get_player_input()
get_input();

// Check if programming
programming = keyboard_check(vk_rshift);

// Override controls for gamepad
var gp_id = 0;

if (gamepad_is_connected(0)) {
	
	// Check if programming
	programming = gamepad_button_check(gp_id, gp_shoulderlb);
}

// Handle program combo
if (programming) {
	if (left_action) prog_combo += "L";
	if (right_action) prog_combo += "R";
	if (up_action) prog_combo += "U";

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

// Handle dash combo
if (left_pressed) dash_combo += "L";
if (right_pressed) dash_combo += "R";
if (jump) dash_combo += "U";

var length = string_length(dash_combo);
if (length > 0) {
	dash_time_total += dash_time_step;
}

if (dash_time_total >= dash_time_removal) {
	dash_combo = string_copy(dash_combo, 2, length-1);
	dash_time_total = 0;
}

length = string_length(dash_combo);
dash_last_two = string_copy(dash_combo, length-2+1, 2);

