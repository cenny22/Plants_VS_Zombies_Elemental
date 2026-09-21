event_inherited();

eh_animal = true;
hp = 300;
hp_maximo = 300;

vel = -1.5;
velocidade_salva = vel;
speed = vel; 

// Configuração do Timer de Caminhada (igual à Girafa)
tempo_caminhada = 5; 
parado = false;
cooldown_ataque = 10; 

// Controle da mecânica especial de morte
em_investida = false; // Indica se está no modo de destruição total
vel_investida = -4; // Velocidade rápida para atravessar a fileira

// Dispara o alarme de parada inicial
alarm[1] = game_get_speed(gamespeed_fps) * tempo_caminhada;