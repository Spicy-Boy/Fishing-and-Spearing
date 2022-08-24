//Controls
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_down = keyboard_check(ord("S"));
key_pickup = keyboard_check_pressed(ord("K"));
key_use = keyboard_check_pressed(ord("J"));
key_restart = keyboard_check_pressed(ord("R"));

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

//Spear
if (place_meeting(x,y,obj_spear) && global.P1holding = 0 && key_pickup)
{
	global.P1holding = 2;	
}

if key_use && global.P1holding = 2
{
	global.P1holding = 0;
	obj_spear.hsp = throwsp * sign(image_xscale);
	obj_spear.vsp = -3.5;
}

//Rod
if (place_meeting(x,y,obj_rod) && global.P1holding = 0 && key_pickup)
{
	global.P1holding = 1;	
}

//if key_pickup && global.P1holding = 1
//{
//	global.P1holding = 0;
//	obj_rod.hsp = castsp * sign(image_xscale);
//	obj_rod.vsp = -3.5;
//}

if key_use && global.P1holding = 1
{
	obj_rod.image_index = 1;
	if obj_rod.cast = 0
	{
		obj_rod.cast = 1;
		instance_create_layer(obj_rod.x,obj_rod.y,"Items",obj_lure);
	}
}


//Dropping off Fish
if (place_meeting(x,y,obj_bucket) && fish_held = 1)
{
	fish_held = 0;
	global.P1bucket = global.P1bucket + 1;
	instance_create_layer(obj_bucket.x, obj_bucket.y-18, "Entities", obj_bucket_icon);
}

//Victory conditions
if global.P1bucket = 3 
{
	global.P1bucket = 0;
	instance_create_layer(320,240,"Static", obj_P1Victory);
	instance_create_layer(320,240,"Entities",obj_Dipshit);
}

if (place_meeting(x,y,obj_Dipshit) && room = rm_battlefield) room_goto(rm_love);

//Execute Movement
x = x + hsp;
y = y + vsp;

//Restart
if key_restart game_restart();



