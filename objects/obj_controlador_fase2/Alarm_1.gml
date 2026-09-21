if (global.fase_iniciada) {
    if (instance_exists(obj_quadrado_grid)) {
        var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
        var yy = quadrado_aleatorio.y; 
        
        instance_create_layer(room_width - 50, yy, "Instances", obj_zumbi_basico);
        zumbis_nascidos += 1;
    }
}

// Ritmo Dinâmico + Looping Infinito
var tempo_min = 8;
var tempo_max = 15;

if (zumbis_nascidos >= total_fase) {
    tempo_min = 2;
    tempo_max = 5;
} else if (global.zumbis_mortos >= 5) {
    tempo_min = 3;
    tempo_max = 6;
}

alarm[1] = game_get_speed(gamespeed_fps) * irandom_range(tempo_min, tempo_max);