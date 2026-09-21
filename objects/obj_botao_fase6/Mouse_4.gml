if (!variable_global_exists("vitorias")) { global.vitorias = 0; }
	if (global.vitorias >= 5) {
    room_goto(Room_fase6_planta); // Nome da sua Room 6
} else {
    show_debug_message("Bloqueado! Precisa de 5 vitórias.");
}