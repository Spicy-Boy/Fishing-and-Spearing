//Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_down = keyboard_check(ord("S"));

//Calculate Movement
var move = key_right - key_left;
hsp = move * movesp;
vsp = vsp + grav;

//methods/functions
function isFalling()
{
	
	if (sign(floor(vsp)) <= 0)
	{
		return false; //character not falling
	}
	
	if (sign(floor(vsp)) == 1)
	{
		return true; //character falling
	}
	
	return false;
}

/*
//fall test
if (isFalling())
{
	show_message("AAAA I'M FALLING"+string(vsp));	
}
*/

if (place_meeting(x,y+1,obj_wall) && key_jump)
{
	vsp = -jumpsp;	
}

if (vsp < 0) && (!key_jump_held)
{
	vsp = max(vsp,0);	
}

//Sprite Management
if hsp!=0 image_xscale=sign(hsp);
if hsp!=0 && place_meeting(x,y+1,obj_wall)
{
	sprite_index = spr_P1_run;
}
else
{
	sprite_index = spr_P1;
}

//Execute Movement
	//x collisions
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;	
}
x = x + hsp;

	//y collisions
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;	
}

	//platform collisions
if (place_meeting(x,y+vsp,obj_platform))
{
	while (isFalling() && !place_meeting(x,y+sign(vsp),obj_platform)) 
	{
		y = y + sign(vsp);
	}
	vsp = 0;	
}
	
y = y + vsp;


