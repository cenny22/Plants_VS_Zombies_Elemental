if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 11) {
    room_goto(Room_fase12_planta);
}