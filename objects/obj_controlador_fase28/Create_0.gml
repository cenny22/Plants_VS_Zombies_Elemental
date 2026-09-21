// ====================================================================
// 1. ESTADO GLOBAL DA PARTIDA
// ====================================================================
global.zumbis_mortos = 0;
global.sois = 4175; // Fase de planejamento: 4000 sóis iniciais
global.fase_iniciada = false;
global.planta_selecionada = noone; 

if (!variable_global_exists("plantas_escolhidas") || !ds_exists(global.plantas_escolhidas, ds_type_list)) {
    global.plantas_escolhidas = ds_list_create();
}

// ====================================================================
// 2. CONTROLE DE PROGRESSO DA FASE 28
// ====================================================================
zumbis_nascidos = 0;
total_fase = 45; // Quantidade de zumbis para vencer a fase

// Controle de tempo para início do ataque
tempo_preparacao = 30000000; // Cronômetro de 30 segundos
fase_ativa = false;     // Define se os zumbis já podem spawnar

// ====================================================================
// 3. COORDENADAS DE NASCIMENTO (SPAWN)
// ====================================================================
posicao_spawn_x = room_width + 60; 

fileiras_y[0] = 177; 
fileiras_y[1] = 304;
fileiras_y[2] = 433;
fileiras_y[3] = 560;
fileiras_y[4] = 689;

// ====================================================================
// 4. SEGURANÇA DOS ALARMES
// ====================================================================
alarm[0] = -1; // Não haverá sol caindo do céu nesta fase
alarm[1] = -1; // Alarme de spawn dos zumbis
horda_iniciada = false;