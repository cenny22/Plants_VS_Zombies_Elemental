// CHECAGEM DE SEGURANÇA
if (!variable_global_exists("fase_iniciada")) {
    global.fase_iniciada = false;
}

if (!variable_global_exists("zumbis_mortos")) {
    global.zumbis_mortos = 0;
}

if (!variable_global_exists("sois")) {
    global.sois = 0;
}

// ====================================================================
// 1. ATIVAÇÃO DOS CRONÔMETROS
// ====================================================================
if (global.fase_iniciada == true) {
    
    if (alarm[0] == -1) {
        alarm[0] = game_get_speed(gamespeed_fps) * 3;  // Sol caindo do céu
    }
    
    if (horda_iniciada == false && alarm[1] == -1) {
        alarm[1] = game_get_speed(gamespeed_fps) * 2;  // Primeiro zumbi da horda
        horda_iniciada = true;      
    }
}

// ====================================================================
// 2. CONDIÇÃO DE VITÓRIA DA FASE 12 (ACUMULAR 500 SÓIS)
// ====================================================================
if (global.sois >= meta_sois && !fase_concluida) {
    if (global.fase_iniciada == true) { 
        
        fase_concluida = true; // Evita executar este bloco várias vezes
        
        if (!variable_global_exists("vitorias")) {
            global.vitorias = 0;
        }
        
        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL
        global.vitorias += 1; 
        
        alarm[1] = -1;  // Desliga o gerador de zumbis definitivamente
        global.fase_iniciada = false;
        global.zumbis_mortos = 0; // Reset padrão dos mortos
        
        // Desbloqueia nova recompensa no mapa (ajuste o nome se necessário)
        // ds_map_replace(global.plantas_liberadas, "nova_planta", true);
        ds_map_replace(global.plantas_liberadas, "covaceps", true);
        room_goto(Room_fases_planta); // Volta para o mapa de seleção
    }
}