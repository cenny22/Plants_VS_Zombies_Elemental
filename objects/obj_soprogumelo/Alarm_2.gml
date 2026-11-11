#region OBJ_SOPRINHO — ALARM 2

if (ervilhas_rajada > 0)
{
    var offset_y = irandom_range(-12, 12);
    var offset_x = irandom_range(15, 25);

    var ervilha = instance_create_layer(
        x + offset_x,
        y + offset_y,
        "Instances",
        obj_sopro
    );

    if (variable_instance_exists(ervilha, "speed"))
    {
        ervilha.speed = random_range(6, 9);
    }
    else if (variable_instance_exists(ervilha, "hspeed"))
    {
        ervilha.hspeed = random_range(6, 9);
    }

    ervilhas_rajada--;

    if (ervilhas_rajada > 0)
    {
        alarm[2] = tempo_entre_rajada;
    }
    else
    {
        sprite_index = Sprite_soprinho;
        image_index = 0;
        
        alarm[0] = game_get_speed(gamespeed_fps) * 1.0; 
    }
}

#endregion