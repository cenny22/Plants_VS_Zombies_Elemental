if (derrotado) exit;

var pos_y = fileiras_y[irandom(4)];
var zumbi_para_criar = noone;

// ==========================================================
// SELEÇÃO DE ZUMBIS BASEADA NA VIDA RESTANTE (HP)
// ==========================================================
if (hp <= 4000) {
    // Fase 3: Vida baixa (35% de chance para o Devorador)
    var chance = irandom(99);
    if (chance < 35)      zumbi_para_criar = obj_devorador;               // 35%
    else if (chance < 42) zumbi_para_criar = obj_zumbi_cone;              // 7%
    else if (chance < 49) zumbi_para_criar = obj_zumbi_balde;             // 7%
    else if (chance < 56) zumbi_para_criar = obj_onca_zumbi;              // 7%
    else if (chance < 63) zumbi_para_criar = obj_zumbi_gorila;            // 7%
    else if (chance < 70) zumbi_para_criar = obj_zumbi_galinheiro;        // 7%
    else if (chance < 77) zumbi_para_criar = obj_zumbi_tarzan;            // 7%
    else if (chance < 84) zumbi_para_criar = obj_zumbi_regadoraervilha;   // 7%
    else if (chance < 91) zumbi_para_criar = obj_zumbi_regadoranoz;       // 7%
    else                  zumbi_para_criar = obj_zumbi_espantalho;        // 9%
} 
else if (hp <= 12000) {
    // Fase 2: Vida média (25% de chance para o Devorador)
    var chance = irandom(99);
    if (chance < 25)      zumbi_para_criar = obj_devorador;               // 25%
    else if (chance < 33) zumbi_para_criar = obj_zumbi_cone;              // 8%
    else if (chance < 41) zumbi_para_criar = obj_zumbi_balde;             // 8%
    else if (chance < 49) zumbi_para_criar = obj_onca_zumbi;              // 8%
    else if (chance < 57) zumbi_para_criar = obj_zumbi_gorila;            // 8%
    else if (chance < 65) zumbi_para_criar = obj_zumbi_galinheiro;        // 8%
    else if (chance < 73) zumbi_para_criar = obj_zumbi_tarzan;            // 8%
    else if (chance < 81) zumbi_para_criar = obj_zumbi_regadoraervilha;   // 8%
    else if (chance < 90) zumbi_para_criar = obj_zumbi_regadoranoz;       // 9%
    else                  zumbi_para_criar = obj_zumbi_espantalho;        // 10%
} 
else {
    // Fase 1: Vida cheia/alta
    if (irandom(1) == 0) zumbi_para_criar = obj_zumbi_cone;
    else zumbi_para_criar = obj_zumbi_basico;
}

// DEFINIÇÃO DA POSIÇÃO X DE SPAWN
var pos_x_final = posicao_spawn_x;
if (zumbi_para_criar == obj_zumbi_tarzan) {
    pos_x_final = room_width / 2;
}

// CRIAÇÃO DO ZUMBI
if (zumbi_para_criar != noone && object_exists(zumbi_para_criar)) {
    instance_create_layer(pos_x_final, pos_y, "Instances", zumbi_para_criar);
}

// Intervalo aleatório de spawn
alarm[1] = irandom_range(3, 6) * game_get_speed(gamespeed_fps);