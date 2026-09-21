if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 12) {
    room_goto(Room_fase13_planta);
}