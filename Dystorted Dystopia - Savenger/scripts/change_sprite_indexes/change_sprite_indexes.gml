///change_sprite_indexes()
if (unlocked_boots) { // Boots are unlocked
	if (boots_charged) { //Boots are charged
		if (weapon_state == prog_normal) {
			idle_sprite = spr_zane_full_normal_idle;
		} else if (weapon_state == prog_sword) {
			idle_sprite = spr_zane_full_sword_idle;
		} else if (weapon_state == prog_grapple) {
			idle_sprite = spr_zane_full_grapple_idle;
		}
	} else { // Boots are not charged
		if (weapon_state == prog_normal) {
			idle_sprite = spr_zane_empty_normal_idle;
		} else if (weapon_state == prog_sword) {
			idle_sprite = spr_zane_empty_sword_idle;
		} else if (weapon_state == prog_grapple) {
			idle_sprite = spr_zane_empty_grapple_idle;
		}
	}
} else { // Boots are not unlocked
	if (weapon_state == prog_normal) {
		idle_sprite = spr_zane_normal_idle;
	} else if (weapon_state == prog_sword) {
		idle_sprite = spr_zane_sword_idle;
	} else if (weapon_state == prog_grapple) {
		idle_sprite = spr_zane_grapple_idle;
	}
}