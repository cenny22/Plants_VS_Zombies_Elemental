if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 13) {
    room_goto(Room_fase14_planta);
}