if (!variable_global_exists("vitorias")) {
    global.vitorias = 0;
}

if (global.vitorias >= 19){
    room_goto(Room_fase20_planta);
}