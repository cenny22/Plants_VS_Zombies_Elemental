// 1. GARANTE O POS_Y ALINHADO AO GRID
var pos_y = y;
var qtd_quadrados = instance_number(obj_quadrado_grid);

if (qtd_quadrados > 0) {
    var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(qtd_quadrados - 1));
    pos_y = quadrado_aleatorio.y;
}

if (!variable_global_exists("zumbis_mortos")) {
    global.zumbis_mortos = 0;
}

var zumbi_para_criar = noone;
var tempo_min = 3;
var tempo_max = 5;

// ==========================================================
// 2. FASE DO DEVORADOR (APÓS 38 KILLS DA HORDA)
// ==========================================================
if (global.zumbis_mortos >= 39) {
    // Checa se NENHUM devorador está ativo na sala
    if (instance_number(obj_zumbi_devorador) == 0) {
        zumbi_para_criar = obj_zumbi_devorador;
    } else {
        // Se ainda existe um devorador vivo, reagenda para checar em 1 segundo
        alarm[1] = game_get_speed(gamespeed_fps) * 1;
        exit;
    }
} 
// ==========================================================
// 3. HORDA NORMAL (Abaixo de 38 Kills)
// ==========================================================
else if (global.zumbis_mortos >= 20 || zumbis_nascidos >= 25) {
    tempo_min = 2;
    tempo_max = 5;
    var chance = irandom(99);
    if (chance < 30) zumbi_para_criar = obj_zumbi_galinheiro;
    else if (chance < 55) zumbi_para_criar = obj_zumbi_arbusto;
    else if (chance < 80) zumbi_para_criar = obj_zumbi_gorila;
    else zumbi_para_criar = obj_zumbi_tarzan;
} 
else if (global.zumbis_mortos >= 10 || zumbis_nascidos >= 10) {
    tempo_min = 3;
    tempo_max = 6;
    var chance = irandom(99);
    if (chance < 40) zumbi_para_criar = obj_zumbi_gorila;
    else if (chance < 70) zumbi_para_criar = obj_onca_zumbi;
    else zumbi_para_criar = obj_zumbi_balde;
} 
else {
    zumbi_para_criar = obj_zumbi_cone;
}

// ==========================================================
// 4. CRIAÇÃO DO ZUMBI / DEVORADOR NO GRID
// ==========================================================
var pos_x_final = posicao_spawn_x;

if (zumbi_para_criar == obj_zumbi_tarzan) {
    pos_x_final = room_width / 2;
}

if (zumbi_para_criar != noone) {
    instance_create_layer(pos_x_final, pos_y, "Instances", zumbi_para_criar);
    zumbis_nascidos += 1;
}

// Reagendamento padrão do Alarm
alarm[1] = irandom_range(tempo_min, tempo_max) * game_get_speed(gamespeed_fps);