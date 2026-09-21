// Garante que a fase começa no estado de seleção no início de qualquer sala de fase
global.fase_iniciada = false;

// Garante que a lista de plantas escolhidas existe na memória para a nova fase
if (!variable_global_exists("plantas_escolhidas") || !ds_exists(global.plantas_escolhidas, ds_type_list)) {
    global.plantas_escolhidas = ds_list_create();
}