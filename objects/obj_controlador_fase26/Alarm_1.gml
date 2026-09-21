var pos_x = posicao_spawn_x;

if (instance_number(obj_quadrado_grid) > 0) {
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
    var pos_y = quadrado_aleatorio.y; 
    var zumbi_para_criar = obj_zumcare; 
    var tempo_min = 8;
    var tempo_max = 12;

    if (!variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos = 0;
    }

    if (zumbis_nascidos >= total_fase) {
        zumbi_para_criar = obj_zumbi_arbusto;
        tempo_min = 2;
        tempo_max = 4;
    } else if (global.zumbis_mortos >= 10) {
        zumbi_para_criar = obj_zumbi_arbusto;
    } else if (global.zumbis_mortos >= 5) {
        var chance = irandom(99);
        if (chance < 50) zumbi_para_criar = obj_zumcare;   
        else if (chance < 90) zumbi_para_criar = obj_zumbi_arbusto; 
        else zumbi_para_criar = obj_zumcare  
    }

    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}