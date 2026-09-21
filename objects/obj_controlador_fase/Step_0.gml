// ====================================================================
// 1. ATIVAÇÃO DOS CRONÔMETROS (Roda no exato segundo em que o jogo começa)
// ====================================================================
if (global.fase_iniciada == true && alarm[1] <= 0 && !instance_exists(obj_zumbi_parent)) {
    alarm[0] = room_speed * 3;  // Primeiro sol cai do céu em 3 segundos
    alarm[1] = room_speed * 6;  // Primeiro zumbi aparece em 6 segundos após clicar em "JÁ"
}

// ====================================================================
// 2. CONDIÇÃO DE VITÓRIA ESPECÍFICA DA FASE 1 (40 Zumbis Mortos)
// ====================================================================
// CONDIÇÃO DE VITÓRIA DA FASE (PADRONIZADO)
// ====================================================================
if (global.zumbis_mortos >= total_fase) {
    if (global.fase_iniciada == true) { 
        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL
        global.vitorias += 1; 
        
        alarm[1] = -1;  // Desliga o gerador de zumbis
        global.fase_iniciada = false;
		ds_map_replace(global.plantas_liberadas, "girassol", true);
        
        room_goto(Room_fases_planta); // Volta para o menu
    }
}