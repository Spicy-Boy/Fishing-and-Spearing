//Collisions
if (place_meeting(x+hsp,y,obj_sand))
{
	while (!place_meeting(x,y+sign(vsp),obj_sand)) {
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
}

if (place_meeting(x+hsp,y,obj_sand))
{
	while (!place_meeting(x,y+sign(vsp),obj_sand)) {
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
}

//Execute
x = x + hsp;
y = y + vsp;
