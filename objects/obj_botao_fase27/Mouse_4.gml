if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 26){
    room_goto(Room_fase27_planta);
}