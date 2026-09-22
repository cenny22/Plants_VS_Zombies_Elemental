// ============================================================
// AVISO — SÓIS INSUFICIENTES
// ============================================================

if (
    variable_global_exists("aviso_sois_timer")
    && global.aviso_sois_timer > 0
)
{
    var largura_faixa = 500;
    var altura_faixa = 55;

    var cx = camera_get_view_x(view_camera[0])
        + camera_get_view_width(view_camera[0]) / 2;

    var cy = camera_get_view_y(view_camera[0]) + 70;

    // --------------------------------------------------------
    // FAIXA PRETA
    // --------------------------------------------------------

    draw_set_color(c_black);
    draw_set_alpha(0.65);

    draw_rectangle(
        cx - largura_faixa / 2,
        cy,
        cx + largura_faixa / 2,
        cy + altura_faixa,
        false
    );

    // --------------------------------------------------------
    // TEXTO
    // --------------------------------------------------------

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_set_font(fnt_menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        cx,
        cy + altura_faixa / 2,
        "VOCÊ PRECISA DE MAIS SÓIS PARA PLANTAR"
    );

    // --------------------------------------------------------
    // RESTAURA
    // --------------------------------------------------------

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}