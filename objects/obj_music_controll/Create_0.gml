// 1. SALAS DE MENU
if (room == Room_menu || room == Room_fases_planta || room == Room_mapas || room == Room_gameover) {
    if (!audio_is_playing(Menu)) {
        audio_stop_sound(F_planta);
        audio_stop_sound(Esteira);
        audio_stop_sound(fases);
        audio_stop_sound(boss);
        audio_play_sound(Menu, 1, true);
    }
}
// 2. FASE 15 (MÚSICA ESPECÍFICA)
else if (room == Room_fase15_planta) {
    if (!audio_is_playing(Esteira)) {
        audio_stop_sound(Menu);
        audio_stop_sound(fases);
        audio_stop_sound(F_planta);
        audio_stop_sound(boss);
        audio_play_sound(Esteira, 1, true);
    }
}
// 3. FASE 1 (PLANTA)
else if (room == Room_fase30_planta) {
    if (!audio_is_playing(boss)) {
        audio_stop_sound(Menu);
        audio_stop_sound(F_planta);
        audio_stop_sound(Esteira);
        audio_stop_sound(F_planta);
        audio_stop_sound(fases);
        audio_play_sound(boss, 1, true);
    }
}
// 4. OUTRAS FASES
else {
    if (!audio_is_playing(F_planta)) {
        audio_stop_sound(Menu);
        audio_stop_sound(Esteira);
        audio_stop_sound(fases);
        audio_stop_sound(boss);
        audio_play_sound(F_planta, 1, true);
    }
}