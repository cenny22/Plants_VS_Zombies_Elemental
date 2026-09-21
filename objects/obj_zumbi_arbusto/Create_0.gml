// Atributos de movimento e identificação
vel_padrao = 0.5; // Ele anda devagar, escondido
speed = vel_padrao;
direction = 180; // Anda para a esquerda

// Atributos de combate
hp_maximo = 190; // Vida considerável quando revelado
hp = hp_maximo;

danos_timer = 0;
atacadoread = noone; // Variável para guardar a planta que ele está comendo

estado = "andando"; // Estados: "andando", "comendo"

eh_animal = false;

paralisado = false;
tempo_paralisado = 0;

velocidade_salva = 0;