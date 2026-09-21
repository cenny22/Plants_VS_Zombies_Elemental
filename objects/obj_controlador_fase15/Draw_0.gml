// Desenha apenas o título da fase e a contagem de progresso dos zumbis
draw_set_color(c_yellow);
draw_text(30, 20, "Mata dos bichos - dia 15 - ESTEIRA DE SELEÇÃO");

// Desenha o contador de zumbis mortos no canto direito
draw_set_color(c_red);
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/" + string(total_fase));