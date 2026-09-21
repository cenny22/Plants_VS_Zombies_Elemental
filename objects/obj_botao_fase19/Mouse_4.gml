if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 18) {
    room_goto(Room_fase19_planta);
}