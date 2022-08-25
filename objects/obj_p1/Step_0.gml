key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_down = keyboard_check_pressed(ord("S"));
key_pickup = keyboard_check_pressed(ord("K"));
key_use = keyboard_check_pressed(ord("J"));
key_restart = keyboard_check_pressed(ord("R"));

event_inherited();

//Lure
if key_use && holding = 1
{
	obj_rod.image_index = 1;
	if obj_rod.cast = 0
	{
		obj_rod.cast = 1;
		instance_create_layer(obj_rod.x,obj_rod.y,"Items",obj_lure1);
	}
	if obj_rod.cast =1 && obj_lure1.vsp=0 && obj_lure1.hsp=0
	{
		obj_rod.cast = 0;
		instance_destroy(obj_lure1.id);
		obj_rod.image_index = 0;
	}
}

//Dropping off Fish
if (place_meeting(x,y,obj_bucket) && fish_held = 1 && global.P1bucket = 0)
{
	fish_held = 0;
	global.P1bucket = global.P1bucket + 1;
	instance_create_layer(obj_bucket.x, obj_bucket.y-18, "Entities", obj_bucket_icon);
}
else if (place_meeting(x,y,obj_bucket) && fish_held = 1)
{
	fish_held = 0;
	global.P1bucket = global.P1bucket + 1;
}

//Victory conditions
if global.P1bucket = 3 
{
	global.P1bucket = 0;
	instance_create_layer(320,240,"Static", obj_P1Victory);
	instance_create_layer(320,240,"Entities",obj_Dipshit);
}