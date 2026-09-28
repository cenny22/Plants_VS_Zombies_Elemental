#region
// ============================================================
// OBJ_BARRA_LATERAL — DRAW GUI
// ============================================================
// Desenha:
// - Cartas
// - Plantas
// - Cooldown
// - Carta selecionada escura
// - Planta seguindo o mouse
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


for (var i = 0; i < quantidade; i++)
{
    var nome =
        ds_list_find_value(
            global.plantas_escolhidas,
            i
        );


    var dados =
        planta_obter(nome);


    if (is_undefined(dados))
    {
        continue;
    }


    var px = barra_x;

    var py =
        barra_y +
        (i * espacamento);


    // ========================================================
    // CARTA
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
    // VERIFICA SE ESTÁ SELECIONADA
    // ========================================================

    var esta_selecionada =
        (indice_selecionado == i);


    // ========================================================
    // SPRITE DA PLANTA
    // ========================================================

    var sprite_planta =
        object_get_sprite(
            dados.objeto
        );


    // ========================================================
    // DESENHA A PLANTA NA CARTA
    // Só aparece se NÃO estiver sendo segurada
    // ========================================================

    if (!esta_selecionada)
    {
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
    }


    // ========================================================
    // COOLDOWN
    // ========================================================

    if (array_length(cooldowns) > i)
    {
        var cooldown_atual =
            cooldowns[i];


        if (cooldown_atual > 0)
        {
            var cooldown_max =
                dados.recarga * room_speed;


            // ================================================
            // ESCURECE A CARTA
            // ================================================

            draw_set_color(c_black);
            draw_set_alpha(0.55);


            draw_rectangle(
                px - 42,
                py - 42,
                px + 42,
                py + 42,
                false
            );


            // ================================================
            // BARRA VERTICAL DE COOLDOWN
            // ================================================

            var porcentagem =
                cooldown_atual / cooldown_max;


            var altura_cooldown =
                84 * porcentagem;


            draw_set_color(c_black);
            draw_set_alpha(0.75);


            draw_rectangle(
                px - 42,
                py - 42,
                px + 42,
                py - 42 + altura_cooldown,
                false
            );


            // ================================================
            // TEXTO DO COOLDOWN
            // ================================================

            draw_set_color(c_white);
            draw_set_alpha(1);

            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);


            var segundos =
                ceil(
                    cooldown_atual / room_speed
                );


            draw_text(
                px,
                py,
                string(segundos)
            );


            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
        }
    }


    // ========================================================
    // CARTA SELECIONADA
    // ========================================================

    if (esta_selecionada)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.55);


        draw_rectangle(
            px - 42,
            py - 42,
            px + 42,
            py + 42,
            false
        );


        draw_set_alpha(1);
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
                var mouse_gui_x =
                    device_mouse_x_to_gui(0);

                var mouse_gui_y =
                    device_mouse_y_to_gui(0);


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
// RESET
// ============================================================

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

#endregion