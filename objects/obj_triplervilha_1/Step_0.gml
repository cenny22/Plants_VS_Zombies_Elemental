event_inherited(); 

var margem_altura = 16; 

// ====================================================================
// DETECÇÃO NAS 3 FILEIRAS
// ====================================================================

// 1. Linha de CIMA (y - distancia_fileira)
var zumbi_cima = collision_rectangle(x, (y - distancia_fileira) - margem_altura, room_width, (y - distancia_fileira) + margem_altura, obj_zumbi_parent, false, true);
var arbusto_cima = collision_rectangle(x, (y - distancia_fileira) - margem_altura, room_width, (y - distancia_fileira) + margem_altura, obj_zumbi_arbusto, false, true);

// 2. Linha do MEIO / ATUAL (y)
var zumbi_meio = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);
var arbusto_meio = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);

// 3. Linha de BAIXO (y + distancia_fileira) — CORRIGIDO AQUI: obj_zumbi_arbusto
var zumbi_baixo = collision_rectangle(x, (y + distancia_fileira) - margem_altura, room_width, (y + distancia_fileira) + margem_altura, obj_zumbi_parent, false, true);
var arbusto_baixo = collision_rectangle(x, (y + distancia_fileira) - margem_altura, room_width, (y + distancia_fileira) + margem_altura, obj_zumbi_arbusto, false, true);


// Verifica se há pelo menos um alvo válido em qualquer uma das três linhas
zumbi_na_linha = false;

// Checagem da fileira de CIMA
if (zumbi_cima != noone || (arbusto_cima != noone && arbusto_cima.estado == "comendo")) {
    zumbi_na_linha = true;
}

// Checagem da fileira do MEIO
if (zumbi_meio != noone || (arbusto_meio != noone && arbusto_meio.estado == "comendo")) {
    zumbi_na_linha = true;
}

// Checagem da fileira de BAIXO
if (zumbi_baixo != noone || (arbusto_baixo != noone && arbusto_baixo.estado == "comendo")) {
    zumbi_na_linha = true;
}


// ====================================================================
// EXECUÇÃO DO DISPARO TRIPLO
// ====================================================================
if (zumbi_na_linha && pode_atirar) {
    // Tiro da fileira de CIMA
    instance_create_layer(x + 20, y - distancia_fileira, "Instances", obj_ervilha);
    
    // Tiro da fileira do MEIO (Atual)
    instance_create_layer(x + 20, y, "Instances", obj_ervilha);
    
    // Tiro da fileira de BAIXO
    instance_create_layer(x + 20, y + distancia_fileira, "Instances", obj_ervilha);
    
    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
}