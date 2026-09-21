if (instance_number(obj_quadrado_grid) > 0) {
    var pos_x_padrao = posicao_spawn_x; // Define a posição padrão de spawn
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
    var pos_y = quadrado_aleatorio.y; 
    
    var zumbi_para_criar = noone; 
    var tempo_min = 8;
    var tempo_max = 12;

    if (!variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos = 0;
    }

    // 1. REGRA REGIMENTAL: Se for o último zumbi a nascer
    if (zumbis_nascidos >= total_fase - 1) {
        zumbi_para_criar = obj_zumbi_arbusto;
        tempo_min = 2;
        tempo_max = 4;
    }
    // 2. FASE 3 (Após 30 kills): Apenas Girafa e Tarzan (50% / 50%)
    else if (global.zumbis_mortos >= 30) {
        var chance = irandom(99);
        if (chance < 50) {
            zumbi_para_criar = obj_zumbi_girafa;
        } else {
            zumbi_para_criar = obj_zumbi_tarzan;
        }
    }
    // 3. FASE 2 (Após 10 kills): Girafa, Básico, Cone e Arbusto (25% cada)
    else if (global.zumbis_mortos >= 10) {
        var chance = irandom(99);
        if (chance < 25) {
            zumbi_para_criar = obj_zumbi_basico;
        } else if (chance < 50) {
            zumbi_para_criar = obj_zumbi_girafa;
        } else if (chance < 75) {
            zumbi_para_criar = obj_zumbi_cone;
        } else {
            zumbi_para_criar = obj_zumbi_arbusto;
        }
    }
    // 4. FASE 1 (Início da fase / < 10 kills): 75% Básico, 25% Girafa
    else {
        var chance = irandom(99);
        if (chance < 75) {
            zumbi_para_criar = obj_zumbi_basico;
        } else {
            zumbi_para_criar = obj_zumbi_girafa;
        }
    }

    // Define a posição X final (se for Tarzan, nasce no meio da tela)
    var pos_x_final = pos_x_padrao;
    if (zumbi_para_criar == obj_zumbi_tarzan) {
        pos_x_final = room_width / 2;
    }

    // Criação do zumbi na posição X final
    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x_final, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    // Reagendamento do próximo spawn
    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}