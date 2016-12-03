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
}