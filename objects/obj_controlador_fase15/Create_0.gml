global.zumbis_mortos = 0;
global.sois = 0;
global.fase_iniciada = true;
global.modo_esteira = true;
global.planta_selecionada = noone;
global.pacote_atual_esteira = noone;

zumbis_nascidos = 0;
total_fase = 40; // Nova meta de vitórias
devorador_gerado = false; // Trava para criar o Devorador apenas uma vez

posicao_spawn_x = room_width - 50;

// Lista de fileiras fixas como backup
fileiras_y[0] = 177;
fileiras_y[1] = 304;
fileiras_y[2] = 433;
fileiras_y[3] = 560;
fileiras_y[4] = 689;

// Inicia o loop infinito de nascimento
alarm[1] = game_get_speed(gamespeed_fps) * 3;