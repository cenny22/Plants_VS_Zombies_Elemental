// CHECAGEM DE SEGURANÇA
if (!variable_global_exists("fase_iniciada")) {
    global.fase_iniciada = false;
}

if (!variable_global_exists("zumbis_mortos")) {
    global.zumbis_mortos = 0;
}

// ====================================================================
// 1. CRONÔMETRO DE PREPARAÇÃO E INÍCIO DOS ZUMBIS
// ====================================================================
// Quando o jogador clica no botão "JÁ", a global.fase_iniciada vira true
if (global.fase_iniciada) {
    
    // Contagem regressiva de 30 segundos
    if (!fase_ativa) {
        tempo_preparacao -= 1 / game_get_speed(gamespeed_fps);
        
        // Se o tempo acabar, inicia a invasão dos zumbis
        if (tempo_preparacao <= 0) {
            tempo_preparacao = 0;
            fase_ativa = true;
        }
    }
    
    // Assim que a fase fica ativa (tempo zerou ou botão de pular foi clicado)
    if (fase_ativa && !horda_iniciada) {
        if (alarm[1] == -1) {
            alarm[1] = game_get_speed(gamespeed_fps) * 2; // Primeiro zumbi em 2s
            horda_iniciada = true;
        }
    }
}

// ====================================================================
// 2. CONDIÇÃO DE VITÓRIA DA FASE 28
// ====================================================================
if (global.zumbis_mortos >= total_fase) {
    if (global.fase_iniciada) { 
        
        if (!variable_global_exists("vitorias")) {
            global.vitorias = 0;
        }
        
        global.vitorias += 1; 
        
        alarm[1] = -1; // Desliga o gerador de zumbis
        global.fase_iniciada = false;
        global.zumbis_mortos = 0; // Reset crítico
        ds_map_replace(global.plantas_liberadas, "trepaervilha", true);
        room_goto(Room_fases_planta); // Retorna ao mapa
    }
}