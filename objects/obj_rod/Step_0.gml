//Picked up by player
if global.P1holding = 1
{
	image_xscale = obj_P1.image_xscale;
	if image_xscale = 1
	{
		x = obj_P1.x + 14;
		y = obj_P1.y - 7;
	}
	else
	{
		x = obj_P1.x - 14;
		y = obj_P1.y - 7;
	}
	
//Casting
	if (cast = 0) && obj_P1.key_use cast = 1;
	//if (cast = 1) && obj_P1.key_use cast = 0;
	if (cast = 1)
	{
		draw_line_color(x,y,obj_bucket.x,obj_bucket.y,c_silver,c_gray);
	}
}


//Collisions
else
{
	vsp = vsp + grav;
	if (place_meeting(x+hsp,y,obj_sand))
	{
		while (!place_meeting(x+sign(hsp),y,obj_sand)) {
			x = x + sign(hsp);
		}
		hsp = 0;	
	}
	if (place_meeting(x,y+vsp,obj_sand))
	{
		while (!place_meeting(x,y+sign(vsp),obj_sand)) {
			y = y + sign(vsp);
		}
		vsp = 0;
		hsp = 0;
	}

	x = x + hsp;
	y = y + vsp;
}

