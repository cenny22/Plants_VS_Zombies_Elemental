if (!variable_global_exists("vitorias")) { global.vitorias = 0; }

if (global.vitorias >= 4) {
    room_goto(Room_fase5_planta); // Nome da sua Room 3
} else {
    show_debug_message("Bloqueado! Precisa de 4 vitórias.");
}