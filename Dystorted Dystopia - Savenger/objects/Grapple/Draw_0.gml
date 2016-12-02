/// @description Create chain

if (instance_exists(Zane)) {
	var x0 = x;
	var y0 = y;
	var x1 = Zane.x;
	var y1 = Zane.y;
	
	var dir = point_direction(x0, y0, x1, y1);
	var length = point_distance(x0, y0, x1, y1);
	var width = sprite_get_width(spr_grapple_chain)*lengthdir_x(1, dir);
	var height = sprite_get_height(spr_grapple_chain)*lengthdir_y(1, dir);
	var chain_segment_length = point_distance(0, 0, sprite_get_width(spr_grapple_chain)*lengthdir_x(1, dir), sprite_get_height(spr_grapple_chain)*lengthdir_y(1, dir)); 
	
	repeat(length/chain_segment_length) {
		draw_sprite_ext(spr_grapple_chain, 0, x0, y0, 1, 1, dir, c_white, 1);
		x0 += width;
		y0 += height;
	}
	
	dir = point_direction(x1, y1, x, y);
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, dir, c_white, 1);
}