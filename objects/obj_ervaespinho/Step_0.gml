#region OBJ_ERVA_ESPINHO — STEP

event_inherited();

// ==========================================
// ATIVAÇÃO DO ADUBO
// ==========================================

if (adubo_ativado)
{
    adubo_ativado = false;
    duracao_adubo = game_get_speed(gamespeed_fps) * 5; // 5 segundos de atração e paralisia
    
    // Troca para o sprite de ataque
    sprite_index = spr_erva_2;
    image_index = 0;
    image_speed = 1;

    // Puxa e paralisa TODOS os zumbis vivos na sala
    var erva_x = x;
    var erva_y = y;

    with (obj_zumbi_parent)
    {
        // Teleporta/Puxa o zumbi para cima da Erva-Espinho
        x = erva_x;
        y = erva_y;

        // Paralisa o zumbi
        paralisado = true;
        tempo_paralisado = game_get_speed(gamespeed_fps) * 5;
        
        if (variable_instance_exists(id, "speed"))
        {
            speed = 0;
        }
    }
}

// ==========================================
// ANIMAÇÃO E CHECAGEM VISUAL PADRÃO
// ==========================================

if (duracao_adubo > 0)
{
    duracao_adubo--;
    sprite_index = spr_erva_2;
}
else
{
    // Lógica original de colisão com zumbi
    var zumbi_tocando = instance_place(x, y, obj_zumbi_parent);

    if (instance_exists(zumbi_tocando))
    {
        if (sprite_index != spr_erva_2)
        {
            sprite_index = spr_erva_2;
            image_index = 0;
            image_speed = 1;
        }
    }
    else
    {
        if (sprite_index != spr_ervaespinho)
        {
            sprite_index = spr_ervaespinho;
            image_index = 0;
            image_speed = 1;
        }
    }
}

#endregion