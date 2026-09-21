// Se for a Fase 13, bloqueia a troca de plantas na tela de seleção
if (room == Room_fase13_planta && !global.fase_iniciada) {
    exit; // Cancela o clique para não alterar a barra
}
// 1. VERIFICAÇÃO PARA O MENU (Antes da partida começar)
// ESTÁGIO 1: DURANTE A PARTIDA (Clicar no card para colocar na mão)
// 1. VERIFICAÇÃO PARA O MENU (Antes da partida começar)
if (variable_global_exists("fase_iniciada") && global.fase_iniciada) {
    if (variable_instance_exists(id, "planta_associada") && planta_associada != noone) {
        
        // Se já for a planta selecionada atual, des-seleciona
        if (global.planta_selecionada == planta_associada) {
            global.planta_selecionada = noone;
        } else {
            global.planta_selecionada = planta_associada;
        }
    }
} 
// 1. VERIFICAÇÃO PARA O MENU (Antes da partida começar)
// ESTÁGIO 2: NO MENU DE SELEÇÃO DE PLANTAS (Antes de começar a fase)
// 1. VERIFICAÇÃO PARA O MENU (Antes da partida começar)
else {
    // Trava de segurança para o Mapa de Liberação
    var desbloqueada = false;
    if (variable_global_exists("plantas_liberadas") && ds_exists(global.plantas_liberadas, ds_type_map)) {
        desbloqueada = ds_map_find_value(global.plantas_liberadas, planta_tipo);
    }

    // Trava de segurança para a Lista de Escolha
    if (desbloqueada == true && variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
        
        var pos_lista = ds_list_find_index(global.plantas_escolhidas, planta_tipo);
        
        // Se ainda NÃO está na barra e o limite de 7 plantas não foi atingido
        if (pos_lista == -1) {
            if (ds_list_size(global.plantas_escolhidas) < 7) {
                ds_list_add(global.plantas_escolhidas, planta_tipo);
            } else {
                show_debug_message("Barra cheia! Máximo de 7 plantas.");
            }
        } 
        // Se JÁ estava na barra e clicou de novo no painel, remove da barra
        else {
            ds_list_delete(global.plantas_escolhidas, pos_lista);
        }
    }
}