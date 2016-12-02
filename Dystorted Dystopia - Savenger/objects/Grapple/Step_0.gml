/// @description Check state
time_active += 1/room_speed;

// Safety retract and finish
if (time_active > 1) {
	retracting = true;
	pulling = false;
}
if (time_active > 1.2) {
	finished = true;
}

if (instance_exists(Zane)) {
	// Calculate chain length
	chain_length = point_distance(x, y, Zane.x, Zane.y);

	// Reaching
	if (!retracting && !pulling) {
	
		// Retract
		if (chain_length > max_length) {
			retracting = true;
		} else {
		
			// Pull Zane
			if (place_meeting(x+hspd, y+vspd, Solid)) {
				while (!place_meeting(x+sign(hspd), y+sign(vspd), Solid)) {
					x += sign(hspd);
					y += sign(vspd);
				}
				hspd = 0;
				vspd = 0;
				pulling = true;
				with (Zane) { state = pull_state; }
			}
		}
	}

	// Retracting
	if (retracting) {
		hspd = spd * 2 * lengthdir_x(1, point_direction(x, y, Zane.x, Zane.y)) * image_xscale;
		vspd = spd * 2 * lengthdir_y(1, point_direction(x, y, Zane.x, Zane.y)) * image_xscale;
		
		// End on collision
		if (place_meeting(x + hspd, y + vspd, Zane) || place_meeting(x + hspd/2, y + vspd/2, Zane)) {
			hspd = 0;
			vspd = 0;
			finished = true;
		}
	}
	
	// Pulling
	if (pulling) {
		hspd = 0;
		vspd = 0;
		with (Zane) {
			hspd = floor(other.pull_spd * lengthdir_x(1, point_direction(x, y, other.x, other.y)));
			vspd = floor(other.pull_spd * lengthdir_y(1, point_direction(x, y, other.x, other.y)));
			if (place_meeting(x + hspd, y + vspd, other) || place_meeting(x + hspd/2, y + vspd/2, other)) {
				other.finished = true;
			}
		}
	}
}

x += hspd;
y += vspd;