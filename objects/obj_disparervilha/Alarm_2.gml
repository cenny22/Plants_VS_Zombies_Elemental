#region OBJ_DISPARERVILHA — ALARM 2

if (ervilhas_rajada > 0)
{
    // Offset vertical para variar a altura sem sair da fileira
    var offset_y = irandom_range(-12, 12);
    
    // Offset horizontal sutil para dar efeito de dispersão
    var offset_x = irandom_range(15, 25);

    // Cria a ervilha com o deslocamento calculado
    var ervilha = instance_create_layer(
        x + offset_x,
        y + offset_y,
        "Instances",
        obj_ervilha
    );

    // Variação leve na velocidade da ervilha (se a ervilha usar a variável hspeed ou speed)
    if (variable_instance_exists(ervilha, "speed"))
    {
        ervilha.speed = random_range(6, 9);
    }
    else if (variable_instance_exists(ervilha, "hspeed"))
    {
        ervilha.hspeed = random_range(6, 9);
    }

    ervilhas_rajada--;

    // Se ainda restarem ervilhas, reagenda o disparo rápido
    if (ervilhas_rajada > 0)
    {
        alarm[2] = tempo_entre_rajada;
    }
    else
    {
        // Ao encerrar as 60 ervilhas, reseta os estados e temporizadores
        sprite_index = spr_disparervilha;
        image_index = 0;
        
        alarm[0] = game_get_speed(gamespeed_fps) * 1.5; // Tempo até poder atirar normal novamente
    }
}

#endregion