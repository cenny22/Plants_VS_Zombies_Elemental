#region OBJ_DUPLERVILHA — ALARM 2

if (ervilhas_rajada > 0)
{
    // Offset vertical para espalhar pela fileira sem sair do bloco
    var offset_y = irandom_range(-14, 14);
    
    // Offset horizontal sutil
    var offset_x = irandom_range(15, 25);

    // Cria a ervilha
    var ervilha = instance_create_layer(
        x + offset_x,
        y + offset_y,
        "Instances",
        obj_ervilha
    );

    // Variação de velocidade para os projéteis não irem colados
    if (variable_instance_exists(ervilha, "speed"))
    {
        ervilha.speed = random_range(7, 10);
    }
    else if (variable_instance_exists(ervilha, "hspeed"))
    {
        ervilha.hspeed = random_range(7, 10);
    }

    ervilhas_rajada--;

    // Reagenda até completar as 90 ervilhas
    if (ervilhas_rajada > 0)
    {
        alarm[2] = tempo_entre_rajada;
    }
    else
    {
        // Encerra a rajada e reseta os estados
        sprite_index = spr_duplervilha;
        image_index = 0;
        
        alarm[0] = game_get_speed(gamespeed_fps) * 1.5;
    }
}

#endregion