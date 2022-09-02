randomize();
i = random_range(0,1);
if i > 0.99 instance_create_layer(x,y,"Entities",obj_fish);
alarm_set(0, random_range(5, 8) * 60);