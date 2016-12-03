///dash_state()
state_string = "Dash";

// Alarms
alarm[alarm_dash]--;
if (alarm[alarm_dash] <= 0) {
	alarm[alarm_dash] = -1;
	alarm[alarm_reset_dash] = 90;
	boots_charged = false;
	state = move_state;
	change_sprite_indexes();
}

// Handle vertical movement and sprites if horizontal dash
if (dashing_state != dash_up) {
	if (!place_meeting(x, y+1, Solid)) {	
		vspd += grav;
	
		// Player is in the air
		sprite_index = idle_sprite;
		//image_speed = 0;
		//image_index = dash_up;
	
		// Control jump
		if (jump_released && vspd < jmp_ctrl) {
			vspd = jmp_ctrl;
		}
	
	} else {
		vspd = 0;
	
		// Handle jump
		if (jump) {
			vspd = jmp;
			//audio_play_sound(snd_jump, 5, false);
		}
	
		sprite_index = idle_sprite;	
		image_xscale = sign(hspd);
		//image_speed = 0.8;
	}
}

// Handle horizontal movement if vertical dash
if (dashing_state == dash_up) {
	if (right || left) {
		hspd += (right-left)*acc;
	
		// Cap max speed
		if (abs(hspd) > abs(spd)) hspd = spd*image_xscale;
	} else {
		apply_friction(acc);
	}
}

move(Solid);

// Handle weapon switching
switch_weapon();
	
// Handle actions
if (left_action || up_action) {
	attack();
}