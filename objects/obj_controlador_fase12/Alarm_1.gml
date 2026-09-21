var pos_x = posicao_spawn_x;
var qtd_quadrados = instance_number(obj_quadrado_grid);

if (qtd_quadrados > 0) {
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(qtd_quadrados - 1));
    var pos_y = quadrado_aleatorio.y; 

    var zumbi_para_criar = obj_zumbi_basico; 
    var tempo_min = 12;
    var tempo_max = 13;

    if (!variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos = 0;
    }

    if (zumbis_nascidos >= total_fase) {
        zumbi_para_criar = obj_onca_zumbi;
        tempo_min = 2;
        tempo_max = 4;
    } else if (global.zumbis_mortos >= 20) {
        tempo_min = 2;
        tempo_max = 4;
        var chance = irandom(99);
        if (chance < 30) zumbi_para_criar = obj_zumbi_cone;
        else if (chance < 70) zumbi_para_criar = obj_zumbi_balde;
        else zumbi_para_criar = obj_onca_zumbi;
    } else if (global.zumbis_mortos >= 5) {
        tempo_min = 3;
        tempo_max = 6;
        var chance = irandom(99);
        if (chance < 40) zumbi_para_criar = obj_zumbi_basico;
        else if (chance < 75) zumbi_para_criar = obj_zumbi_cone;   
        else zumbi_para_criar = obj_onca_zumbi; 
    }

    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}