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

    // 1. REGRA INICIAL: Os primeiros 5 zumbis a nascer SEMPRE serão Regadores
    if (zumbis_nascidos < 5) {
        zumbi_para_criar = obj_zumbi_regadoranoz;
        tempo_min = 8;
        tempo_max = 12;
    }
    // 2. FASE FINAL (Após 30 kills ou atinja o limite da fase): Spawns MUITO amontoados
    else if (global.zumbis_mortos >= 30 || zumbis_nascidos >= total_fase - 1) {
        var chance = irandom(99);
        if (chance < 50) {
            zumbi_para_criar = obj_zumbi_regadoranoz;
        } else {
            zumbi_para_criar = obj_zumbi_regadoraervilha;
        }
        
        // Tempo bem curto para nascerem vários zumbis colados uns nos outros
        tempo_min = 1;
        tempo_max = 3;
    }
    // 3. FASE INTERMEDIÁRIA (A partir de 10 kills): Spawns mais amontoados
    else if (global.zumbis_mortos >= 10) {
        var chance = irandom(99);
        if (chance < 50) {
            zumbi_para_criar = obj_zumbi_regadoraervilha;
        } else if (chance < 90) {
            zumbi_para_criar = obj_zumbi_basico;
        } else {
            zumbi_para_criar = obj_zumbi_regadoranoz;
        }
        
        // Reduz o tempo do alarme para aglomerar os zumbis no campo
        tempo_min = 2;
        tempo_max = 4;
    }
    // 4. FASE INICIAL (< 10 kills): Zumbi Básico em ritmo normal
    else {
        zumbi_para_criar = obj_zumbi_basico;
        tempo_min = 6;
        tempo_max = 10;
    }

    // Criação do zumbi na camada Instances
    if (zumbi_para_criar != noone) {
        instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
        zumbis_nascidos += 1;
    }

    // Reagendamento do próximo spawn
    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);
}