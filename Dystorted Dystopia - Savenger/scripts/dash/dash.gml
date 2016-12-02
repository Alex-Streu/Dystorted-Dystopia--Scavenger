///dash()

if (!unlocked_boots || !boots_charged)
	return;
	
if (dash_up) {
	vspd = -spd_dash;
	hspd = 0;
} else {
	vspd = 0;
	if (dash_left) hspd = -spd_dash;
	else if (dash_right) hspd = spd_dash;
}

alarm[alarm_dash] = 5;
boots_charged = false;
state = dash_state;