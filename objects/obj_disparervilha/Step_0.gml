#region OBJ_DISPARERVILHA — STEP

event_inherited(); // Garante que ela morra se o HP chegar a zero

// ====================================================================
// CHECAGEM DO ADUBO
// ====================================================================

if (adubo_ativado)
{
    adubo_ativado = false;  // Reseta o gatilho
    ervilhas_rajada = 60;   // Define o total de 60 ervilhas
    pode_atirar = false;    // Pausa o disparo comum durante a super rajada
    
    // Troca para a animação de ataque
    sprite_index = spr_disparervilha_atirando;
    image_index = 0;
    
    // Inicia a metralhadora de ervilhas no próximo frame
    alarm[2] = 1;
}

// ====================================================================
// VISÃO E TIRO PADRÃO
// ====================================================================

var margem_altura = 16;

var zumbi_normal = collision_rectangle(
    x,
    y - margem_altura,
    room_width,
    y + margem_altura,
    obj_zumbi_parent,
    false,
    true
);

var zumbi_arbusto = collision_rectangle(
    x,
    y - margem_altura,
    room_width,
    y + margem_altura,
    obj_zumbi_arbusto,
    false,
    true
);

zumbi_na_linha = false;

if (zumbi_normal != noone)
{
    zumbi_na_linha = true;
}

if (zumbi_arbusto != noone && zumbi_arbusto.estado == "comendo")
{
    zumbi_na_linha = true;
}

// Disparo comum (só dispara se NÃO estiver em rajada do adubo)
if (zumbi_na_linha && pode_atirar && ervilhas_rajada <= 0)
{
    instance_create_layer(
        x + 20,
        y,
        "Instances",
        obj_ervilha
    );

    sprite_index = spr_disparervilha_atirando;
    image_index = 0;

    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
    alarm[1] = game_get_speed(gamespeed_fps);
}

#endregion