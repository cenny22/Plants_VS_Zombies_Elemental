if (global.fase_iniciada) {
    var xx = irandom_range(100, room_width - 100);
    instance_create_layer(xx, -50, "Instances", obj_sol);
}
alarm[0] = room_speed * irandom_range(9, 12); // Próximo sol entre 7 e 12 segundos