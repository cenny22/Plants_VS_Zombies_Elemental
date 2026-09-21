// ====================================================================
// 1. ESTADO GLOBAL DA PARTIDA
// ====================================================================
global.zumbis_mortos = 0;
global.sois = 500; 
global.fase_iniciada = false;
global.planta_selecionada = noone; 

global.plantas_escolhidas = ds_list_create();

// ====================================================================
// 2. CONTROLE DE PROGRESSO DA FASE 4
// ====================================================================
zumbis_nascidos = 0;
total_fase = 25; // Meta de zumbis para vencer esta fase

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
alarm[0] = -1;
alarm[1] = -1;
horda_iniciada = false;