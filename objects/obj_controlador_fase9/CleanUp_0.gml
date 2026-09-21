// Sempre limpe estruturas de dados para evitar Lag (Memory Leak)
if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
    ds_list_destroy(global.plantas_escolhidas);
}