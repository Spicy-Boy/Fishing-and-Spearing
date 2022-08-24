//Collisions
//Sand
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
//Froof
if (place_meeting(x+hsp,y,obj_froof))
{
	while (!place_meeting(x,y+sign(vsp),obj_froof)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}
if (place_meeting(x,y+vsp,obj_froof))
{
	while (!place_meeting(x,y+sign(vsp),obj_froof)) {
		y = y + sign(vsp);
	}
	vsp = 0;	
}
//Caught by rod
if (place_meeting(x,y,obj_lure) && obj_P1.fish_held = 0)
{
	caught = 1;
	hsp = 0;
	vsp = 0;
}

if caught = 1 && obj_P1.key_use
{
	instance_destroy();
	obj_P1.fish_held = 1;
}

//Hit by spear
if (place_meeting(x,y,obj_spear) && global.P1holding!=2 && obj_spear.hsp!=0 && obj_P1.fish_held = 0)
{
	instance_destroy();
	obj_P1.fish_held = 1;
}

//Execute
x = x + hsp;
y = y + vsp;
