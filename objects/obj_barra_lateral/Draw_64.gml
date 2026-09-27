#region
// ============================================================
// OBJ_BARRA_LATERAL — DRAW GUI
// ============================================================
// Desenha:
// - Cartas das plantas
// - Plantas das cartas
// - Borda da planta selecionada
// - Planta seguindo o mouse
// ============================================================


// ============================================================
// VERIFICA LISTA
// ============================================================

if (!variable_global_exists("plantas_escolhidas"))
{
    exit;
}

if (!ds_exists(global.plantas_escolhidas, ds_type_list))
{
    exit;
}


var quantidade =
    ds_list_size(
        global.plantas_escolhidas
    );


// ============================================================
// DESENHA TODAS AS CARTAS
// ============================================================

for (var i = 0; i < quantidade; i++)
{
    // --------------------------------------------------------
    // Nome da planta
    // --------------------------------------------------------

    var nome =
        ds_list_find_value(
            global.plantas_escolhidas,
            i
        );


    // --------------------------------------------------------
    // Dados do catálogo
    // --------------------------------------------------------

    var dados =
        planta_obter(nome);


    if (is_undefined(dados))
    {
        continue;
    }


    // --------------------------------------------------------
    // Posição
    // --------------------------------------------------------

    var px = barra_x;

    var py =
        barra_y +
        (i * espacamento);


    // ========================================================
    // QUADRO
    // ========================================================

    draw_sprite_ext(
        spr_quadrado_plantas,
        0,
        px,
        py,
        escala_quadro_x,
        escala_quadro_y,
        0,
        c_white,
        1
    );


    // ========================================================
    // SPRITE DA PLANTA
    // ========================================================

    var sprite_planta =
        object_get_sprite(
            dados.objeto
        );


    if (sprite_planta != -1)
    {
        draw_sprite_ext(
            sprite_planta,
            0,
            px,
            py,
            escala_planta,
            escala_planta,
            0,
            c_white,
            1
        );
    }


    // ========================================================
    // BORDA DE SELEÇÃO
    // ========================================================

    if (indice_selecionado == i)
    {
        draw_set_color(c_yellow);

        // FALSE = somente a borda.
        // Não usamos draw_style.outline.

        draw_rectangle(
            px - 42,
            py - 42,
            px + 42,
            py + 42,
            false
        );

        draw_set_color(c_white);
    }
}


// ============================================================
// PLANTA SEGUINDO O MOUSE
// ============================================================

if (indice_selecionado != -1)
{
    if (planta_selecionada_local != "")
    {
        var dados_selecionados =
            planta_obter(
                planta_selecionada_local
            );


        if (!is_undefined(dados_selecionados))
        {
            var sprite_selecionado =
                object_get_sprite(
                    dados_selecionados.objeto
                );


            if (sprite_selecionado != -1)
            {
                // ------------------------------------------------
                // Posição do mouse na GUI
                // ------------------------------------------------

                var mouse_gui_x =
                    device_mouse_x_to_gui(0);

                var mouse_gui_y =
                    device_mouse_y_to_gui(0);


                // ------------------------------------------------
                // Desenha a planta na posição do mouse
                // ------------------------------------------------

                draw_sprite_ext(
                    sprite_selecionado,
                    0,
                    mouse_gui_x,
                    mouse_gui_y,
                    escala_planta,
                    escala_planta,
                    0,
                    c_white,
                    0.75
                );
            }
        }
    }
}


// ============================================================
// RESTAURA CONFIGURAÇÕES
// ============================================================

draw_set_alpha(1);

draw_set_color(c_white);

draw_set_halign(fa_left);

draw_set_valign(fa_top);

#endregion