// CHECAGEM DE SEGURANÇA: Se a variável global de início não existir, cria como falsa
if (!variable_global_exists("fase_iniciada")) {
    global.fase_iniciada = false;
}

// ====================================================================
// 1. ATIVAÇÃO DOS CRONÔMETROS (Garante que só roda UMA VEZ no início)
// ====================================================================
if (global.fase_iniciada == true) {
    
    // Se o alarme do Sol estiver desligado (-1), liga ele
    if (alarm[0] == -1) {
        alarm[0] = room_speed * 3;  // Primeiro sol cai do céu em 3 segundos
    }
    
    // Usamos a trava "horda_iniciada" em vez de checar se nascidos é 0
    if (horda_iniciada == false && alarm[1] == -1) {
        alarm[1] = room_speed * 2;  // Primeiro zumbi aparece em 2 segundos
        horda_iniciada = true;      // Tranca a porta! O Step nunca mais mexe no Alarm 1
    }
}

// ====================================================================
// 2. CONDIÇÃO DE VITÓRIA DA FASE
// ====================================================================
if (global.zumbis_mortos >= total_fase) {
    if (global.fase_iniciada == true) { 
        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL
        global.vitorias += 1; 
        
        alarm[1] = -1;  // Desliga o gerador de zumbis
        global.fase_iniciada = false;
        ds_map_replace(global.plantas_liberadas, "batatamina", true);
        room_goto(Room_fases_planta); // Volta para o menu
    }
}