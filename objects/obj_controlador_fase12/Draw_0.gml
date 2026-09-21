// 1. Desenha a quantidade atual de Sóis no topo
draw_set_color(c_yellow);
draw_text(30, 20, "SÓIS: " + string(global.sois));

// 2. Texto explicativo antes da fase iniciar
if (!global.fase_iniciada) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 12 ACUMULE 500 SÓIS");
    
    if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
        draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
    }
}

// 3. BARRA DE PROGRESSO DE SÓIS (Canto Superior Direito)
var bar_x = 600;
var bar_y = 20;
var bar_largura = 180;
var bar_altura = 20;

// Calcula a porcentagem do progresso (limitada a 100%)
var progresso = clamp(global.sois / meta_sois, 0, 1);

// Fundo da barra (Cinza escuro com borda)
draw_set_color(c_black);
draw_rectangle(bar_x - 2, bar_y - 2, bar_x + bar_largura + 2, bar_y + bar_altura + 2, false);

draw_set_color(c_dkgray);
draw_rectangle(bar_x, bar_y, bar_x + bar_largura, bar_y + bar_altura, false);

// Preenchimento da barra (Amarelo / Sol)
draw_set_color(c_yellow);
draw_rectangle(bar_x, bar_y, bar_x + (bar_largura * progresso), bar_y + bar_altura, false);

// Texto com a porcentagem / valor por cima da barra
draw_set_color(c_black);
draw_text(bar_x + 10, bar_y + 2, string(global.sois) + " / " + string(meta_sois));
draw_set_color(c_white); // Reseta a cor padrão