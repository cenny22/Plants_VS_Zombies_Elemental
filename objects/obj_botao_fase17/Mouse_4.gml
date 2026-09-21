if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 16) {
    room_goto(Room_fase17_planta);
}