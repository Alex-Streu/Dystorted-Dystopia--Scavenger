///pull_state()
move(Solid);

if (instance_exists(weapon)) {	
	if (left_action || up_action) weapon.finished = true;
	
	if (weapon.finished) {
		state = attack_state;
	}
}