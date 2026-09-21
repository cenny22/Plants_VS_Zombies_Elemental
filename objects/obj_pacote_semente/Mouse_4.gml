// Se a fase ainda não começou e não escolhemos mais de 7 plantas
if (!global.fase_iniciada && ds_list_size(global.plantas_escolhidas) < 7) {
    // Verifica se essa planta já não foi escolhida
    if (ds_list_find_index(global.plantas_escolhidas, planta_associada) == -1) {
        ds_list_add(global.plantas_escolhidas, planta_associada);
        selecionado = true; // Marca que já foi escolhida
    }
} 
// Se a fase JÁ começou, esse mesmo botão serve para SELECIONAR a planta para plantar no grid!
else if (global.fase_iniciada) {
    // Verifica se essa planta está na lista das escolhidas
    if (ds_list_find_index(global.plantas_escolhidas, planta_associada) != -1) {
        global.planta_selecionada = planta_associada;
    }
}