#region OBJ_DIALOGO — DRAW GUI

if (!dialogo_ativo)
{
    exit;
}


// ============================================================
// TAMANHO DO BALÃO
// ============================================================

var largura = display_get_gui_width() * 0.75;
var altura = 150;


// ============================================================
// POSIÇÃO
// ============================================================

var bx = display_get_gui_width() / 2;
var by = display_get_gui_height() - 120;


// ============================================================
// BORDA E FUNDO
// ============================================================

draw_set_color(c_white);

draw_roundrect(
    bx - largura / 2,
    by - altura / 2,
    bx + largura / 2,
    by + altura / 2,
    false
);

draw_set_color(c_white);
draw_set_alpha(0.95);

draw_roundrect(
    bx - largura / 2,
    by - altura / 2,
    bx + largura / 2,
    by + altura / 2,
    true
);

draw_set_alpha(1);


// ============================================================
// NOME DO PERSONAGEM
// ============================================================

draw_set_font(fnt_pvz);
draw_set_color(c_aqua);

var nome_personagem = "Dave Doidão";

if (personagem_atual == "penny")
{
    nome_personagem = "Penny";
    draw_set_font(fnt_pvz);
    draw_set_color(c_red);
}

draw_text(
    bx - largura / 2 + 30,
    by - altura / 2 + 15,
    nome_personagem
);


// ============================================================
// FALA
// ============================================================

draw_set_font(fnt_pvz);
draw_set_color(c_black);

draw_text_ext(
    bx - largura / 2 + 30,
    by - altura / 2 + 55,
    texto_atual,
    30,
    largura - 60
);


// ============================================================
// INDICADOR DE CONTINUAR
// ============================================================

if (pode_avancar)
{
    draw_set_color(c_black);

    draw_text(
        bx + largura / 2 - 55,
        by + altura / 2 - 35,
        "E"
    );
}


// ============================================================
// RESET
// ============================================================

draw_set_alpha(1);
draw_set_color(c_white);

#endregion