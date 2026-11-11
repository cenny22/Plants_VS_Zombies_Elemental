#region OBJ_SOPRINHO — STEP

event_inherited(); // Garante que ela morra se o HP chegar a zero

// ====================================================================
// CONTROLE DE DESAPARECIMENTO GRADUAL (60 SEGUNDOS)
// ====================================================================
tempo_vida_atual -= 1;
image_alpha = tempo_vida_atual / tempo_vida_maximo;

if (tempo_vida_atual <= 0)
{
    instance_destroy();
    exit;
}

// ====================================================================
// CHECAGEM DO ADUBO (GLOBAL PARA TODOS OS SOPROGUMELOS)
// ====================================================================
if (adubo_ativado)
{
    adubo_ativado = false;  
    
    // Comanda TODOS os soprogumelos na sala a dispararem a super rajada juntos!
    with (obj_soprogumelo)
    {
        adubo_ativado = false;
        ervilhas_rajada = 60;   
        pode_atirar = false;    
        
        sprite_index = Sprite_soprinho;
        image_index = 0;
        
        alarm[2] = 1; // Inicia a rajada imediatamente
    }
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
        obj_sopro
    );

    sprite_index = Sprite_soprinho;
    image_index = 0;

    pode_atirar = false;
    alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
    alarm[1] = game_get_speed(gamespeed_fps);
}

#endregion