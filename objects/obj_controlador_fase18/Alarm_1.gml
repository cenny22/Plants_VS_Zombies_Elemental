if (!global.fase_iniciada) exit;

var pos_x_padrao = posicao_spawn_x;
var qtd_quadrados = instance_number(obj_quadrado_grid);

if (qtd_quadrados > 0) {
    if (!variable_global_exists("zumbis_mortos")) global.zumbis_mortos = 0;
    if (!variable_instance_exists(id, "zumbis_nascidos")) zumbis_nascidos = 0;

    var quantidade_por_horda = 1;
    var tempo_min = 12;
    var tempo_max = 16;

    // 1. INÍCIO DA FASE (Muito calmo: 1 por vez a cada 12-16s)
    if (zumbis_nascidos < 5) {
        tempo_min = 12;
        tempo_max = 16;
        quantidade_por_horda = 1;
    } 
    // 2. APÓS MATAR 30 ZUMBIS: Horda massiva só de básicos!
    else if (global.zumbis_mortos >= 30) {
        tempo_min = 0.5;
        tempo_max = 1.2;
        quantidade_por_horda = irandom_range(2, 4); // Spawna de 2 a 4 zumbis básicos por ciclo
    }
    // 3. MEIO DA FASE (Transição moderada antes dos 30 mortos)
    else if (zumbis_nascidos < total_fase) {
        tempo_min = 3.0;
        tempo_max = 5.0;
        quantidade_por_horda = irandom_range(1, 2);
    } 
    // 4. FINAL DA FASE
    else {
        tempo_min = 4.0;
        tempo_max = 6.0;
        quantidade_por_horda = 1;
    }

    // ====================================================================
    // CRIAÇÃO APENAS DE ZUMBIS BÁSICOS
    // ====================================================================
    for (var i = 0; i < quantidade_por_horda; i++) {
        var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(qtd_quadrados - 1));
        var pos_y = quadrado_aleatorio.y;
        
        // Exclusivamente o zumbi básico em qualquer momento da fase
        var zumbi_para_criar = obj_zumbi_basico;

        if (zumbi_para_criar != noone) {
            instance_create_layer(pos_x_padrao, pos_y, "Instances", zumbi_para_criar);
            zumbis_nascidos += 1;
        }
    }

    // Agenda o próximo disparo do alarme
    alarm[1] = game_get_speed(gamespeed_fps) * random_range(tempo_min, tempo_max);

} else {
    alarm[1] = game_get_speed(gamespeed_fps);
}