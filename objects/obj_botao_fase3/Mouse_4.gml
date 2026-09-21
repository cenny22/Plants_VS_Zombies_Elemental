// 1. Limpa o clique anterior para não ativar sozinho ao entrar na sala
io_clear();

if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

// 2. Se você tem 2 vitórias ou mais, libera o acesso
if (global.vitorias >= 2) {
    global.zumbis_mortos = 0;
    global.fase_iniciada = false;
    room_goto(Room_fase3_planta);
}