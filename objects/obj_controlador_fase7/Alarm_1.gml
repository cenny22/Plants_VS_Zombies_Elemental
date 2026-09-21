// Se já nasceram 15 zumbis, para de criar mais zumbis!
if (zumbis_nascidos >= total_fase) {
    exit;
}

// 1. OBRIGA A PEGAR O Y DO GRID
var pos_x = posicao_spawn_x;

var quadrado_aleatorio = instance_find(obj_quadrado_grid, irandom(instance_number(obj_quadrado_grid) - 1));
var pos_y = quadrado_aleatorio.y; 

var zumbi_para_criar = obj_zumbi_basico; 

// 2. SISTEMA DE HORDAS (Usando a variável GLOBAL correta)
if (!variable_global_exists("zumbis_mortos")) {
    global.zumbis_mortos = 0;
}

// HORDA 1: 0 a 4 mortes
if (global.zumbis_mortos < 5) {
    zumbi_para_criar = obj_zumbi_basico;
}

// HORDA 2: De 5 até 9 mortes
else if (global.zumbis_mortos >= 5 && global.zumbis_mortos < 10) {
    var chance = irandom(99);
    if (chance < 50) {
        zumbi_para_criar = obj_zumbi_cone;   
    } else if (chance < 90) {
        zumbi_para_criar = obj_onca_zumbi; 
    } else {
        zumbi_para_criar = obj_zumbi_galinheiro;  
    }
}

// HORDA FINAL: 10 ou mais mortes
else {
    zumbi_para_criar = obj_zumbi_galinheiro;
}

// 3. CRIAÇÃO E RE-AGENDAMENTO
if (zumbi_para_criar != noone) {
    instance_create_layer(pos_x, pos_y, "Instances", zumbi_para_criar);
    zumbis_nascidos += 1;
}

// Se ainda faltam zumbis para nascer, agenda o próximo
if (zumbis_nascidos < total_fase) {
    alarm[1] = room_speed * random_range(6, 25);
}