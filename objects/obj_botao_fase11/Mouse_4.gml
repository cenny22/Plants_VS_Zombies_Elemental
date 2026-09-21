if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 10) {
    room_goto(Room_fase11_planta);
}