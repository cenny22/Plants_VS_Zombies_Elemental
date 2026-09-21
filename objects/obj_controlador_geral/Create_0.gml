// Coloque no Create do obj_controlador_fase (ou no Game Start)
randomize(); // Força o GameMaker a gerar uma semente totalmente nova a cada execução
//====================================================================
// CONTROLADOR GERAL DE SALVAMENTO E PROGRESSO
//====================================================================

// Se a variável de vitórias ainda não existe, cria como 0
if (!variable_global_exists("vitorias")) {
    global.vitorias = 0; 
}

// Cria a lista de plantas de forma segura
if (!variable_global_exists("plantas_escolhidas") || !ds_exists(global.plantas_escolhidas, ds_type_list)) {
    global.plantas_escolhidas = ds_list_create();
}
// Garantir que o mapa/lista de plantas liberadas exista
if (!variable_global_exists("plantas_liberadas")) {
    global.plantas_liberadas = ds_map_create();
    
    // Plantas iniciais liberadas por padrão
    ds_map_add(global.plantas_liberadas, "disparervilha", 1);
	ds_map_add(global.plantas_liberadas, "girassol",0);
    ds_map_add(global.plantas_liberadas, "noz", 0)
    ds_map_add(global.plantas_liberadas, "ervaespinho", 0);
    ds_map_add(global.plantas_liberadas, "batatamina", 0);
    ds_map_add(global.plantas_liberadas, "esparabalde", 0);
    ds_map_add(global.plantas_liberadas, "repelecao",0);
    ds_map_add(global.plantas_liberadas, "duplervilha",0);
    ds_map_add(global.plantas_liberadas, "covaceps",0);
    ds_map_add(global.plantas_liberadas, "veudenoiva",0);
    ds_map_add(global.plantas_liberadas, "broto",0);
    ds_map_add(global.plantas_liberadas, "morcegarrador",0);
	ds_map_add(global.plantas_liberadas, "enroscacovas",0);
	ds_map_add(global.plantas_liberadas, "triplervilha", 0);
	ds_map_add(global.plantas_liberadas, "espinhoguiado", 0);
	ds_map_add(global.plantas_liberadas, "trepaervilha", 0);
}

// Lista onde o jogador vai colocar até 7 plantas escolhidas
if (!variable_global_exists("plantas_escolhidas")) {
    global.plantas_escolhidas = ds_list_create();
}