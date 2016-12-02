///attack()
state = attack_state;

switch(weapon_state) {
	case prog_grapple:
		weapon = instance_create_depth(x, y, depth+1, Grapple);
		if (left_action) { weapon.hspd = weapon.spd*image_xscale; }
		if (up_action) { weapon.vspd = -weapon.spd; weapon.hspd = hspd; }
		break;
	default:
		state = move_state;
		break;
}