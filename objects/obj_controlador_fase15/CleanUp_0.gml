// Limpeza de memória ao sair da fase
if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
    ds_list_destroy(global.plantas_escolhidas);
}
global.modo_esteira = false; // Desativa a flag de esteira ao sair da room