#region ALARM 0

if (global.fase_iniciada) {
    var xx = irandom_range(100, room_width - 100);
    instance_create_layer(xx, -50, "Instances", obj_sol);
}
alarm[0] = room_speed * irandom_range(7, 8);

#endregion