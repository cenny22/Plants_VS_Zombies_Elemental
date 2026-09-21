if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 27){
    room_goto(Room_fase28_planta);
}