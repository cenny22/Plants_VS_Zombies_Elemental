//draw_set_font(fnt_cool);
// Desenha a quantidade de Sóis no topo da tela
draw_set_color(c_yellow);
draw_text(30, 20, ".......... " + string(global.sois));

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