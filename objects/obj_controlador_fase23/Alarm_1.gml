if (instance_number(obj_quadrado_grid) > 0) {
    var pos_x = posicao_spawn_x;
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
    var pos_y = quadrado_aleatorio.y; 
    
    var zumbi_para_criar = noone; 
    var tempo_min = 8;
    var tempo_max = 12;

    if (!variable_global_exists("zumbis_mortos")) {
        global.zumbis_mortos = 0;
    }

    // 1. REGRA INICIAL: Os primeiros 5 zumbis a nascer SEMPRE serão Espantalhos
    if (zumbis_nascidos < 5) {
        zumbi_para_criar = obj_zumbi_espantalho;
        tempo_min = 4;
        tempo_max = 7;
    }
    // 2. FASE FINAL (Após 15 kills ou atingir o limite de zumbis da fase): Apenas Zumbi Balde
    else if (global.zumbis_mortos >= 15 || zumbis_nascidos >= total_fase - 1) {
        zumbi_para_criar = obj_zumbi_balde;
        tempo_min = 3;
        tempo_max = 6;
    }
    // 3. FASE INTERMEDIÁRIA (Entre 10 e 14 kills): Girafa (50%), Onça (40%), Balde (10%)
    else if (global.zumbis_mortos >= 10) {
        var chance = irandom(99);
        if (chance < 50) {
            zumbi_para_criar = obj_zumbi_girafa;
        } else if (chance < 90) {
            zumbi_para_criar = obj_onca_zumbi; // Certifique-se de que o nome no Asset Browser esteja correto
        } else {
            zumbi_para_criar = obj_zumbi_balde;
        }
    }
    // 4. FASE INICIAL (< 10 kills e após os 5 espantalhos): Zumbi Básico
    else {
        zumbi_para_criar = obj_zumbi_basico;
    }

    // Criação do zumbi na camada Instances
    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    // Reagendamento do próximo spawn de acordo com a velocidade definida na etapa
    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}