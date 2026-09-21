if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 29){
    room_goto(Room_fase30_planta);
}