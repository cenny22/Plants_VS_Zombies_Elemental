if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 21){
    room_goto(Room_fase22_planta);
}