///switch_weapon()
var set_weapon = false;

switch(prog_last_three) {
	case prog_normal:
		set_weapon = true;
		break;
	case prog_sword:
		if (unlocked_sword) set_weapon = true;
		break;
	case prog_grapple:
		if (unlocked_grapple) set_weapon = true;
		break;
}

if (set_weapon) {
	weapon_state = prog_last_three;
	reset_prog();
	change_sprite_indexes();
}