var pos_x = posicao_spawn_x;
var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));

if (quadrado_aleatorio != noone) {
    var pos_y = quadrado_aleatorio.y; 
    var zumbi_para_criar = obj_zumbi_basico; 
    var tempo_min = 8;
    var tempo_max = 14;

    if (!variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos = 0;
    }

    if (zumbis_nascidos >= total_fase) {
        zumbi_para_criar = obj_onca_zumbi;
        tempo_min = 2;
        tempo_max = 4;
    } else if (global.zumbis_mortos >= 15) {
        tempo_min = 3;
        tempo_max = 5;
        var chance = irandom(99);
        if (chance < 40) zumbi_para_criar = obj_onca_zumbi;
        else if (chance < 65) zumbi_para_criar = obj_zumbi_cone;
        else if (chance < 85) zumbi_para_criar = obj_zumbi_galinheiro;
        else zumbi_para_criar = obj_onca_zumbi;
    } else if (global.zumbis_mortos >= 5) {
        tempo_min = 5;
        tempo_max = 10;
        var chance = irandom(99);
        if (chance < 50) zumbi_para_criar = obj_zumbi_basico;
        else if (chance < 80) zumbi_para_criar = obj_zumbi_cone;
        else zumbi_para_criar = obj_zumbi_galinheiro;
    }

    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    alarm[1] = irandom_range(tempo_min, tempo_max) * game_get_speed(gamespeed_fps);
}