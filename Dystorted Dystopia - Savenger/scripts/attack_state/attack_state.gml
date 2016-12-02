///attack_state()
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
		if (instance_exists(weapon) && weapon.finished) finished = true;
		
		if (finished) {
			if (instance_exists(weapon)) instance_destroy(weapon);
			state = move_state;
		}
		break;
	default:
		state = move_state;
		break;
}