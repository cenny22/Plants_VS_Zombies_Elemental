// 1. DURANTE A PARTIDA (Clicar no card para colocar a planta na mão)
if (variable_global_exists("fase_iniciada") && global.fase_iniciada) {
    if (variable_instance_exists(id, "planta_associada") && planta_associada != noone) {
        if (global.planta_selecionada == planta_associada) {
            global.planta_selecionada = noone;
        } else {
            global.planta_selecionada = planta_associada;
        }
    }
} 
// 2. NO MENU DE SELEÇÃO (Antes do jogo começar)
else {
    var desbloqueada = false;
    if (variable_global_exists("plantas_liberadas") && ds_exists(global.plantas_liberadas, ds_type_map)) {
        desbloqueada = ds_map_find_value(global.plantas_liberadas, planta_tipo);
    }

    if (desbloqueada == true && variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
        
        // --- COMPORTAMENTO DA FASE 13 ---
        if (room == Room_fase13_planta) {
            ds_list_clear(global.plantas_escolhidas);
            repeat (7) {
                ds_list_add(global.plantas_escolhidas, "covaceps");
            }
            show_debug_message("Fase 13: 7 Covaceps equipados!");
        } 
        // --- COMPORTAMENTO DE FASES NORMAIS ---
        else {
            var pos_lista = ds_list_find_index(global.plantas_escolhidas, planta_tipo);
            
            // Se ainda não está na barra, adiciona apenas 1
            if (pos_lista == -1) {
                if (ds_list_size(global.plantas_escolhidas) < 7) {
                    ds_list_add(global.plantas_escolhidas, planta_tipo);
                } else {
                    show_debug_message("Barra cheia!");
                }
            } 
            // Se já está na barra, remove ao clicar de novo
            else {
                ds_list_delete(global.plantas_escolhidas, pos_lista);
            }
        }
    }
}