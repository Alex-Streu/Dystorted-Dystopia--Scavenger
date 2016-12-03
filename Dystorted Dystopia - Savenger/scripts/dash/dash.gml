///dash(dash_last_two)
var set_dash = false;

if (!unlocked_boots || !boots_charged)
	return;

switch(dash_last_two) {
	case dash_up:
		vspd = vspd_dash;
		hspd = 0;
		set_dash = true;
		break;
	case dash_left:
		vspd = 0;
		hspd = -hspd_dash;
		set_dash = true;
		break;
	case dash_right:
		vspd = 0;
		hspd = hspd_dash;
		set_dash = true;
		break;
}

if (set_dash) {
	dashing_state = dash_last_two;
	alarm_set(alarm_dash, room_speed/6);
	state = dash_state;
}