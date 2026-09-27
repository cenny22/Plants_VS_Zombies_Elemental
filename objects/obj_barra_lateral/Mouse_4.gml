#region
// ============================================================
// CLIQUE NA BARRA LATERAL
// ============================================================


// Só responde se a fase começou

if (global.fase_iniciada)
{
    // ========================================================
    // TAMANHO DO QUADRO
    // ========================================================

    var quadro_largura =
        sprite_get_width(spr_quadrado_plantas) * 1.12;

    var quadro_altura =
        sprite_get_height(spr_quadrado_plantas) * 1.08;


    // ========================================================
    // VERIFICA SE O MOUSE ESTÁ NO QUADRO
    // ========================================================

    var dentro_quadro =
        point_in_rectangle(
            mouse_x,
            mouse_y,
            x - quadro_largura / 2,
            y - quadro_altura / 2,
            x + quadro_largura / 2,
            y + quadro_altura / 2
        );


    if (!dentro_quadro)
    {
        exit;
    }


    // ========================================================
    // SE ESTIVER EM COOLDOWN
    // ========================================================

    if (em_cooldown)
    {
        exit;
    }


    // ========================================================
    // ÍNDICE DA PLANTA
    // ========================================================

    var index = type - 1;


    if (index < ds_list_size(global.plantas_escolhidas))
    {
        var nome_planta =
            ds_list_find_value(
                global.plantas_escolhidas,
                index
            );


        // ====================================================
        // OBJETO REAL DA PLANTA
        // ====================================================

        var objeto_real =
            asset_get_index(
                "obj_" + nome_planta
            );


        // ====================================================
        // EXCEÇÕES
        // ====================================================

        if (nome_planta == "noz")
        {
            objeto_real = obj_noz_obstaculo;
        }

        if (nome_planta == "repelecao")
        {
            objeto_real = obj_repele_cao;
        }

        if (nome_planta == "broto")
        {
            objeto_real = obj_brotoflorescedor;
        }

        if (nome_planta == "covaceps")
        {
            objeto_real = obj_covaceps;
        }

        if (nome_planta == "enroscacovas")
        {
            objeto_real = obj_enroscacovas;
        }

        if (nome_planta == "espinhoguiado")
        {
            objeto_real = obj_espinhoguiado;
        }


        // ====================================================
        // VERIFICA SE O OBJETO EXISTE
        // ====================================================

        if (object_exists(objeto_real))
        {
            // -----------------------------------------------
            // CLICOU NA MESMA PLANTA
            // -----------------------------------------------

            if (global.planta_selecionada == objeto_real)
            {
                global.planta_selecionada = noone;
                global.barra_selecionada = noone;
            }
            else
            {
                // -------------------------------------------
                // SELECIONA
                // -------------------------------------------

                global.planta_selecionada = objeto_real;

                global.barra_selecionada = id;
            }
        }
    }
}

#endregion