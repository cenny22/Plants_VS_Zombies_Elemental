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
// EXECUÇÃO DO TIRO (Baseado no seu alarme e trava)
// ====================================================================
// Só atira se tiver zumbi na linha E se a planta não estiver na espera do alarme
if (zumbi_na_linha && pode_atirar) {

    instance_create_layer(x + 20, y, "Instances", obj_ervilha_frio);

    instance_create_layer(x + 20, y - 50, "Instances", obj_ervilha);   
 pode_atirar = false;
    alarm[0] = room_speed * 1.5; // 1.5 segundos de intervalo para poder atirar de novo
}