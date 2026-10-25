// Atributos de movimento e identificação
vel_padrao = 0.5; // Ele anda devagar, escondido
speed = vel_padrao;
direction = 180; // Anda para a esquerda

// Atributos de combate
hp_maximo = 190; // Vida considerável quando revelado
hp = hp_maximo;

danos_timer = 0;// ============================================================
// OBJ_ZUMBI_ARBUSTO — CREATE
// ============================================================

// Atributos de movimento e identificação
vel_padrao = -0.5;            // Negativo para andar para a esquerda
velocidade_atual = vel_padrao; // Variável usada pelo controle de movimento e paralisia
speed = 0;                   // Zerado para não conflitar com a movimentação manual por x += velocidade_atual

// Atributos de combate
hp_maximo = 190;             // Vida considerável
hp = hp_maximo;

danos_timer = 0;
atacadoread = noone;         // Guarda a planta que ele está comendo

estado = "andando";          // Estados: "andando", "comendo"

eh_animal = false;

paralisado = false;
tempo_paralisado = 0;
velocidade_salva = vel_padrao;
atacadoread = noone; // Variável para guardar a planta que ele está comendo

estado = "andando"; // Estados: "andando", "comendo"

eh_animal = false;

paralisado = false;
tempo_paralisado = 0;

velocidade_salva = 0;