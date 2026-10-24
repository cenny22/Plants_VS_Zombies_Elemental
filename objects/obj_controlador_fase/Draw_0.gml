#region DRAW

function draw_text_outline(x, y, texto, cor_texto, cor_borda, espessura) {
    draw_set_color(cor_borda);
    
    draw_text(x - espessura, y, texto);
    draw_text(x + espessura, y, texto);
    draw_text(x, y - espessura, texto);
    draw_text(x, y + espessura, texto);
    draw_text(x - espessura, y - espessura, texto);
    draw_text(x + espessura, y - espessura, texto);
    draw_text(x - espessura, y + espessura, texto);
    draw_text(x + espessura, y + espessura, texto);
    
    draw_set_color(cor_texto);
    draw_text(x, y, texto);
}

// Sóis no canto superior esquerdo
draw_text(50, 20, "________" + string(global.sois));

if (!global.fase_iniciada) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 1");
    draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
}

// ============================================================
// CONTADOR DE KILLS — NO CANTO SUPERIOR DIREITO
// ============================================================
draw_set_color(c_red);
draw_text(room_width - 220, 20, "DERROTADOS: " + string(global.zumbis_mortos));

// ============================================================
// BARRA DE PROGRESSO DA HORDA — NO MEIO SUPERIOR
// ============================================================
if (global.fase_iniciada)
{
    var barra_largura = 240;
    var barra_altura = 14;
    var barra_x1 = (room_width / 2) - (barra_largura / 2); // Centralizado na tela
    var barra_y1 = 20;

    // Fundo da Barra
    draw_set_color(c_black);
    draw_rectangle(barra_x1, barra_y1, barra_x1 + barra_largura, barra_y1 + barra_altura, false);

    // Barra de Progresso Preenchida
    draw_set_color(c_green);
    draw_rectangle(barra_x1, barra_y1, barra_x1 + (barra_largura * progresso_barra), barra_y1 + barra_altura, false);

    // Borda
    draw_set_color(c_white);
    draw_rectangle(barra_x1, barra_y1, barra_x1 + barra_largura, barra_y1 + barra_altura, true);

    // BANDEIRAS FIXAS NA BARRA
    var pos_bandeira1 = barra_x1 + (barra_largura * 0.35); // Horda 1
    var pos_bandeira2 = barra_x1 + (barra_largura * 0.70); // Horda 2
    var pos_bandeira3 = barra_x1 + (barra_largura * 1.00); // Horda 3 (Fim)

    if (sprite_exists(spr_bandeira))
    {
        draw_sprite(spr_bandeira, 0, pos_bandeira1, barra_y1 - 4);
        draw_sprite(spr_bandeira, 0, pos_bandeira2, barra_y1 - 4);
        draw_sprite(spr_bandeira, 0, pos_bandeira3, barra_y1 - 4);
    }

    // ÍCONE SPR_HORDA ANDANDO PELA BARRA
    var icon_x = barra_x1 + (barra_largura * progresso_barra);
    if (sprite_exists(spr_horda))
    {
        draw_sprite(spr_horda, 0, icon_x, barra_y1 + (barra_altura / 2));
    }
}

// ============================================================
// AVISO — GRANDE HORDA DE ZUMBIS
// ============================================================
if (aviso_horda_timer > 0)
{
    var centro_x = room_width / 2;
    var centro_y = room_height / 2;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var escala = 1.5;
    var espessura = 2; // Espessura do contorno

    // 1. DEFINE A COR PRETA PARA O CONTORNO
    draw_set_color(c_black);
    
    // Desenha nas 4 posições ao redor (Sombra/Borda)
    draw_text_transformed(centro_x - espessura, centro_y, "UMA GRANDE HORDA DE ZUMBIS ESTÁ CHEGANDO!", escala, escala, 0);
    draw_text_transformed(centro_x + espessura, centro_y, "UMA GRANDE HORDA DE ZUMBIS ESTÁ CHEGANDO!", escala, escala, 0);
    draw_text_transformed(centro_x, centro_y - espessura, "UMA GRANDE HORDA DE ZUMBIS ESTÁ CHEGANDO!", escala, escala, 0);
    draw_text_transformed(centro_x, centro_y + espessura, "UMA GRANDE HORDA DE ZUMBIS ESTÁ CHEGANDO!", escala, escala, 0);

    // 2. DEFINE A COR VERMELHA PARA O TEXTO PRINCIPAL NO CENTRO
    draw_set_color(c_red);
    draw_text_transformed(centro_x, centro_y, "UMA GRANDE HORDA DE ZUMBIS ESTÁ CHEGANDO!", escala, escala, 0);

    // Restaura o alinhamento e cor padrão
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}
// ============================================================
// AVISO — SÓIS INSUFICIENTES
// ============================================================

if (global.aviso_sois_timer > 0)
{
    var largura_faixa = 500;
    var altura_faixa = 55;

    var centro_x = room_width / 2;
    var topo_y = 90;

    draw_set_color(c_black);
    draw_set_alpha(0.65);

    draw_rectangle(
        centro_x - largura_faixa / 2,
        topo_y,
        centro_x + largura_faixa / 2,
        topo_y + altura_faixa,
        false
    );

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        centro_x,
        topo_y + altura_faixa / 2,
        "VOCÊ PRECISA DE MAIS SÓIS PARA PLANTAR ISSO!"
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}

#endregion