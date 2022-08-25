//Movement Calculation
if (collidedWithFish = false)
{
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
	if (place_meeting(x+hsp,y,obj_fish) && obj_Player.fish_held = 0)
	{
		collidedWithFish = true;
		while (!place_meeting(x,y+sign(vsp),obj_fish)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	if (place_meeting(x,y+vsp,obj_fish) obj_Player.fish_held = 0)
	{
		collidedWithFish = true;
		while (!place_meeting(x,y+sign(vsp),obj_fish)) {
			y = y + sign(vsp);
		}
		vsp = 0;	
	}
}

//Movement Execution
if (collidedWithFish)
{
	
}
else
{
	x = x + hsp;
	y = y + vsp;
}