///pull_state()
state_string = "Pull";

move(Solid);
reset_dash();

if (instance_exists(weapon)) {	
	dash();
	if (left_action || up_action || state != pull_state) weapon.finished = true;
	
	if (weapon.finished) {
		instance_destroy(weapon);
		if (state == pull_state) state = attack_state;
	}
}