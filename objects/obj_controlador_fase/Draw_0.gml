//draw_set_font(fnt_cool);
// Desenha a quantidade de Sóis no topo da tela
draw_set_font(fnt_menu)
draw_set_color(c_yellow);
draw_text(50, 20, "________" + string(global.sois));

// Se a fase NÃO começou, exibe um texto de instrução
if (!global.fase_iniciada) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 1");
    
    // Mostra quantas plantas já foram escolhidas
    draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
}
// Desenha o contador de zumbis mortos no canto superior direito
draw_set_color(c_red);
// Mudamos a posição X para 600 para ficar no canto direito da tela
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/5");

// ============================================================
// AVISO — SÓIS INSUFICIENTES
// ============================================================

if (global.aviso_sois_timer > 0)
{
    var largura_faixa = 500;
    var altura_faixa = 55;

    var centro_x = room_width / 2;
    var topo_y = 90;

    // --------------------------------------------------------
    // FAIXA PRETA
    // --------------------------------------------------------

    draw_set_color(c_black);
    draw_set_alpha(0.65);

    draw_rectangle(
        centro_x - largura_faixa / 2,
        topo_y,
        centro_x + largura_faixa / 2,
        topo_y + altura_faixa,
        false
    );

    // --------------------------------------------------------
    // TEXTO
    // --------------------------------------------------------

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        centro_x,
        topo_y + altura_faixa / 2,
        "VOCÊ PRECISA DE MAIS SÓIS PARA PLANTAR ISSO!"
    );

    // --------------------------------------------------------
    // RESTAURA
    // --------------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}