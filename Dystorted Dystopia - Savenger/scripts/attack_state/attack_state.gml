///attack_state()
state_string = "Attack";

var finished = false;

// Handle momentum
if (!place_meeting(x, y+1, Solid)) {	
	vspd += grav;
} else {
	vspd = 0;
	apply_friction(acc);
}
move(Solid);


// Handle attack
switch (weapon_state) {
	case prog_grapple:
		if (left_action || up_action) finished = true;
		if (instance_exists(weapon)) {
			finished = weapon.finished;
		} else finished = true;
		
		if (finished) {
			if (instance_exists(weapon)) instance_destroy(weapon);
			state = move_state;
		}
		break;
	default:
		state = move_state;
		break;
}

reset_dash();