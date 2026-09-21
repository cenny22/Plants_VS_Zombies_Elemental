if (!variable_global_exists("vitorias")) { global.vitorias = 0; }
	if (global.vitorias >= 6) {
    room_goto(Room_fase6_planta); // Nome da sua Room 6
}
