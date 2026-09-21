if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 9) {
    room_goto(Room_fase10_planta);
}