if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 14) {
    room_goto(Room_fase15_planta);
}