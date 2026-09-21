// CHECAGEM DE SEGURANÇA
if (!variable_global_exists("fase_iniciada")) {
    global.fase_iniciada = false;
}

if (!variable_global_exists("zumbis_mortos")) {
    global.zumbis_mortos = 0;
}

// ====================================================================
// 1. ATIVAÇÃO DOS CRONÔMETROS
// ====================================================================
if (global.fase_iniciada == true) {
    
    if (alarm[0] == -1) {
        alarm[0] = room_speed * 3;  // Sol caindo
    }
    
    if (horda_iniciada == false && alarm[1] == -1) {
        alarm[1] = room_speed * 2;  // Primeiro zumbi
        horda_iniciada = true;      
    }
}

// ====================================================================
// 2. CONDIÇÃO DE VITÓRIA DA FASE 2
// ====================================================================
if (global.zumbis_mortos >= total_fase) {
    if (global.fase_iniciada == true) { 
        
        if (!variable_global_exists("vitorias")) {
            global.vitorias = 0;
        }
        
        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL
        global.vitorias += 1; 
        
        alarm[1] = -1;  // Desliga o gerador de zumbis
        global.fase_iniciada = false;
        global.zumbis_mortos = 0; // RESET CRÍTICO: Zera os mortos para não dar loop no mapa/próxima fase!
        ds_map_replace(global.plantas_liberadas, "espinhoguiado", true);
        room_goto(Room_fases_planta); // Volta para o menu/mapa
    }
}