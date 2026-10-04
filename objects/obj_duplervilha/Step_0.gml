#region OBJ_DUPLERVILHA — STEP

event_inherited();

// ====================================================================
// CHECAGEM DO ADUBO
// ====================================================================
if (adubo_ativado)
{
    adubo_ativado = false;  // Reseta o gatilho
    ervilhas_rajada = 90;   // Define o total de 90 ervilhas
    pode_atirar = false;    // Pausa o disparo comum
    
    // Troca para a animação de ataque/disparo
    sprite_index = spr_duplervilha_atirando; 
    image_index = 0;
    
    // Inicia a super rajada no próximo frame
    alarm[2] = 1;
}

// ====================================================================
// VISÃO E TIRO PADRÃO
// ====================================================================
var margem_altura = 16;

var zumbi_normal = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_parent, false, true);
var zumbi_arbusto = collision_rectangle(x, y - margem_altura, room_width, y + margem_altura, obj_zumbi_arbusto, false, true);

zumbi_na_linha = false;

if (zumbi_normal != noone)
{
    zumbi_na_linha = true;
}

if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo")
{
    zumbi_na_linha = true;
}

// Disparo duplo padrão (SÓ ATIRA SE: zumbi na linha, puder atirar E não estiver no adubo)
if (zumbi_na_linha && pode_atirar && ervilhas_rajada <= 0)
{
    pode_atirar = false; // Bloqueia novos tiros imediatamente para não resetar o alarme no próximo frame
    
    // CRIA A 1ª ERVILHA
    instance_create_layer(x + 20, y, "Instances", obj_ervilha);
    
    sprite_index = spr_duplervilha_atirando;
    image_index = 0;

    // ALARM 1: Dispara a segunda ervilha após uma pequena fração de segundo (ex: 0.15 segundos)
    alarm[1] = game_get_speed(gamespeed_fps) * 0.15;
    
    // ALARM 0: Controla o tempo total de recarga para o próximo par de tiros (1.5 segundos)
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
}

#endregion
