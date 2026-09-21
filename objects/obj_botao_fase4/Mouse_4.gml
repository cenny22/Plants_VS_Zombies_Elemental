// Só muda de sala se o jogador clicar E tiver vitórias suficientes
if (global.vitorias >= 3) { // Ajuste para a quantidade de vitórias necessária
    global.zumbis_mortos = 0;
    global.fase_iniciada = false;
    
    room_goto(Room_fase4_planta); // Nome da Room da Fase 4
}