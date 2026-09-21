/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 17F6E769
/// @DnDArgument : "code" "// CHECAGEM DE SEGURANÇA$(13_10)if (!variable_global_exists("fase_iniciada")) {$(13_10)    global.fase_iniciada = false;$(13_10)}$(13_10)$(13_10)if (!variable_global_exists("zumbis_mortos")) {$(13_10)    global.zumbis_mortos = 0;$(13_10)}$(13_10)$(13_10)// ====================================================================$(13_10)// 1. ATIVAÇÃO DOS CRONÔMETROS$(13_10)// ====================================================================$(13_10)if (global.fase_iniciada == true) {$(13_10)    $(13_10)    if (alarm[0] == -1) {$(13_10)        alarm[0] = room_speed * 3;  // Sol caindo$(13_10)    }$(13_10)    $(13_10)    if (horda_iniciada == false && alarm[1] == -1) {$(13_10)        alarm[1] = room_speed * 2;  // Primeiro zumbi$(13_10)        horda_iniciada = true;      $(13_10)    }$(13_10)}$(13_10)$(13_10)// ====================================================================$(13_10)// 2. CONDIÇÃO DE VITÓRIA DA FASE 2$(13_10)// ====================================================================$(13_10)if (global.zumbis_mortos >= total_fase) {$(13_10)    if (global.fase_iniciada == true) { $(13_10)        $(13_10)        if (!variable_global_exists("vitorias")) {$(13_10)            global.vitorias = 0;$(13_10)        }$(13_10)        $(13_10)        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL$(13_10)        global.vitorias += 1; $(13_10)        $(13_10)        alarm[1] = -1;  // Desliga o gerador de zumbis$(13_10)        global.fase_iniciada = false;$(13_10)        global.zumbis_mortos = 0; // RESET CRÍTICO: Zera os mortos para não dar loop no mapa/próxima fase!$(13_10)        ds_map_replace(global.plantas_liberadas, "repelecao", true);$(13_10)        room_goto(Room_fases_planta); // Volta para o menu/mapa$(13_10)    }$(13_10)}$(13_10)"
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
        
        // ADICIONA 1 VITÓRIA AO CONTADOR GLOBAL
        global.vitorias += 1; 
        
        alarm[1] = -1;  // Desliga o gerador de zumbis
        global.fase_iniciada = false;
        global.zumbis_mortos = 0; // RESET CRÍTICO: Zera os mortos para não dar loop no mapa/próxima fase!
        ds_map_replace(global.plantas_liberadas, "repelecao", true);
        room_goto(Room_fases_planta); // Volta para o menu/mapa
    }
}