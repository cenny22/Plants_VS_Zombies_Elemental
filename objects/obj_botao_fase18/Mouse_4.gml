if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 17) {
    room_goto(Room_fase18_planta);
}