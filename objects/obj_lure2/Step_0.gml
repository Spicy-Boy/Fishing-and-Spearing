//Movement Calculation
vsp = vsp + grav;
//Collisions
//Sand
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
//Fish
if (place_meeting(x+hsp,y,obj_fish) && obj_P2.fish_held = 0)
{
	while (!place_meeting(x,y+sign(vsp),obj_fish)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
if (place_meeting(x,y+vsp,obj_fish) && obj_P2.fish_held = 0)
{
	while (!place_meeting(x,y+sign(vsp),obj_fish)) {
		y = y + sign(vsp);
	}
	vsp = 0;	
}

//Movement Execution
	x = x + hsp;
	y = y + vsp;