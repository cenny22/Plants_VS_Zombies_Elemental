if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 28){
    room_goto(Room_fase29_planta);
}