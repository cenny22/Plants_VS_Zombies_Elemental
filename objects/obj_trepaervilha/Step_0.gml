event_inherited(); // Garante que morra se o HP chegar a zero

if (adubo_ativado)
{
    adubo_ativado = false;  // Reseta o gatilho
    ervilhas_rajada = 5;   // Define o total de 60 ervilhas
    pode_atirar = false;    // Pausa o disparo comum durante a super rajada
    
    // Troca para a animação de ataque
    sprite_index = Sprite130;
    image_index = 0;
    
    // Inicia a metralhadora de ervilhas no próximo frame
    alarm[2] = 1;
}


var margem_altura = 16; 

// Procura alvos na linha
var zumbi_normal = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);
var zumbi_arbusto = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);

zumbi_na_linha = false;

if (zumbi_normal != noone) {
    zumbi_na_linha = true;
}

if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo") {
    zumbi_na_linha = true;
}

// ====================================================================
// VERIFICAÇÃO DE COLISÃO COM OUTRAS ERVILHAS
// ====================================================================
var projetil_para_atirar = obj_ervilha; // Projetil padrão

// Se estiver sobre a Disparervilha, Duplervilha ou Triplervilha, muda o projetil
if (place_meeting(x, y, obj_disparervilha) || place_meeting(x, y, obj_duplervilha) || place_meeting(x, y, obj_triplervilha)) {
    projetil_para_atirar = obj_forte;
}

// ====================================================================
// EXECUÇÃO DO TIRO
// ====================================================================
if (zumbi_na_linha && pode_atirar) {
    instance_create_layer(x + 20, y, "Instances", projetil_para_atirar);
    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
}