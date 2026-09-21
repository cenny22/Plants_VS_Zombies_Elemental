if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 23){
    room_goto(Room_fase24_planta);
}