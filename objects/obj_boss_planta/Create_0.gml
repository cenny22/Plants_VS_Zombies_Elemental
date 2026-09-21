// Força a escala original do novo sprite (1 = 100%)


// --- TRAVA DA POSIÇÃO INICIAL DO ROOM EDITOR ---
posicao_spawn_x = x; // Salva a coordenada X onde você colocou o Boss na Room

// --- DESENHO E TRAVAS DE MOVIMENTO ---
vel = 0;
vspd = 0;
hspd = 0;
speed = 0;


// --- VARIÁVEIS GLOBAIS DA ESTEIRA ---
global.zumbis_mortos = 0;
global.sois = 0;
global.fase_iniciada = true;
global.modo_esteira = true;
global.planta_selecionada = noone;
global.pacote_atual_esteira = noone;

// --- ATRIBUTOS DO BOSS ---
hp_max = 24000; // HP padrão para acomodar os marcos de 6.000 e 12.000 de dano
hp = hp_max;
dano_recebido_acumulado = 0;
derrotado = false;

// --- FILEIRAS Y DO MAPA ---
fileiras_y[0] = 177;
fileiras_y[1] = 304;
fileiras_y[2] = 433;
fileiras_y[3] = 560;
fileiras_y[4] = 689;

// --- ALARMES DE HABILIDADES E SPAWN ---
alarm[0] = game_get_speed(gamespeed_fps) * 3; // Habilidades a cada 5s
alarm[1] = game_get_speed(gamespeed_fps) * 8; // Início do spawn de zumbis