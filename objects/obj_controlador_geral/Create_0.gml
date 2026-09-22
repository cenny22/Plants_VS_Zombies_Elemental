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
// Catálogo e desbloqueios vivem em um único lugar.
global.plantas = plantas_criar_catalogo();
plantas_inicializar_desbloqueios();

global.barra_selecionada = noone;
