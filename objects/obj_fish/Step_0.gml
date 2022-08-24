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

//Hit by spear
if (place_meeting(x,y,obj_spear) && global.P1holding!=2)
{
	instance_destroy();
	obj_P1.fish_held = 1;
	instance_create_layer(obj_P1.x+4,obj_P1.y-18,"Entities",obj_fish_icon);
}

//Execute
x = x + hsp;
y = y + vsp;
