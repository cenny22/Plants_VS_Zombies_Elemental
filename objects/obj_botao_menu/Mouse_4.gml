if (tipo == "jogar") {
    alarm[0] = 1;
}
else if (tipo == "mapa_planta") {
    room_goto(Room_fases_planta);
} else if (tipo == "fase_1") {
    room_goto(Room_fase1_planta);
} 
// ADICIONE DAQUI PARA BAIXO:
else if (tipo == "fase_2") {
  

    if (global.vitorias >= 1) {
        room_goto(Room_fase2_planta); 
    }
}