/// @description Control the player's state
get_player_input();

// Tick alarms
for (var i = 0; i < alarm_count; i++) if (alarm_get(i) > -1) alarm[i] -= 1;

// Execute the state
script_execute(state);