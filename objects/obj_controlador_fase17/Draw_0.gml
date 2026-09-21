// Desenha la quantidade de Sóis no topo da tela
draw_set_color(c_yellow);
draw_text(30, 20, "SÓIS: " + string(global.sois));

// Se a fase NÃO começou, exibe um texto de instrução
if (!global.fase_iniciada) {
    draw_set_color(c_orange);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 17");
    
    // Mostra quantas plantas já foram escolhidas
    if (ds_exists(global.plantas_escolhidas, ds_type_list)) {
        draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
    }
}

// Desenha o contador de zumbis mortos no canto direito da tela
draw_set_color(c_red);
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/" + string(total_fase));