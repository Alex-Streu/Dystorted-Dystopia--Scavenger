/// @function show_debug_mode_message(x, y, halign, col, str)
/// @description Show a message if debug mode is on
/// @param x The x coordinate
/// @param y The y coordinate
/// @param halign The halign (0 for default left)
/// @param col The desired color for the text
/// @param str The message to show

var xx = argument0;
var yy = argument1;
var halign = argument2;
var col = argument3;
var str = argument4;

if (debug_on) {
	if (halign == 0) halign = fa_left;
	draw_set_halign(halign);
	draw_set_font(font_debug);
	draw_set_color(col);
	draw_text(xx, yy, string(str));
}