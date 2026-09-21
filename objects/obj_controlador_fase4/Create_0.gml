// ====================================================================
// 1. ESTADO GLOBAL DA PARTID
global.zumbis_mortos = 0;
// ====================================================================
global.sois = 50; 
//global.sois = 100000000000000000; 
global.fase_iniciada = false;
global.planta_selecionada = noone; 

// Lista dinâmica que vai guardar quais plantas o jogador escolheu para levar para a partida
global.plantas_escolhidas = ds_list_create();

// ====================================================================
// 2. CONTROLE DE PROGRESSO DA FASE 4
// ====================================================================
zumbis_nascidos = 0;
zumbis_mortos = 0;
total_fase = 20; // Meta de zumbis para vencer esta fase

// ====================================================================
// 3. COORDENADAS DE NASCIMENTO (SPAWN)
// ====================================================================
// Posição X: Um pouco além da borda direita da tela (ajuste se sua room for maior)
posicao_spawn_x = room_width + 60; 

// Posições Y: Ajuste esses números para baterem com o centro das suas fileiras!
fileiras_y[0] = 177; 
fileiras_y[1] = 304;
fileiras_y[2] = 433;
fileiras_y[3] = 560;
fileiras_y[4] = 689;

// ====================================================================
// 4. SEGURANÇA DOS ALARMES
// ====================================================================
// Garantimos que os alarmes comecem totalmente desligados (-1)
alarm[0] = -1;
alarm[1] = -1;
horda_iniciada = false; // Trava para ligar o alarme apenas UMA vez