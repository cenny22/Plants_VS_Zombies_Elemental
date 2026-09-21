if (instance_number(obj_quadrado_grid) > 0) {
    var pos_x_padrao = posicao_spawn_x;
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
    var pos_y = quadrado_aleatorio.y; 
    
    var zumbi_para_criar = noone; 
    
    // TEMPO ENTRE SPAWNS (HORDA CONTINUA E RAPIDA)
    var tempo_min = 0.8; 
    var tempo_max = 1.0;

    // Sorteio direto com chance muito baixa para a Girafa (3%)
    var chance = irandom(99);

    if (chance < 18) {
        zumbi_para_criar = obj_zumbi_cone;
    } else if (chance < 33) {
        zumbi_para_criar = obj_onca_zumbi;
    } else if (chance < 45) {
        zumbi_para_criar = obj_zumbi_galinheiro;
    } else if (chance < 48) { 
        zumbi_para_criar = obj_zumbi_girafa; // Apenas 3% de chance (45, 46, 47)
    } else if (chance < 70) {
        zumbi_para_criar = obj_zumbi_tarzan;
    } else if (chance < 85) {
        zumbi_para_criar = obj_zumbi_balde;
    } else {
        zumbi_para_criar = obj_zumbi_arbusto;
    }

    // Posição para o zumbi Tarzan (meio da tela)
    var pos_x_final = pos_x_padrao;
    if (zumbi_para_criar == obj_zumbi_tarzan) {
        pos_x_final = room_width / 2;
    }

    // Criação do zumbi
    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x_final, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    // Reagendamento ultra rápido do próximo spawn da horda
    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}