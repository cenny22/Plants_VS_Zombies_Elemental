#region

event_inherited(); // Garante que ela morra se o HP chegar a zero

// Altura da área de visão
var margem_altura = 16;

// Procura QUALQUER zumbi em uma faixa reta para a direita
var zumbi_normal = collision_rectangle(
    x,
    y - margem_altura,
    room_width,
    y + margem_altura,
    obj_zumbi_parent,
    false,
    true
);

// Procura o zumbi arbusto na mesma faixa
var zumbi_arbusto = collision_rectangle(
    x,
    y - margem_altura,
    room_width,
    y + margem_altura,
    obj_zumbi_arbusto,
    false,
    true
);


// ====================================================================
// CONFIGURAÇÃO DO DISPARO
// ====================================================================

zumbi_na_linha = false;

// Zumbi normal / galinha
if (zumbi_normal != noone)
{
    zumbi_na_linha = true;
}

// Zumbi arbusto somente quando está comendo
if (
    zumbi_arbusto != noone
    &&
    zumbi_arbusto.estado == "comendo"
)
{
    zumbi_na_linha = true;
}


// ====================================================================
// EXECUÇÃO DO TIRO
// ====================================================================

if (zumbi_na_linha && pode_atirar)
{
    // Cria a ervilha
    instance_create_layer(
        x + 20,
        y,
        "Instances",
        obj_ervilha
    );

    // ================================================================
    // ANIMAÇÃO DE ATAQUE
    // ================================================================

    sprite_index = spr_disparervilha_atirando;

    // Reinicia a animação da sprite
    image_index = 0;

    // ================================================================
    // CONTROLE DO DISPARO
    // ================================================================

    pode_atirar = false;

    alarm[0] = room_speed * 1.5;

    // Timer para voltar à sprite normal
    alarm[1] = room_speed;
}

#endregion