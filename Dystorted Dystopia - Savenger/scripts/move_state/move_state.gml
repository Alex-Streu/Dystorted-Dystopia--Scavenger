/// move_state()
state_string = "Move";

// Handle vertical movement and sprites
if (!place_meeting(x, y+1, Solid)) {	
	vspd += grav;
	
	// Player is in the air
	sprite_index = idle_sprite;
	//image_speed = 0;
	//image_index = vspd > 0;
	
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
	
	// Player is on the ground
	if (hspd == 0) {
		sprite_index = idle_sprite;	
	} else {
		sprite_index = idle_sprite;	
		//image_speed = 0.8;
	}
}

// Handle horizontal movement
if (right || left) {
	hspd += (right-left)*acc;
	
	// Cap max speed
	if (abs(hspd) > abs(spd)) hspd = spd*image_xscale;
} else {
	apply_friction(acc);
}

if (hspd != 0) {
	image_xscale = sign(hspd);
}

move(Solid);

// Handle weapon switching
switch_weapon();
	
// Handle actions
if (left_action || up_action) {
	attack();
}
	
// Handle dash
reset_dash();
dash();