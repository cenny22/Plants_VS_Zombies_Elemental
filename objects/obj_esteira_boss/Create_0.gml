// 0. Garante aleatoriedade real em toda partida
randomize();

// 1. Configurações globais do modo esteira
global.modo_esteira = true;
global.fase_iniciada = true;

// 2. Lista de plantas para o modo esteira (alta frequência para as principais)
plantas_fase15 = [
    // Plantas de Alta Ponderação (Aparecem com muito mais frequência)
    "disparervilha", "disparervilha", "disparervilha", "disparervilha",
    "duplervilha",   "duplervilha",   "duplervilha",   "duplervilha",
    "triplervilha",  "triplervilha",  "triplervilha",
    "espinhoguiado", "espinhoguiado", "espinhoguiado",
    "broto",         "broto",         "broto",

    // Defesas e Armadilhas
    "noz", "noz",
    "batatamina", "batatamina",
    "ervaespinho",
    "esparabalde",

    // Plantas Utilitárias e Suporte
    "trepaervilha",
    "repelecao",
    "morcegarrador",
    "covaceps",
    "veudenoiva",
    "enroscacovas"
];

// 3. Tempo em segundos para gerar o próximo pacote
tempo_spawn = 3; 

// 4. Inicia o Alarm
alarm[0] = game_get_speed(gamespeed_fps) * tempo_spawn;