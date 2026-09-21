if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 20){
    room_goto(Room_fase21_planta);
}