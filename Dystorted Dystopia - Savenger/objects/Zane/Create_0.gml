/// @description Initialize player
// Player variables
spd = 5;
acc = 1;
hspd = 0;
vspd = 0;
grav = 1;
jmp = -10;
jmp_ctrl = -4;
vspd_dmg = -12;
hspd_dmg = 6;
audio_em = audio_emitter_create();
weapon = pointer_null;
debug_on = false;

// Input variables ---- move later
right_pressed = false;
left_pressed = false;
was_right = false;
was_left = false;

// Setup combo variables
prog_combo = "";
prog_time_step = 1/room_speed;
prog_time_removal = 1;
prog_time_total = 0;
prog_normal = "LLR";
prog_sword = "LLL";
prog_grapple = "LUR";
prog_last_three = "";

// Setup dash variables
dash_combo = "";
dash_time_step = 1/room_speed;
dash_time_removal = 1/4;
dash_time_total = 0;
dash_up = "UU";
dash_left = "LL";
dash_right = "RR";
dash_last_two = "";
hspd_dash = 14;
vspd_dash = -8;


// Player states
state = move_state;
weapon_state = prog_normal;

// Player alarms
alarm_dash = 0;
alarm_reset_dash = 1;

// Player unlockables
unlocked_sword = true;
unlocked_grapple = true;
unlocked_boots = true;
boots_charged = true;

// Set sprites
change_sprite_indexes();