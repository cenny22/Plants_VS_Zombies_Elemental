// 0. Garante aleatoriedade real em toda partida
randomize();

// 1. Configurações globais do modo esteira
global.modo_esteira = true;
global.fase_iniciada = true;

// 2. Lista ponderada: Disparervilha e Duplervilha aparecem mais vezes para aumentar a chance
plantas_fase15 = [
    "disparervilha", "disparervilha", "disparervilha", "disparervilha", // Maior chance
    "duplervilha",   "duplervilha",   "duplervilha",                   // Segunda maior chance
    "noz", "noz",
    "batatamina", "batatamina",
    "esparabalde",
    "repepecao",
    "covaceps",
    "ervaespinho"
];

// 3. Tempo em segundos para gerar o próximo pacote
tempo_spawn = 3; 

// 4. Inicia o Alarm
alarm[0] = game_get_speed(gamespeed_fps) * tempo_spawn;