// ============================================================
// BARRA LATERAL — PLANTAS
// ============================================================

// Garante a existência do type
if (!variable_instance_exists(id, "type"))
{
    type = 1;
}

var index = type - 1;

// ============================================================
// VERIFICA A PLANTA
// ============================================================

if (variable_global_exists("plantas_escolhidas") &&
    ds_exists(global.plantas_escolhidas, ds_type_list))
{
    if (index < ds_list_size(global.plantas_escolhidas))
    {
        var nome_planta = ds_list_find_value(
            global.plantas_escolhidas,
            index
        );

        // ========================================================
        // DEFINE O SPRITE DA PLANTA
        // ========================================================

        if (nome_planta == "disparervilha" || nome_planta == "disparaervilha")
            sprite_index = spr_disparervilha;

        else if (nome_planta == "girassol")
            sprite_index = Sprite12_2;

        else if (nome_planta == "noz")
            sprite_index = Sprite23_3;

        else if (nome_planta == "ervaespinho")
            sprite_index = spr_ervaespinho_1;

        else if (nome_planta == "batatamina")
            sprite_index = spr_batata_mina_charged;

        else if (nome_planta == "esparabalde")
            sprite_index = Sprite32;

        else if (nome_planta == "repelecao")
            sprite_index = spr_repele_cao;

        else if (nome_planta == "duplervilha")
            sprite_index = Sprite6_2;

        else if (nome_planta == "triplervilha")
            sprite_index = Sprite113;

        else if (nome_planta == "espinhoguiado")
            sprite_index = Sprite122;

        else if (nome_planta == "covaceps")
            sprite_index = Sprite75;

        else if (nome_planta == "enroscacovas")
            sprite_index = Sprite105;

        else if (nome_planta == "veudenoiva")
            sprite_index = Sprite85;

        else if (nome_planta == "broto")
            sprite_index = Sprite92;

        else if (nome_planta == "morcegarrador")
            sprite_index = Sprite101;

        else if (nome_planta == "trepaervilha")
            sprite_index = Sprite130;

        else
            sprite_index = -1;
    }
    else
    {
        sprite_index = -1;
    }
}
else
{
    sprite_index = -1;
}

// ============================================================
// DESENHO
// ============================================================

if (sprite_index != -1)
{
    // --------------------------------------------------------
    // TAMANHO DO QUADRADO
    // --------------------------------------------------------

    var quadrado_escala_x = 1.12;
    var quadrado_escala_y = 1.08;


    // --------------------------------------------------------
    // QUADRADO DA PLANTA
    // --------------------------------------------------------

    draw_sprite_ext(
        spr_quadrado_plantas,
        0,
        x,
        y,
        quadrado_escala_x,
        quadrado_escala_y,
        0,
        c_white,
        1
    );


    // --------------------------------------------------------
    // TAMANHO DA PLANTA
    // --------------------------------------------------------

    var tamanho_planta = 0.75;


    // --------------------------------------------------------
    // PLANTA
    // --------------------------------------------------------

    draw_sprite_ext(
        sprite_index,
        image_index,
        x + (sprite_get_xoffset(sprite_index) - sprite_get_width(sprite_index) / 2) * tamanho_planta,
        y + (sprite_get_yoffset(sprite_index) - sprite_get_height(sprite_index) / 2) * tamanho_planta,
        tamanho_planta,
        tamanho_planta,
        image_angle,
        image_blend,
        image_alpha
    );
	// ============================================================
// PLANTA SELECIONADA
// ============================================================

if (global.barra_selecionada == id)
{
    // Borda de seleção
    draw_set_color(c_yellow);
    draw_set_alpha(1);

    draw_rectangle(
        x - (sprite_get_width(spr_quadrado_plantas) * 1.12) / 2,
        y - (sprite_get_height(spr_quadrado_plantas) * 1.08) / 2,
        x + (sprite_get_width(spr_quadrado_plantas) * 1.12) / 2,
        y + (sprite_get_height(spr_quadrado_plantas) * 1.08) / 2,
        true
    );

    draw_set_color(c_white);
}


    // ========================================================
    // COOLDOWN
    // ========================================================

    if (global.fase_iniciada && em_cooldown)
    {
        var porcentagem = tempo_cooldown_atual / tempo_cooldown_max;

        // ----------------------------------------------------
        // ESCURECE O QUADRADO INTEIRO
        // ----------------------------------------------------

        draw_sprite_ext(
            spr_quadrado_plantas,
            0,
            x,
            y,
            quadrado_escala_x,
            quadrado_escala_y,
            0,
            c_black,
            0.65 * porcentagem
        );


        // ----------------------------------------------------
        // TEMPO DO COOLDOWN
        // ----------------------------------------------------

        draw_set_color(c_white);
        draw_set_alpha(1);

        draw_set_font(fnt_menu);

        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);

        draw_text(
            x,
            y,
            string_format(
                tempo_cooldown_atual,
                1,
                1
            ) + "s"
        );

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}

// ============================================================
// RESTAURA CONFIGURAÇÕES
// ============================================================

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);