if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
    ds_list_destroy(global.plantas_escolhidas);
}
global.modo_esteira = false;