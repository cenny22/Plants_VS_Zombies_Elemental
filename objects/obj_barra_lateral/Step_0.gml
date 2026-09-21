if (em_cooldown) {
    tempo_cooldown_atual -= 1 / game_get_speed(gamespeed_fps);
    
    if (tempo_cooldown_atual <= 0) {
        tempo_cooldown_atual = 0;
        em_cooldown = false;
    }
}