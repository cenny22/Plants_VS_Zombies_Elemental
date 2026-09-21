// Herda vida, paralisia e variáveis do obj_zumbi_parent
event_inherited();

eh_animal = true;
hp = 3500;
hp_maximo = 3500;

vel = -1.5;
velocidade_salva = vel;
speed = vel; 

// Configuração do Timer de Caminhada
tempo_caminhada = 5; // Tempo em segundos andando até parar
parado = false;

cooldown_ataque = 10; 

// Dispara o alarme de parada
alarm[1] = game_get_speed(gamespeed_fps) * tempo_caminhada;