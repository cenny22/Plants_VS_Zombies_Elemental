// Desenha a quantidade de Sóis no topo da tela
draw_set_color(c_yellow);
draw_text(50, 20, "________" + string(global.sois));

// Se a fase NÃO começou, exibe um texto de instrução
if (!global.fase_iniciada) {
    draw_set_color(c_white);
    draw_text(room_width / 2 - 100, 50, "Mata dos bichos - dia 2");
    
    // CHECAGEM DE SEGURANÇA: Só desenha o contador se a lista existir de verdade
    if (variable_global_exists("plantas_escolhidas") && ds_exists(global.plantas_escolhidas, ds_type_list)) {
        draw_text(30, 60, "Escolhidas: " + string(ds_list_size(global.plantas_escolhidas)) + "/7");
    } else {
        draw_text(30, 60, "Escolhidas: 0/7");
    }
}

// Desenha o contador de zumbis mortos no canto superior direito (Meta: 10 zumbis)
draw_set_color(c_red);
draw_text(600, 20, "ZUMBIS DERROTADOS: " + string(global.zumbis_mortos) + "/10");