#region OBJ_TRIPLERVILHA — ALARM 2

if (ervilhas_rajada > 0)
{
    // ========================================================
    // DISTÂNCIA ENTRE AS 3 FILEIRAS
    // ========================================================

    var distancia_fileira = 150;


    // ========================================================
    // ESCOLHE UMA DAS 3 LINHAS
    // ========================================================

    var linha = irandom(2);

    var pos_y = y;

    if (linha == 0)
    {
        pos_y = y - distancia_fileira;
    }
    else if (linha == 1)
    {
        pos_y = y;
    }
    else
    {
        pos_y = y + distancia_fileira;
    }


    // ========================================================
    // PEQUENA DISPERSÃO
    // ========================================================

    var offset_y = irandom_range(-10, 10);
    var offset_x = irandom_range(15, 25);


    // ========================================================
    // CRIA A ERVILHA
    // ========================================================

    var ervilha =
        instance_create_layer(
            x + offset_x,
            pos_y + offset_y,
            "Instances",
            obj_ervilha
        );


    // ========================================================
    // VELOCIDADE VARIADA
    // ========================================================

    if (variable_instance_exists(ervilha, "speed"))
    {
        ervilha.speed =
            random_range(6, 9);
    }
    else if (variable_instance_exists(ervilha, "hspeed"))
    {
        ervilha.hspeed =
            random_range(6, 9);
    }


    // ========================================================
    // DIMINUI A QUANTIDADE
    // ========================================================

    ervilhas_rajada--;


    // ========================================================
    // CONTINUA A RAJADA
    // ========================================================

    if (ervilhas_rajada > 0)
    {
        alarm[2] =
            tempo_entre_rajada;
    }
    else
    {
        // ====================================================
        // FIM DA RAJADA
        // ====================================================

       // sprite_index =
       //     spr_triplervilha;

        image_index = 0;

        pode_atirar = true;

        alarm[0] =
            game_get_speed(gamespeed_fps) * 1.5;
    }
}

#endregion