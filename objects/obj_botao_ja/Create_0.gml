// Caso queira inicializar alguma propriedade visual do botão "JÁ"
// Verifica se estamos especificamente na Fase 13
if (room == Room_fase13_planta) {
    
    // Garante que a lista existe
    if (!variable_global_exists("plantas_escolhidas") || !ds_exists(global.plantas_escolhidas, ds_type_list)) {
        global.plantas_escolhidas = ds_list_create();
    }

    // Limpa qualquer seleção que o jogador tenha feito
    ds_list_clear(global.plantas_escolhidas);

    // Adiciona obrigatoriamente 7 Covaceps na lista
    repeat (7) {
        ds_list_add(global.plantas_escolhidas, "covaceps");
    }
}