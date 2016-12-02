///switch_weapon(weapon)
var weapon = argument0;
var set_weapon = false;

switch(weapon) {
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
	weapon_state = weapon;
	reset_prog();
	change_sprite_indexes();
}