if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 22){
    room_goto(Room_fase23_planta);
}