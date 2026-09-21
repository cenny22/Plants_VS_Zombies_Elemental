if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 7) {
    room_goto(Room_fase8_planta);
}