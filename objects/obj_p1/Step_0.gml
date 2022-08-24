//Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_slam = keyboard_check(ord("S"));

//Calculate Movement
var move = key_right - key_left;
hsp = move * movesp;
vsp = vsp + grav;

if (place_meeting(x,y+1,obj_sand) && key_jump)
{
	vsp = -jumpsp;	
}

if (vsp < 0) && (!key_jump_held)
{
	vsp = max(vsp,0);	
}

//Collisions
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
}


//Sprite Management
if hsp!=0 image_xscale=sign(hsp);
if hsp!=0 && place_meeting(x,y+1,obj_sand)
{
	sprite_index = spr_P1_run;
}
else
{
	sprite_index = spr_P1;
}

//Execute Movement
x = x + hsp;
y = y + vsp;


