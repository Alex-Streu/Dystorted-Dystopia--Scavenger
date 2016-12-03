///reset_dash()

if (alarm[alarm_reset_dash] > -1) alarm[alarm_reset_dash]--;

if (alarm[alarm_reset_dash] == 0) {
	boots_charged = true;
	change_sprite_indexes();
	sprite_index = idle_sprite;
}