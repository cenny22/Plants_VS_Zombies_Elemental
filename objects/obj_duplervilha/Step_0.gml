event_inherited(); // Garante que ela morra se o HP chegar a zero

// Altura da área de visão (16 pixels para cima e 16 para baixo cobre a fileira toda)
var margem_altura = 16; 

// 1. Procura QUALQUER zumbi (inclusive a galinha) em uma faixa reta para a direita
var zumbi_normal = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);

// 2. Procura o zumbi arbusto na mesma faixa
var zumbi_arbusto = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);


// ====================================================================
// CONFIGURAÇÃO DO DISPARO
// ====================================================================
zumbi_na_linha = false;

// Se achou um zumbi normal/galinha, avisa que tem alvo
if (zumbi_normal != noone) {
    zumbi_na_linha = true;
}

// Se achou o arbusto E ele está comendo, avisa que tem alvo também
if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo") {
    zumbi_na_linha = true;
}


// ====================================================================
// EXECUÇÃO DO TIRO (Duplo)
// ====================================================================
// Só atira se tiver zumbi na linha E se a planta não estiver na espera do alarme
if (zumbi_na_linha && pode_atirar) {
    // 1. Cria a PRIMEIRA ervilha imediatamente
    instance_create_layer(x + 20, y - 50, "Instances", obj_ervilha);
    
    // Trava para não criar rajadas infinitas
    pode_atirar = false;
    
    // 2. Chama o Alarm 1 em 0.15 segundos para soltar a SEGUNDA ervilha
    alarm[1] = game_get_speed(gamespeed_fps) * 0.15;
    
    // 3. Chama o Alarm 0 em 1 segundo para liberar a planta para atirar de novo
    alarm[0] = game_get_speed(gamespeed_fps) * 1.0; 
}