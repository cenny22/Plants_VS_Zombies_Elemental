event_inherited();
hp = 190;
vel = -0.5;
velocidade_salva = vel;
speed = vel;
eh_animal = false;

// Intervalo de tiro (ex: 2 segundos)
cooldown_tiro = 1.5;
alarm[0] = game_get_speed(gamespeed_fps) * cooldown_tiro;